# 🌕 PROJECT LUNA CAPSTONE

# LUNA-1 OPERATIONS PLATFORM

Project LUNA is the cumulative artifact from all ten missions.

The capstone is not a separate application.

It is the complete system you built throughout the bootcamp.

---

# Capstone Architecture

```text
                         🌎 EARTH
                             │
              ┌──────────────┼──────────────┐
              │              │              │
           GitHub       Browser / SSH   Apps Script
              │              │              ▲
              │ CI           │ HTTP         │ webhook
              ▼              ▼              │
                    🌑 LUNA-1 K3s
                             │
                       Traefik Ingress
                             │
                             ▼
                         FastAPI
                    ┌────────┼────────┐
                    │        │        │
                    ▼        ▼        ▼
               PostgreSQL  Ollama  Earth Relay
                    │        │
                    ▼        ▼
               Persistent  Persistent
                 Storage     Models

              Monitoring Plane
                    │
          ┌─────────┼──────────┐
          ▼         ▼          ▼
      Prometheus  Grafana  Node Exporter
```

---

# Skills Demonstrated

```text
Linux administration
networking
SSH
Git / GitHub
Bash
Python
structured data
SQL
PostgreSQL
REST APIs
FastAPI
HTML/CSS/JavaScript
Docker
Docker Compose
security hardening
logging
Prometheus
Grafana
GitHub Actions
webhooks
Google Apps Script
local LLM integration
Kubernetes
K3s
persistent storage
Ingress
NetworkPolicy
incident response
```

See:

```text
REQUIREMENTS.md
```

for final evidence requirements.

Then complete:

```text
emergency-simulation/BRIEFING.md
```
