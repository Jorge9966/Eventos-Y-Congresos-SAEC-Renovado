from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("base", "0016_extra_fields"),
    ]

    operations = [
        migrations.AddField(
            model_name="extrafield",
            name="role_scope",
            field=models.CharField(choices=[("both", "Participantes e Instructores"), ("participante", "Solo Participantes"), ("instructor", "Solo Instructores")], default="both", max_length=20, verbose_name="Visible para"),
        ),
        migrations.AddField(
            model_name="extrafield",
            name="section",
            field=models.CharField(choices=[("registro", "Registro"), ("perfil", "Perfil")], default="registro", max_length=20, verbose_name="Sección"),
        ),
    ]
