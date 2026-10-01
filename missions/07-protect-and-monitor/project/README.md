# 🛠️ MISSION 07 FINAL PROJECT

# PROTECT & MONITOR LUNA-1

You will convert the containerized application into an observable, hardened operating environment.

---

# REQUIREMENT 1 — PRE-HARDENING SNAPSHOT

Create a VirtualBox snapshot before SSH/firewall changes.

---

# REQUIREMENT 2 — SSH KEYS

Earth Mission Control must authenticate using an Ed25519 SSH key.

Verify a fresh SSH session works with the key.

---

# REQUIREMENT 3 — SSH HARDENING

Use an SSH configuration drop-in.

Required effective policies:

```text
PubkeyAuthentication yes
PasswordAuthentication no
PermitRootLogin no
```

Run:

```bash
sudo sshd -t
```

before reload.

Keep an existing session open while testing a second login.

---

# REQUIREMENT 4 — HOST FIREWALL

Configure UFW for the host.

At minimum allow:

```text
SSH
HTTP
```

Document the Docker/UFW limitation.

Do not rely on UFW alone to protect Docker-published ports.

---

# REQUIREMENT 5 — MINIMIZE DOCKER EXPOSURE

The application stack should not broadly publish:

```text
PostgreSQL 5432
FastAPI 8000
Prometheus 9090
Grafana 3000
Node Exporter 9100
```

Expected:

```text
Nginx 80
```

is public to the local network.

Monitoring ports may bind only to:

```text
127.0.0.1
```

---

# REQUIREMENT 6 — SECRET HYGIENE

Real secrets live in:

```text
.env
```

Requirements:

- `.env` ignored,
- `.env` untracked,
- permissions `600`,
- `.env.example` contains placeholders,
- no real password in documentation.

---

# REQUIREMENT 7 — PROMETHEUS

Add Prometheus to Compose.

Configuration lives under:

```text
monitoring/
```

Prometheus must scrape:

```text
prometheus
node-exporter
```

Persist Prometheus data with a named volume.

Bind the Prometheus UI to LUNA-1 loopback only.

---

# REQUIREMENT 8 — NODE EXPORTER

Add Node Exporter.

Prometheus must successfully collect LUNA-1 host metrics.

Do not publish Node Exporter to the LAN.

---

# REQUIREMENT 9 — GRAFANA

Add Grafana.

Requirements:

- credentials from `.env`,
- named persistent volume,
- loopback-only published port,
- Prometheus data source,
- dashboard with CPU, memory, and disk information.

Access Grafana from Earth using SSH port forwarding.

---

# REQUIREMENT 10 — ALERT RULE

Create at least one Prometheus alert rule.

The required rule:

```text
high root-disk utilization
```

It should have:

- threshold,
- duration,
- severity label,
- useful summary.

---

# REQUIREMENT 11 — CI WORKFLOW

Create:

```text
.github/workflows/ci.yml
```

Run on:

```text
push
pull_request
```

At minimum:

- checkout repository,
- configure Python,
- install dependencies,
- validate Python syntax,
- build API Docker image,
- validate Compose configuration.

---

# REQUIREMENT 12 — CI FAILURE TEST

Create a temporary branch.

Cause a safe validation failure.

Observe GitHub Actions fail.

Repair it.

Observe the workflow pass.

Do not merge the broken revision.

---

# REQUIREMENT 13 — DEPLOYMENT SCRIPT

Create:

```text
scripts/deploy.sh
```

It must:

1. stop on errors,
2. pull using fast-forward-only,
3. validate Compose,
4. build,
5. deploy,
6. show service state,
7. perform an HTTP health check.

---

# REQUIREMENT 14 — DOCUMENT OPERATIONS

Update project documentation with:

```text
SSH hardening
UFW policy
Docker exposure model
secret handling
monitoring architecture
SSH tunnels
Prometheus
Grafana
CI workflow
deployment workflow
log commands
troubleshooting sequence
```

---

# REQUIREMENT 15 — FINAL AUDIT

Provide evidence for:

```text
key-based SSH works
password SSH disabled
root SSH disabled
UFW enabled
only intended ports exposed
.env ignored
Prometheus targets UP
Grafana dashboard works
alert rule loaded
CI passing
deploy script succeeds
application healthy
```

---

# SELF-CHECK

```text
[ ] VM snapshot exists
[ ] SSH key login works
[ ] password SSH disabled safely
[ ] root SSH disabled
[ ] UFW configured
[ ] Docker/UFW limitation documented
[ ] unnecessary Docker ports unpublished
[ ] .env protected
[ ] Prometheus running
[ ] Node Exporter running
[ ] Grafana running
[ ] monitoring UIs private
[ ] dashboard created
[ ] alert loaded
[ ] GitHub Actions CI works
[ ] failure test performed
[ ] deploy script works
[ ] documentation updated
```

Then continue to the incident.
