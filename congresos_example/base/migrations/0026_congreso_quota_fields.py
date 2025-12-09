from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("base", "0025_alter_userextrafieldvalue_value"),
    ]

    operations = [
        migrations.AddField(
            model_name="congreso",
            name="min_talleres_por_participante",
            field=models.PositiveSmallIntegerField(
                null=True,
                blank=True,
                verbose_name="Mín. talleres por participante",
                help_text=(
                    "Cantidad mínima de talleres en los que debe inscribirse cada participante. "
                    "Dejar vacío para no requerir mínimo."
                ),
            ),
        ),
        migrations.AddField(
            model_name="congreso",
            name="max_talleres_por_participante",
            field=models.PositiveSmallIntegerField(
                null=True,
                blank=True,
                verbose_name="Máx. talleres por participante",
                help_text=(
                    "Cantidad máxima de talleres permitidos por participante. "
                    "Dejar vacío para sin límite."
                ),
            ),
        ),
        migrations.AddField(
            model_name="congreso",
            name="min_conferencias_por_participante",
            field=models.PositiveSmallIntegerField(
                null=True,
                blank=True,
                verbose_name="Mín. conferencias por participante",
                help_text=(
                    "Cantidad mínima de conferencias en las que debe inscribirse cada participante. "
                    "Dejar vacío para no requerir mínimo."
                ),
            ),
        ),
        migrations.AddField(
            model_name="congreso",
            name="max_conferencias_por_participante",
            field=models.PositiveSmallIntegerField(
                null=True,
                blank=True,
                verbose_name="Máx. conferencias por participante",
                help_text=(
                    "Cantidad máxima de conferencias permitidas por participante. "
                    "Dejar vacío para sin límite."
                ),
            ),
        ),
        migrations.AddField(
            model_name="congreso",
            name="min_concursos_por_participante",
            field=models.PositiveSmallIntegerField(
                null=True,
                blank=True,
                verbose_name="Mín. concursos por participante",
                help_text=(
                    "Cantidad mínima de concursos en los que debe inscribirse cada participante. "
                    "Dejar vacío para no requerir mínimo."
                ),
            ),
        ),
        migrations.AddField(
            model_name="congreso",
            name="max_concursos_por_participante",
            field=models.PositiveSmallIntegerField(
                null=True,
                blank=True,
                verbose_name="Máx. concursos por participante",
                help_text=(
                    "Cantidad máxima de concursos permitidos por participante. "
                    "Dejar vacío para sin límite."
                ),
            ),
        ),
    ]
