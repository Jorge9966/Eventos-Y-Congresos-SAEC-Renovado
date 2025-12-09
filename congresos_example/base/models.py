from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify
from django.contrib.auth.hashers import make_password, check_password


class PasswordResetCode(models.Model):
	"""Código de restablecimiento por usuario con expiración y uso único."""
	user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="password_reset_codes")
	code = models.CharField(max_length=8, db_index=True)
	created_at = models.DateTimeField(auto_now_add=True)
	expires_at = models.DateTimeField()
	is_used = models.BooleanField(default=False)

	class Meta:
		indexes = [
			models.Index(fields=["code", "expires_at", "is_used"]),
		]

	def __str__(self) -> str:
		return f"{self.user.username} - {self.code} (used={self.is_used})"


class Congreso(models.Model):
	"""Agrupa la configuración por evento/congreso."""
	name = models.CharField("Nombre", max_length=200, unique=True)
	slug = models.SlugField(max_length=220, unique=True, blank=True)
	logo = models.ImageField(upload_to="logos/", null=True, blank=True)
	description = models.TextField("Descripción", null=True, blank=True)
	admin_user = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name="admin_congresos", verbose_name="Administrador del congreso")
	# Si es True, los usuarios del grupo "Administradores_Congresos" asignados a este congreso
	# solo podrán navegar dentro de este congreso y serán redirigidos directamente al
	# inicio del congreso tras iniciar sesión.
	restrict_group_admin_scope = models.BooleanField(default=True)
	created_at = models.DateTimeField(auto_now_add=True)
	# Contraseña de acceso al registro/membresía para este congreso (almacenada como hash)
	access_password_hash = models.CharField(max_length=128, null=True, blank=True)
	# Cantidad exacta por participante (opcional). Si está vacío, no se aplica requisito/límite.
	talleres_por_participante = models.PositiveSmallIntegerField(
		null=True, blank=True, verbose_name="Talleres por participante",
		help_text="Número exacto de talleres permitidos/exigidos por participante. Vacío = sin restricción."
	)
	conferencias_por_participante = models.PositiveSmallIntegerField(
		null=True, blank=True, verbose_name="Conferencias por participante",
		help_text="Número exacto de conferencias permitidas/exigidas por participante. Vacío = sin restricción."
	)
	concursos_por_participante = models.PositiveSmallIntegerField(
		null=True, blank=True, verbose_name="Concursos por participante",
		help_text="Número exacto de concursos permitidos/exigidos por participante. Vacío = sin restricción."
	)

	def save(self, *args, **kwargs):
		if not self.slug:
			self.slug = slugify(self.name)[:220]
		super().save(*args, **kwargs)

	def __str__(self) -> str:
		return self.name

	# Gestión de contraseña de acceso
	def has_access_password(self) -> bool:
		return bool(self.access_password_hash)

	def set_access_password(self, raw_password: str | None):
		"""Define la contraseña de acceso (hasheada). Si raw_password es vacío/None, borra la contraseña."""
		if raw_password:
			self.access_password_hash = make_password(raw_password)
		else:
			self.access_password_hash = None

	def check_access_password(self, raw_password: str) -> bool:
		if not self.access_password_hash:
			return True  # si no hay contraseña configurada, no se requiere
		return check_password(raw_password or "", self.access_password_hash)


class CongresoAdminScope(models.Model):
	"""Asigna un único congreso a un usuario del grupo "Administradores_Congresos".

	Si existe este registro para el usuario, su acceso como administrador de congresos
	se limitará al congreso indicado y se le redirigirá a la página de inicio de ese congreso
	tras iniciar sesión.
	"""
	user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="admin_congreso_scope")
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="scoped_group_admins")
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("user", "congreso")

	def __str__(self) -> str:
		return f"Scope {self.user.username} -> {self.congreso.name}"


class AllowedEmailDomain(models.Model):
	"""Dominio permitido para registros, asociado a un congreso."""
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="allowed_domains")
	domain = models.CharField("Dominio (ej. @gmail.com)", max_length=100)
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("congreso", "domain")
		ordering = ["congreso__name", "domain"]

	def __str__(self) -> str:
		return f"{self.congreso.name} - {self.domain}"


