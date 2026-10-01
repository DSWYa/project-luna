# INCIDENT INC-005 — HINT 2

If PostgreSQL reports an undefined column, the database connection itself succeeded.

Compare the SQL in:

```text
main.py
```

with the real `modules` table:

```sql
SELECT *
FROM modules;
```

Look closely at the status column name.
