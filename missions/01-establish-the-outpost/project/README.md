# 🛠️ MISSION 01 FINAL PROJECT

# LUNA-1 OPERATIONS NODE

The training portion of Mission 01 is complete.

Until now, Mission Control provided exact commands and guided procedures.

That ends here.

You already possess everything required to complete this assignment.

You may use:

- Mission 01 Academy documentation
- Previous labs
- The Linux/networking cheat sheet
- Your own notes

You should not need to learn an entirely new technology to finish this project.

---

# Scenario

LUNA-1's command server is online.

Mission Control now needs the server prepared for routine station operations.

The server requires:

1. An organized operations workspace.
2. An automated system report.
3. A remotely accessible station information page.
4. A backup copy of its latest report.
5. Verified remote administration.

Your assignment is to build them.

---

# PROJECT REQUIREMENTS

## 1 — Build the Operations Workspace

Inside your home directory, create:

```text
luna-ops/
├── reports/
├── backups/
├── scripts/
└── station/
```

You decide which Linux commands to use.

---

# 2 — Create the Station Configuration File

Create:

```text
~/luna-ops/station/station-info.txt
```

It must contain:

```text
PROJECT: LUNA
STATION: LUNA-1
ROLE: COMMAND SERVER
LOCATION: LUNAR SURFACE
STATUS: OPERATIONAL
```

---

# 3 — Build the Operations Report Script

Create:

```text
~/luna-ops/scripts/generate-report.sh
```

The script must automatically generate:

```text
~/luna-ops/reports/latest-report.txt
```

The report must contain:

```text
================================
       LUNA-1 SYSTEM REPORT
================================

Hostname:
<actual hostname>

Engineer:
<actual Linux user>

Report Generated:
<actual current date/time>

IP Configuration:
<actual IP information>

System Uptime:
<actual uptime>

Disk Usage:
<actual disk information>

================================
STATUS: OPERATIONAL
================================
```

You have already learned all syntax required to accomplish this.

Your script will likely use concepts such as:

```bash
echo
$(command)
>
>>
```

along with Linux commands from this mission.

Do not manually type your current hostname, username, uptime, IP address, date, or disk usage into the report.

The script must retrieve them from the system.

---

# 4 — Make the Script Executable

This must work:

```bash
~/luna-ops/scripts/generate-report.sh
```

Running it must create or update:

```text
~/luna-ops/reports/latest-report.txt
```

---

# 5 — Create a Backup

After generating the report, create a copy at:

```text
~/luna-ops/backups/report-backup.txt
```

Mission Control does not care whether you perform the copy manually or include it in your script.

However, automating it earns you imaginary lunar-engineer bonus points.

---

# 6 — Build the LUNA Operations Webpage

Your existing default training webpage is no longer sufficient.

Replace it with an **Operations Node** page.

The webpage must display at least:

```text
LUNA-1 OPERATIONS NODE

SERVER STATUS: OPERATIONAL

SERVICES:
SSH: ONLINE
HTTP: ONLINE

MISSION:
PROJECT LUNA
```

You may customize the page however you want.

You are not being graded on web design.

The objective is to demonstrate that you understand:

- Where Nginx serves files from
- How to edit those files
- How to access the service remotely

---

# 7 — Add One Piece of Dynamic Information Manually

Add the server's current IP address to the webpage.

Example:

```text
CURRENT NODE ADDRESS: 192.168.1.50
```

At this stage, it is acceptable for this value to be entered manually.

Automatically generating webpages comes later.

---

# 8 — Verify Remote Administration

From Earth Mission Control, successfully:

1. Ping LUNA-1.
2. SSH into LUNA-1.
3. Run your report-generation script remotely.
4. Display the generated report using:

```bash
cat
```

5. Check Nginx's service status.
6. Exit the SSH session.

The VM console should not be required for these steps.

---

# 9 — Verify the Web Service

From Earth Mission Control:

Open:

```text
http://YOUR-LUNA-IP
```

Verify that the Operations Node page appears.

Then from your host terminal, test the same service using:

```text
curl
```

or on Windows:

```powershell
curl.exe http://YOUR-LUNA-IP
```

---

# 10 — Create the Final Snapshot

After confirming everything works, shut down LUNA-1 cleanly.

Create a VirtualBox snapshot named:

```text
M01 COMPLETE - OPERATIONS NODE
```

---

# Required Evidence

Capture screenshots showing:

### Screenshot 1

Your LUNA-1 Operations Node webpage from your host computer.

### Screenshot 2

A successful SSH session.

### Screenshot 3

Your script executing.

### Screenshot 4

The contents of:

```text
latest-report.txt
```

### Screenshot 5

Nginx shown as:

```text
active (running)
```

---

# Self-Check

Before moving forward, verify:

```text
[ ] LUNA-1 boots normally

[ ] SSH works from Earth Mission Control

[ ] Nginx is running

[ ] Operations Node page loads remotely

[ ] luna-ops directory structure exists

[ ] generate-report.sh exists

[ ] Script is executable

[ ] Script retrieves real system information

[ ] latest-report.txt is generated

[ ] Backup report exists

[ ] Final VM snapshot exists
```

---

# Important

You are not supposed to remember every command perfectly.

Use your documentation.

What matters is whether you can take a requirement such as:

> "Create an executable script that records disk usage."

and connect it to skills you already learned:

```text
Create file
+
Bash
+
df
+
redirection
+
permissions
```

That is the difference between following a tutorial and applying a skill.

---

When the project is complete, proceed to:

```text
../incidents/INCIDENT-01.md
```