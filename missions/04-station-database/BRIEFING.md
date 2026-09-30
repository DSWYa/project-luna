# 🗄️ MISSION 04 — STATION DATABASE

**OBJECTIVE:** Deploy LUNA-1's PostgreSQL database server.

## Infrastructure Rule

```text
🌎 Windows / Earth Mission Control
SSH + Git + browser
        │
        ▼
🌑 LUNA-1 Ubuntu Server
        └── PostgreSQL Server
```

PostgreSQL itself runs on the Ubuntu VM, not Windows. This prepares LUNA-1 for later APIs, Docker, monitoring, and other services that will connect to the database locally.

Mission 04 covers PostgreSQL, `psql`, relational design, CRUD, keys, joins, aggregation, CSV import, transactions, and reproducible `.sql` files.
