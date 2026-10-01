# 📦 MISSION 06 — CONTAINERIZE THE STATION

**MISSION ID:** LUNA-M06  
**PRIORITY:** HIGH  
**ROLE:** Junior Systems Engineer  
**OBJECTIVE:** Convert LUNA-1's application stack into reproducible containers

---

## Mission Briefing

LUNA-1 now hosts a working multi-tier application:

```text
Nginx
  ↓
FastAPI
  ↓
PostgreSQL
```

It works.

But the server still depends on configuration performed directly on the Ubuntu host:

- Python packages installed into a virtual environment
- systemd unit files
- Nginx site configuration
- PostgreSQL installation and database state

If LUNA-1 had to be rebuilt tomorrow, an engineer would need to remember how every piece was configured.

Mission Control wants something more reproducible.

The answer is **containers**.

---

# What Is a Container?

A container packages an application with the environment it needs to run.

Instead of saying:

> Install Python, install these packages, configure these files, then run this command...

you can describe the application as an image.

Docker then creates containers from that image.

---

# Mission Architecture

Before Mission 06:

```text
LUNA-1 Ubuntu
│
├── host Nginx service
├── host FastAPI systemd service
└── host PostgreSQL service
```

After Mission 06:

```text
LUNA-1 Ubuntu
│
└── Docker Engine
     │
     ├── luna-nginx
     ├── luna-api
     └── luna-db
          │
          └── persistent Docker volume
```

Earth Mission Control still reaches:

```text
http://LUNA-1-IP/
```

But the application stack now runs inside Docker containers.

---

# What You Will Learn

- Docker Engine
- images
- containers
- registries
- ports
- bind mounts
- named volumes
- container networks
- Dockerfiles
- image builds
- container logs
- `docker exec`
- Docker Compose
- service health checks
- multi-container application deployment
- persistent PostgreSQL data
- container troubleshooting

Open `OBJECTIVES.md`, then continue to `WALKTHROUGH.md`.
