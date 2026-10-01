# LAB 03 — MONITORING

Use Prometheus, Node Exporter, and Grafana on LUNA-1.

Requirements:

1. Prometheus target `luna1` is UP.
2. Query `up`.
3. Query `node_load1`.
4. Query CPU usage.
5. Query memory usage.
6. Query root disk usage.
7. Grafana uses Prometheus as a data source.
8. Create a dashboard containing at least three panels.
9. Confirm Grafana remains accessible only through the SSH tunnel or LUNA-1 loopback binding.
10. Confirm the disk alert rule is loaded.

Explain the difference between:

```text
service is running
```

and:

```text
monitoring can successfully observe the service
```
