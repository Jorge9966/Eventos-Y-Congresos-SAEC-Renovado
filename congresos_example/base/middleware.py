from typing import Optional

from django.http import HttpRequest, HttpResponse


class CongresoParamMiddleware:
    """
    Persist the current congreso context across redirects by capturing the
    `c` query parameter and storing it in the session.

    - If `?c=...` is present, save it to `request.session['congreso_id']`.
    - If absent, leave existing session value untouched.
    """

    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request: HttpRequest) -> HttpResponse:
        c_val: Optional[str] = request.GET.get("c")
        if c_val:
            try:
                c_int = int(c_val)
                if c_int > 0:
                    request.session["congreso_id"] = c_int
            except (TypeError, ValueError):
                # Ignore invalid values; do not overwrite session.
                pass

        response = self.get_response(request)
        return response
