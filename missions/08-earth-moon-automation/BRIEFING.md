# 🌎↔🌑 MISSION 08 — EARTH ↔ MOON AUTOMATION

**MISSION ID:** LUNA-M08  
**PRIORITY:** HIGH  
**ROLE:** Junior Systems Engineer  
**OBJECTIVE:** Connect LUNA-1 to external business automation and notification systems

---

## Mission Briefing

LUNA-1 is now:

- containerized,
- monitored,
- hardened,
- version controlled,
- and backed by CI.

But Mission Control still relies on people noticing problems and manually copying information between systems.

A critical maintenance ticket should not require an engineer to:

1. notice it,
2. open another application,
3. copy the details,
4. update a spreadsheet,
5. and manually send an email.

Systems should communicate.

Mission 08 introduces **external automation**.

---

# Core Architecture

LUNA-1 does not need to expose a new inbound management port to the public internet.

Instead, it can send outbound HTTPS events to an automation endpoint.

```text
🌑 LUNA-1
FastAPI / automation code
        │
        │ HTTPS POST
        ▼
☁️ Google Apps Script Web App
        │
        ├── validate shared token
        ├── write Google Sheet row
        └── send CRITICAL email
```

This is an **outbound webhook** pattern.

It works well for a home/lab server because outbound HTTPS is much simpler than exposing LUNA-1 directly to the public internet.

---

# Free-First Rule

The required Mission 08 path uses:

```text
Google Apps Script
Google Sheets
Google email service
```

A standard Google account can use Apps Script without purchasing a separate automation product, subject to Google's normal quotas.

Zapier is included as an **optional comparison lab** only.

If Zapier marks a required feature Premium in your account:

```text
SKIP IT
```

Do not buy a plan or start a paid trial just to complete Project LUNA.

---

# What You Will Learn

- automation triggers and actions,
- webhook concepts,
- HTTP POST automation,
- JSON payload contracts,
- shared-secret validation,
- Google Apps Script,
- Script Properties,
- Google Sheets automation,
- automated email alerts,
- time-driven triggers,
- external-service quotas,
- Python HTTP requests,
- environment-based webhook configuration,
- graceful external-service failure,
- Zapier concepts,
- automation troubleshooting.

Open `OBJECTIVES.md`, then continue to `WALKTHROUGH.md`.
