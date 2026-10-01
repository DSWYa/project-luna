# MISSION 07 WALKTHROUGH

Mission 07 protects and monitors the infrastructure you already built.

Do not rush security changes.

A bad SSH configuration can lock you out of LUNA-1.

---

# PART 1 — CREATE A PRE-HARDENING SNAPSHOT

Before changing SSH or firewall settings, create a VirtualBox snapshot.

Suggested name:

```text
M07 - PRE HARDENING
```

This is your recovery point.

---

# PART 2 — CREATE AN SSH KEY ON EARTH MISSION CONTROL

On Windows Command Prompt:

```text
ssh-keygen -t ed25519 -C "project-luna-earth-control"
```

Accept the default file location unless you have a reason to change it.

Typical files:

```text
%USERPROFILE%\.ssh\id_ed25519
%USERPROFILE%\.ssh\id_ed25519.pub
```

The file ending in:

```text
.pub
```

is the public key.

The file without `.pub` is the private key.

Never distribute the private key.

---

# PART 3 — COPY THE PUBLIC KEY TO LUNA-1

From Windows:

```text
scp %USERPROFILE%\.ssh\id_ed25519.pub lunaadmin@YOUR-LUNA-IP:/tmp/earth-control.pub
```

SSH into LUNA-1 using your existing method.

On LUNA-1:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
cat /tmp/earth-control.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
rm /tmp/earth-control.pub
```

---

# PART 4 — VERIFY KEY LOGIN BEFORE HARDENING

Keep your current SSH session open.

Open a **second** terminal on Earth.

Try:

```text
ssh lunaadmin@YOUR-LUNA-IP
```

The connection should authenticate using your key.

Do not disable password authentication until a second key-based login works.

This avoids locking yourself out.

---

# PART 5 — CREATE AN SSH HARDENING DROP-IN

On LUNA-1:

```bash
sudo nano /etc/ssh/sshd_config.d/99-luna-hardening.conf
```

Paste:

```text
PubkeyAuthentication yes
PasswordAuthentication no
PermitRootLogin no
```

Save.

This is a **configuration file**, not a command.

---

# PART 6 — VALIDATE SSH CONFIGURATION

Before reloading:

```bash
sudo sshd -t
```

No output means the syntax passed validation.

If an error appears:

**do not reload SSH.**

Fix the error and test again.

---

# PART 7 — RELOAD SSH SAFELY

Keep your current session open.

Reload:

```bash
sudo systemctl reload ssh
```

Open another new terminal from Earth.

Test:

```text
ssh lunaadmin@YOUR-LUNA-IP
```

Only after the new connection works should you close the older sessions.

---

# PART 8 — VERIFY ROOT LOGIN POLICY

Check effective settings:

```bash
sudo sshd -T | grep -E 'passwordauthentication|pubkeyauthentication|permitrootlogin'
```

You should see the effective SSH values.

---

# PART 9 — INSTALL UFW

On LUNA-1:

```bash
sudo apt update
sudo apt install ufw -y
```

Before enabling it, allow SSH:

```bash
sudo ufw allow OpenSSH
```

Allow the public web service:

```bash
sudo ufw allow 80/tcp
```

Set defaults:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Enable:

```bash
sudo ufw enable
```

Inspect:

```bash
sudo ufw status verbose
```

---

# PART 10 — IMPORTANT DOCKER + UFW CAVEAT

Do not assume:

```text
UFW DENY
```

automatically protects every Docker-published port.

Docker creates its own firewall/NAT rules for published container ports.

Traffic can be diverted before it follows the normal UFW input path.

Therefore Project LUNA uses two layers:

```text
Host firewall rules
+
Do not publish unnecessary Docker ports
```

The strongest simple rule for this bootcamp is:

> If Earth does not need direct access to a container port, do not publish it.

---

# PART 11 — AUDIT HOST LISTENING PORTS

Run:

```bash
sudo ss -tulpn
```

Also:

```bash
docker compose ps
```

from your `luna-operations` directory.

Expected public application port:

```text
80
```

SSH also listens on:

```text
22
```

PostgreSQL and FastAPI should not be broadly published by Docker.

---

# PART 12 — DOCKER PORT-BINDING REVIEW

In `compose.yaml`, this:

```yaml
ports:
  - "80:80"
```

publishes on host interfaces.

This:

```yaml
ports:
  - "127.0.0.1:3000:3000"
