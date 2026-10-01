# 🚨 FINAL EMERGENCY — ECLIPSE PROTOCOL

**INCIDENT ID:** LUNA-FINAL  
**PRIORITY:** CRITICAL  
**STATUS:** MULTIPLE ANOMALIES DETECTED

---

# Situation

LUNA-1 survived the Kubernetes migration.

Mission Control now initiates the final operational-readiness test.

This simulation introduces multiple independent failures.

You are not told:

- how many failures exist,
- which layer each failure affects,
- or what order to repair them.

---

# Preconditions

Do **not** run this simulation until:

```bash
~/project-luna/tests/mission-10/check.sh
```

passes.

You also need the completed Project LUNA stack in:

```text
namespace luna
```

---

# Create a Snapshot

Before the simulation, create:

```text
M10 - BEFORE ECLIPSE PROTOCOL
```

---

# Start the Simulation

On LUNA-1:

```bash
cd ~/project-luna/capstone/emergency-simulation
chmod +x trigger-emergency.sh
./trigger-emergency.sh
```

Do not inspect:

```text
trigger-emergency.sh
```

until the simulation is complete.

---

# Mission Control Report

Immediately after the event:

```text
LUNA-1 NODE ............ ONLINE

MISSION CONTROL ........ UNAVAILABLE

KUBERNETES API ......... ONLINE

AI ANALYST ............. UNAVAILABLE

MONITORING ............. DEGRADED

ASSET DATABASE ......... DATA ANOMALY DETECTED
```

No further technical explanation is provided.

---

# Rules

You may use:

```text
course material
your own notes
man pages
official documentation
normal troubleshooting tools
```

Do not inspect the trigger script.

Do not restore the VM snapshot unless the cluster becomes genuinely unrecoverable.

Do not solve the incident by deleting the entire cluster and starting over.

Use the smallest evidence-supported repairs.

---

# Objectives

Restore:

```text
Mission Control web access
API health
database-backed endpoints
AI analysis
Prometheus host monitoring
equipment relationship integrity
```

Then run:

```bash
./validate-recovery.sh
```

When validation passes, complete:

```text
AFTER-ACTION-REPORT-TEMPLATE.md
```

Only after the report is complete should you inspect the trigger script.

---

# Suggested Investigation Mindset

Do not assume all symptoms share one root cause.

Use layers:

```text
Node
↓
Ingress
↓
Service
↓
Endpoints
↓
Pods
↓
application
↓
dependency Services
↓
monitoring
↓
data integrity
```

Good luck, Systems Engineer.
