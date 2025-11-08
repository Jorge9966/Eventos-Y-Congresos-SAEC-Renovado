from django import template

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
