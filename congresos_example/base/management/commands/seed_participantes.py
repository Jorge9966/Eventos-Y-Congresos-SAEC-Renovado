from django.core.management.base import BaseCommand, CommandError
from django.contrib.auth.models import User
from django.db import transaction, models
from django.utils import timezone

from base.models import (
    Congreso,
    UserCongresoMembership,
    ExtraField,
    UserExtraFieldValue,
    Taller,
    Conferencia,
    TallerInscripcion,
    ConferenciaInscripcion,
)


class Command(BaseCommand):
    help = (
        "Crea N usuarios 'Participantes' con datos mínimos y los inscribe en "
        "el Taller y la Conferencia indicados. También rellena los campos extra "
        "requeridos (globales o del congreso) visibles para participantes."
    )

    def add_arguments(self, parser):
        parser.add_argument(
            "--congreso",
            default="Tecnologías emergentes y desarrollo de software con IA",
            help="Nombre del congreso destino",
        )
        parser.add_argument(
            "--taller",
            default="Prueba",
            help="Título del taller al que inscribir",
        )
        parser.add_argument(
            "--conferencia",
            default="Prueba",
            help="Título de la conferencia a inscribir",
        )
        parser.add_argument(
            "--count",
            type=int,
            default=5,
            help="Cantidad de participantes a crear/asegurar",
        )
        parser.add_argument(
            "--password",
            default="Prueba123!",
            help="Contraseña a asignar a los usuarios creados",
        )

    @transaction.atomic
    def handle(self, *args, **opts):
        nombre_congreso = opts["congreso"].strip()
        taller_title = opts["taller"].strip()
        conf_title = opts["conferencia"].strip()
        count = int(opts["count"]) or 5
        password = opts["password"]

        try:
            congreso = Congreso.objects.get(name=nombre_congreso)
        except Congreso.DoesNotExist:
            raise CommandError(f"No existe el congreso: {nombre_congreso!r}")

        try:
            taller = Taller.objects.get(congreso=congreso, title=taller_title)
        except Taller.DoesNotExist:
            raise CommandError(f"No existe el taller {taller_title!r} en el congreso {congreso.name!r}")

        try:
            conferencia = Conferencia.objects.get(congreso=congreso, title=conf_title)
        except Conferencia.DoesNotExist:
            raise CommandError(f"No existe la conferencia {conf_title!r} en el congreso {congreso.name!r}")

        # Campos extra requeridos para participantes (globales o del congreso)
        required_fields = list(
            ExtraField.objects.filter(
                (models.Q(congreso=congreso) | models.Q(congreso__isnull=True)),
                active=True,
                required=True,
                role_scope__in=["both", "participante"],
            ).order_by("order", "name")
        )

        created_users = []
        for i in range(1, count + 1):
            username = f"part_demo_{i}"
            email = f"part.demo{i}@ejemplo.test"
            user, created = User.objects.get_or_create(
                username=username,
                defaults={
                    "first_name": f"Participante {i}",
                    "last_name": "Prueba",
                    "email": email,
                },
            )
            if created:
                user.set_password(password)
                user.save()

            # Crear/asegurar membresía como participante (aprobada)
            mem, _ = UserCongresoMembership.objects.get_or_create(
                user=user,
                congreso=congreso,
                role="participante",
                defaults={"status": "approved", "decided_at": timezone.now()},
            )
            if mem.status != "approved":
                mem.status = "approved"
                mem.decided_at = timezone.now()
                mem.save()

            # Rellenar campos extra requeridos si faltan
            for f in required_fields:
                if not UserExtraFieldValue.objects.filter(user=user, field=f, congreso=f.congreso or congreso).exists():
                    value = self._fake_value_for_field(f, i, user)
                    UserExtraFieldValue.objects.create(
                        user=user,
                        field=f,
                        congreso=f.congreso or congreso,
                        value=value,
                    )

            # Inscripciones
            TallerInscripcion.objects.get_or_create(
                congreso=congreso, taller=taller, user=user
            )
            ConferenciaInscripcion.objects.get_or_create(
                congreso=congreso, conferencia=conferencia, user=user
            )

            created_users.append(user.username)

        self.stdout.write(self.style.SUCCESS(
            f"Listo. Usuarios asegurados/creados: {', '.join(created_users)}. "
            f"Inscritos en Taller '{taller.title}' y Conferencia '{conferencia.title}' del congreso '{congreso.name}'."
        ))

    def _fake_value_for_field(self, f, idx, user):
        """Genera un valor simple válido para el campo extra requerido.
        Mantiene unicidad cuando `unique_value=True`.
        """
        code = f.code or f"campo_{f.id}"
        unique_suffix = f"-{idx}" if f.unique_value else ""
        if f.field_type == "select":
            choices = f.get_choices()
            return choices[0] if choices else f"Opcion{unique_suffix or ''}"
        if f.field_type == "number":
            return str(1000 + idx)
        if f.field_type == "date":
            return timezone.localdate().isoformat()
        if f.field_type == "boolean":
            return "Sí"
        if f.field_type == "email":
            # Asegurar unicidad si la requiere
            local = f"{code}{unique_suffix or ''}"
            return f"{local}@ejemplo.test"
        # Texto por defecto
        return f"{code.capitalize()} valor{unique_suffix}"
