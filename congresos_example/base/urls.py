from django.urls import path
from . import views

app_name = "events"

urlpatterns = [
    path("", views.home_congresos, name="home_congresos"),
    path("login/", views.login_view, name="login"),
    path("instructor/", views.vista_instructor, name="instructor"),
    path("participante/", views.vista_participante, name="participante"),
    path("accounts/register/", views.registro_view, name="register"),
    path("recuperar-contrasena/", views.recuperar_contrasena_view, name="password_reset"),
    path("restablecer/", views.code_password_view, name="code_password"),
]