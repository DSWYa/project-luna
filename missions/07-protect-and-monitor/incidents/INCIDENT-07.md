# 🚨 INCIDENT INC-007

**SYSTEM:** LUNA Monitoring  
**RUNTIME:** Docker on LUNA-1

Mission Control reports:

```text
LUNA-1 ................. ONLINE
APPLICATION ............ ONLINE
PROMETHEUS ............. ONLINE
NODE EXPORTER .......... RUNNING
HOST METRICS ........... MISSING
```

The station is working.

Monitoring is blind.

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
cd ~/project-luna/missions/07-protect-and-monitor/incidents
chmod +x trigger-incident.sh
./trigger-incident.sh
```

It creates:

```text
~/luna-incident-07
```

Do not inspect the generator before troubleshooting.

---

# STEP 3 — START THE INCIDENT STACK

```bash
cd ~/luna-incident-07
docker compose up -d
```

Check:

```bash
docker compose ps
```

---

# STEP 4 — CHECK PROMETHEUS

Prometheus is bound to LUNA-1 loopback at:

```text
127.0.0.1:9190
```

From LUNA-1:

```bash
curl http://127.0.0.1:9190/-/healthy
```

Prometheus should be healthy.

Inspect targets through the API:

```bash
curl -s http://127.0.0.1:9190/api/v1/targets
```

---

# OBJECTIVE

Determine:

1. Whether Prometheus itself is healthy.
2. Whether Node Exporter is running.
3. Which target is DOWN.
4. Why Prometheus cannot scrape it.
5. The smallest configuration correction.
6. How to apply the corrected configuration.

Useful commands:

```bash
docker compose ps
docker compose logs prometheus
docker compose logs node-exporter
cat prometheus.yml
```

If stuck, open `hint-1.md`.