```

publishes only on the host loopback interface.

This is useful for private admin tools.

---

# PART 13 — SECRET HYGIENE

Your real:

```text
.env
```

contains secrets/configuration.

It must not be committed.

Check:

```bash
git check-ignore -v .env
```

Check tracked files:

```bash
git ls-files | grep -E '(^|/)\.env$'
```

No output is expected if `.env` is not tracked.

---

# PART 14 — PROTECT THE ENV FILE

On LUNA-1:

```bash
chmod 600 ~/luna-operations/.env
```

Inspect:

```bash
ls -l ~/luna-operations/.env
```

The owner should have read/write access.

Other users should not.

---

# PART 15 — `.env.example`

Your repository should include:

```text
.env.example
```

with placeholders:

```text
LUNA_DB_NAME=luna_operations
LUNA_DB_USER=luna_api
LUNA_DB_PASSWORD=CHANGE_ME
GRAFANA_ADMIN_USER=admin
GRAFANA_ADMIN_PASSWORD=CHANGE_ME
```

This documents required variables without publishing the real secrets.

---

# PART 16 — SECRET HISTORY WARNING

If a real password is accidentally committed, adding the file to `.gitignore` later does **not** erase the secret from existing Git history.

Treat exposed secrets as compromised.

The proper response includes rotating the credential.

Mission 07 does not ask you to intentionally commit a secret.

---

# PART 17 — LOGGING WITH DOCKER COMPOSE

From:

```bash
cd ~/luna-operations
```

View all logs:

```bash
docker compose logs
```

API only:

```bash
docker compose logs api
```

Recent API logs:

```bash
docker compose logs --tail 50 api
```

Follow:

```bash
docker compose logs -f api
```

Exit with:

```text
Ctrl + C
```

---

# PART 18 — HOST LOGS

Docker service:

```bash
sudo journalctl -u docker -n 50
```

SSH:

```bash
sudo journalctl -u ssh -n 50
```

Recent system errors:

```bash
sudo journalctl -p err -n 50
```

`journalctl` is a major Linux troubleshooting tool.

---

# PART 19 — ADD A MONITORING FOLDER

Inside `luna-operations`, create:

```text
monitoring/
```

Inside it create:

```text
prometheus.yml
alerts.yml
grafana/
```

The configuration belongs in Git.

Grafana's actual stored data will use a named Docker volume.

---

# PART 20 — PROMETHEUS CONFIGURATION

Create:

```text
monitoring/prometheus.yml
```

Paste:

```yaml
global:
  scrape_interval: 15s

rule_files:
  - /etc/prometheus/alerts.yml

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets:
          - prometheus:9090

  - job_name: luna1
    static_configs:
      - targets:
          - node-exporter:9100
```

Prometheus periodically **scrapes** metrics from targets.

---

# PART 21 — PROMETHEUS ALERT RULE

Create:

```text
monitoring/alerts.yml
```

Paste:

```yaml
groups:
  - name: luna-host
    rules:
      - alert: LUNAHighDiskUsage
        expr: |
          100 * (
            1 -
            node_filesystem_avail_bytes{mountpoint="/"}
            /
            node_filesystem_size_bytes{mountpoint="/"}
          ) > 85
        for: 5m
        labels:
          severity: warning
        annotations:
          summary: "LUNA-1 root disk usage is above 85%"
```

This creates an alert rule inside Prometheus.

It does not yet send a text or email.

It becomes visible as a firing alert in Prometheus.

---

# PART 22 — ADD NODE EXPORTER TO COMPOSE

Add a service:

```yaml
  node-exporter:
    image: prom/node-exporter
    command:
      - --path.procfs=/host/proc
      - --path.sysfs=/host/sys
      - --path.rootfs=/rootfs
    volumes:
      - /proc:/host/proc:ro
      - /sys:/host/sys:ro
      - /:/rootfs:ro
    restart: unless-stopped
```

Do not publish port 9100 to Earth.

Prometheus can reach it over the Compose network.

---

# PART 23 — ADD PROMETHEUS

Add:

```yaml
  prometheus:
    image: prom/prometheus
    volumes:
      - ./monitoring/prometheus.yml:/etc/prometheus/prometheus.yml:ro
      - ./monitoring/alerts.yml:/etc/prometheus/alerts.yml:ro
      - prometheus_data:/prometheus
    ports:
      - "127.0.0.1:9090:9090"
    depends_on:
      - node-exporter
    restart: unless-stopped
