🛠️ MISSION PROJECT — LUNA-1 COMMAND SERVER

The guided portion of Mission 01 is complete.

From this point forward, you receive requirements rather than exact commands.

Use:

Academy documentation

Previous labs

Your notes

Internet documentation

man pages

Search engines

You are allowed to research.

That is part of the job.

Scenario

Mission Control is preparing to connect additional systems to LUNA-1.

Before authorization can be granted, the station's first server must pass operational readiness testing.

Your server must satisfy every requirement below.

Requirements

Server

Your VM must:

Be named LUNA-1.

Run Ubuntu Server.

Have at least 2 GB RAM.

Have at least 20 GB virtual storage.

Successfully boot without installation media.

Identity

The Linux hostname must be:

luna-1

You must have a standard administrative user.

Recommended:

lunaadmin

Directory Structure

Inside your home directory, create:

luna/
├── logs/
├── reports/
├── scripts/
└── telemetry/

Status File

Create:

~/luna/reports/system-info.txt

It must contain:

PROJECT LUNA
NODE: luna-1
STATUS: OPERATIONAL

Add the server's current IP address.

Add the date you completed Mission 01.

Script

Create:

~/luna/scripts/status.sh

Running it must display:

==============================
       LUNA-1 STATUS
==============================
Hostname:
<your hostname>

Current User:
<your username>

IP Address:
<your IP>

Uptime:
<system uptime>

Disk Usage:
<disk information>
==============================

You will need to research commands capable of displaying this information.

Do not simply hard-code the answers.

The script should obtain information from the operating system.

Make the script executable.

SSH

Mission Control must be able to SSH into LUNA-1 from the host computer.

HTTP

Nginx must be installed and running.

Opening:

http://YOUR-LUNA-IP

from your host computer must display a webpage containing:

LUNA-1 COMMAND SERVER
STATUS: OPERATIONAL

You may customize the page however you want.

Services

Both of these must be running:

ssh
nginx

Snapshot

Create a VirtualBox snapshot after completing the project.

Name it:

M01 COMPLETE

Evidence

Save screenshots showing:

Successful SSH login.

status.sh running.

systemctl status nginx.

LUNA-1 status page in your host browser.

Later, these can become part of your project documentation.

Completion Condition

Do not open COMPLETE.md until:

The project requirements are complete.

You have completed the incident.

You have completed the knowledge check.

Proceed to:

../incidents/INCIDENT-01.md