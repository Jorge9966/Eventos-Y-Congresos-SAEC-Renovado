from django.contrib import admin
from .models import PasswordResetCode, Congreso, AllowedEmailDomain, PerformanceLevel


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
