INCIDENT INC-001 — SOLUTION

First inspect the service:

systemctl status nginx

You should find that Nginx is inactive or stopped.

Start it:

sudo systemctl start nginx

Verify:

systemctl status nginx

Then test locally:

curl localhost

Finally, test from Earth Mission Control:

http://LUNA-1-IP

The webpage should load again.

Root Cause

The Nginx service had stopped.

The operating system itself remained functional.

Networking remained functional.

SSH remained functional.

Only the HTTP service was unavailable.

Why This Incident Matters

A user may report:

"The server is down."

But that may not actually be true.

In this incident:

Server .............. ONLINE
Network ............. ONLINE
SSH ................. ONLINE
Web Service ......... OFFLINE

The real failure existed at the service layer.

A strong troubleshooting process narrows the problem instead of treating every symptom as a total system failure.

Think in layers:

Virtual Machine
      ↓
Operating System
      ↓
Networking
      ↓
Service
      ↓
Application

Eliminate healthy layers until you reach the failure.

What the Incident Simulator Did

Only after completing the incident should you inspect:

trigger-incident.sh

The relevant line is:

systemctl stop nginx >/dev/null 2>&1

The command:

systemctl stop nginx

stopped Nginx.

The section:

>/dev/null 2>&1

discarded normal output and error output so the script would not reveal what it changed.

This is your first example of a script performing system administration automatically.

You will learn much more about scripting later in Project LUNA.