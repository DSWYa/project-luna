# 🛰️ MISSION 05 — MISSION CONTROL SOFTWARE

**MISSION ID:** LUNA-M05  
**PRIORITY:** HIGH  
**ROLE:** Junior Systems Engineer  
**OBJECTIVE:** Build LUNA-1's first database-backed web application and REST API

---

## Mission Briefing

LUNA-1 now has:

- Linux
- SSH
- Nginx
- Git deployment
- Python automation
- PostgreSQL
- relational operational data

But only engineers who know Linux and SQL can easily use that information.

Mission Control needs a software layer between users and the database.

You will build:

```text
Browser / Client
       │
       │ HTTP
       ▼
     Nginx
       │
       ▼
   FastAPI
       │
       │ SQL
       ▼
 PostgreSQL
```

Everything on the server side runs on:

```text
🌑 LUNA-1 Ubuntu Server VM
```

Earth Mission Control remains your Windows administration workstation.

---

# What You Will Build

By the end of Mission 05, LUNA-1 will host a Mission Control application with:

- a browser dashboard,
- a health endpoint,
- a modules API,
- an equipment API,
- a maintenance-ticket API,
- a telemetry-summary API,
- PostgreSQL-backed data,
- and Nginx as the public web entry point.

---

# New Technologies

You will learn:

- HTTP
- REST APIs
- FastAPI
- Uvicorn / FastAPI server runtime
- Psycopg 3
- HTML
- CSS
- JavaScript
- `fetch()`
- JSON responses
- request bodies
- parameterized SQL
- Python virtual environments
- systemd service files
- Nginx reverse proxying

---

# Infrastructure

```text
🌎 EARTH MISSION CONTROL
Windows
│
├── VS Code
├── Git / GitHub
├── browser
└── SSH
        │
        ▼
🌑 LUNA-1
Ubuntu Server
│
├── Nginx :80
├── FastAPI :8000
└── PostgreSQL :5432
```

PostgreSQL stays local to LUNA-1.

FastAPI talks to PostgreSQL locally.

Nginx is the entry point Earth Mission Control sees.

Open `OBJECTIVES.md`, then continue to `WALKTHROUGH.md`.
