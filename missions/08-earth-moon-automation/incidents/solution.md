# INCIDENT INC-008 — SOLUTION

The sender posts:

```json
{
  "priority": "CRITICAL"
}
```

The receiver expects:

```json
{
  "severity": "CRITICAL"
}
```

HTTP delivery succeeds because the JSON is valid.

The event is logged because logging does not require the severity field.

But the alert condition checks:

```python
payload.get("severity") == "CRITICAL"
```

so it never becomes true.

Change the sender field from:

```text
priority
```

to:

```text
severity
```

Run:

```bash
./send-event.sh
```

again.

Now inspect:

```bash
cat alerts.log
```

---

# ROOT CAUSE

```text
network ............. OK
HTTP ................ OK
JSON syntax ......... OK
receiver ............ OK
logging ............. OK
payload contract .... WRONG
routing action ...... SKIPPED
```

A 200-class response does not automatically prove the entire business workflow produced the intended result.
