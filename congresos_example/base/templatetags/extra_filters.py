from django import template

register = template.Library()

# Ya existen otros filtros en este módulo; añadimos `index` de forma segura.

@register.filter(name="index")
def index(sequence, position):
    """
    Devuelve el elemento en `position` de `sequence`.
    - Si `sequence` no es indexable o el índice está fuera de rango, devuelve cadena vacía.
    - Convierte `position` a int si viene como string desde la plantilla.
    """
    try:
        pos = int(position)
    except (TypeError, ValueError):
        return ""
    try:
        return sequence[pos]
    except Exception:
        return ""

from django import template
import re
import html as html_lib

register = template.Library()


@register.filter(name="get_item")
def get_item(mapping, key):
    """
    Safe dict-like access in templates: {{ mydict|get_item:some_key }}.
    Returns empty string on errors.
    """
    try:
        if mapping is None:
            return ""
        return mapping.get(key, "")
    except Exception:
        return ""


@register.filter(name="first_line")
def first_line(value):
    """Devuelve solo la primera línea del texto, sin etiquetas HTML.

    Uso en plantilla: {{ texto|first_line }}
    """
    try:
        if not value:
            return ""
        text = str(value)
        # Convertir saltos <br> y cierres de bloque en nuevas líneas antes de quitar etiquetas
        text = re.sub(r"(?i)<\s*br\s*/?>", "\n", text)
        text = re.sub(r"(?i)</\s*(p|div|li)\s*>", "\n", text)
        # Quitar cualquier otra etiqueta HTML
        text = re.sub(r"<[^>]*>", "", text)
        # Decodificar entidades HTML (&nbsp;,&amp;, etc.)
        text = html_lib.unescape(text)
        # Reemplazar espacios duros unicode NBSP por espacios normales
        text = text.replace("\u00A0", " ")
        # Normalizar saltos de línea
        text = text.replace("\r\n", "\n").replace("\r", "\n")
        # Tomar la primera línea lógica
        first = text.split("\n", 1)[0]
        # Colapsar espacios consecutivos y recortar extremos
        first = re.sub(r"\s+", " ", first).strip()
        return first
    except Exception:
        return ""


@register.filter(name="full_name")
def full_name(user):
    """Devuelve nombre completo (nombre + apellidos) si existen.

    Si el proyecto guarda ambos apellidos juntos en last_name, se mostrarán.
    Fallback: username.
    Uso: {{ user|full_name }}.
    """
    try:
        if not user:
            return ""
        first = (getattr(user, "first_name", "") or "").strip()
        last = (getattr(user, "last_name", "") or "").strip()
        combined = f"{first} {last}".strip()
        return combined or (getattr(user, "username", "") or "")
    except Exception:
        return ""


@register.filter(name="zip_values")
def zip_values(extra_fields, values):
    """
    Zipea `extra_fields` y `values` por posición y devuelve una lista de dicts
    con llaves `id` y `value` para uso en plantillas.

    Uso: {% for pair in extra_fields|zip_values:row.values_ordered %}
            data-extra{{ pair.id }}="{{ pair.value }}"
         {% endfor %}
    """
    try:
        if not extra_fields:
            return []
        vals = list(values or [])
        out = []
        for i, ef in enumerate(extra_fields):
            vid = getattr(ef, 'id', None)
            v = vals[i] if i < len(vals) else ""
            out.append({"id": vid, "value": v})
        return out
    except Exception:
        return []

# Nuevo filtro: obtener nivel de desempeño del miembro por congreso
from base.models import UserCongresoMembership

@register.filter(name="performance_level_for")
def performance_level_for(user, congreso):
    """
    Devuelve el nombre del nivel de desempeño para `user` en el `congreso` dado.
    Acepta `congreso` como objeto o id. Retorna cadena vacía si no existe.
    Uso en plantilla:
      {{ ins.user|performance_level_for:congreso }}
    """
    try:
        if not user or not congreso:
            return ""
        congreso_id = getattr(congreso, "id", None) or int(congreso)
        membership = (
            UserCongresoMembership.objects
            .select_related("performance_level")
            .filter(user=user, congreso_id=congreso_id)
            .order_by("-created_at")
            .first()
        )
        if membership and getattr(membership.performance_level, "name", ""):
            return membership.performance_level.name
        return ""
    except Exception:
        return ""

# Nuevo filtro aritmético: resta segura de dos valores numéricos
@register.filter(name="subtract")
def subtract(a, b):
    """
    Resta `b` de `a` como enteros. Si no son convertibles, devuelve cadena vacía.
    Uso: {{ max_value|subtract:current_count }}
    """
    try:
        return int(a) - int(b)
    except Exception:
        return ""
