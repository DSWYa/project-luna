# LAB 04 — DOCKER COMPOSE

Create a disposable two-service Compose application.

Use:

```text
web
db
```

The database should use PostgreSQL 18.

Requirements:

- `compose.yaml` exists,
- database credentials come from variables,
- database has a named volume,
- volume target is `/var/lib/postgresql`,
- PostgreSQL has a health check,
- web depends on database health,
- only the web service publishes a port,
- `docker compose up -d` starts the stack,
- `docker compose ps` shows state,
- `docker compose logs` works,
- `docker compose down` removes containers without deleting the named database volume.

Explain why:

```bash
docker compose down
```

and:

```bash
docker compose down -v
```

are very different for database data.