```

Prometheus is reachable from LUNA-1 at:

```text
127.0.0.1:9090
```

but is not intentionally published to the LAN.

---

# PART 24 — ADD GRAFANA

Add:

```yaml
  grafana:
    image: grafana/grafana
    environment:
      GF_SECURITY_ADMIN_USER: ${GRAFANA_ADMIN_USER}
      GF_SECURITY_ADMIN_PASSWORD: ${GRAFANA_ADMIN_PASSWORD}
    volumes:
      - grafana_data:/var/lib/grafana
    ports:
      - "127.0.0.1:3000:3000"
    depends_on:
      - prometheus
    restart: unless-stopped
```

Add to `.env`:

```text
GRAFANA_ADMIN_USER=admin
GRAFANA_ADMIN_PASSWORD=CHOOSE-A-STRONG-LAB-PASSWORD
```

Do not put the real password in `.env.example`.

---

# PART 25 — DECLARE MONITORING VOLUMES

Under Compose volumes, include:

```yaml
volumes:
  postgres_data:
  prometheus_data:
  grafana_data:
```

Keep your existing PostgreSQL volume declaration.

---

# PART 26 — VALIDATE AND DEPLOY MONITORING

Run:

```bash
docker compose config
```

Then:

```bash
docker compose up -d
```

Check:

```bash
docker compose ps
```

Logs:

```bash
docker compose logs prometheus
docker compose logs grafana
docker compose logs node-exporter
```

---

# PART 27 — TEST PROMETHEUS LOCALLY

On LUNA-1:

```bash
curl http://127.0.0.1:9090/-/healthy
```

Prometheus should report healthy.

---

# PART 28 — ACCESS PRIVATE MONITORING THROUGH SSH

Prometheus and Grafana are not directly exposed to the LAN.

From Earth Mission Control open a new terminal:

```text
ssh -L 3000:127.0.0.1:3000 -L 9090:127.0.0.1:9090 lunaadmin@YOUR-LUNA-IP
```

Keep that SSH session open.

Now your Windows browser can open:

```text
http://127.0.0.1:3000
```

for Grafana.

And:

```text
http://127.0.0.1:9090
```

for Prometheus.

The traffic travels through the encrypted SSH connection.

---

# PART 29 — PROMETHEUS TARGETS

Open Prometheus through the tunnel.

Go to:

```text
Status → Target health
```

or use the Prometheus targets interface.

You should see:

```text
prometheus   UP
luna1        UP
```

If a target is DOWN, monitoring is incomplete even if the actual station service is still running.

---

# PART 30 — BASIC PROMQL

Prometheus uses PromQL.

Try:

```text
up
```

This shows target availability from Prometheus's perspective.

Try:

```text
node_load1
```

One-minute Linux load average.

---

# PART 31 — CPU QUERY

Try:

```text
100 - (
  avg by (instance) (
    rate(node_cpu_seconds_total{mode="idle"}[5m])
  ) * 100
)
```

This estimates CPU usage percentage.

Do not worry about memorizing the query.

Understand that Prometheus stores time-series metrics and PromQL calculates useful views from them.

---

# PART 32 — MEMORY QUERY

Try:

```text
100 * (
  1 -
  node_memory_MemAvailable_bytes
  /
  node_memory_MemTotal_bytes
)
```

This estimates used memory percentage.

---

# PART 33 — DISK QUERY

Try:

```text
100 * (
  1 -
  node_filesystem_avail_bytes{mountpoint="/"}
  /
  node_filesystem_size_bytes{mountpoint="/"}
)
```

This estimates root filesystem utilization.

---

# PART 34 — CONFIGURE GRAFANA

Open:

```text
http://127.0.0.1:3000
```

Log in with the credentials from `.env`.

Add a Prometheus data source.

URL:

```text
http://prometheus:9090
```

Why not:

```text
127.0.0.1:9090
```

Because Grafana runs in a container.

Inside the Grafana container, `127.0.0.1` means Grafana itself.

The Prometheus Compose service is reachable as:

```text
prometheus
```

---

# PART 35 — CREATE A SIMPLE DASHBOARD

Create a dashboard with at least:

```text
CPU usage
memory usage
root disk usage
one-minute load
```

Use the PromQL queries from the walkthrough.

Save the dashboard.

Grafana's named volume keeps its state when the container is recreated.

---

# PART 36 — CHECK ALERT RULES

In Prometheus, inspect alert/rule status.

The disk alert should normally be:

```text
inactive
```

unless your disk is actually above the configured threshold.

The purpose is to prove that Prometheus loaded the rule.

---

# PART 37 — WHAT IS CI?

CI means:

```text
Continuous Integration
```

When engineers push changes, automated checks run before deployment.

Instead of:

```text
push code
hope it works
```

you get:

```text
push code
↓
automated validation
↓
pass / fail
```

---

# PART 38 — CREATE THE GITHUB ACTIONS FOLDER

On Earth Mission Control inside `luna-operations`, create:

```text
.github/workflows/
```

This is a **folder structure**.

Inside it create a **file**:

```text
ci.yml
```

---

# PART 39 — CREATE THE CI WORKFLOW

Paste:

```yaml
name: LUNA CI

