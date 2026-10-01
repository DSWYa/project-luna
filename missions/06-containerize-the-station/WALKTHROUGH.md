# MISSION 06 WALKTHROUGH

All Docker runtime work happens on:

```text
🌑 LUNA-1 Ubuntu Server VM
```

Earth Mission Control remains your SSH, Git, and browser workstation.

---

# PART 1 — UPDATE LUNA-1

SSH into LUNA-1.

```bash
sudo apt update
sudo apt upgrade -y
```

---

# PART 2 — INSTALL DOCKER ENGINE FROM DOCKER'S APT REPOSITORY

Install prerequisites:

```bash
sudo apt install ca-certificates curl -y
```

Create the keyring directory:

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```

Download Docker's signing key:

```bash
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  -o /etc/apt/keyrings/docker.asc
```

Make it readable:

```bash
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

Add Docker's repository:

```bash
sudo tee /etc/apt/sources.list.d/docker.sources > /dev/null <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
```

Update:

```bash
sudo apt update
```

Install Docker Engine and the Compose plugin:

```bash
sudo apt install \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin \
  -y
```

---

# PART 3 — VERIFY DOCKER

Check the service:

```bash
sudo systemctl status docker
```

Verify Engine:

```bash
sudo docker run --rm hello-world
```

Verify Compose:

```bash
sudo docker compose version
```

---

# PART 4 — OPTIONAL NON-ROOT DOCKER ACCESS

You may add `lunaadmin` to the Docker group:

```bash
sudo usermod -aG docker $USER
```

Then completely log out of SSH and reconnect.

Verify:

```bash
docker run --rm hello-world
```

## Important Security Note

Membership in the:

```text
docker
```

group effectively grants root-level power over the Docker host.

Treat Docker access as privileged administrative access.

If you do not want to add your user to the group, prefix Docker commands with:

```text
sudo
```

The rest of the mission shows commands without `sudo` for readability.

---

# PART 5 — IMAGE VS CONTAINER

Mental model:

```text
IMAGE
read-only application template
       │
       │ docker run
       ▼
CONTAINER
running instance of image
```

An image is similar to a template.

A container is an instance created from the template.

---

# PART 6 — PULL AN IMAGE

Run:

```bash
docker pull nginx:alpine
```

List images:

```bash
docker image ls
```

You downloaded an image but have not started a container yet.

---

# PART 7 — RUN YOUR FIRST WEB CONTAINER

Run:

```bash
docker run -d \
  --name luna-nginx-training \
  -p 8080:80 \
  nginx:alpine
```

Meaning:

```text
-d
run detached

--name
give the container a readable name

-p 8080:80
host port 8080 → container port 80
```

From Earth Mission Control browse:

```text
http://YOUR-LUNA-IP:8080/
```

You should see the Nginx welcome page.

---

# PART 8 — HOST PORT VS CONTAINER PORT

This:

```text
8080:80
```

means:

```text
LUNA-1 port 8080
        │
        ▼
container port 80
```

The service inside the container still listens on port 80.

Docker publishes it as port 8080 on the host.

---

# PART 9 — LIST CONTAINERS

Running containers:

```bash
docker ps
```

All containers:

```bash
docker ps -a
```

---

# PART 10 — LOGS

Inspect:

```bash
docker logs luna-nginx-training
```

Follow logs:

```bash
docker logs -f luna-nginx-training
```

Exit follow mode:

```text
Ctrl + C
```

---

# PART 11 — EXECUTE A COMMAND INSIDE A CONTAINER

Run:

```bash
docker exec luna-nginx-training nginx -v
```

Interactive shell:

```bash
docker exec -it luna-nginx-training sh
```

Inside:

```sh
ls /
```

Exit:

```sh
exit
```

`docker exec` runs a command inside an already-running container.

---

# PART 12 — STOP AND REMOVE

Stop:

```bash
docker stop luna-nginx-training
```

Remove:

```bash
docker rm luna-nginx-training
```

The image remains.

Verify:

```bash
docker image ls
```

---

# PART 13 — EPHEMERAL CONTAINER DATA

By default, changes made inside a container belong to that container's writable layer.

Removing the container removes those changes.

Important mental model:

```text
container filesystem
        =
temporary unless storage is mounted
```

Persistent data should live outside the disposable container layer.

---

# PART 14 — CREATE A NAMED VOLUME

Create:

```bash
docker volume create luna-training-data
```

List:

```bash
docker volume ls
```

Write data:

```bash
docker run --rm \
  -v luna-training-data:/data \
  busybox \
  sh -c 'echo "PROJECT LUNA" > /data/status.txt'
```

Read it using a completely different container:

```bash
docker run --rm \
  -v luna-training-data:/data \
  busybox \
  cat /data/status.txt
```

The first container no longer exists.

The volume preserved the data.

---

# PART 15 — BIND MOUNTS

A bind mount connects a specific host path to a container path.

Create:

```bash
mkdir -p ~/docker-training/site
```

Create:

```text
~/docker-training/site/index.html
```

with:

