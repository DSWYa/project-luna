# 🚨 INCIDENT INC-006

**SYSTEM:** Containerized LUNA application  
**RUNTIME:** Docker on LUNA-1

Mission Control reports:

```text
CONTAINERS ............. RUNNING
NGINX .................. ONLINE
API HEALTH ............. 200 OK
MODULE DATA ............ 500 ERROR
DATABASE CONTAINER ..... HEALTHY
```

This is a container-networking incident.

---

# STEP 1 — UPDATE COURSE REPO

On LUNA-1:

```bash
cd ~/project-luna
git pull
```

---

# STEP 2 — GENERATE THE INCIDENT

```bash
cd ~/project-luna/missions/06-containerize-the-station/incidents
chmod +x trigger-incident.sh
./trigger-incident.sh
```

The script creates:

```text
~/luna-incident-06
```

Do not inspect the generator source before troubleshooting.

---

# STEP 3 — START THE INCIDENT STACK

```bash
cd ~/luna-incident-06
docker compose up -d --build
```

Check:

```bash
docker compose ps
```

---

# STEP 4 — TEST

From LUNA-1:

```bash
curl http://127.0.0.1:8180/health
```

Then:

```bash
curl http://127.0.0.1:8180/modules
```

The health endpoint should work.

The database-backed endpoint should fail.

---

# OBJECTIVE

Determine:

1. Which containers are running.
2. Whether the database is healthy.
3. Whether Nginx reaches the API.
4. Why the API cannot reach PostgreSQL.
5. Which environment value is incorrect.
6. The smallest correction necessary.

Useful commands include:

```bash
docker compose ps
docker compose logs api
docker compose logs db
docker compose exec api env
```

If stuck, open `hint-1.md`.
