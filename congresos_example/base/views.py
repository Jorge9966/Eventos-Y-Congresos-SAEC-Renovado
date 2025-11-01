from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User, Group
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from django.urls import reverse
from django.http import HttpResponseRedirect
from django.core.mail import send_mail
from django.conf import settings
from django.core.files.uploadedfile import UploadedFile
import random
import re
from datetime import timedelta
from django.utils import timezone
from .models import PasswordResetCode, Congreso, AllowedEmailDomain, PerformanceLevel
def home_congresos(request):
    """Página pública de inicio: lista todos los congresos/eventos y redirige a login al hacer clic."""
    congresos = list(Congreso.objects.all().order_by("name"))
    return render(request, "home.html", {"congresos": congresos})


# -------------------
# LOGIN
# -------------------
def login_view(request):
    # Obtener congreso seleccionado por query (?c=ID) o por campo oculto del formulario
    congreso_id = request.GET.get("c") or request.POST.get("c")
    selected_congreso = None
    if congreso_id:
        try:
            selected_congreso = Congreso.objects.get(pk=congreso_id)
        except Congreso.DoesNotExist:
            selected_congreso = None

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
        return render(request, "login.html", {"selected_congreso": selected_congreso})

    return render(request, "login.html", {"selected_congreso": selected_congreso})


# -------------------
# REGISTRO
# -------------------
def registro_view(request):
    # Congreso seleccionado para mostrar logo en registro
    congreso_id = request.GET.get("c") or request.POST.get("c")
    selected_congreso = None
    if congreso_id:
        try:
            selected_congreso = Congreso.objects.get(pk=congreso_id)
        except Congreso.DoesNotExist:
            selected_congreso = None

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
            return render(request, "register.html", {"selected_congreso": selected_congreso})

        # Validación de política de contraseña: 8-16 caracteres, al menos 1 mayúscula, 1 minúscula y 1 símbolo especial (.!%&$})
        specials = set(".!%&$}")
        if not password or len(password) < 8 or len(password) > 16:
            messages.error(request, "La contraseña debe tener entre 8 y 16 caracteres.")
            return render(request, "register.html", {"selected_congreso": selected_congreso})
        if not any(c.isupper() for c in password) or not any(c.islower() for c in password) or not any(c in specials for c in password):
            messages.error(request, "La contraseña debe contener al menos una letra mayúscula, una letra minúscula y un símbolo especial (.!%&$}).")
            return render(request, "register.html", {"selected_congreso": selected_congreso})

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
                return render(request, "register.html", {"selected_congreso": selected_congreso})

            grupo = Group.objects.get(name="Instructores")
            user.groups.add(grupo)
            login(request, user)
            return redirect("instructor")

        else:
            grupo = Group.objects.get(name="Participantes")
            user.groups.add(grupo)
            login(request, user)
            return redirect("participante")  #  corregido

    return render(request, "register.html", {"selected_congreso": selected_congreso})


# -------------------
# LOGOUT
# -------------------
def logout_view(request):
    logout(request)
    # Redirigir siempre a la página pública de inicio (lista de congresos)
    return redirect("home")


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
def congresos_eventos_view(request):
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    # Asegurar al menos un congreso base para comenzar
    if not Congreso.objects.exists():
        Congreso.objects.create(name="Congreso General")

    # Acciones (eliminar congreso)
    if request.method == "POST":
        action = request.POST.get("action")
        if action == "delete_congreso":
            cid = request.POST.get("congreso_id")
            if cid:
                Congreso.objects.filter(id=cid).delete()
                messages.success(request, "Congreso eliminado.")
            return HttpResponseRedirect(reverse("congresos_eventos"))

    congresos = list(Congreso.objects.all().order_by("name"))
    return render(request, "congresos_eventos.html", {"rol": rol, "congresos": congresos})


