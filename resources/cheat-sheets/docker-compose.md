# DOCKER / COMPOSE CHEAT SHEET

Docker status:

```bash
sudo systemctl status docker
```

Images:

```bash
docker image ls
docker pull IMAGE
docker build -t NAME:TAG .
```

Containers:

```bash
docker ps
docker ps -a
docker run -d IMAGE
docker stop NAME
docker rm NAME
docker rm -f NAME
docker logs NAME
docker exec -it NAME sh
```

Ports:

```bash
-p HOST:CONTAINER
```

Volume:

```bash
docker volume create NAME
docker volume ls
```

PostgreSQL 18 storage target:

```text
/var/lib/postgresql
```

Networks:

```bash
docker network create NAME
docker network ls
```

Compose:

```bash
docker compose config
docker compose build
docker compose up -d
docker compose ps
docker compose logs
docker compose logs -f api
docker compose exec api sh
docker compose restart api
docker compose down
```

Dangerous for persistent DB data:

```bash
docker compose down -v
```

Resource usage:

```bash
docker stats
docker system df
```

Troubleshoot:

```text
container running?
↓
health?
↓
logs?
↓
environment?
↓
network/service hostname?
↓
volume?
↓
application?
```
