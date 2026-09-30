# SQL / POSTGRESQL CHEAT SHEET

Server: **LUNA-1 Ubuntu Server**

```bash
sudo systemctl status postgresql
sudo -u postgres psql
sudo -u postgres psql -d luna_operations
sudo -u postgres psql -d luna_operations -f file.sql
```

Default port: `5432`

```sql
SELECT * FROM table_name;
UPDATE table_name SET column='value' WHERE id=1;
DELETE FROM table_name WHERE id=1;
SELECT COUNT(*) FROM table_name;
```
