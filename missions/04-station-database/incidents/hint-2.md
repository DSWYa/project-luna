# HINT 2

```sql
SELECT e.equipment_id,e.equipment_name,e.module_id,m.module_name
FROM equipment AS e
LEFT JOIN modules AS m ON e.module_id=m.module_id;
```

Inspect the modules table, identify the intended module, then use a targeted `UPDATE`.
