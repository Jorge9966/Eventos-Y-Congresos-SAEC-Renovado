from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("base", "0021_concursoequipo_concursoequipomiembro"),
    ]

    operations = [
        migrations.AddField(
            model_name="extrafield",
            name="unique_value",
            field=models.BooleanField(default=False, verbose_name="Irrepetible"),
        ),
    ]
