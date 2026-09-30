# 🚨 INCIDENT INC-001

**PRIORITY:** HIGH  
**SYSTEM:** LUNA-1  
**SOURCE:** Earth Mission Control

---

# INCIDENT SIMULATION

Mission Control has deployed an automated diagnostic simulation with the Project LUNA training repository.

The simulator will create a system failure.

You are deliberately **not being told what it changes**.

Your job is to diagnose the resulting symptoms.

---

# Update Your Mission Files

SSH into LUNA-1.

Enter your Project LUNA repository:

```bash
cd ~/project-luna
```

Retrieve the latest Mission Control files:

```bash
git pull
```

Then enter:

```bash
cd missions/01-establish-the-outpost/incidents
```

Verify the files:

```bash
ls
```

You should see:

```text
INCIDENT-01.md
trigger-incident.sh
hint-1.md
hint-2.md
solution.md
```

---

# Run the Incident Simulator

Give the simulator execute permission:

```bash
chmod +x trigger-incident.sh
```

Run:

```bash
sudo ./trigger-incident.sh
```

You should see:

```text
========================================
      PROJECT LUNA DIAGNOSTIC TOOL
========================================

Initializing LUNA-1 systems check...
Checking environmental interfaces...
Checking communications relay...
Checking mission services...

Mission Control diagnostic sequence complete.

INCIDENT GENERATED.

Return to Earth Mission Control and begin troubleshooting.
```

**Do not open `trigger-incident.sh`.**

Doing so will reveal the failure and defeat the purpose of the exercise.

---

# Incident Report

At 03:42 UTC, Earth Mission Control reports loss of one LUNA-1 service.

Initial automated testing shows:

```text
SERVER REACHABLE: YES

PING: SUCCESS

SSH: SUCCESS

OPERATIONS PAGE: FAILED
```

Crew systems report no power interruption.

---

# Mission Objective

Determine:

1. What failed.
2. What remained operational.
3. The smallest action required to restore service.

Restore normal operations.

Do not reboot the server unless your troubleshooting indicates that a reboot is actually necessary.

Do not reinstall software unless your investigation shows that the software itself is damaged.

---

# Troubleshooting Rules

Work from known information.

Ask:

```text
What is definitely working?

What is definitely failing?

What layer does that eliminate?

What should I test next?
```

Use the tools learned during Mission 01.

---

# Success Condition

Mission Control must return:

```text
PING ........ PASS
SSH ......... PASS
HTTP ........ PASS
```

and the LUNA-1 Operations Node must load again.

If you remain stuck for approximately 15 minutes:

Open:

```text
hint-1.md
```