# SECURITY / MONITORING / CI CHEAT SHEET

SSH:

```bash
sudo sshd -t
sudo sshd -T
sudo systemctl reload ssh
```

Firewall:

```bash
sudo ufw status verbose
```

Sockets:

```bash
sudo ss -tulpn
```

Secrets:

```bash
chmod 600 .env
git check-ignore -v .env
```

Docker logs:

```bash
docker compose logs
docker compose logs --tail 50 api
docker compose logs -f api
```

Journal:

```bash
sudo journalctl -u docker -n 50
sudo journalctl -u ssh -n 50
```

Prometheus:

```text
up
node_load1
```

SSH tunnels:

```text
ssh -L 3000:127.0.0.1:3000 -L 9090:127.0.0.1:9090 user@server
```

Compose monitoring:

```bash
docker compose ps
docker compose logs prometheus
docker compose logs grafana
docker compose logs node-exporter
```

CI workflow location:

```text
.github/workflows/
```

Deployment:

```bash
git pull --ff-only
docker compose config
docker compose build
docker compose up -d
curl --fail http://127.0.0.1/health
```
