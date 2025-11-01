from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('base', '0006_congreso_admin_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='congreso',
            name='description',
            field=models.TextField(verbose_name='Descripción', null=True, blank=True),
        ),
    ]
