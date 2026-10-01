# 🛠️ MISSION 06 FINAL PROJECT

# CONTAINERIZE LUNA MISSION CONTROL

Mission Control wants the complete Mission 05 stack described as reproducible infrastructure.

You will replace the host-managed application stack with containers running on LUNA-1.

---

# FINAL ARCHITECTURE

```text
🌎 Earth Mission Control
        │
        │ HTTP :80
        ▼
🌑 LUNA-1 Ubuntu
        │
        └── Docker Engine
             │
             ├── nginx
             │    └── :80 published
             │
             ├── api
             │    └── :8000 internal
             │
             └── db
                  ├── :5432 internal
                  └── postgres_data volume
```

---

# REQUIREMENT 1 — TAKE A VM SNAPSHOT

Before replacing host services, create a VirtualBox snapshot.

Suggested name:

```text
M06 - PRE CONTAINER MIGRATION
```

This gives you a recovery point before infrastructure changes.

---

# REQUIREMENT 2 — BACK UP THE HOST DATABASE

On LUNA-1:

```bash
mkdir -p ~/luna-backups
```

Back up:

```bash
sudo -u postgres pg_dump \
  -d luna_operations \
  > ~/luna-backups/luna_operations_pre_docker.sql
```

Verify the file exists:

```bash
ls -lh ~/luna-backups
```

Do not place database backups containing operational data or credentials into a public Git repository.

---

# REQUIREMENT 3 — PROJECT FILES

Inside `luna-operations`, create:

```text
compose.yaml
.env.example
app/Dockerfile
app/.dockerignore
nginx/default.conf
```

Your existing application files remain in:

```text
app/
```

Your existing SQL remains in:

```text
database/
```

---

# REQUIREMENT 4 — `.env`

On LUNA-1 create:

```text
~/luna-operations/.env
```

Example variables:

```text
LUNA_DB_NAME=luna_operations
LUNA_DB_USER=luna_api
LUNA_DB_PASSWORD=CHOOSE-A-LAB-PASSWORD
```

Do not commit `.env`.

Commit:

```text
.env.example
```

with placeholder values only.

---

# REQUIREMENT 5 — API DOCKERFILE

`app/Dockerfile` must:

- use a Python slim base image,
- set a work directory,
- install `requirements.txt`,
- copy the application,
- run FastAPI on `0.0.0.0:8000`.

The container does not publish port 8000 directly to Earth.

---

# REQUIREMENT 6 — `.dockerignore`

At minimum ignore:

```text
.venv/
__pycache__/
*.pyc
*.env
.git/
```

---

# REQUIREMENT 7 — NGINX CONFIGURATION

Create:

```text
nginx/default.conf
```

Nginx must proxy requests to:

```text
http://api:8000
```

Notice:

```text
api
```

is the Compose service name.

It is not:

```text
127.0.0.1
```

---

# REQUIREMENT 8 — COMPOSE DATABASE SERVICE

Create service:

```text
db
```

Use:

```text
postgres:18
```

Provide:

```text
POSTGRES_DB
POSTGRES_USER
POSTGRES_PASSWORD
```

using `.env` variables.

Create a named volume:

```text
postgres_data
```

Mount it at:

```text
/var/lib/postgresql
```

Do **not** publish PostgreSQL port 5432 to Earth.

---

# REQUIREMENT 9 — DATABASE INITIALIZATION

Mount your version-controlled SQL into:

```text
/docker-entrypoint-initdb.d/
```

so a brand-new empty PostgreSQL volume can initialize the schema and seed data.

Use files such as:

```text
database/schema.sql
database/seed.sql
```

Remember:

Initialization scripts run when PostgreSQL initializes a new empty data directory.

They do not repeatedly re-run every time an existing database volume starts.

---

# REQUIREMENT 10 — DATABASE HEALTH CHECK

The database service must have a health check using:

```text
pg_isready
```

The API service must wait for:

```text
service_healthy
```

---

# REQUIREMENT 11 — API SERVICE

Create service:

```text
api
```

It must:

