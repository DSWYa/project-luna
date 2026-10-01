# LAB 02 — DATABASE-BACKED API

Perform this lab on **LUNA-1**.

Create:

```text
GET /api/equipment
GET /api/tickets
```

Equipment output should include:

```text
equipment_name
equipment_type
module_name
status
```

Use a `LEFT JOIN` so unassigned equipment remains visible.

Ticket output should include:

```text
ticket_id
title
priority
status
module_name
```

Use environment variables for database credentials.

Use parameterized SQL when a route uses user-supplied values.
