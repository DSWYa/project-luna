# LAB 02 — SECRETS & LOGS

## Secrets

Verify:

```text
.env is ignored
.env is not tracked
.env permissions are restrictive
.env.example contains no real password
```

Commands may include:

```bash
git check-ignore -v .env
git ls-files
ls -l .env
```

## Logs

Generate a few normal requests to the application.

Then use:

```bash
docker compose logs
docker compose logs api
docker compose logs nginx
```

Also inspect:

```bash
journalctl
```

Write down which log source you would check first for:

1. Docker daemon failure.
2. API exception.
3. SSH problem.
4. Nginx proxy problem.
