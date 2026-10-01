# INCIDENT INC-007 — SOLUTION

Prometheus is configured to scrape:

```text
node-exporter:9200
```

But Node Exporter listens on:

```text
9100
```

Correct:

```yaml
- job_name: luna1
  static_configs:
    - targets:
        - node-exporter:9100
```

Save.

Restart Prometheus:

```bash
docker compose restart prometheus
```

Wait a few seconds.

Check targets again.

---

# ROOT CAUSE

```text
LUNA-1 ............. OK
Node Exporter ...... OK
Prometheus ......... OK
Docker network ..... OK
Scrape target ...... WRONG PORT
```

Monitoring systems can fail independently from the systems they monitor.

That is why monitoring itself must be checked.
