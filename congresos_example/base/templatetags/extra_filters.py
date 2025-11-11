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
    """
    Devuelve solo la primera línea del texto, sin etiquetas HTML.
    Uso en plantilla: {{ texto|first_line }}
    """
    if value is None:
        return ""
    try:
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