on:
  push:
  pull_request:

jobs:
  validate:
    runs-on: ubuntu-latest

    steps:
      - name: Check out repository
        uses: actions/checkout@v6

      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.13"

      - name: Install Python dependencies
        run: |
          python -m pip install --upgrade pip
          pip install -r app/requirements.txt

      - name: Validate Python syntax
        run: |
          python -m compileall app

      - name: Build API image
        run: |
          docker build -t luna-api-ci ./app

      - name: Validate Compose
        run: |
          docker compose --env-file .env.example config
```

Commit and push.

Open the repository's **Actions** tab on GitHub.

The workflow should run automatically.

---

# PART 40 — READ A CI FAILURE

If CI fails:

1. Open the failed workflow.
2. Open the failed job.
3. Expand the failed step.
4. Read the error output.

CI does not magically fix code.

It gives you feedback before deployment.

---

# PART 41 — INTENTIONALLY TEST CI

On a temporary branch, introduce a harmless Python syntax error.

Push the branch.

Watch CI fail.

Fix it.

Push again.

Watch CI pass.

Do not merge intentionally broken code into `main`.

---

# PART 42 — CI VS CD

```text
CI
automatically validates changes

CD
delivers/deploys validated changes
```

Your LUNA-1 VM is normally on a private network.

A GitHub-hosted runner cannot safely be assumed to have direct access to it.

Mission 07 therefore uses:

```text
GitHub Actions = CI
LUNA deployment script = controlled deployment automation
```

This avoids exposing SSH to the public internet just to make deployment automatic.

---

# PART 43 — CREATE A DEPLOYMENT SCRIPT

Inside `luna-operations`, create:

```text
scripts/deploy.sh
```

Paste:

```bash
#!/bin/bash

set -e

cd "$HOME/luna-operations"

echo "Pulling latest code..."
git pull --ff-only

echo "Validating Compose..."
docker compose --env-file .env config >/dev/null

echo "Building..."
docker compose build

echo "Deploying..."
docker compose up -d

echo "Checking services..."
docker compose ps

echo "Checking health..."
curl --fail http://127.0.0.1/health

echo
echo "Deployment complete."
```

Make executable on LUNA-1:

```bash
chmod +x ~/luna-operations/scripts/deploy.sh
```

Run:

```bash
~/luna-operations/scripts/deploy.sh
```

`set -e` makes the script stop when a command fails.

---

# PART 44 — DEPLOYMENT RULE

The workflow becomes:

```text
Earth
edit
↓
commit
↓
push
↓
GitHub Actions CI
↓
PASS
↓
SSH to LUNA-1
↓
run deploy.sh
```

Do not deploy a change whose CI run is failing.

---

# PART 45 — SECURITY REVIEW

Before finishing, answer:

```text
Which host ports are listening?

Which Docker ports are published?

Which secrets exist?

Are they tracked?

Can password SSH still be used?

Can root SSH directly?

Are monitoring UIs LAN-accessible?

Are database/API ports publicly published?

Does CI pass?

Are Prometheus targets UP?
```

Security is not one product.

It is the combined result of many small controls.

---

# PART 46 — COMPLETE THE LABS

Complete:

```text
labs/01-ssh-host-security.md
labs/02-secrets-logs.md
labs/03-monitoring.md
labs/04-cicd.md
```

Then continue to:

```text
project/README.md
```
