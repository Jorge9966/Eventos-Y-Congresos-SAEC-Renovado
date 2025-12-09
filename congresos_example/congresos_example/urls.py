"""
URL configuration for congresos_example project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include   
from django.conf import settings
from django.conf.urls.static import static
from django.views.generic.base import RedirectView
from base import views

urlpatterns = [
    path("admin/", admin.site.urls),
    # Página pública inicial con todos los congresos/eventos
    path("", views.introduccion_view, name="home"),
    # Rutas de la app (internas/protegidas)
    path("", include("base.urls")),
    path('inicio/', views.inicio_view, name='inicio'),
    path('login/', views.login_view, name='login'),
    path('accounts/register/', views.registro_view, name='register'),
    path('logout/', views.logout_view, name='logout'),
    path('congresos-eventos/', views.congresos_eventos_view, name='congresos_eventos'),
    path('congreso-evento/', views.congreso_evento_view, name='congreso_evento'),
    path('editar-congreso-evento/<int:congreso_id>/', views.editar_congreso_evento_view, name='editar_congreso_evento'),
    # Compatibilidad: redirigir la ruta antigua a la nueva
    path('congresos/', RedirectView.as_view(pattern_name='congresos_eventos', permanent=False)),
    path('correos/', views.correos_view, name='correos'),
    path('nivel-desempeno/', views.nivel_desempeno_view, name='nivel_desempeno'),
    path('campos/', views.campos_view, name='campos'),
    path('inicio-congreso/<int:congreso_id>/', views.inicio_congreso_view, name='inicio_congreso'),
    path('perfil-congreso/<int:congreso_id>/', views.perfil_congreso_view, name='perfil_congreso'),
    # Área de congreso: placeholders
    path('congreso/<int:congreso_id>/talleres/', views.talleres_list_view, name='talleres_list'),
    path('congreso/<int:congreso_id>/talleres/export/', views.export_talleres_excel_view, name='talleres_export'),
    path('congreso/<int:congreso_id>/concursos/', views.concursos_list_view, name='concursos_list'),
    path('congreso/<int:congreso_id>/concursos/export/', views.export_concursos_excel_view, name='concursos_export'),
    path('congreso/<int:congreso_id>/conferencias/', views.conferencias_list_view, name='conferencias_list'),
    path('congreso/<int:congreso_id>/conferencias/export/', views.export_conferencias_excel_view, name='conferencias_export'),
    # Acciones (crear/detalle placeholder)
    path('congreso/<int:congreso_id>/taller/nuevo/', views.taller_nuevo_view, name='taller_nuevo'),
    path('congreso/<int:congreso_id>/taller/editar/<int:taller_id>/', views.taller_editar_view, name='taller_editar'),
    path('congreso/<int:congreso_id>/taller/<int:taller_id>/participantes/', views.taller_participantes_view, name='taller_participantes'),
    path('congreso/<int:congreso_id>/taller/<int:taller_id>/export/', views.export_taller_excel_view, name='taller_export'),
    path('congreso/<int:congreso_id>/taller/<int:taller_id>/imprimir/', views.taller_participantes_print_view, name='taller_participantes_print'),
    path('congreso/<int:congreso_id>/concurso/nuevo/', views.concurso_nuevo_view, name='concurso_nuevo'),
    path('congreso/<int:congreso_id>/concurso/editar/<int:concurso_id>/', views.concurso_editar_view, name='concurso_editar'),
    path('congreso/<int:congreso_id>/concurso/<int:concurso_id>/participantes/', views.concurso_participantes_view, name='concurso_participantes'),
    path('congreso/<int:congreso_id>/concurso/<int:concurso_id>/export/', views.export_concurso_excel_view, name='concurso_export'),
    path('congreso/<int:congreso_id>/concurso/<int:concurso_id>/imprimir/', views.concurso_participantes_print_view, name='concurso_participantes_print'),
    path('congreso/<int:congreso_id>/conferencia/nueva/', views.conferencia_nueva_view, name='conferencia_nueva'),
    path('congreso/<int:congreso_id>/conferencia/editar/<int:conferencia_id>/', views.conferencia_editar_view, name='conferencia_editar'),
    path('congreso/<int:congreso_id>/conferencia/<int:conferencia_id>/participantes/', views.conferencia_participantes_view, name='conferencia_participantes'),
    path('congreso/<int:congreso_id>/conferencia/<int:conferencia_id>/export/', views.export_conferencia_excel_view, name='conferencia_export'),
    path('congreso/<int:congreso_id>/conferencia/<int:conferencia_id>/imprimir/', views.conferencia_participantes_print_view, name='conferencia_participantes_print'),
    path('congreso/<int:congreso_id>/instructores/', views.instructores_view, name='instructores'),
    path('congreso/<int:congreso_id>/instructores/export/', views.export_instructores_excel_view, name='instructores_export'),
    path('congreso/<int:congreso_id>/participantes/', views.participantes_view, name='participantes'),
    path('congreso/<int:congreso_id>/participantes/export/', views.export_participantes_excel_view, name='participantes_export'),
    # Usuarios acción (crear/editar)
    path('congreso/<int:congreso_id>/usuario/participante/nuevo/', views.usuario_participante_nuevo_view, name='usuario_participante_nuevo'),
    path('congreso/<int:congreso_id>/usuario/instructor/nuevo/', views.usuario_instructor_nuevo_view, name='usuario_instructor_nuevo'),
    path('congreso/<int:congreso_id>/usuario/participante/editar/<int:membership_id>/', views.usuario_editar_participante_view, name='usuario_editar_participante'),
    path('congreso/<int:congreso_id>/usuario/instructor/editar/<int:membership_id>/', views.usuario_editar_instructores_view, name='usuario_editar_instructores'),
    path('congreso/<int:congreso_id>/logo/', views.logo_view, name='logo'),
    path('congreso/<int:congreso_id>/avisos/', views.avisos_view, name='avisos'),
    path('perfil/', views.perfil_view, name='perfil'),
    path('recuperar-contrasena/', views.recuperar_contrasena_view, name='password_reset'),
    path('restablecer/', views.code_password_view, name='code_password'),
    # Instructor area (non-namespaced for global reverse)
    path('instructor/inicio/', views.inicio_instructor_view, name='inicio_instructor'),
    path('instructor/perfil/', views.instructor_perfil_view, name='instructor_perfil'),
    path('instructor/participantes/', views.instructor_participantes_view, name='instructor_participantes'),
    path('instructor/pendiente/', views.instructor_pendiente_view, name='instructor_pendiente'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
