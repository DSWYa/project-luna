# INCIDENT INC-006 — HINT 2

Inspect the API environment:

```bash
docker compose exec api env
```

Look at:

```text
DB_HOST
```

Remember:

Inside the API container:

```text
127.0.0.1
```

means the API container itself.

The PostgreSQL service is another container.

Compose provides DNS using the service name.
