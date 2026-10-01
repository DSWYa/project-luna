# INCIDENT INC-008 — HINT 1

A successful HTTP request proves transport.

It does not prove every downstream action happened.

Inspect:

```bash
cat events.log
```

The relay logged the exact JSON payload it received.

Compare the field names with the relay logic.