class PerformanceLevel(models.Model):
	"""Nivel/Grupo/Categoría de desempeño por congreso (semestres, áreas, puestos, etc.)."""
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="performance_levels")
	name = models.CharField("Nombre del nivel", max_length=120)
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("congreso", "name")
		ordering = ["congreso__name", "name"]

	def __str__(self) -> str:
		return f"{self.congreso.name} - {self.name}"


class UserCongresoMembership(models.Model):
	"""Membresía de usuarios a congresos con flujo de aprobación.

	Un usuario puede solicitar pertenecer a un congreso como Instructor o Participante.
	El administrador del congreso (o miembros del grupo Administradores_Congresos asociados) podrá aprobar o rechazar.
	"""
	ROLE_CHOICES = (
		("instructor", "Instructor"),
		("participante", "Participante"),
	)
	STATUS_CHOICES = (
		("pending", "Pendiente"),
		("approved", "Aprobado"),
		("rejected", "Rechazado"),
	)

	user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="congreso_memberships")
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="memberships")
	role = models.CharField(max_length=20, choices=ROLE_CHOICES)
	status = models.CharField(max_length=20, choices=STATUS_CHOICES, default="pending", db_index=True)
	# Para participantes, nivel de desempeño asociado (opcional)
	performance_level = models.ForeignKey(PerformanceLevel, null=True, blank=True, on_delete=models.SET_NULL, related_name="memberships")
	# Email normalizado (minúsculas) tomado del usuario al momento de crear la membresía,
	# para garantizar unicidad por congreso a nivel BD aunque existan múltiples usuarios con mismo correo.
	email_normalized = models.CharField(max_length=254, null=True, blank=True, db_index=True)
	created_at = models.DateTimeField(auto_now_add=True)
	decided_at = models.DateTimeField(null=True, blank=True)
	decided_by = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name="decided_memberships")

	class Meta:
		unique_together = ("user", "congreso", "role")
		indexes = [
			models.Index(fields=["congreso", "status"]),
		]
		constraints = [
			models.UniqueConstraint(fields=["congreso", "email_normalized"], name="uniq_membership_congreso_emailnorm")
		]

	def __str__(self) -> str:
		return f"{self.user.username} -> {self.congreso.name} ({self.role}, {self.status})"

	def save(self, *args, **kwargs):
		# Autorrellenar email_normalized desde el usuario (email o username) en minúsculas
		if not self.email_normalized and self.user:
			raw = (self.user.email or self.user.username or "").strip().lower()
			self.email_normalized = raw or None
		super().save(*args, **kwargs)


class Taller(models.Model):
	"""Taller asociado a un congreso.

	Unicidad: el título debe ser único por congreso, pero puede repetirse entre congresos distintos.
	"""
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="talleres")
	title = models.CharField("Nombre del taller", max_length=300)
	image = models.ImageField(upload_to="talleres/", null=True, blank=True)
	lugar = models.CharField("Lugar", max_length=200, blank=True)
	cupo_maximo = models.PositiveIntegerField("Cupo máximo", null=True, blank=True)
	instructor = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name="talleres_imparte")
	description = models.TextField("Descripción", blank=True)
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("congreso", "title")
		ordering = ["congreso__name", "title"]

	def __str__(self) -> str:
		return f"{self.congreso.name} - {self.title}"


class Conferencia(models.Model):
	"""Conferencia asociada a un congreso.

	Unicidad: el título debe ser único por congreso.
	"""
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="conferencias")
	title = models.CharField("Nombre de la conferencia", max_length=300)
	image = models.ImageField(upload_to="conferencias/", null=True, blank=True)
	lugar = models.CharField("Lugar", max_length=200, blank=True)
	cupo_maximo = models.PositiveIntegerField("Cupo máximo", null=True, blank=True)
	instructor = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name="conferencias_imparte")
	description = models.TextField("Descripción", blank=True)
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("congreso", "title")
		ordering = ["congreso__name", "title"]

	def __str__(self) -> str:
		return f"{self.congreso.name} - {self.title}"


