# FILE: missions/01-establish-the-outpost/incidents/INCIDENT-01.md

# 🚨 INCIDENT INC-001

**PRIORITY:** HIGH  
**SYSTEM:** LUNA-1 Command Server  
**SOURCE:** Earth Mission Control

---

## Situation

Mission Control has issued a routine systems diagnostic package for LUNA-1.

The package is designed to simulate an operational event and verify your troubleshooting process.

You are not expected to know what the script changes.

Your job is to diagnose the system based on the symptoms that appear afterward.

---

# Step 1 — Run the Incident Simulator

From LUNA-1, navigate to the incident folder containing the script:

```bash
cd ~/project-luna/missions/01-establish-the-outpost/incidents
```

If your Project LUNA repository is located somewhere else, navigate to that location instead.

Make the script executable:

```bash
chmod +x trigger-incident.sh
```

Run it:

```bash
sudo ./trigger-incident.sh
```

You should see:

```text
Mission Control diagnostic sequence complete.

INCIDENT GENERATED.

Return to Earth Mission Control and begin troubleshooting.
```

Do not open the script.

Do not inspect its contents.

The goal is to troubleshoot the resulting system behavior.

---

# Incident Report

At 03:42 UTC, Mission Control lost access to the LUNA-1 status page.

The server itself still appears reachable.

Crew systems report no power failure.

---

# Reported Symptoms

Mission Control reports:

```text
PING: SUCCESS
SSH: SUCCESS
WEB DASHBOARD: FAILED
```

Attempting to access:

```text
http://LUNA-1-IP
```

results in a connection failure.

---

# Your Objective

Restore the LUNA-1 status page.

You may:

- SSH into the server
- Inspect processes
- Inspect services
- Review logs
- Test network connectivity
- Restart services
- Use any command learned during Mission 01

Do not reinstall software unless your investigation shows that it is actually necessary.

---

# Rules

Try to diagnose the issue systematically.

Avoid random changes.

Start with the information you already have:

```text
The server responds to ping.
SSH still works.
The webpage does not.
```

What does that tell you?

---

# Success Criteria

The incident is resolved when:

```text
PING: SUCCESS
SSH: SUCCESS
HTTP: SUCCESS
```

and the LUNA-1 status page loads successfully again.

If you remain stuck after approximately 15 minutes, open:

`hint-1.md`