```html
<h1>PROJECT LUNA CONTAINER LAB</h1>
```

Run:

```bash
docker run -d \
  --name luna-bind-lab \
  -p 8081:80 \
  -v "$HOME/docker-training/site:/usr/share/nginx/html:ro" \
  nginx:alpine
```

Browse:

```text
http://YOUR-LUNA-IP:8081/
```

The `:ro` means read-only inside the container.

---

# PART 16 — NAMED VOLUME VS BIND MOUNT

Named volume:

```text
Docker manages the storage location.
Good for persistent application data.
```

Bind mount:

```text
You choose the host file/folder.
Good for configuration or development files.
```

Project LUNA will use:

```text
named volume
for PostgreSQL database data

bind mount
for Nginx configuration
```

---

# PART 17 — CLEAN UP TRAINING CONTAINER

```bash
docker rm -f luna-bind-lab
```

You may keep the named training volume for now.

---

# PART 18 — DOCKER NETWORKS

Create:

```bash
docker network create luna-training-net
```

Run an Nginx container on that network:

```bash
docker run -d \
  --name luna-network-web \
  --network luna-training-net \
  nginx:alpine
```

Notice:

```text
no -p
```

The container is not published to Earth.

---

# PART 19 — CONTAINER DNS

Run a temporary BusyBox container on the same network:

```bash
docker run --rm \
  --network luna-training-net \
  busybox \
  wget -qO- http://luna-network-web
```

The important part is:

```text
luna-network-web
```

Docker networking provides name resolution between containers.

Containers do not need to know each other's changing IP addresses.

---

# PART 20 — `localhost` INSIDE A CONTAINER

Inside a container:

```text
127.0.0.1
localhost
```

means:

> this container

It does **not** mean:

> another container

Therefore an API container should not connect to a PostgreSQL container using:

```text
127.0.0.1
```

It should use the database service/container name:

```text
db
```

This concept will appear in the incident.

---

# PART 21 — NETWORK CLEANUP

```bash
docker rm -f luna-network-web
docker network rm luna-training-net
```

---

# PART 22 — DOCKERFILE

A Dockerfile is a **text file** containing instructions for building an image.

Create:

```bash
mkdir -p ~/docker-training/api
cd ~/docker-training/api
```

Create:

```text
main.py
```

Paste:

```python
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def root():
    return {
        "message": "LUNA CONTAINER API ONLINE"
    }
```

Create:

```text
requirements.txt
```

Paste:

```text
fastapi[standard-no-fastapi-cloud-cli]
```

---

# PART 23 — CREATE A DOCKERFILE

Create a **file** named exactly:

```text
Dockerfile
```

No extension.

Paste:

```dockerfile
FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]
```

---

# PART 24 — DOCKERFILE INSTRUCTIONS

```text
FROM
starting base image

WORKDIR
default directory inside image

COPY
copy files into image

RUN
execute command while building image

CMD
default command when container starts
```

---

# PART 25 — BUILD AN IMAGE

From the folder containing the Dockerfile:

```bash
docker build -t luna-api-training:1.0 .
```

The final:

```text
.
```

means:

> use the current directory as the build context

List:

```bash
docker image ls
```

---

# PART 26 — RUN YOUR CUSTOM IMAGE

```bash
docker run -d \
  --name luna-api-training \
  -p 8082:8000 \
  luna-api-training:1.0
```

Test from Earth:

```text
http://YOUR-LUNA-IP:8082/
```

Logs:

```bash
docker logs luna-api-training
```

Clean up:

```bash
docker rm -f luna-api-training
```

---

# PART 27 — IMAGE LAYERS AND BUILD CACHING

Notice the Dockerfile copies:

```text
requirements.txt
```

before the rest of the application.

This helps Docker reuse earlier build layers when your Python source changes but dependencies do not.

A common pattern is:

```dockerfile
COPY requirements.txt .
RUN pip install ...
COPY . .
```

rather than copying everything before installing dependencies.

---

# PART 28 — `.dockerignore`

Create:

```text
.dockerignore
```

Example:

```text
.venv/
__pycache__/
*.pyc
*.env
.git/
```

This prevents unnecessary or sensitive files from entering the Docker build context.

`.dockerignore` is similar in spirit to `.gitignore`, but it controls Docker's build context.

---

# PART 29 — POSTGRESQL CONTAINER

Create a named volume:

```bash
docker volume create luna-postgres-training
```

Run PostgreSQL 18:

```bash
docker run -d \
  --name luna-db-training \
  -e POSTGRES_DB=luna_training \
  -e POSTGRES_USER=luna_training \
  -e POSTGRES_PASSWORD=training-password \
  -v luna-postgres-training:/var/lib/postgresql \
  postgres:18
```

Important:

For the official PostgreSQL 18 image, persistent volume storage is mounted at:

```text
/var/lib/postgresql
```

---

# PART 30 — CHECK POSTGRESQL CONTAINER

Logs:

```bash
docker logs luna-db-training
```

Readiness:

```bash
docker exec luna-db-training \
  pg_isready \
  -U luna_training \
  -d luna_training
```

