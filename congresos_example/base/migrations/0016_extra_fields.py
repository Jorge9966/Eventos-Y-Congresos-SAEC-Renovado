from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("base", "0015_aviso"),
    ]

    operations = [
        migrations.CreateModel(
            name="ExtraField",
            fields=[
                ("id", models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("name", models.CharField(max_length=200, verbose_name="Nombre visible")),
                ("code", models.SlugField(help_text="Identificador único, sin espacios.", max_length=220, verbose_name="Código interno")),
                ("field_type", models.CharField(choices=[("text", "Texto"), ("number", "Número"), ("date", "Fecha"), ("boolean", "Sí/No"), ("select", "Lista"), ("email", "Correo")], default="text", max_length=12)),
                ("required", models.BooleanField(default=False)),
                ("active", models.BooleanField(default=True)),
                ("order", models.PositiveIntegerField(default=0)),
                ("choices_text", models.TextField(blank=True, help_text="Una opción por línea o separadas por comas. Se ignorará si el tipo no es Lista.", verbose_name="Opciones (solo para Lista)")),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("congreso", models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name="extra_fields", to="base.congreso")),
            ],
            options={
                "ordering": ["congreso__name", "order", "name"],
                "unique_together": {("congreso", "code")},
            },
        ),
        migrations.CreateModel(
            name="UserExtraFieldValue",
            fields=[
                ("id", models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("value", models.TextField(verbose_name="Valor")),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("congreso", models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name="extra_field_values", to="base.congreso")),
                ("field", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="values", to="base.extrafield")),
                ("user", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="extra_field_values", to="auth.user")),
            ],
            options={
                "unique_together": {("user", "congreso", "field")},
            },
        ),
    ]
