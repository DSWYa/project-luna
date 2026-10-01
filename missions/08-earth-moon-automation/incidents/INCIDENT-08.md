# 🚨 INCIDENT INC-008

**SYSTEM:** Earth Automation Relay  
**RUNTIME:** Disposable Docker lab on LUNA-1

Mission Control reports:

```text
WEBHOOK REQUEST ........ DELIVERED
HTTP RESPONSE .......... SUCCESS
EVENT LOG .............. CREATED
CRITICAL ALERT ......... NOT GENERATED
```

The transport works.

The intended automation action does not.

---

# STEP 1 — UPDATE COURSE FILES

On LUNA-1:

```bash
cd ~/project-luna
git pull
```

---

# STEP 2 — GENERATE THE INCIDENT

```bash
cd ~/project-luna/missions/08-earth-moon-automation/incidents
chmod +x trigger-incident.sh
./trigger-incident.sh
```

It creates:

```text
~/luna-incident-08
```

Do not inspect the generator source before troubleshooting.

---

# STEP 3 — START THE RELAY

```bash
cd ~/luna-incident-08
docker compose up -d --build
```

Check:

```bash
docker compose ps
```

---

# STEP 4 — SEND THE STATION EVENT

Run:

```bash
./send-event.sh
```

You should receive JSON indicating the webhook was received.

Inspect:

```bash
cat events.log
```

Then:

```bash
cat alerts.log
```

The event arrived.

The alert did not.

---

# OBJECTIVE

Determine:

1. whether HTTP delivery succeeded,
2. whether the receiver parsed the JSON,
3. which fields arrived,
4. which field the receiver expects for routing,
5. why the CRITICAL branch did not execute,
6. the smallest correction.

This is a **payload contract** incident.

If stuck, open `hint-1.md`.
