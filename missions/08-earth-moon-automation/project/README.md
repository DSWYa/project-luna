# 🛠️ MISSION 08 FINAL PROJECT

# LUNA EARTH INCIDENT RELAY

Build the permanent automation bridge between LUNA-1 and Earth operations.

---

# FINAL ARCHITECTURE

```text
LUNA Mission Control API
        │
        │ critical/normal event
        ▼
app/automation.py
        │
        │ HTTPS POST
        ▼
Google Apps Script
        │
        ├── validate token
        ├── append Sheet row
        └── CRITICAL → email
```

Scheduled path:

```text
Apps Script time trigger
        │
        ▼
Daily digest
```

---

# REQUIREMENT 1 — GOOGLE SHEET

Create:

```text
LUNA Automation Log
```

Required tab:

```text
Events
```

Columns:

```text
Timestamp
Station
Source
Severity
Message
```

Add filtering and useful conditional formatting.

---

# REQUIREMENT 2 — APPS SCRIPT WEB APP

Create a bound Apps Script project.

Required functions:

```text
doGet
doPost
jsonResponse
sendDailyDigest
```

`doPost` must:

1. parse JSON,
2. validate a shared token,
3. reject invalid requests,
4. append a row,
5. email CRITICAL events,
6. return structured JSON.

---

# REQUIREMENT 3 — SCRIPT PROPERTIES

Store:

```text
WEBHOOK_TOKEN
ALERT_EMAIL
```

as Script Properties.

Do not hard-code either into `Code.gs`.

---

# REQUIREMENT 4 — DEPLOYMENT

Deploy Apps Script as a web app.

LUNA-1 must be able to perform:

```text
GET
POST
```

to the deployed `/exec` URL without an interactive browser sign-in.

Do not bypass an organization policy to achieve this.

---

# REQUIREMENT 5 — VERSION APPS SCRIPT SOURCE

Inside `luna-operations` create:

```text
automation/google-apps-script/
├── Code.gs
└── README.md
```

Commit source code and documentation.

Do not commit actual Script Property values.

---

# REQUIREMENT 6 — VALID PYTHON SENDER

Create:

```text
app/automation.py
```

A valid implementation may resemble:

```python
import os

import requests


def send_event(source, severity, message):
    url = os.environ.get(
        "LUNA_AUTOMATION_WEBHOOK_URL"
    )

    token = os.environ.get(
        "LUNA_AUTOMATION_TOKEN"
    )

    if not url or not token:
        print("Automation relay is not configured.")
        return False

    payload = {
        "token": token,
        "station": "LUNA-1",
        "source": source,
        "severity": severity,
        "message": message
    }

    try:
        response = requests.post(
            url,
            json=payload,
            timeout=10
        )

        response.raise_for_status()

        result = response.json()

        if not result.get("ok"):
            print(
                f"Relay rejected event: {result}"
            )
            return False

        return True

    except requests.RequestException as error:
        print(
            f"Relay request failed: {error}"
        )
        return False

    except ValueError as error:
        print(
            f"Relay returned invalid JSON: {error}"
        )
        return False
```

---

# REQUIREMENT 7 — PYTHON DEPENDENCY

Add:

```text
requests
```

to:

```text
app/requirements.txt
```

Rebuild the API image.

---

# REQUIREMENT 8 — ENVIRONMENT VARIABLES

Real values belong in:

```text
.env
```

Add:

```text
LUNA_AUTOMATION_WEBHOOK_URL
LUNA_AUTOMATION_TOKEN
```

Add placeholders to:

```text
.env.example
```

Do not commit real values.

---

# REQUIREMENT 9 — COMPOSE

Pass both automation variables into the `api` service.

After changes:

```bash
docker compose config
docker compose up -d --build
```

---

# REQUIREMENT 10 — MAINTENANCE INTEGRATION

After a maintenance ticket is successfully created in PostgreSQL, send an event.

Use:

```text
source = maintenance
severity = ticket priority
message = ticket ID + title
```

The database action is primary.

The external notification is secondary.

If external automation fails, the ticket must remain created.

---

# REQUIREMENT 11 — EVENT TESTS

Create through the API:

```text
LOW ticket
HIGH ticket
CRITICAL ticket
```

Verify all events are logged.

Verify the CRITICAL ticket produces immediate email.

---

# REQUIREMENT 12 — AUTHENTICATION TEST

Send one webhook with a deliberately incorrect token.

Expected:

```text
not logged
no email
JSON rejection
```

Restore the correct token.

---

# REQUIREMENT 13 — DAILY DIGEST

Create an Apps Script time-driven trigger for:

```text
sendDailyDigest
```

The digest must summarize at least:

```text
events during last 24 hours
critical events during last 24 hours
```

---

# REQUIREMENT 14 — PRODUCTIVITY VIEW

The Sheet should provide an easy operations view.

Use at least:

```text
frozen headers
filters
severity formatting
one count formula or summary
```

---

# REQUIREMENT 15 — DOCUMENTATION

Document:

- architecture,
- webhook payload,
- Script Properties,
- deployment,
- environment variables,
- failure behavior,
- quotas,
- troubleshooting,
- daily digest,
- optional Zapier path.

Do not document real secrets.

---

# REQUIREMENT 16 — VERSION CONTROL

Use branch:

```text
feature/earth-moon-automation
```

Make meaningful commits.

Merge.

Push.

Deploy on LUNA-1 after CI passes.

---

# REQUIRED EVIDENCE

Capture:

1. Apps Script GET response.
2. Google Sheet event log.
3. CRITICAL event.
4. CRITICAL alert email.
5. rejected invalid-token test.
6. daily trigger configuration.
7. FastAPI ticket creation.
8. CI passing.
9. LUNA application healthy.

---

# SELF-CHECK

```text
[ ] Apps Script web app deployed
[ ] shared token stored in Script Properties
[ ] real token not committed
[ ] Sheet logging works
[ ] CRITICAL email works
[ ] invalid token rejected
[ ] Python sender exists
[ ] requests dependency exists
[ ] Compose passes relay configuration
[ ] ticket creation triggers relay
[ ] relay failure does not destroy ticket
[ ] daily digest scheduled
[ ] Apps Script source versioned
[ ] documentation complete
[ ] branch used
[ ] CI passing
[ ] LUNA deployment healthy
```

Then continue to the incident.
