from django.db import migrations, connection


def set_utf8mb4_unicode_ci(apps, schema_editor):
    # Solo aplica en MySQL/MariaDB
    if connection.vendor != 'mysql':
        return

    db_name = connection.settings_dict.get('NAME')

    # 1) Cambiar default del esquema (si hay permisos)
    try:
        with connection.cursor() as cursor:
            cursor.execute(f"ALTER DATABASE `{db_name}` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;")
    except Exception:
        # Continuar incluso si no hay permiso; convertiremos tablas individualmente
        pass

    # 2) Convertir todas las tablas existentes a utf8mb4_unicode_ci
    tables = []
    with connection.cursor() as cursor:
        cursor.execute(
            """
            SELECT table_name
            FROM information_schema.tables
            WHERE table_schema = %s AND table_type = 'BASE TABLE'
            """,
            [db_name],
        )
        tables = [row[0] for row in cursor.fetchall()]

    for tbl in tables:
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    f"ALTER TABLE `{tbl}` CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
                )
        except Exception:
            # Si alguna tabla falla (p.ej., por índices largos en versiones muy antiguas),
            # continuamos con las demás para maximizar avance.
            pass


class Migration(migrations.Migration):
    dependencies = [
        ('base', '0019_remove_congresoadminscope_uniq_scope_user_congreso_and_more'),
    ]

    operations = [
        migrations.RunPython(set_utf8mb4_unicode_ci, migrations.RunPython.noop),
    ]
