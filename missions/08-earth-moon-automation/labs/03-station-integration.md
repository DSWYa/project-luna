# LAB 03 — STATION INTEGRATION

Integrate the relay with `luna-operations`.

Requirements:

1. `requests` exists in `app/requirements.txt`.
2. `app/automation.py` exists.
3. Webhook URL comes from environment.
4. Token comes from environment.
5. Compose passes the variables to the API.
6. Creating a normal maintenance ticket produces a Sheet row.
7. Creating a CRITICAL ticket produces a Sheet row and email.
8. If the external relay URL is temporarily invalid, the maintenance ticket still remains in PostgreSQL.

The last requirement demonstrates graceful degradation.

Restore the correct URL after testing.