class Concurso(models.Model):
	"""Concurso asociado a un congreso.

	Puede ser de tipo individual o grupal. En individual se usa `cupo_maximo`.
	En grupal se usan `numero_equipos` y `max_por_equipo`.
	Los demás campos son análogos a Taller/Conferencia para mantener consistencia.
	"""
	TIPO_CHOICES = (
		("individual", "Individual"),
		("grupal", "Grupal"),
	)

	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="concursos")
	type = models.CharField(max_length=12, choices=TIPO_CHOICES, default="individual")
	title = models.CharField("Nombre del concurso", max_length=300)
	image = models.ImageField(upload_to="concursos/", null=True, blank=True)
	lugar = models.CharField("Lugar", max_length=200, blank=True)
	instructor = models.ForeignKey(User, null=True, blank=True, on_delete=models.SET_NULL, related_name="concursos_imparte")
	description = models.TextField("Descripción", blank=True)
	# Individual
	cupo_maximo = models.PositiveIntegerField("Cupo máximo", null=True, blank=True)
	# Grupal
	numero_equipos = models.PositiveIntegerField("Número de equipos", null=True, blank=True)
	max_por_equipo = models.PositiveIntegerField("Número máximo por equipo", null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("congreso", "title")
		ordering = ["congreso__name", "title"]

	def __str__(self) -> str:
		return f"{self.congreso.name} - {self.title} ({self.type})"


# =============================
# Inscripciones por recurso
# =============================
class TallerInscripcion(models.Model):
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="taller_inscripciones")
	taller = models.ForeignKey(Taller, on_delete=models.CASCADE, related_name="inscripciones")
	user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="taller_inscripciones")
	performance_level = models.ForeignKey(PerformanceLevel, null=True, blank=True, on_delete=models.SET_NULL, related_name="taller_inscripciones")
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("taller", "user")
		indexes = [
			models.Index(fields=["congreso", "taller"]),
		]

	def __str__(self) -> str:
		return f"{self.taller.title} <- {self.user.username}"


class ConferenciaInscripcion(models.Model):
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="conferencia_inscripciones")
	conferencia = models.ForeignKey(Conferencia, on_delete=models.CASCADE, related_name="inscripciones")
	user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="conferencia_inscripciones")
	performance_level = models.ForeignKey(PerformanceLevel, null=True, blank=True, on_delete=models.SET_NULL, related_name="conferencia_inscripciones")
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("conferencia", "user")
		indexes = [
			models.Index(fields=["congreso", "conferencia"]),
		]

	def __str__(self) -> str:
		return f"{self.conferencia.title} <- {self.user.username}"


class ConcursoInscripcion(models.Model):
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="concurso_inscripciones")
	concurso = models.ForeignKey(Concurso, on_delete=models.CASCADE, related_name="inscripciones")
	user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="concurso_inscripciones")
	performance_level = models.ForeignKey(PerformanceLevel, null=True, blank=True, on_delete=models.SET_NULL, related_name="concurso_inscripciones")
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("concurso", "user")
		indexes = [
			models.Index(fields=["congreso", "concurso"]),
		]

	def __str__(self) -> str:
		return f"{self.concurso.title} <- {self.user.username}"


# =============================
# Equipos de concursos grupales
# =============================
class ConcursoEquipo(models.Model):
	"""Representa un equipo inscrito en un concurso grupal.

	Cada equipo pertenece a un `Concurso` y está liderado por el usuario que realiza la inscripción.
	`nombre` es único dentro del concurso para evitar duplicados fáciles de distinguir.
	"""
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="equipos_concurso")
	concurso = models.ForeignKey(Concurso, on_delete=models.CASCADE, related_name="equipos")
	nombre = models.CharField(max_length=150)
	lider = models.ForeignKey(User, on_delete=models.CASCADE, related_name="equipos_liderados")
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("concurso", "nombre")
		ordering = ["concurso__title", "nombre"]

	def __str__(self) -> str:
		return f"Equipo {self.nombre} - {self.concurso.title}"


