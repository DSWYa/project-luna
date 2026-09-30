# 🚨 INCIDENT INC-004

This incident runs against PostgreSQL on **LUNA-1**.

Update the course repo:

```bash
cd ~/project-luna
git pull
```

Run:

```bash
sudo -u postgres psql -f ~/project-luna/missions/04-station-database/incidents/trigger-incident.sql
```

Connect:

```bash
sudo -u postgres psql -d luna_incident_04
```

Mission Control reports an important life-support device is online but appears unassigned. Determine which row is affected, whether its module exists, which relationship is wrong, and the smallest targeted update needed.
