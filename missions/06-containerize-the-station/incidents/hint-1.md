# INCIDENT INC-006 — HINT 1

Because:

```text
/health
```

works through Nginx, you know:

```text
Docker host networking works
Nginx works
Nginx can reach API
FastAPI runs
```

The failure happens only when the API needs PostgreSQL.

Inspect:

```bash
docker compose logs api
```
