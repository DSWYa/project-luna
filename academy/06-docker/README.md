# ACADEMY 06 — DOCKER & CONTAINERS

## Image vs Container

```text
IMAGE
template
  ↓ docker run
CONTAINER
running instance
```

## Common Commands

```bash
docker image ls
docker ps
docker ps -a
docker logs CONTAINER
docker exec -it CONTAINER sh
docker stop CONTAINER
docker rm CONTAINER
```

## Ports

```bash
docker run -p 8080:80 nginx
```

means:

```text
host 8080 → container 80
```

## Volumes

```bash
docker volume create mydata
```

```bash
docker run -v mydata:/data IMAGE
```

PostgreSQL 18 official image:

```text
/var/lib/postgresql
```

## Bind Mount

```bash
-v /host/path:/container/path:ro
```

## Network

```bash
docker network create mynet
```

Containers on the same network can communicate by name.

`localhost` inside a container refers to that container.

## Dockerfile

```dockerfile
FROM python:3.13-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]
```

## Build

```bash
docker build -t image-name:tag .
```

## Compose

```bash
docker compose up -d
docker compose ps
docker compose logs
docker compose down
```

Do not casually run:

```bash
docker compose down -v
```

on a database stack.

## Health Check

```yaml
healthcheck:
  test: ["CMD-SHELL", "pg_isready -U $${POSTGRES_USER}"]
```

## Service DNS

Compose service:

```text
db
```

can be reached from another Compose service using:

```text
db
```

as the hostname.
