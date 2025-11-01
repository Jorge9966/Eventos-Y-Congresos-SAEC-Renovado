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
    path("", views.home_congresos, name="home"),
    # Rutas de la app (internas/protegidas)
    path("", include("base.urls")),
    path('inicio/', views.inicio_view, name='inicio'),
    path('login/', views.login_view, name='login'),
    path('instructor/', views.vista_instructor, name='instructor'), 
    path('participante/', views.vista_participante, name='participante'),
    path('accounts/register/', views.registro_view, name='register'),
    path('logout/', views.logout_view, name='logout'),
    path('congresos-eventos/', views.congresos_eventos_view, name='congresos_eventos'),
    path('congreso-evento/', views.congreso_evento_view, name='congreso_evento'),
    path('editar-congreso-evento/<int:congreso_id>/', views.editar_congreso_evento_view, name='editar_congreso_evento'),
    # Compatibilidad: redirigir la ruta antigua a la nueva
    path('congresos/', RedirectView.as_view(pattern_name='congresos_eventos', permanent=False)),
    path('correos/', views.correos_view, name='correos'),
    path('nivel-desempeno/', views.nivel_desempeno_view, name='nivel_desempeno'),
    path('inicio-congreso/<int:congreso_id>/', views.inicio_congreso_view, name='inicio_congreso'),
    path('perfil/', views.perfil_view, name='perfil'),
    path('recuperar-contrasena/', views.recuperar_contrasena_view, name='password_reset'),
    path('restablecer/', views.code_password_view, name='code_password'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
