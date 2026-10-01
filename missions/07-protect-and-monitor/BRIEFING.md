# 🛡️ MISSION 07 — PROTECT & MONITOR LUNA-1

**MISSION ID:** LUNA-M07  
**PRIORITY:** CRITICAL  
**ROLE:** Junior Systems Engineer  
**OBJECTIVE:** Harden, monitor, test, and safely operate the containerized station

---

## Mission Briefing

LUNA-1 is now containerized.

The station application can be rebuilt from Docker configuration instead of relying on manually prepared host services.

That solves reproducibility.

It does not solve operations.

Mission Control now needs answers to questions such as:

- Who can SSH into LUNA-1?
- Are passwords and secrets protected?
- Which ports are actually exposed?
- How much CPU, memory, and disk is the station using?
- Is monitoring itself working?
- Did a code change break the application before deployment?
- Where should engineers look when something fails?

Mission 07 introduces **defense and observability**.

---

# Final Architecture

```text
🌎 EARTH MISSION CONTROL
│
├── SSH key authentication
├── Git / GitHub
├── GitHub Actions CI
└── SSH tunnels to private monitoring
        │
        ▼
🌑 LUNA-1
│
├── hardened SSH
├── minimal host exposure
├── Docker
│   ├── nginx        public :80
│   ├── api          internal
│   ├── db           internal
│   ├── prometheus   host loopback only
│   ├── grafana      host loopback only
│   └── node-exporter internal
│
└── logs + health checks
```

---

# What You Will Learn

- SSH key authentication
- cautious SSH hardening
- UFW basics
- Docker firewall caveats
- port-exposure auditing
- secret hygiene
- file permissions
- Docker logs
- journald
- Prometheus
- Node Exporter
- Grafana
- PromQL basics
- alert rules
- SSH port forwarding
- GitHub Actions CI
- automated validation
- deployment scripts
- layered security/monitoring troubleshooting

Open `OBJECTIVES.md`, then continue to `WALKTHROUGH.md`.
