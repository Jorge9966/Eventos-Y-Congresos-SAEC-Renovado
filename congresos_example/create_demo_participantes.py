import os
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "congresos_example.settings")

import django
django.setup()

from django.utils import timezone
from django.contrib.auth.models import User
from django.db import transaction, models
from base.models import (Congreso, Taller, Conferencia, UserCongresoMembership, ExtraField, UserExtraFieldValue, TallerInscripcion, ConferenciaInscripcion)

# OJO: Usa el nombre EXACTO tal como está en la BD. En tu instancia
# hay doble espacio entre "emergentes" y "y".
CONGRESO_NOMBRE = "Tecnologías emergentes  y desarrollo de software con IA"
TALLER_TITULO = "Prueba"
CONFERENCIA_TITULO = "Prueba"
COUNT = 5
PASSWORD = "Prueba123!"

def fake_value(field, idx):
    code = field.code or f"campo_{field.id}"
    uniq = f"-{idx}" if field.unique_value else ""
    if field.field_type == "select":
        ch = field.get_choices()
        return ch[0] if ch else f"Opcion{uniq}"
    if field.field_type == "number":
        return str(1000 + idx)
    if field.field_type == "date":
        return timezone.localdate().isoformat()
    if field.field_type == "boolean":
        return "Sí"
    if field.field_type == "email":
        return f"{code}{uniq}@ejemplo.test"
    return f"{code.capitalize()} valor{uniq}"

@transaction.atomic
def main():
    # Buscar objetos existentes; si no existen, fallar explícitamente.
    congreso = Congreso.objects.get(name=CONGRESO_NOMBRE)
    taller = Taller.objects.get(congreso=congreso, title=TALLER_TITULO)
    conferencia = Conferencia.objects.get(congreso=congreso, title=CONFERENCIA_TITULO)

    required_fields = list(
        ExtraField.objects.filter(
            (models.Q(congreso=congreso) | models.Q(congreso__isnull=True)),
            active=True,
            required=True,
            role_scope__in=["both", "participante"],
        ).order_by("order", "name")
    )

    created = []
    for i in range(1, COUNT + 1):
        username = f"part_demo_{i}"
        email = f"part.demo{i}@ejemplo.test"
        user, is_new = User.objects.get_or_create(
            username=username,
            defaults={
                "first_name": f"Participante {i}",
                "last_name": "Prueba",
                "email": email,
            },
        )
        if is_new:
            user.set_password(PASSWORD)
            user.save()

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

        for f in required_fields:
            UserExtraFieldValue.objects.get_or_create(
                user=user,
                field=f,
                congreso=f.congreso or congreso,
                defaults={"value": fake_value(f, i)},
            )

        TallerInscripcion.objects.get_or_create(congreso=congreso, taller=taller, user=user)
        ConferenciaInscripcion.objects.get_or_create(congreso=congreso, conferencia=conferencia, user=user)
        created.append(user.username)

    print(
        "OK - Usuarios creados/asegurados:", ", ".join(created),
        "| Taller:", taller.title,
        "| Conferencia:", conferencia.title,
        "| Congreso:", congreso.name,
    )

if __name__ == "__main__":
    main()
