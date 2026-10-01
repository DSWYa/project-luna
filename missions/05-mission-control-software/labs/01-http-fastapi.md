# LAB 01 — HTTP & FASTAPI

Perform this lab on **LUNA-1**.

Create a disposable FastAPI application with:

```text
GET /
GET /health
GET /crew/{crew_id}
GET /search
```

Requirements:

- `/` returns a Project LUNA message.
- `/health` returns station and status.
- `/crew/{crew_id}` returns the supplied ID.
- `/search?status=...` returns the supplied query value.

Test using the browser, `/docs`, or `curl`.

Explain in your own words:

- route,
- method,
- path parameter,
- query parameter,
- status code.