@login_required
def congreso_evento_view(request):
    """Crea un nuevo congreso/evento y, opcionalmente, un usuario administrador para ese congreso.

    Campos esperados:
    - logo (archivo, opcional, máx ~3MB)
    - nombre_congreso (texto)
    - descripcion (texto largo, opcional)
    - nombre_encargado (texto)
    - username (texto o email)
    - password (texto, 8-16, mayúscula+minúscula+símbolo especial .!%&$})
    """
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    if request.method == "POST":
        nombre_congreso = (request.POST.get("nombre_congreso") or "").strip()
        descripcion = (request.POST.get("descripcion") or "").strip()
        nombre_encargado = (request.POST.get("nombre_encargado") or "").strip()
        username = (request.POST.get("username") or "").strip()
        password = request.POST.get("password") or ""
        logo_file = request.FILES.get("logo")

        # Validaciones
        has_error = False
        if not nombre_congreso:
            messages.error(request, "El nombre del congreso o evento no puede estar vacío.")
            has_error = True
        elif Congreso.objects.filter(name__iexact=nombre_congreso).exists():
            messages.error(request, "Ya existe un congreso o evento con ese nombre.")
            has_error = True

        if logo_file:
            # Límite aproximado 3MB
            max_bytes = 3 * 1024 * 1024
            if isinstance(logo_file, UploadedFile) and logo_file.size > max_bytes:
                messages.error(request, "El logo excede el tamaño máximo de 3MB.")
                has_error = True

        # Validaciones de usuario (si se llenan los 3 campos, intentamos crear usuario)
        creating_user = bool(nombre_encargado or username or password)
        if creating_user:
            if not (nombre_encargado and username and password):
                messages.error(request, "Para crear el usuario administrador del congreso, llena Nombre, Usuario y Contraseña.")
                has_error = True
            else:
                if User.objects.filter(username=username).exists():
                    messages.error(request, "El usuario indicado ya existe.")
                    has_error = True
                # Política de contraseña usada en el proyecto
                specials = set(".!%&$}")
                if len(password) < 8 or len(password) > 16 or not any(c.isupper() for c in password) or not any(c.islower() for c in password) or not any(c in specials for c in password):
                    messages.error(request, "La contraseña debe tener entre 8 y 16 caracteres, incluir mayúscula, minúscula y un símbolo especial (.!%&$}).")
                    has_error = True

        if not has_error:
            # Crear congreso
            congreso = Congreso(name=nombre_congreso, description=descripcion or None)
            if logo_file:
                congreso.logo = logo_file
            congreso.save()

            # Crear usuario si corresponde
            if creating_user and nombre_encargado and username and password:
                user = User.objects.create_user(
                    username=username,
                    email=username if "@" in username else "",
                    password=password,
                    first_name=nombre_encargado,
                )
                # Asegurar grupo Administradores_Congresos
                group_name = "Administradores_Congresos"
                group, _ = Group.objects.get_or_create(name=group_name)
                user.groups.add(group)
                # Relacionar como administrador del congreso
                congreso.admin_user = user
                congreso.save(update_fields=["admin_user"])

            messages.success(request, "Congreso o evento creado correctamente.")
            return redirect("congresos_eventos")

    return render(request, "congreso_evento.html", {"rol": rol})

