# SOLUTION

`Primary Oxygen Scrubber` still exists, but its `module_id` is `NULL`. HAB-1 is module 1.

```sql
UPDATE equipment
SET module_id=1
WHERE equipment_name='Primary Oxygen Scrubber';
```

Re-run the join to verify.
