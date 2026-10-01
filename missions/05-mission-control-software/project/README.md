# 🛠️ MISSION 05 FINAL PROJECT

# LUNA MISSION CONTROL WEB APPLICATION

Finished architecture:

```text
🌎 Earth Mission Control Browser
              │
              │ HTTP :80
              ▼
🌑 LUNA-1 — Nginx
              │
              │ proxy
              ▼
          FastAPI
              │
              │ SQL
              ▼
         PostgreSQL
```

---

# REQUIREMENT 1 — PROJECT STRUCTURE

Inside `luna-operations`, create:

```text
app/
├── main.py
├── db.py
├── requirements.txt
├── README.md
└── static/
    ├── index.html
    ├── style.css
    └── app.js
```

Do not commit:

```text
.venv/
luna-api.env
```

---

# REQUIREMENT 2 — API ROUTES

Create:

```text
GET  /health
GET  /api/modules
GET  /api/equipment
GET  /api/tickets
GET  /api/telemetry/summary
POST /api/tickets
```

---

# REQUIREMENT 3 — HEALTH

Return at least:

```json
{
  "station": "LUNA-1",
  "api": "ONLINE"
}
```

---

# REQUIREMENT 4 — MODULES

Return:

```text
module_id
module_name
module_type
status
```

from PostgreSQL.

---

# REQUIREMENT 5 — EQUIPMENT

Return:

```text
equipment_id
equipment_name
equipment_type
status
module_name
```

Use a join.

Unassigned equipment must still appear.

---

# REQUIREMENT 6 — TICKETS

Return maintenance tickets with:

```text
ticket_id
title
priority
status
module_name
```

---

# REQUIREMENT 7 — TELEMETRY SUMMARY

Return one summary per module containing:

```text
module_name
reading_count
average_oxygen
average_temperature
average_pressure
```

Use Mission 04 joins and aggregation.

---

# REQUIREMENT 8 — CREATE A TICKET

Accept JSON such as:

```json
{
  "title": "Inspect HAB-2 oxygen sensor",
  "priority": "HIGH",
  "module_id": 2
}
```

Use:

- Pydantic,
- parameterized SQL,
- status `OPEN`,
- HTTP 201.

Return the newly created record.

---

# REQUIREMENT 9 — DATABASE CONNECTION

`db.py` must read database configuration from environment variables.

Do not hard-code credentials.

Use Psycopg 3.

---

# REQUIREMENT 10 — DASHBOARD

The dashboard must display data retrieved through your API.

Show at least:

```text
station/API health
modules
equipment
open tickets
telemetry summary
```

Do not hard-code station data into the HTML.

Use JavaScript `fetch()`.

---

# REQUIREMENT 11 — CSS

Use `style.css`.

The goal is readability and organization, not professional graphic design.

---

# REQUIREMENT 12 — REQUIREMENTS

`requirements.txt` must include:

```text
fastapi[standard-no-fastapi-cloud-cli]
psycopg[binary]
```

---

# REQUIREMENT 13 — GIT WORKFLOW

Develop using:

```text
feature/mission-control-api
```

Make several meaningful commits.

Merge to `main`.

Push.

Then on LUNA-1:

```bash
cd ~/luna-operations
git pull
```

---

# REQUIREMENT 14 — SERVER VIRTUAL ENVIRONMENT

On LUNA-1:

```bash
cd ~/luna-operations/app
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

---

# REQUIREMENT 15 — ENVIRONMENT FILE

On LUNA-1 create:

```text
~/luna-operations/app/luna-api.env
```

Add database configuration.

Protect:

```bash
chmod 600 luna-api.env
```

Do not commit it.

---

# REQUIREMENT 16 — SYSTEMD

Create:

```text
/etc/systemd/system/luna-api.service
```

It must:

- run as `lunaadmin`,
- use the app directory,
- load `luna-api.env`,
- run FastAPI on `127.0.0.1:8000`,
- restart on failure.

Enable:

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now luna-api
```

---

# REQUIREMENT 17 — NGINX

Nginx must proxy port 80 to:

```text
127.0.0.1:8000
```

Test before reload:

```bash
sudo nginx -t
```

Then:

```bash
sudo systemctl reload nginx
```

---

# REQUIREMENT 18 — TEST EVERY LAYER

FastAPI direct from LUNA-1:

```bash
curl http://127.0.0.1:8000/health
```

Through Nginx:

```bash
curl http://127.0.0.1/health
```

From Earth:

```text
http://YOUR-LUNA-IP/
```

Also test:

```text
http://YOUR-LUNA-IP/docs
```

---

# REQUIREMENT 19 — DOCUMENTATION

`app/README.md` must explain:

- architecture,
- dependencies,
- endpoints,
- database connection,
- environment variables,
- deployment,
- systemd,
- Nginx,
- troubleshooting.

Never document the actual database password.

---

# REQUIRED EVIDENCE

Capture:

1. Dashboard.
2. `/docs`.
3. `/health`.
4. `systemctl status luna-api`.
5. `systemctl status nginx`.
6. `systemctl status postgresql`.
7. Successful ticket creation.
8. New ticket visible afterward.

---

# SELF-CHECK

```text
[ ] FastAPI runs on LUNA-1
[ ] PostgreSQL runs on LUNA-1
[ ] Nginx runs on LUNA-1
[ ] credentials are not committed
[ ] GET endpoints work
[ ] POST ticket works
[ ] parameterized SQL is used
[ ] dashboard loads API data
[ ] systemd works
[ ] Nginx proxy works
[ ] Earth can browse the dashboard
[ ] branch was used
[ ] work is pushed
```

Then continue to the incident.
