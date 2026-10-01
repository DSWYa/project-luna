# INCIDENT INC-005 — SOLUTION

The health route works because it does not query PostgreSQL.

The modules route successfully reaches PostgreSQL but asks for the wrong column.

Broken:

```sql
SELECT
    module_id,
    module_name,
    module_type,
    module_status
FROM modules;
```

The Mission 04 schema uses:

```text
status
```

Correct:

```sql
SELECT
    module_id,
    module_name,
    module_type,
    status
FROM modules;
```

Re-test `/api/modules`.

Root-cause layers:

```text
Linux ........ OK
Network ...... OK
FastAPI ...... OK
PostgreSQL ... OK
DB login ..... OK
SQL query .... FAILED
```