@login_required
def editar_congreso_evento_view(request, congreso_id: int):
    """Edita un congreso/evento existente. Permite actualizar nombre y logo.

    Campos opcionales para usuario administrador:
    - nombre_encargado, username, password. Si existen valores y el congreso ya tiene
      admin_user, se actualizan esos campos (password solo si viene). Si no tiene
      admin_user y se llenan los 3, se crea y se asocia.
    """
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    try:
        congreso = Congreso.objects.get(pk=congreso_id)
    except Congreso.DoesNotExist:
        messages.error(request, "El congreso solicitado no existe.")
        return redirect("congresos_eventos")

    if request.method == "POST":
        nombre_congreso = (request.POST.get("nombre_congreso") or "").strip()
        descripcion = (request.POST.get("descripcion") or "").strip()
        nombre_encargado = (request.POST.get("nombre_encargado") or "").strip()
        username = (request.POST.get("username") or "").strip()
        password = request.POST.get("password") or ""
        logo_file = request.FILES.get("logo")

        has_error = False
        if not nombre_congreso:
            messages.error(request, "El nombre del congreso o evento no puede estar vacío.")
            has_error = True
        elif Congreso.objects.exclude(pk=congreso.pk).filter(name__iexact=nombre_congreso).exists():
            messages.error(request, "Ya existe un congreso o evento con ese nombre.")
            has_error = True

        if logo_file:
            max_bytes = 3 * 1024 * 1024
            if isinstance(logo_file, UploadedFile) and logo_file.size > max_bytes:
                messages.error(request, "El logo excede el tamaño máximo de 3MB.")
                has_error = True

        # Actualización/creación de admin user según entradas
        specials = set(".!%&$}")
        admin = congreso.admin_user
        if nombre_encargado or username or password:
            if admin:
                # actualizar existente
                if username:
                    if User.objects.exclude(pk=admin.pk).filter(username=username).exists():
                        messages.error(request, "El usuario indicado ya existe.")
                        has_error = True
                    else:
                        admin.username = username
                        admin.email = username if "@" in username else admin.email
                if nombre_encargado:
                    admin.first_name = nombre_encargado
                if password:
                    if len(password) < 8 or len(password) > 16 or not any(c.isupper() for c in password) or not any(c.islower() for c in password) or not any(c in specials for c in password):
                        messages.error(request, "La contraseña debe tener entre 8 y 16 caracteres, incluir mayúscula, minúscula y un símbolo especial (.!%&$}).")
                        has_error = True
                    else:
                        admin.set_password(password)
                if not has_error:
                    admin.save()
            else:
                # crear nuevo solo si vienen los 3 campos
                if nombre_encargado and username and password:
                    if User.objects.filter(username=username).exists():
                        messages.error(request, "El usuario indicado ya existe.")
                        has_error = True
                    elif len(password) < 8 or len(password) > 16 or not any(c.isupper() for c in password) or not any(c.islower() for c in password) or not any(c in specials for c in password):
                        messages.error(request, "La contraseña debe tener entre 8 y 16 caracteres, incluir mayúscula, minúscula y un símbolo especial (.!%&$}).")
                        has_error = True
                    else:
                        user = User.objects.create_user(
                            username=username,
                            email=username if "@" in username else "",
                            password=password,
                            first_name=nombre_encargado,
                        )
                        group, _ = Group.objects.get_or_create(name="Administradores_Congresos")
                        user.groups.add(group)
                        congreso.admin_user = user
                else:
                    messages.error(request, "Para crear el usuario administrador del congreso, llena Nombre, Usuario y Contraseña.")
                    has_error = True

        if not has_error:
            congreso.name = nombre_congreso
            congreso.description = descripcion or None
            if logo_file:
                congreso.logo = logo_file
            congreso.save()
            messages.success(request, "Congreso o evento actualizado correctamente.")
            return redirect("congresos_eventos")

    # Valores por defecto para el formulario
    initial = {
        "nombre_congreso": congreso.name,
        "descripcion": congreso.description or "",
        "nombre_encargado": congreso.admin_user.first_name if congreso.admin_user else "",
        "username": congreso.admin_user.username if congreso.admin_user else "",
    }

    return render(request, "editar_congreso_evento.html", {"rol": rol, "congreso": congreso, **initial})

