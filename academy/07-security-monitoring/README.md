# ACADEMY 07 — SECURITY, MONITORING & CI

## SSH

Validate:

```bash
sudo sshd -t
```

Effective config:

```bash
sudo sshd -T
```

Hardening concepts:

```text
public-key auth
disable password auth
disable direct root login
test before closing working session
```

## UFW

```bash
sudo ufw status verbose
```

Remember:

Docker-published ports interact with Docker's firewall/NAT rules.

Minimize published ports.

## Port Audit

```bash
sudo ss -tulpn
docker compose ps
```

## Secrets

```bash
chmod 600 .env
git check-ignore -v .env
git ls-files
```

Never commit real credentials.

## Logs

```bash
docker compose logs api
docker compose logs -f nginx
sudo journalctl -u docker -n 50
sudo journalctl -u ssh -n 50
```

## Prometheus

Metrics collection and time-series database.

Useful query:

```text
up
```

## Node Exporter

Exports Linux host metrics to Prometheus.

Normal port:

```text
9100
```

## Grafana

Visualizes metrics.

Project LUNA keeps it bound to host loopback and uses an SSH tunnel.

## SSH Tunnel

```text
ssh -L LOCAL_PORT:127.0.0.1:REMOTE_PORT user@server
```

## CI

GitHub workflow folder:

```text
.github/workflows/
```

CI checks code/configuration automatically after repository events.

## Deployment Flow

```text
edit
↓
commit
↓
push
↓
CI
↓
deploy script
↓
health check
```
