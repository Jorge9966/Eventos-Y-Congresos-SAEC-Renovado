from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("base", "0026_congreso_quota_fields"),
    ]

    operations = [
        # Remove previous min/max fields
        migrations.RemoveField(model_name="congreso", name="min_talleres_por_participante"),
        migrations.RemoveField(model_name="congreso", name="max_talleres_por_participante"),
        migrations.RemoveField(model_name="congreso", name="min_conferencias_por_participante"),
        migrations.RemoveField(model_name="congreso", name="max_conferencias_por_participante"),
        migrations.RemoveField(model_name="congreso", name="min_concursos_por_participante"),
        migrations.RemoveField(model_name="congreso", name="max_concursos_por_participante"),
        # Add single cantidad fields
        migrations.AddField(
            model_name="congreso",
            name="talleres_por_participante",
            field=models.PositiveSmallIntegerField(
                null=True,
                blank=True,
                verbose_name="Talleres por participante",
                help_text="Número exacto de talleres permitidos/exigidos por participante. Vacío = sin restricción.",
            ),
        ),
        migrations.AddField(
            model_name="congreso",
            name="conferencias_por_participante",
            field=models.PositiveSmallIntegerField(
                null=True,
                blank=True,
                verbose_name="Conferencias por participante",
                help_text="Número exacto de conferencias permitidas/exigidas por participante. Vacío = sin restricción.",
            ),
        ),
        migrations.AddField(
            model_name="congreso",
            name="concursos_por_participante",
            field=models.PositiveSmallIntegerField(
                null=True,
                blank=True,
                verbose_name="Concursos por participante",
                help_text="Número exacto de concursos permitidos/exigidos por participante. Vacío = sin restricción.",
            ),
        ),
    ]