- build from `app/`,
- receive database environment variables,
- connect to database host `db`,
- depend on healthy `db`,
- not publish port 8000 to the host.

Inside the container:

```text
LUNA_DB_HOST=db
```

---

# REQUIREMENT 12 — NGINX SERVICE

Create service:

```text
nginx
```

Use an Nginx image.

Bind mount:

```text
nginx/default.conf
```

into the container's Nginx configuration location.

Publish:

```text
80:80
```

Nginx depends on the API.

Only this service should need a public host port.

---

# REQUIREMENT 13 — VALIDATE COMPOSE BEFORE CUTOVER

Run:

```bash
cd ~/luna-operations
docker compose config
```

This renders and validates the Compose configuration.

Build:

```bash
docker compose build
```

Fix errors before stopping the working host services.

---

# REQUIREMENT 14 — CUT OVER FROM HOST SERVICES

Port 80 is currently used by host Nginx.

Stop the host API:

```bash
sudo systemctl stop luna-api
```

Stop host Nginx:

```bash
sudo systemctl stop nginx
```

Start the container stack:

```bash
docker compose up -d
```

Check:

```bash
docker compose ps
```

---

# REQUIREMENT 15 — VALIDATE THE CONTAINER STACK

From Earth:

```text
http://YOUR-LUNA-IP/
```

Test:

```text
/health
/api/modules
/api/equipment
/api/tickets
/api/telemetry/summary
/docs
```

From LUNA-1:

```bash
curl http://127.0.0.1/health
```

---

# REQUIREMENT 16 — CHECK LOGS

```bash
docker compose logs nginx
docker compose logs api
docker compose logs db
```

You should know where to look when each layer fails.

---

# REQUIREMENT 17 — VERIFY DATABASE PERSISTENCE

Create a test ticket through the API.

Confirm it exists.

Then:

```bash
docker compose down
docker compose up -d
```

Confirm the ticket still exists.

This demonstrates that database data survived container recreation.

Do **not** use:

```bash
docker compose down -v
```

for this test.

---

# REQUIREMENT 18 — RETIRE REPLACED HOST SERVICES

Only after the container stack is confirmed working:

```bash
sudo systemctl disable luna-api
sudo systemctl disable nginx
```

The old host PostgreSQL service has also been replaced by the containerized database.

After confirming the Docker database is working and your backup exists:

```bash
sudo systemctl disable --now postgresql
```

Do not uninstall PostgreSQL yet.

Keeping the packages during the learning project makes rollback easier.

---

# REQUIREMENT 19 — REBOOT TEST

Reboot LUNA-1:

```bash
sudo reboot
```

Reconnect.

Docker should start automatically.

Bring up the Compose stack if it is not configured with restart policies.

Your Compose services should use an appropriate restart policy such as:

```text
unless-stopped
```

Verify the dashboard after reboot.

---

# REQUIREMENT 20 — VERSION CONTROL

Use branch:

```text
feature/containerize-luna
```

Commit:

```text
Dockerfile
compose.yaml
Nginx config
.dockerignore
.env.example
documentation
```

Do not commit:

```text
.env
database volume contents
database passwords
```

Merge and push.

---

# REQUIREMENT 21 — DOCUMENTATION

Update project documentation with:

- container architecture,
- services,
- ports,
- volumes,
- environment variables,
- build process,
- start/stop commands,
- logs,
- backup warning,
- troubleshooting sequence.

---

# SELF-CHECK

```text
[ ] Docker runs on LUNA-1
[ ] Compose plugin works
[ ] API has Dockerfile
[ ] .dockerignore exists
[ ] compose.yaml exists
[ ] nginx is containerized
[ ] API is containerized
[ ] PostgreSQL is containerized
[ ] only Nginx publishes public port
[ ] API reaches DB using service name
[ ] PostgreSQL uses named volume
[ ] PostgreSQL 18 volume path is correct
[ ] health check exists
[ ] API waits for healthy DB
[ ] .env is not committed
[ ] database persists across compose down/up
[ ] host services are retired only after validation
[ ] reboot test succeeds
[ ] branch used
[ ] final changes pushed
```

Then continue to the incident.
