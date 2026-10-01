# ECLIPSE PROTOCOL — HINT 2

The AI system has its own desired replica count.

Inspect:

```bash
kubectl get deployment ollama -n luna
kubectl describe deployment ollama -n luna
```

For monitoring:

```bash
kubectl get configmap prometheus-config -n luna -o yaml
```

Node Exporter's normal service port from Mission 07 is:

```text
9100
```
