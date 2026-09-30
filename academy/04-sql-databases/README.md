# ACADEMY 04 — SQL & POSTGRESQL

PostgreSQL server location: **LUNA-1 Ubuntu Server**.

```bash
sudo apt install postgresql postgresql-contrib -y
sudo systemctl status postgresql
sudo -u postgres psql
```

psql:

```text
\l
\du
\c database
\dt
\d table
\q
```

SQL examples:

```sql
SELECT * FROM modules WHERE status='OPERATIONAL';
UPDATE modules SET status='OFFLINE' WHERE module_id=1;
SELECT e.equipment_name,m.module_name FROM equipment e LEFT JOIN modules m ON e.module_id=m.module_id;
```

Run a file:

```bash
sudo -u postgres psql -d database_name -f file.sql
```
