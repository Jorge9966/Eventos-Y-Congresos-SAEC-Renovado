from django.db import migrations, models
import django.db.models.deletion
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        ("base", "0015_aviso"),
        ("auth", "0012_alter_user_first_name_max_length"),
    ]

    operations = [
        migrations.AddField(
            model_name="congreso",
            name="restrict_group_admin_scope",
            field=models.BooleanField(default=True),
        ),
        migrations.CreateModel(
            name="CongresoAdminScope",
            fields=[
                ("id", models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name="ID")),
                ("created_at", models.DateTimeField(auto_now_add=True)),
                ("congreso", models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name="scoped_group_admins", to="base.congreso")),
                ("user", models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name="admin_congreso_scope", to=settings.AUTH_USER_MODEL)),
            ],
            options={
                "constraints": [
                    models.UniqueConstraint(fields=("user", "congreso"), name="uniq_scope_user_congreso"),
                ],
            },
        ),
    ]
