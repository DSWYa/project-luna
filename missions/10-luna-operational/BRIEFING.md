# 🚀 MISSION 10 — LUNA GOES OPERATIONAL

**MISSION ID:** LUNA-M10  
**PRIORITY:** FINAL  
**ROLE:** Systems Engineer  
**OBJECTIVE:** Migrate Project LUNA to Kubernetes and survive the final station emergency

---

# Final Mission Briefing

You began Project LUNA with an empty Ubuntu Server VM.

You now have:

```text
Linux
Networking
SSH
Git / GitHub
Bash
Python
JSON / CSV
PostgreSQL
FastAPI
HTML / CSS / JavaScript
Docker
Docker Compose
Security hardening
Prometheus
Grafana
CI
External automation
Local AI
```

The station works.

The final engineering problem is **orchestration**.

Mission Control no longer wants to think in terms of:

```text
start this container
restart that container
remember this port
manually replace this process
```

Instead, engineers should declare:

> This is the state the station should be in.

Kubernetes continuously works to make reality match that desired state.

---

# Project LUNA Kubernetes Platform

This mission uses:

```text
K3s
```

K3s is a lightweight, conformant Kubernetes distribution designed for environments such as:

- edge systems,
- homelabs,
- development,
- IoT,
- resource-constrained infrastructure.

A single K3s server is a complete Kubernetes cluster.

That fits LUNA-1 perfectly.

---

# Final Architecture

```text
🌎 EARTH MISSION CONTROL
│
├── Browser
├── Git / GitHub
├── SSH
└── CI
        │
        ▼
🌑 LUNA-1 — K3s
│
├── Kubernetes Control Plane
├── Traefik Ingress
├── CoreDNS
├── local-path storage
├── metrics-server
│
└── namespace: luna
     │
     ├── FastAPI Deployment
     ├── PostgreSQL StatefulSet
     ├── Ollama Deployment
     ├── Prometheus Deployment
     ├── Grafana Deployment
     ├── Node Exporter DaemonSet
     ├── Services
     ├── ConfigMaps
     ├── Secrets
     ├── PersistentVolumeClaims
     ├── NetworkPolicy
     └── Ingress
```

---

# Final Rule

For Missions 1–9, the walkthrough gave substantial guidance.

Mission 10 changes the balance.

You will receive:

```text
Walkthrough
= teaches Kubernetes concepts

Labs
= guided practice

Final Migration
= requirements

Emergency Simulation
= symptoms only
```

You are expected to combine what you have learned.

---

# Mission Completion

Project LUNA is complete when:

1. The full station stack runs under K3s.
2. Persistent data survives Pod replacement.
3. Earth reaches Mission Control through Kubernetes Ingress.
4. The API can scale.
5. Kubernetes replaces failed Pods.
6. Secrets remain out of Git.
7. Monitoring works.
8. AI works.
9. Earth automation works.
10. CI passes.
11. The final emergency simulation is recovered.
12. You write an after-action report explaining what failed and why.

Open:

```text
OBJECTIVES.md
```

then continue to:

```text
WALKTHROUGH.md
```
