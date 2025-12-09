from django.urls import path
from . import views

# Nota: se elimina app_name para evitar que los nombres de ruta queden bajo un namespace
# ("events:") y así permitir que las plantillas existentes que usan {% url 'ins_talleres' %}
# funcionen sin levantar NoReverseMatch. Si se desea namespacing más adelante, habrá que
# volver a añadir app_name y actualizar todas las referencias a 'events:...'.

urlpatterns = [
    path("", views.introduccion_view, name="home"),
    path("home/", views.home_congresos, name="home_congresos"),
    path("login/", views.login_view, name="login"),
    path("accounts/register/", views.registro_view, name="register"),
    path("recuperar-contrasena/", views.recuperar_contrasena_view, name="password_reset"),
    path("restablecer/", views.code_password_view, name="code_password"),
    # Landings y área de instructor movidos a urls globales para evitar duplicados
    path("participante/inicio/", views.inicio_participante_view, name="inicio_participante"),
    path("instructor/inicio/", views.inicio_instructor_view, name="inicio_instructor"),
    path("instructor/pendiente/", views.instructor_pendiente_view, name="instructor_pendiente"),
    path("instructor/perfil/", views.instructor_perfil_view, name="instructor_perfil"),
    path("instructor/participantes/", views.instructor_participantes_view, name="instructor_participantes"),
    # Instructor recursos: talleres, concursos, conferencias
    path("instructor/talleres/", views.instructor_talleres_view, name="ins_talleres"),
    path("instructor/concursos/", views.instructor_concursos_view, name="ins_concursos"),
    path("instructor/conferencias/", views.instructor_conferencias_view, name="ins_conferencias"),
    # Instructor edit pages (owner-style forms)
    path("instructor/taller/editar/", views.instructor_taller_editar_view, name="ins_taller_editar"),
    path("instructor/concurso/editar/", views.instructor_concurso_editar_view, name="ins_concurso_editar"),
    path("instructor/conferencia/editar/", views.instructor_conferencia_editar_view, name="ins_conferencia_editar"),
    # Instructor participantes pages
    path("instructor/taller/participantes/", views.instructor_taller_participantes_view, name="ins_taller_participantes"),
    path("instructor/concurso/participantes/", views.instructor_concurso_participantes_view, name="ins_concurso_participantes"),
    path("instructor/conferencia/participantes/", views.instructor_conferencia_participantes_view, name="ins_conferencia_participantes"),
    # Participante secciones
    path("participante/talleres/", views.part_talleres_view, name="part_talleres"),
    path("participante/concursos/", views.part_concursos_view, name="part_concursos"),
    path("participante/conferencias/", views.part_conferencias_view, name="part_conferencias"),
    # Participante: páginas de inscripción/detalle
    path("participante/taller/<int:taller_id>/inscribir/", views.part_taller_inscribir_view, name="part_taller_inscribir"),
    path("participante/concurso/<int:concurso_id>/inscribir/", views.part_concurso_inscribir_view, name="part_concurso_inscribir"),
    path("participante/conferencia/<int:conferencia_id>/inscribir/", views.part_conferencia_inscribir_view, name="part_conferencia_inscribir"),
    path("participante/avisos/", views.part_avisos_view, name="part_avisos"),
    path("participante/perfil/", views.part_perfil_view, name="part_perfil"),
]