import logging
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

from .models import UserCongresoMembership

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