class ConcursoEquipoMiembro(models.Model):
	"""Miembros de un equipo de concurso grupal.

	Incluye al líder (se registra también como miembro para facilitar listados homogéneos).
	"""
	equipo = models.ForeignKey(ConcursoEquipo, on_delete=models.CASCADE, related_name="miembros")
	user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="equipos_concurso")
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("equipo", "user")
		ordering = ["equipo__nombre", "user__username"]

	def __str__(self) -> str:
		return f"{self.equipo.nombre} -> {self.user.username}"


# =============================
# Avisos por congreso
# =============================
class Aviso(models.Model):
	congreso = models.ForeignKey(Congreso, on_delete=models.CASCADE, related_name="avisos")
	content = models.TextField("Aviso")
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		ordering = ["-created_at"]

	def __str__(self) -> str:
		return f"Aviso {self.id} - {self.congreso.name}"


# =============================
# Campos extra dinámicos para registro/perfil
# =============================
class ExtraField(models.Model):
	FIELD_TYPE_CHOICES = (
		("text", "Texto"),
		("number", "Número"),
		("date", "Fecha"),
		("boolean", "Sí/No"),
		("select", "Lista"),
		("email", "Correo"),
	)

	ROLE_SCOPE_CHOICES = (
		("both", "Participantes e Instructores"),
		("participante", "Solo Participantes"),
		("instructor", "Solo Instructores"),
	)

	SECTION_CHOICES = (
		("registro", "Registro"),
		("perfil", "Perfil"),
	)

	# Si congreso es NULL el campo es global y aplica a todos los congresos.
	congreso = models.ForeignKey(Congreso, null=True, blank=True, on_delete=models.CASCADE, related_name="extra_fields")
	name = models.CharField("Nombre visible", max_length=200)
	code = models.SlugField("Código interno", max_length=220, help_text="Identificador único, sin espacios.")
	field_type = models.CharField(max_length=12, choices=FIELD_TYPE_CHOICES, default="text")
	role_scope = models.CharField(max_length=20, choices=ROLE_SCOPE_CHOICES, default="both", verbose_name="Visible para")
	section = models.CharField(max_length=20, choices=SECTION_CHOICES, default="registro", verbose_name="Sección")
	required = models.BooleanField(default=False)
	active = models.BooleanField(default=True)
	unique_value = models.BooleanField(default=False, verbose_name="Irrepetible")
	order = models.PositiveIntegerField(default=0)
	choices_text = models.TextField(
		"Opciones (solo para Lista)", blank=True,
		help_text="Una opción por línea o separadas por comas. Se ignorará si el tipo no es Lista."
	)
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		ordering = ["congreso__name", "order", "name"]
		unique_together = ("congreso", "code")

	def __str__(self) -> str:
		cg = self.congreso.name if self.congreso else "Global"
		return f"{cg} - {self.name} ({self.code})"

	def get_choices(self):
		if self.field_type != "select" or not self.choices_text:
			return []
		# Split por líneas o comas y limpiar.
		raw = self.choices_text.replace("\r", "\n")
		parts = []
		for line in raw.split("\n"):
			line = line.strip()
			if not line:
				continue
			parts.extend(p.strip() for p in line.split(",") if p.strip())
		# Quitar duplicados preservando orden
		seen = set()
		final = []
		for p in parts:
			if p not in seen:
				seen.add(p)
				final.append(p)
		return final


class UserExtraFieldValue(models.Model):
	user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="extra_field_values")
	congreso = models.ForeignKey(Congreso, null=True, blank=True, on_delete=models.CASCADE, related_name="extra_field_values")
	field = models.ForeignKey(ExtraField, on_delete=models.CASCADE, related_name="values")
	value = models.CharField("Valor", max_length=500)
	created_at = models.DateTimeField(auto_now_add=True)

	class Meta:
		unique_together = ("user", "congreso", "field")
		constraints = [
			# Evita valores repetidos para el mismo campo y alcance de congreso
			models.UniqueConstraint(fields=["field", "congreso", "value"], name="uniq_extrafieldvalue_field_congreso_value")
		]

	def __str__(self) -> str:
		cg = self.congreso.name if self.congreso else "Global"
		return f"{self.user.username} - {cg} - {self.field.code}"
