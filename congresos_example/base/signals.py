import logging
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver

from .models import (
    UserCongresoMembership,
    Congreso,
    TallerInscripcion,
    ConferenciaInscripcion,
    ConcursoInscripcion,
)

logger = logging.getLogger(__name__)


def _normalized_from_user(user: User) -> str | None:
    raw = (user.email or user.username or "").strip().lower()
    return raw or None


@receiver(post_save, sender=User)
def sync_membership_email_normalized_on_user_change(sender, instance: User, **kwargs):
    """Keep membership.email_normalized in sync when a User's email/username changes.

    We update each membership cautiously to avoid violating the unique constraint
    (congreso, email_normalized). If the new normalized value would conflict with an
    existing membership in the same congreso, we skip updating that specific row and
    log a warning instead of raising.
    """
    new_norm = _normalized_from_user(instance)

    # Fetch memberships for this user
    memberships = UserCongresoMembership.objects.filter(user=instance)

    for m in memberships:
        # If already matches, skip
        if (m.email_normalized or None) == new_norm:
            continue

        # If setting to a real value, check for conflicts in the same congreso
        if new_norm:
            conflict = (
                UserCongresoMembership.objects
                .filter(congreso=m.congreso, email_normalized=new_norm)
                .exclude(pk=m.pk)
                .exists()
            )
            if conflict:
                logger.warning(
                    "Skipping email_normalized update due to conflict: membership=%s congreso=%s new_norm=%s",
                    m.pk, m.congreso_id, new_norm,
                )
                continue

        m.email_normalized = new_norm
        m.save(update_fields=["email_normalized"])


# =============================
# Enforzar máximos por participante (congreso)
# =============================
def _check_max_and_raise(model_name: str, congreso: Congreso, user: User):
    """Valida que el usuario no exceda el máximo configurado en el congreso
    para el tipo de inscripción indicado por `model_name`.

    model_name: "taller" | "conferencia" | "concurso"
    """
    if not congreso:
        return
    # Obtener el máximo configurado (None/0 = sin restricción)
    if model_name == "taller":
        max_allowed = congreso.talleres_por_participante or 0
        current = TallerInscripcion.objects.filter(congreso=congreso, user=user).count()
    elif model_name == "conferencia":
        max_allowed = congreso.conferencias_por_participante or 0
        current = ConferenciaInscripcion.objects.filter(congreso=congreso, user=user).count()
    elif model_name == "concurso":
        max_allowed = congreso.concursos_por_participante or 0
        current = ConcursoInscripcion.objects.filter(congreso=congreso, user=user).count()
    else:
        return
    if max_allowed and current >= max_allowed:
        # Mensaje en español específico por tipo
        tipo_txt = {
            "taller": "talleres",
            "conferencia": "conferencias",
            "concurso": "concursos",
        }.get(model_name, "inscripciones")
        raise ValidationError(
            f"Has alcanzado el máximo de {tipo_txt} permitidos en este congreso.",
            code="max_per_user_congreso"
        )


@receiver(pre_save, sender=TallerInscripcion)
def enforce_max_talleres(sender, instance: TallerInscripcion, **kwargs):
    # Solo validar en creación (cuando no tiene pk aún)
    if getattr(instance, "pk", None):
        return
    _check_max_and_raise("taller", instance.congreso, instance.user)


@receiver(pre_save, sender=ConferenciaInscripcion)
def enforce_max_conferencias(sender, instance: ConferenciaInscripcion, **kwargs):
    if getattr(instance, "pk", None):
        return
    _check_max_and_raise("conferencia", instance.congreso, instance.user)


@receiver(pre_save, sender=ConcursoInscripcion)
def enforce_max_concursos(sender, instance: ConcursoInscripcion, **kwargs):
    if getattr(instance, "pk", None):
        return
    _check_max_and_raise("concurso", instance.congreso, instance.user)