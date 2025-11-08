from django.contrib import admin
from .models import PasswordResetCode, Congreso, AllowedEmailDomain, PerformanceLevel
from .models import UserCongresoMembership
from .models import Taller, Conferencia, Concurso
from .models import TallerInscripcion, ConferenciaInscripcion, ConcursoInscripcion
from .models import Aviso, ExtraField, UserExtraFieldValue


@admin.register(PasswordResetCode)
class PasswordResetCodeAdmin(admin.ModelAdmin):
	list_display = ("user", "code", "created_at", "expires_at", "is_used")
	list_filter = ("is_used", "created_at")
	search_fields = ("user__username", "user__email", "code")


@admin.register(Congreso)
class CongresoAdmin(admin.ModelAdmin):
	list_display = ("name", "slug", "created_at")
	search_fields = ("name", "slug")


@admin.register(AllowedEmailDomain)
class AllowedEmailDomainAdmin(admin.ModelAdmin):
	list_display = ("congreso", "domain", "created_at")
	list_filter = ("congreso",)
	search_fields = ("domain", "congreso__name")


@admin.register(PerformanceLevel)
class PerformanceLevelAdmin(admin.ModelAdmin):
	list_display = ("congreso", "name", "created_at")
	list_filter = ("congreso",)
	search_fields = ("name", "congreso__name")
	ordering = ("congreso__name", "name")

@admin.register(UserCongresoMembership)
class UserCongresoMembershipAdmin(admin.ModelAdmin):
	list_display = ("user", "congreso", "role", "status", "created_at", "decided_at", "decided_by")
	list_filter = ("congreso", "role", "status")
	search_fields = ("user__username", "user__first_name", "user__last_name", "congreso__name")


@admin.register(Taller)
class TallerAdmin(admin.ModelAdmin):
	list_display = ("congreso", "title", "lugar", "cupo_maximo", "instructor", "created_at")
	list_filter = ("congreso",)
	search_fields = ("title", "congreso__name")


@admin.register(Conferencia)
class ConferenciaAdmin(admin.ModelAdmin):
	list_display = ("congreso", "title", "lugar", "instructor", "created_at")
	list_filter = ("congreso",)
	search_fields = ("title", "congreso__name")


@admin.register(Concurso)
class ConcursoAdmin(admin.ModelAdmin):
	list_display = ("congreso", "title", "type", "lugar", "created_at")
	list_filter = ("congreso", "type")
	search_fields = ("title", "congreso__name")


@admin.register(TallerInscripcion)
class TallerInscripcionAdmin(admin.ModelAdmin):
	list_display = ("taller", "user", "performance_level", "created_at")
	list_filter = ("taller__congreso",)
	search_fields = ("taller__title", "user__username", "user__first_name")


@admin.register(ConferenciaInscripcion)
class ConferenciaInscripcionAdmin(admin.ModelAdmin):
	list_display = ("conferencia", "user", "performance_level", "created_at")
	list_filter = ("conferencia__congreso",)
	search_fields = ("conferencia__title", "user__username", "user__first_name")


@admin.register(ConcursoInscripcion)
class ConcursoInscripcionAdmin(admin.ModelAdmin):
	list_display = ("concurso", "user", "performance_level", "created_at")
	list_filter = ("concurso__congreso",)
	search_fields = ("concurso__title", "user__username", "user__first_name")


@admin.register(Aviso)
class AvisoAdmin(admin.ModelAdmin):
	list_display = ("id", "congreso", "created_at")
	list_filter = ("congreso",)
	search_fields = ("content", "congreso__name")


@admin.register(ExtraField)
class ExtraFieldAdmin(admin.ModelAdmin):
	list_display = ("congreso", "name", "code", "role_scope", "required", "active", "created_at")
	list_filter = ("congreso", "role_scope", "required", "active")
	search_fields = ("name", "code", "congreso__name")
	ordering = ("congreso__name", "name")


@admin.register(UserExtraFieldValue)
class UserExtraFieldValueAdmin(admin.ModelAdmin):
	list_display = ("user", "congreso", "field", "value", "created_at")
	list_filter = ("congreso",)
	search_fields = ("user__username", "user__email", "field__name", "field__code", "value")
