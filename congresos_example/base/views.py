from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User, Group
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from django.urls import reverse
from django.http import HttpResponseRedirect

# -------------------
# LOGIN
# -------------------
def login_view(request):
    if request.method == "POST":
        # Permitir iniciar sesión con usuario o correo
        identifier = request.POST.get("username")
        password = request.POST.get("password")

        username_for_auth = identifier or ""
        # Si se ingresó un correo, ubicar el usuario por email (case-insensitive)
        if identifier and "@" in identifier:
            try:
                user_by_email = User.objects.get(email__iexact=identifier)
                username_for_auth = user_by_email.username
            except User.DoesNotExist:
                # Caerá a intentar autenticar con lo ingresado como username
                pass

        user = authenticate(request, username=username_for_auth, password=password)

        if user is not None:
            login(request, user)
            return redirect("inicio")  # siempre redirige a inicio.html
        else:
            messages.error(request, "Usuario o contraseña incorrectos.")
            return render(request, "login.html")

    return render(request, "login.html")


# -------------------
# REGISTRO
# -------------------
def registro_view(request):
    if request.method == "POST":
        first_name = request.POST.get("first_name")
        apellido_paterno = request.POST.get("apellido_paterno")
        apellido_materno = request.POST.get("apellido_materno")
        email = request.POST.get("email")
        password = request.POST.get("password")
        tipo_usuario = request.POST.get("tipo_usuario")
        clave_instructor = request.POST.get("clave_instructor")

        # Validar duplicados
        if User.objects.filter(username=email).exists():
            messages.error(request, "Ya existe una cuenta con ese correo.")
            return render(request, "register.html")

        # Crear usuario
        user = User.objects.create_user(
            username=email,
            email=email,
            password=password,
            first_name=first_name,
            last_name=f"{apellido_paterno} {apellido_materno}"
        )

        # Asignar grupo según tipo
        if tipo_usuario == "instructor":
            # Validar clave de instructor
            if clave_instructor != "ISC123":  # 👈 clave secreta
                messages.error(request, "Clave de instructor incorrecta.")
                user.delete()
                return render(request, "register.html")

            grupo = Group.objects.get(name="Instructores")
            user.groups.add(grupo)
            login(request, user)
            return redirect("instructor")

        else:
            grupo = Group.objects.get(name="Participantes")
            user.groups.add(grupo)
            login(request, user)
            return redirect("participante")  #  corregido

    return render(request, "register.html")


# -------------------
# LOGOUT
# -------------------
def logout_view(request):
    logout(request)
    return redirect("login")


# -------------------
# VISTAS PROTEGIDAS
# -------------------
@login_required
def inicio_view(request):
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    return render(request, "inicio.html", {"rol": rol})


@login_required
@user_passes_test(lambda u: u.groups.filter(name="Instructores").exists())
def vista_instructor(request):
    return render(request, "instructor.html")


@login_required
@user_passes_test(lambda u: u.groups.filter(name="Participantes").exists())
def vista_participante(request):
    return render(request, "participante.html")

@login_required
def congresos_view(request):
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    return render(request, "congresos.html", {"rol": rol})

@login_required
def correos_view(request):
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    # Placeholder: lista de correos opcional para la tabla
    correos = []
    return render(request, "correos.html", {"rol": rol, "correos": correos})

@login_required
def nivel_desempeno_view(request):
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    # Placeholder: lista de niveles de desempeño para la tabla
    niveles = []
    return render(request, "nivel_desempeno.html", {"rol": rol, "niveles": niveles})

@login_required
def perfil_view(request):
    # Determinar rol como en otras vistas
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    context = {"rol": rol, "username_value": request.user.username}

    if request.method == "POST":
        action = request.POST.get("action")
        if action == "update_name":
            new_username = request.POST.get("username", "").strip()
            if not new_username:
                messages.error(request, "El nombre de usuario no puede estar vacío.")
            elif User.objects.exclude(pk=request.user.pk).filter(username=new_username).exists():
                messages.error(request, "Ese nombre de usuario ya está en uso.")
            elif len(new_username) > 150:
                messages.error(request, "El nombre de usuario no puede exceder 150 caracteres.")
            else:
                request.user.username = new_username
                request.user.save()
                messages.success(request, "Nombre de usuario actualizado correctamente.")
                context["username_value"] = new_username
            # PRG: redirigir para mostrar mensajes y evitar reenvío
            return HttpResponseRedirect(reverse("perfil") + "#user")
        elif action == "update_password":
            current = request.POST.get("current_password", "")
            new = request.POST.get("new_password", "")
            confirm = request.POST.get("confirm_password", "")

            # Validaciones básicas
            if not request.user.check_password(current):
                messages.error(request, "La contraseña actual no es correcta.")
            elif new != confirm:
                messages.error(request, "La nueva contraseña y su confirmación no coinciden.")
            elif len(new) < 8 or len(new) > 16:
                messages.error(request, "La nueva contraseña debe tener entre 8 y 16 caracteres.")
            elif not any(c.isdigit() for c in new) or not any(c.isupper() for c in new):
                messages.error(request, "La nueva contraseña debe contener al menos un dígito y una mayúscula.")
            else:
                try:
                    request.user.set_password(new)
                    request.user.save()
                    update_session_auth_hash(request, request.user)  # mantener sesión
                    messages.success(request, "Contraseña actualizada correctamente.")
                except Exception:
                    messages.error(request, "Ocurrió un error al actualizar la contraseña. Inténtalo de nuevo.")
            # PRG: redirigir al bloque de contraseña
            return HttpResponseRedirect(reverse("perfil") + "#password")

    return render(request, "perfil.html", context)