from django.urls import path
from . import views

app_name = "events"

urlpatterns = [
    path("", views.home_congresos, name="home_congresos"),
    path("login/", views.login_view, name="login"),
    path("accounts/register/", views.registro_view, name="register"),
    path("recuperar-contrasena/", views.recuperar_contrasena_view, name="password_reset"),
    path("restablecer/", views.code_password_view, name="code_password"),
]