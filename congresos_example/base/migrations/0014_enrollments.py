from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("base", "0013_concurso"),
    ]

    operations = [
        migrations.CreateModel(
            name="TallerInscripcion",
            fields=[
                ("id", models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("congreso", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="taller_inscripciones", to="base.congreso")),
                ("taller", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="inscripciones", to="base.taller")),
                ("user", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="taller_inscripciones", to="auth.user")),
                ("performance_level", models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name="taller_inscripciones", to="base.performancelevel")),
            ],
            options={
                "indexes": [models.Index(fields=["congreso", "taller"], name="base_taller_insc_idx")],
                "unique_together": {("taller", "user")},
            },
        ),
        migrations.CreateModel(
            name="ConferenciaInscripcion",
            fields=[
                ("id", models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("congreso", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="conferencia_inscripciones", to="base.congreso")),
                ("conferencia", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="inscripciones", to="base.conferencia")),
                ("user", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="conferencia_inscripciones", to="auth.user")),
                ("performance_level", models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name="conferencia_inscripciones", to="base.performancelevel")),
            ],
            options={
                "indexes": [models.Index(fields=["congreso", "conferencia"], name="base_conf_insc_idx")],
                "unique_together": {("conferencia", "user")},
            },
        ),
        migrations.CreateModel(
            name="ConcursoInscripcion",
            fields=[
                ("id", models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("congreso", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="concurso_inscripciones", to="base.congreso")),
                ("concurso", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="inscripciones", to="base.concurso")),
                ("user", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="concurso_inscripciones", to="auth.user")),
                ("performance_level", models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name="concurso_inscripciones", to="base.performancelevel")),
            ],
            options={
                "indexes": [models.Index(fields=["congreso", "concurso"], name="base_cons_insc_idx")],
                "unique_together": {("concurso", "user")},
            },
        ),
    ]
