# INCIDENT INC-006 — SOLUTION

The API contains:

```text
DB_HOST=127.0.0.1
```

That is incorrect in this architecture.

Inside the API container:

```text
127.0.0.1
```

points back to the API container.

PostgreSQL runs in the Compose service:

```text
db
```

Correct the environment value in `compose.yaml`:

```yaml
DB_HOST: db
```

Recreate the API:

```bash
docker compose up -d --build
```

or:

```bash
docker compose up -d --force-recreate api
```

Test:

```bash
curl http://127.0.0.1:8180/modules
```

---

# ROOT CAUSE

```text
Docker .......... OK
Nginx ........... OK
FastAPI ......... OK
Database ........ OK
Docker network .. OK
DB hostname ..... WRONG
```

Containers communicate through the Docker network using service names.

`localhost` is local to each individual container.
