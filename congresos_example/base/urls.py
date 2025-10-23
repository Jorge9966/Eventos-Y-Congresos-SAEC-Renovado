from django.urls import path
from . import views

app_name = "events"

urlpatterns = [
    path("login/", views.login_view, name="login"),
    path("instructor/", views.vista_instructor, name="instructor"),
    path("participante/", views.vista_participante, name="participante"),
    path("accounts/register/", views.registro_view, name="register"),
]