@login_required
def correos_view(request):
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    # Crear congreso rápido si no hay ninguno aún (para empezar a trabajar)
    if not Congreso.objects.exists():
        Congreso.objects.create(name="Congreso General")

    # Selección de congreso actual (por querystring ?c=ID o por post oculto)
    selected_id = request.POST.get("congreso_id") or request.GET.get("c")
    try:
        congreso = Congreso.objects.get(pk=selected_id) if selected_id else Congreso.objects.order_by("name").first()
    except Congreso.DoesNotExist:
        congreso = Congreso.objects.order_by("name").first()

    # Acciones
    if request.method == "POST":
        action = request.POST.get("action")
        if action == "create_congreso":
            name = (request.POST.get("name") or "").strip()
            if not name:
                messages.error(request, "El nombre del congreso no puede estar vacío.")
            elif Congreso.objects.filter(name__iexact=name).exists():
                messages.error(request, "Ya existe un congreso con ese nombre.")
            else:
                congreso = Congreso.objects.create(name=name)
                messages.success(request, "Congreso creado.")
            return HttpResponseRedirect(reverse("correos") + f"?c={congreso.id}")

        elif action == "add_domain":
            raw = (request.POST.get("domain") or "").strip().lower()
            # Normalizar: asegurar que empiece con '@'
            if raw and not raw.startswith("@"):
                raw = "@" + raw
            if not raw or "@" not in raw or "." not in raw:
                messages.error(request, "Ingresa un dominio válido. Ej.: @gmail.com")
            else:
                try:
                    AllowedEmailDomain.objects.create(congreso=congreso, domain=raw)
                    messages.success(request, "Dominio agregado.")
                except Exception:
                    messages.error(request, "Ese dominio ya existe para este congreso.")
            return HttpResponseRedirect(reverse("correos") + f"?c={congreso.id}")

        elif action == "delete_domain":
            did = request.POST.get("domain_id")
            AllowedEmailDomain.objects.filter(id=did, congreso=congreso).delete()
            messages.success(request, "Dominio eliminado.")
            return HttpResponseRedirect(reverse("correos") + f"?c={congreso.id}")

        elif action == "update_domain":
            did = request.POST.get("domain_id")
            raw = (request.POST.get("domain") or "").strip().lower()
            if raw and not raw.startswith("@"):
                raw = "@" + raw
            if not raw or "@" not in raw or "." not in raw:
                messages.error(request, "Ingresa un dominio válido. Ej.: @gmail.com")
            else:
                try:
                    dom = AllowedEmailDomain.objects.get(id=did, congreso=congreso)
                    if AllowedEmailDomain.objects.exclude(id=did).filter(congreso=congreso, domain=raw).exists():
                        messages.error(request, "Ese dominio ya existe para este congreso.")
                    else:
                        dom.domain = raw
                        dom.save(update_fields=["domain"])
                        messages.success(request, "Dominio actualizado.")
                except AllowedEmailDomain.DoesNotExist:
                    messages.error(request, "El dominio a actualizar no existe.")
            return HttpResponseRedirect(reverse("correos") + f"?c={congreso.id}")

    congresos = list(Congreso.objects.all().order_by("name"))
    dominios = list(AllowedEmailDomain.objects.filter(congreso=congreso).order_by("domain"))
    # Modo edición opcional via querystring ?edit=<id>
    edit_id = request.GET.get("edit")
    edit_domain = None
    if edit_id:
        try:
            edit_domain = AllowedEmailDomain.objects.get(id=edit_id, congreso=congreso)
        except AllowedEmailDomain.DoesNotExist:
            edit_domain = None

    ctx = {
        "rol": rol,
        "congresos": congresos,
        "congreso": congreso,
        "dominios": dominios,
        "edit_domain": edit_domain,
    }
    return render(request, "correos.html", ctx)

@login_required
def nivel_desempeno_view(request):
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    if not Congreso.objects.exists():
        Congreso.objects.create(name="Congreso General")

    selected_id = request.POST.get("congreso_id") or request.GET.get("c")
    try:
        congreso = Congreso.objects.get(pk=selected_id) if selected_id else Congreso.objects.order_by("name").first()
    except Congreso.DoesNotExist:
        congreso = Congreso.objects.order_by("name").first()

    if request.method == "POST":
        action = request.POST.get("action")
        if action == "add_level":
            name = (request.POST.get("name") or "").strip()

            if not name:
                messages.error(request, "El nombre del nivel no puede estar vacío.")
            else:
                try:
                    PerformanceLevel.objects.create(congreso=congreso, name=name)
                    messages.success(request, "Nivel agregado.")
                except Exception:
                    messages.error(request, "Ese nivel ya existe para este congreso.")
            return HttpResponseRedirect(reverse("nivel_desempeno") + f"?c={congreso.id}")

        elif action == "delete_level":
            lid = request.POST.get("level_id")
            PerformanceLevel.objects.filter(id=lid, congreso=congreso).delete()
            messages.success(request, "Nivel eliminado.")
            return HttpResponseRedirect(reverse("nivel_desempeno") + f"?c={congreso.id}")

        elif action == "update_level":
            lid = request.POST.get("level_id")
            name = (request.POST.get("name") or "").strip()
            if not name:
                messages.error(request, "El nombre del nivel no puede estar vacío.")
            else:
                try:
                    lvl = PerformanceLevel.objects.get(id=lid, congreso=congreso)
                    if PerformanceLevel.objects.exclude(id=lid).filter(congreso=congreso, name__iexact=name).exists():
                        messages.error(request, "Ese nivel ya existe para este congreso.")
                    else:
                        lvl.name = name
                        lvl.save(update_fields=["name"])
                        messages.success(request, "Nivel actualizado.")
                except PerformanceLevel.DoesNotExist:
                    messages.error(request, "El nivel a actualizar no existe.")
            return HttpResponseRedirect(reverse("nivel_desempeno") + f"?c={congreso.id}")

    congresos = list(Congreso.objects.all().order_by("name"))
    niveles = list(PerformanceLevel.objects.filter(congreso=congreso).order_by("name"))
    edit_id = request.GET.get("edit")
    edit_level = None
    if edit_id:
        try:
            edit_level = PerformanceLevel.objects.get(id=edit_id, congreso=congreso)
        except PerformanceLevel.DoesNotExist:
            edit_level = None
    return render(request, "nivel_desempeno.html", {"rol": rol, "congresos": congresos, "congreso": congreso, "niveles": niveles, "edit_level": edit_level})

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
            else:
                specials = set(".!%&$}")
                if not any(c.isupper() for c in new) or not any(c.islower() for c in new) or not any(c in specials for c in new):
                    messages.error(request, "La nueva contraseña debe contener al menos una letra mayúscula, una letra minúscula y un símbolo especial (.!%&$}).")
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


