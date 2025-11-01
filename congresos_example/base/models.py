from django.db import models
from django.contrib.auth.models import User
from django.utils.text import slugify


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
	created_at = models.DateTimeField(auto_now_add=True)

	def save(self, *args, **kwargs):
		if not self.slug:
			self.slug = slugify(self.name)[:220]
		super().save(*args, **kwargs)

	def __str__(self) -> str:
		return self.name


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
