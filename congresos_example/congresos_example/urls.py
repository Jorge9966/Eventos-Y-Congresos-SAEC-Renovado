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
from base import views

urlpatterns = [
    path("admin/", admin.site.urls),
    path("", include("base.urls")),     #  conecta las rutas de tu app "base"
    path('inicio/', views.inicio_view, name='inicio'),
    path('login/', views.login_view, name='login'),
    path('instructor/', views.vista_instructor, name='instructor'), 
    path('participante/', views.vista_participante, name='participante'),
    path('accounts/register/', views.registro_view, name='register'),
    path('logout/', views.logout_view, name='logout'),
    path('congresos/', views.congresos_view, name='congresos'),
    path('correos/', views.correos_view, name='correos'),
    path('nivel-desempeno/', views.nivel_desempeno_view, name='nivel_desempeno'),
    path('perfil/', views.perfil_view, name='perfil'),
]