@login_required
def inicio_congreso_view(request, congreso_id: int):
    """Página de inicio/administración para un congreso específico."""
    grupos = request.user.groups.values_list("name", flat=True)
    if "Instructores" in grupos:
        rol = "Instructor"
    elif "Participantes" in grupos:
        rol = "Participante"
    else:
        rol = "Administrador"

    try:
        congreso = Congreso.objects.get(pk=congreso_id)
    except Congreso.DoesNotExist:
        messages.error(request, "El congreso solicitado no existe.")
        return redirect("congresos_eventos")

    return render(request, "inicio_congreso.html", {"rol": rol, "congreso": congreso})


# -------------------
# RECUPERAR CONTRASEÑA (solicitud por correo)
# -------------------
def recuperar_contrasena_view(request):
    """Solicita el correo y, si existe, envía un código y un enlace de restablecimiento.

    - Si el correo es válido y pertenece a un usuario: muestra mensaje de confirmación grande
      y envía un correo con un código de 4 dígitos y un enlace a una página (placeholder).
    - Si el correo no existe o es inválido: despliega error y deja el formulario visible.
    """
    # Mostrar pista en UI si estamos usando el backend de consola
    using_console = getattr(settings, "EMAIL_BACKEND", "").endswith("console.EmailBackend")
    # Mantener el logo del congreso seleccionado (si llega ?c=ID)
    congreso_id = request.GET.get("c") or request.POST.get("c")
    selected_congreso = None
    if congreso_id:
        try:
            selected_congreso = Congreso.objects.get(pk=congreso_id)
        except Congreso.DoesNotExist:
            selected_congreso = None

    context = {"email_sent": False, "using_console_backend": using_console, "selected_congreso": selected_congreso}

    if request.method == "POST":
        email = request.POST.get("email", "").strip()

        # Validación básica de email (formato)
        email_regex = r"^[^@\s]+@[^@\s]+\.[^@\s]+$"
        if not re.match(email_regex, email):
            messages.error(request, "Ingresa un correo válido.")
            return render(request, "password_reset.html", context)

        # Verificar si el correo existe en usuarios
        try:
            user = User.objects.get(email__iexact=email)
        except User.DoesNotExist:
            messages.error(request, "No existe una cuenta con ese correo.")
            return render(request, "password_reset.html", context)

        # Generar código y enlace
        codigo = random.randint(1000, 9999)
        enlace = request.build_absolute_uri(
            reverse("code_password") + f"?code={codigo}"
            + (f"&c={selected_congreso.id}" if selected_congreso else "")
        )

        # Persistir código con expiración de 30 minutos y anular anteriores
        PasswordResetCode.objects.filter(user=user, is_used=False).delete()
        expires_at = timezone.now() + timedelta(minutes=30)
        PasswordResetCode.objects.create(user=user, code=str(codigo), expires_at=expires_at)

        # Preparar correo (texto + HTML con enlace clicable)
        subject = "Restablecer contraseña (válido 30 min)"
        body = (
            "Estimad@ usuario\n\n"
            "Recientemente se envió una solicitud para restablecer una contraseña para su cuenta.\n"
            "Si esto fue un error, simplemente ignore este correo electrónico y no pasará nada.\n"
            "Para restablecer su contraseña tenga en cuenta el siguiente código:\n\n"
            f"{codigo}\n\n"
            "Este código caduca en 30 minutos.\n\n"
            f"Para restablecer su contraseña da clic aquí: {enlace}\n\n"
            "Saludos"
        )

        html_body = f"""
            <p>Estimad@ usuario</p>
            <p>
              Recientemente se envió una solicitud para restablecer una contraseña para su cuenta.<br/>
              Si esto fue un error, simplemente ignore este correo electrónico y no pasará nada.
            </p>
            <p>Para restablecer su contraseña tenga en cuenta el siguiente código:</p>
            <p style=\"font-size:22px;font-weight:700;letter-spacing:3px;margin:8px 0;\">{codigo}</p>
            <p style=\"margin:8px 0;\"><strong>Este código caduca en 30 minutos.</strong></p>
            <p>
              <a href=\"{enlace}\" style=\"display:inline-block;padding:10px 16px;background:#0d6efd;color:#fff;text-decoration:none;border-radius:6px;\">
                Para restablecer su contraseña da clic aquí
              </a>
            </p>
            <p>Saludos</p>
    """

        from_email = getattr(settings, "DEFAULT_FROM_EMAIL", None) or getattr(
            settings, "EMAIL_HOST_USER", "no-reply@localhost"
        )

        try:
            send_mail(subject, body, from_email, [email], fail_silently=False, html_message=html_body)
            context["email_sent"] = True
        except Exception:
            # Si hay problema con la configuración de correo, avisar pero no fallar.
            messages.warning(
                request,
                "No se pudo enviar el correo en este momento. Verifica la configuración de correo del sistema."
            )

        return render(request, "password_reset.html", context)

    return render(request, "password_reset.html", context)