Connect:

```bash
docker exec -it luna-db-training \
  psql \
  -U luna_training \
  -d luna_training
```

Inside PostgreSQL:

```sql
SELECT 'LUNA DATABASE CONTAINER ONLINE';
```

Exit:

```text
\q
```

---

# PART 31 — PROVE DATABASE PERSISTENCE

Inside the training database:

```sql
CREATE TABLE test_data (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    message TEXT NOT NULL
);

INSERT INTO test_data (message)
VALUES ('Persistent LUNA data');
```

Exit.

Remove the database container:

```bash
docker rm -f luna-db-training
```

Recreate it with the same environment and volume:

```bash
docker run -d \
  --name luna-db-training \
  -e POSTGRES_DB=luna_training \
  -e POSTGRES_USER=luna_training \
  -e POSTGRES_PASSWORD=training-password \
  -v luna-postgres-training:/var/lib/postgresql \
  postgres:18
```

Reconnect and query:

```sql
SELECT *
FROM test_data;
```

The data should still exist because the named volume survived the container.

---

# PART 32 — CLEAN UP DATABASE LAB

```bash
docker rm -f luna-db-training
docker volume rm luna-postgres-training
```

Only remove this training volume.

Do not casually remove production/project database volumes.

---

# PART 33 — DOCKER COMPOSE

Managing several containers with separate `docker run` commands becomes difficult.

Docker Compose lets you describe a multi-container application in one YAML file.

The standard command is:

```text
docker compose
```

not the older standalone:

```text
docker-compose
```

---

# PART 34 — CREATE A COMPOSE TRAINING FOLDER

```bash
mkdir -p ~/compose-training/site
cd ~/compose-training
```

Create:

```text
site/index.html
```

with:

```html
<h1>LUNA COMPOSE TRAINING</h1>
```

Create a **file**:

```text
compose.yaml
```

Paste:

```yaml
services:
  web:
    image: nginx:alpine
    ports:
      - "8083:80"
    volumes:
      - ./site:/usr/share/nginx/html:ro
```

---

# PART 35 — START COMPOSE

Run:

```bash
docker compose up -d
```

Inspect:

```bash
docker compose ps
```

Browse:

```text
http://YOUR-LUNA-IP:8083/
```

Logs:

```bash
docker compose logs
```

Stop and remove the container/network:

```bash
docker compose down
```

---

# PART 36 — COMPOSE SERVICE NAMES

Compose automatically creates a network for the application.

Services can resolve one another by service name.

If Compose has:

```yaml
services:
  api:
    ...

  db:
    ...
```

the API can reach PostgreSQL at:

```text
db:5432
```

not:

```text
127.0.0.1:5432
```

---

# PART 37 — HEALTH CHECKS

A container being:

```text
running
```

does not automatically mean its application is ready.

PostgreSQL may need time to initialize.

Compose supports health checks.

Example:

```yaml
healthcheck:
  test:
    - CMD-SHELL
    - pg_isready -U $${POSTGRES_USER} -d $${POSTGRES_DB}
  interval: 5s
  timeout: 5s
  retries: 10
  start_period: 10s
```

The doubled:

```text
$$
```

passes the variable through Compose so it is expanded inside the container.

---

# PART 38 — DEPENDENCY READINESS

An API can wait for the database health check:

```yaml
depends_on:
  db:
    condition: service_healthy
```

This is better than simply assuming PostgreSQL is ready because its container process started.

---

# PART 39 — USEFUL COMPOSE COMMANDS

Start:

```bash
docker compose up -d
```

Build and start:

```bash
docker compose up -d --build
```

State:

```bash
docker compose ps
```

Logs:

```bash
docker compose logs
```

One service:

```bash
docker compose logs api
```

Follow:

```bash
docker compose logs -f api
```

Execute:

```bash
docker compose exec api sh
```

Restart:

```bash
docker compose restart api
```

Stop/remove:

```bash
docker compose down
```

Stop/remove including named volumes:

```bash
docker compose down -v
```

## Warning

`-v` removes Compose-managed named volumes.

For a database stack, that may delete persistent database data.

Do not casually use:

```bash
docker compose down -v
```

on the real LUNA stack.

---

# PART 40 — INSPECT RESOURCE USE

Running containers:

```bash
docker stats
```

Press:

```text
Ctrl + C
```

Inspect details:

```bash
docker inspect CONTAINER_NAME
```

Disk usage:

```bash
docker system df
```

---

# PART 41 — FINAL ARCHITECTURE PREVIEW

Mission 06's project will create:

```text
LUNA-1
│
└── Docker
    │
    ├── nginx
    │    └── :80 published
    │
    ├── api
    │    └── :8000 internal only
    │
    └── db
         ├── :5432 internal only
         └── postgres_data volume
```

Only Nginx needs to be published to Earth.

---

# PART 42 — COMPLETE THE LABS

Complete:

```text
labs/01-containers.md
labs/02-storage-networking.md
labs/03-dockerfile.md
labs/04-compose.md
```

Then proceed to:

```text
project/README.md
```
