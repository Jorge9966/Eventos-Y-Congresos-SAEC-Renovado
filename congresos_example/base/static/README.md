# Static assets for base app

Place your images, CSS, and JS for the `base` app under this directory.

Recommended location for the welcome illustration used in `base/templates/inicio.html`:

- Path: `base/static/base/img/welcome-illustration.png`
- Suggested size: around 220–260px width, transparent background (PNG or SVG)

How to use:
- Save your image to `base/static/base/img/welcome-illustration.png`
- Ensure `django.contrib.staticfiles` is enabled and `STATIC_URL` is configured in your settings.
- In templates, use `{% load static %}` and reference it with `{% static 'base/img/welcome-illustration.png' %}`.