def code_password_view(request):
    """Verifica el código y permite cambiar la contraseña con la política definida."""
    prefill_code = request.GET.get("code", "").strip()
    context = {"prefill_code": prefill_code}
    # Mantener logo de congreso seleccionado si llega ?c=ID
    congreso_id = request.GET.get("c") or request.POST.get("c")
    selected_congreso = None
    if congreso_id:
        try:
            selected_congreso = Congreso.objects.get(pk=congreso_id)
        except Congreso.DoesNotExist:
            selected_congreso = None
    context["selected_congreso"] = selected_congreso

    if request.method == "POST":
        code = request.POST.get("code", "").strip()
        new = request.POST.get("new_password", "")
        confirm = request.POST.get("confirm_password", "")

        # Validaciones de código
        if not code:
            messages.error(request, "Ingresa el código enviado a tu correo.")
            return render(request, "code_password.html", context)

        now = timezone.now()
        prc = (
            PasswordResetCode.objects.filter(code=code, is_used=False, expires_at__gt=now)
            .order_by("-created_at")
            .first()
        )
        if not prc:
            messages.error(request, "El código es inválido o ha expirado.")
            return render(request, "code_password.html", context)

        # Validaciones de contraseña
        if new != confirm:
            messages.error(request, "La nueva contraseña y su confirmación no coinciden.")
            return render(request, "code_password.html", context)
        if len(new) < 8 or len(new) > 16:
            messages.error(request, "La nueva contraseña debe tener entre 8 y 16 caracteres.")
            return render(request, "code_password.html", context)
        specials = set(".!%&$}")
        if not any(c.isupper() for c in new) or not any(c.islower() for c in new) or not any(c in specials for c in new):
            messages.error(
                request,
                "La nueva contraseña debe contener al menos una letra mayúscula, una letra minúscula y un símbolo especial (.!%&$}).",
            )
            return render(request, "code_password.html", context)

        # Cambiar contraseña del usuario dueño del código
        user = prc.user
        try:
            user.set_password(new)
            user.save()
            # Marcar código como usado e invalidar otros pendientes
            prc.is_used = True
            prc.save(update_fields=["is_used"])
            PasswordResetCode.objects.filter(user=user, is_used=False).exclude(pk=prc.pk).delete()
            messages.success(request, "Tu contraseña fue restablecida. Ahora puedes iniciar sesión.")
            return redirect("login")
        except Exception:
            messages.error(request, "No se pudo restablecer la contraseña en este momento.")

    return render(request, "code_password.html", context)