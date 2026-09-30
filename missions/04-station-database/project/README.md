# 🛠️ MISSION 04 FINAL PROJECT — LUNA CENTRAL OPERATIONS DATABASE

The PostgreSQL server runs on **LUNA-1 Ubuntu Server**. SQL source files live in `luna-operations`.

## Architecture

```text
Windows / Earth Mission Control
        │ push
        ▼
      GitHub
        │ pull
        ▼
LUNA-1 Ubuntu Server
        ├── PostgreSQL service
        └── luna_operations database
```

## Source Files

Inside `luna-operations`, create:

```text
database/
├── schema.sql
├── seed.sql
├── queries.sql
└── README.md
```

Create the real PostgreSQL database on LUNA-1:

```bash
sudo -u postgres createdb luna_operations
```

`schema.sql` must create:

```text
modules
crew
equipment
maintenance_tickets
telemetry
```

Use identity primary keys and foreign keys to `modules` where appropriate.

`seed.sql` must insert at least:

```text
6 modules
5 crew
10 equipment rows
8 maintenance tickets
20 telemetry rows
```

Include unassigned crew/equipment, mixed ticket states/priorities, and multiple telemetry modules.

`queries.sql` must answer:

1. Operational modules.
2. Equipment and assigned module.
3. All equipment including unassigned.
4. Active crew and module.
5. Open tickets.
6. Critical open tickets.
7. Ticket count by module.
8. Unassigned equipment.
9. Average oxygen by module.
10. Five lowest oxygen readings.
11. Minimum and maximum temperature.
12. Telemetry count by module.
13. One useful query of your own.

`database/README.md` must document the database, relationships, deployment, and commands. Explicitly state that PostgreSQL runs on LUNA-1.

## Rebuild Test on LUNA-1

```bash
sudo -u postgres dropdb --if-exists luna_operations_test
sudo -u postgres createdb luna_operations_test
sudo -u postgres psql -d luna_operations_test -f ~/luna-operations/database/schema.sql
sudo -u postgres psql -d luna_operations_test -f ~/luna-operations/database/seed.sql
sudo -u postgres psql -d luna_operations_test -f ~/luna-operations/database/queries.sql
```

Use a branch:

```text
feature/station-database
```

Push, merge, and pull the completed work onto LUNA-1.

Verify:

```bash
sudo systemctl status postgresql
```
