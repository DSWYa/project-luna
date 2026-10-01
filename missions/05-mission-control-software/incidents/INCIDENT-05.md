# 🚨 INCIDENT INC-005

**SYSTEM:** LUNA Mission Control API  
**RUNTIME:** LUNA-1 Ubuntu Server

Mission Control reports:

```text
SERVER REACHABLE ........ YES
TRAINING API ............ ONLINE
HEALTH ENDPOINT ......... 200 OK
MODULES ENDPOINT ........ 500 ERROR
POSTGRESQL .............. ONLINE
```

One function is failing.

---

# STEP 1 — UPDATE THE COURSE REPO

On LUNA-1:

```bash
cd ~/project-luna
git pull
```

---

# STEP 2 — RUN THE INCIDENT GENERATOR

```bash
cd ~/project-luna/missions/05-mission-control-software/incidents
chmod +x trigger-incident.sh
./trigger-incident.sh
```

It creates:

```text
~/luna-incident-05
```

Do not inspect the generator source before troubleshooting.

---

# STEP 3 — SET THE DATABASE PASSWORD

Enter the generated lab:

```bash
cd ~/luna-incident-05
```

Export the password used by `luna_api`:

```bash
export LUNA_DB_PASSWORD="YOUR-LUNA-API-PASSWORD"
```

If your database/user names differ, also set them as described in the generated README.

---

# STEP 4 — START THE APP

```bash
source .venv/bin/activate
fastapi dev main.py --host 0.0.0.0 --port 8100
```

---

# STEP 5 — TEST FROM EARTH

Working endpoint:

```text
http://YOUR-LUNA-IP:8100/health
```

Failing endpoint:

```text
http://YOUR-LUNA-IP:8100/api/modules
```

---

# OBJECTIVE

Determine:

1. Which layers are confirmed working.
2. What exception appears in the FastAPI terminal.
3. Whether PostgreSQL connectivity succeeds.
4. Which SQL statement is wrong.
5. The smallest correction required.

If stuck, open `hint-1.md`.
