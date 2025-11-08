from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("base", "0014_enrollments"),
    ]

    operations = [
        migrations.CreateModel(
            name="Aviso",
            fields=[
                ("id", models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("content", models.TextField(verbose_name="Aviso")),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("congreso", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="avisos", to="base.congreso")),
            ],
            options={
                "ordering": ["-created_at"],
            },
        ),
    ]
