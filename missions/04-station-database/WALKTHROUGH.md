# MISSION 04 WALKTHROUGH

All PostgreSQL server work occurs on **LUNA-1 Ubuntu Server**.

---

# PART 1 — CONNECT TO LUNA-1

From Windows:

```text
ssh lunaadmin@YOUR-LUNA-IP
```

---

# PART 2 — INSTALL POSTGRESQL

On Ubuntu:

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib -y
```

Check:

```bash
sudo systemctl status postgresql
```

Look for `active (running)`.

PostgreSQL's default TCP port is `5432`.

For this mission, PostgreSQL does **not** need to be exposed to the network. You administer it through SSH and local `psql`.

---

# PART 3 — OPEN PSQL

```bash
sudo -u postgres psql
```

Useful commands:

```text
\l        list databases
\du       list roles
\q        quit
```

---

# PART 4 — CREATE TRAINING DATABASE

Inside `psql`:

```sql
CREATE DATABASE luna_training;
```

Connect:

```text
\c luna_training
```

---

# PART 5 — CREATE AN APPLICATION USER

```sql
CREATE USER luna_app WITH PASSWORD 'CHANGE-THIS-LAB-PASSWORD';
GRANT ALL PRIVILEGES ON DATABASE luna_training TO luna_app;
```

Use a lab-only password.

---

# PART 6 — FIRST TABLE

```sql
CREATE TABLE modules (
    module_id INTEGER PRIMARY KEY,
    module_name VARCHAR(50) NOT NULL,
    module_type VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL
);
```

List tables:

```text
\dt
```

Describe:

```text
\d modules
```

---

# PART 7 — DATA TYPES

Common types:

```text
INTEGER
NUMERIC
VARCHAR
TEXT
BOOLEAN
DATE
TIMESTAMP
```

---

# PART 8 — INSERT DATA

```sql
INSERT INTO modules (module_id,module_name,module_type,status)
VALUES
(1,'HAB-1','Habitat','OPERATIONAL'),
(2,'HAB-2','Habitat','OPERATIONAL'),
(3,'LAB-1','Laboratory','OPERATIONAL'),
(4,'POWER','Power','OPERATIONAL');
```

---

# PART 9 — SELECT / WHERE / ORDER / LIMIT

```sql
SELECT * FROM modules;
```

```sql
SELECT module_name,status
FROM modules
WHERE module_type='Habitat'
ORDER BY module_name;
```

```sql
SELECT * FROM modules
ORDER BY module_id
LIMIT 2;
```

---

# PART 10 — SAFE UPDATE

Verify first:

```sql
SELECT * FROM modules WHERE module_name='HAB-2';
```

Then:

```sql
UPDATE modules
SET status='MAINTENANCE'
WHERE module_name='HAB-2';
```

Without `WHERE`, every row could change.

---

# PART 11 — SAFE DELETE

Create a test row, verify it, then delete only that row:

```sql
INSERT INTO modules VALUES (99,'TEST','Training','OFFLINE');
SELECT * FROM modules WHERE module_id=99;
DELETE FROM modules WHERE module_id=99;
```

---

# PART 12 — IDENTITY KEYS

```sql
CREATE TABLE crew (
    crew_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    crew_name VARCHAR(100) NOT NULL,
    role VARCHAR(100) NOT NULL,
    active BOOLEAN NOT NULL DEFAULT TRUE
);
```

Insert without manually assigning IDs.

---

# PART 13 — NULL

```sql
ALTER TABLE crew ADD COLUMN callsign VARCHAR(50);
SELECT * FROM crew WHERE callsign IS NULL;
```

Use `IS NULL`, not `= NULL`.

---

# PART 14 — FOREIGN KEYS

```sql
CREATE TABLE equipment (
    equipment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    equipment_name VARCHAR(100) NOT NULL,
    equipment_type VARCHAR(50) NOT NULL,
    module_id INTEGER,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);
```

Relationship:

```text
equipment.module_id → modules.module_id
```

---

# PART 15 — RELATED DATA

```sql
INSERT INTO equipment (equipment_name,equipment_type,module_id,status)
VALUES
('Primary Oxygen Scrubber','Life Support',1,'OPERATIONAL'),
('Backup Oxygen Scrubber','Life Support',2,'OPERATIONAL'),
('Spectrometer','Science',3,'OPERATIONAL'),
('Solar Controller','Power',4,'OPERATIONAL'),
('Portable Sensor Kit','Sensor',NULL,'AVAILABLE');
```

---

# PART 16 — INNER JOIN

```sql
SELECT e.equipment_name,m.module_name
FROM equipment AS e
INNER JOIN modules AS m
ON e.module_id=m.module_id;
```

Only matching relationships return.

---

# PART 17 — LEFT JOIN

```sql
SELECT e.equipment_name,m.module_name
FROM equipment AS e
LEFT JOIN modules AS m
ON e.module_id=m.module_id;
```

The unassigned sensor kit remains visible.

---

# PART 18 — FIND MISSING RELATIONSHIPS

```sql
SELECT e.equipment_name
FROM equipment AS e
LEFT JOIN modules AS m ON e.module_id=m.module_id
WHERE m.module_id IS NULL;
```

---

# PART 19 — TELEMETRY TABLE

```sql
CREATE TABLE telemetry (
    telemetry_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    module_id INTEGER NOT NULL,
    oxygen NUMERIC(5,2) NOT NULL,
    temperature NUMERIC(5,2) NOT NULL,
    pressure NUMERIC(6,2) NOT NULL,
    recorded_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (module_id) REFERENCES modules(module_id)
);
```

Insert several readings from multiple modules.

---

# PART 20 — AGGREGATION

```sql
SELECT COUNT(*) FROM telemetry;
SELECT AVG(oxygen) FROM telemetry;
SELECT MIN(oxygen),MAX(oxygen) FROM telemetry;
```

Group:

```sql
SELECT module_id,AVG(oxygen)
FROM telemetry
GROUP BY module_id;
```

Readable names:

```sql
SELECT m.module_name,AVG(t.oxygen) AS average_oxygen
FROM telemetry AS t
INNER JOIN modules AS m ON t.module_id=m.module_id
GROUP BY m.module_name
ORDER BY m.module_name;
```

---

# PART 21 — SQL FILES IN GIT

On Earth Mission Control, create a **folder** in `luna-operations`:

```text
database/
```

The folder contains version-controlled SQL source. It is not the PostgreSQL database itself.

Push those files, then on LUNA-1:

```bash
cd ~/luna-operations
git pull
```

Execute a SQL file:

```bash
sudo -u postgres psql -d luna_training -f ~/luna-operations/database/example.sql
```

---

# PART 22 — CSV IMPORT ON LUNA-1

Place CSV files under `~/luna-operations/data/`.

Inside `psql`:

```text
\copy maintenance_import(title,priority,status) FROM '/home/lunaadmin/luna-operations/data/maintenance.csv' WITH (FORMAT csv, HEADER true);
```

---

# PART 23 — TRANSACTIONS

```sql
BEGIN;
UPDATE modules SET status='OFFLINE' WHERE module_name='HAB-1';
ROLLBACK;
```

Or keep changes:

```sql
COMMIT;
```

Pattern:

```text
BEGIN → change → verify → COMMIT or ROLLBACK
```

---

# PART 24 — SERVICE OPERATIONS

Exit `psql`, then:

```bash
sudo systemctl status postgresql
sudo systemctl restart postgresql
```

PostgreSQL is now another real Linux service on LUNA-1.

Complete the labs, then the project.
