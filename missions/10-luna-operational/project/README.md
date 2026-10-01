# 🛠️ MISSION 10 FINAL PROJECT

# LUNA KUBERNETES MIGRATION

This is the least-guided project in the bootcamp.

You know every application component already.

Your job is to express the complete platform as Kubernetes desired state.

---

# REQUIRED REPOSITORY STRUCTURE

Inside `luna-operations`, create:

```text
k8s/
├── 00-namespace.yaml
├── 10-configmap.yaml
├── 20-postgres.yaml
├── 30-api.yaml
├── 40-ollama.yaml
├── 50-prometheus.yaml
├── 51-node-exporter.yaml
├── 52-grafana.yaml
├── 60-ingress.yaml
├── 70-network-policy.yaml
├── secrets.env.example
└── README.md
```

You may split resources into more files.

Do not combine everything merely to match this example.

---

# REQUIREMENT 1 — NAMESPACE

All Project LUNA application workloads must run in:

```text
luna
```

System K3s components remain in their normal namespaces.

---

# REQUIREMENT 2 — CONFIGMAP

Store non-secret configuration separately.

Include at least:

```text
LUNA_DB_NAME
LUNA_DB_USER
LUNA_DB_HOST
OLLAMA_URL
OLLAMA_MODEL
```

Expected Kubernetes hostnames include:

```text
postgres
ollama
```

---

# REQUIREMENT 3 — SECRET WORKFLOW

Real secret values must not exist in Git.

Create:

```text
k8s/secrets.env
```

locally and ignore it.

Create/update:

```text
luna-secrets
```

from that file.

Commit only:

```text
secrets.env.example
```

---

# REQUIREMENT 4 — POSTGRESQL

Use:

```text
StatefulSet
Service
PersistentVolumeClaim
```

Requirements:

```text
postgres:18
1 replica
ClusterIP Service
persistent storage
readiness check
resource requests/limits
Secret password
```

Persistent PostgreSQL path:

```text
/var/lib/postgresql
```

---

# REQUIREMENT 5 — DATA MIGRATION

Restore the pre-Kubernetes PostgreSQL backup.

Verify:

```text
modules
equipment
maintenance tickets
telemetry
```

still contain expected data.

Prove the database survives deletion/recreation of the PostgreSQL Pod.

---

# REQUIREMENT 6 — API

Use:

```text
Deployment
Service
```

Requirements:

```text
2 replicas
ClusterIP
readiness probe
liveness probe
resource requests
resource limits
ConfigMap configuration
Secret configuration
luna-api:10.0 image
imagePullPolicy: IfNotPresent
```

---

# REQUIREMENT 7 — IMAGE DISTRIBUTION

Build:

```text
luna-api:10.0
```

Import it into the K3s containerd `k8s.io` image namespace.

Document the process.

Do not depend on a paid registry.

---

# REQUIREMENT 8 — OLLAMA

Use:

```text
Deployment
Service
PVC
```

Requirements:

```text
internal ClusterIP only
persistent model storage
qwen3:0.6b installed
not exposed through Ingress
```

The API must reach:

```text
http://ollama:11434
```

---

# REQUIREMENT 9 — MONITORING

Migrate:

```text
Prometheus
Grafana
Node Exporter
```

Requirements:

```text
Prometheus persistent storage
Grafana persistent storage
Node Exporter DaemonSet
Prometheus ConfigMap
private ClusterIP Services
```

Do not expose monitoring through the public Ingress.

---

# REQUIREMENT 10 — INGRESS

Use K3s Traefik.

Route:

```text
/
```

to:

```text
luna-api
```

Earth Mission Control must reach:

```text
http://YOUR-LUNA-IP/
```

---

# REQUIREMENT 11 — NETWORK POLICY

Create a NetworkPolicy protecting PostgreSQL ingress.

At minimum:

```text
API Pods
→
PostgreSQL TCP 5432
```

should be allowed.

Unrelated Pods should not receive unrestricted PostgreSQL ingress.

---

# REQUIREMENT 12 — HEALTH

Kubernetes must know whether the API is:

```text
alive
ready
```

Use distinct liveness/readiness concepts.

PostgreSQL must have a readiness mechanism.

---

# REQUIREMENT 13 — RESOURCE MANAGEMENT

At least these workloads must define resource requests and limits:

```text
API
PostgreSQL
Prometheus
Grafana
```

Choose values appropriate for your VM.

Document them.

---

# REQUIREMENT 14 — PRIVATE ADMIN ACCESS

Use Kubernetes port forwarding plus SSH where appropriate for:

```text
Grafana
Prometheus
```

Do not create public Ingress routes merely for convenience.

---

# REQUIREMENT 15 — AI

Verify:

```text
/api/ai/health
```

and at least one ticket analysis after migration.

The AI remains read-only.

---

# REQUIREMENT 16 — AUTOMATION

Create a maintenance ticket.

Verify the Mission 08 Earth relay still receives the event.

Verify a CRITICAL event still produces its expected automation behavior.

---

# REQUIREMENT 17 — MONITORING

Verify:

```text
Prometheus targets healthy
Grafana dashboard available
LUNA host metrics visible
```

---

# REQUIREMENT 18 — SCALING

Scale:

```text
luna-api
```

from 2 replicas to 3.

Verify all become Ready.

Scale back to 2.

Document the commands.

---

# REQUIREMENT 19 — SELF-HEALING

Delete one API Pod.

Verify the Deployment replaces it automatically.

Capture evidence.

---

# REQUIREMENT 20 — ROLLOUT AND ROLLBACK

Perform one safe rollout.

Verify:

```text
rollout status
rollout history
```

Then demonstrate:

```text
rollout undo
```

on a controlled change.

---

# REQUIREMENT 21 — PERSISTENCE TEST

Delete/recreate a stateful Pod or restart the cluster.

Verify:

```text
PostgreSQL data
Ollama model
Grafana state
```

remain available through their persistent storage.

---

# REQUIREMENT 22 — REBOOT TEST

Reboot LUNA-1.

After reboot:

```text
K3s Ready
Pods recover
Ingress works
data exists
monitoring works
AI works
```

---

# REQUIREMENT 23 — KUBERNETES DEPLOY SCRIPT

Create:

```text
scripts/deploy-k8s.sh
```

It should perform a safe workflow such as:

```text
pull current Git state
create/update Secret from ignored env file
server-side dry run
diff
apply manifests
wait for rollouts
health check
```

Do not place secret values inside the script.

---

# REQUIREMENT 24 — DOCUMENTATION

Your repository README should explain:

```text
architecture
K3s installation
manifests
namespace
Services
Ingress
ConfigMaps
Secrets
storage
image import
monitoring access
AI
automation
deployment
backup/restore
rollback
troubleshooting
```

---

# REQUIREMENT 25 — FINAL ARCHITECTURE DIAGRAM

Create an ASCII diagram showing:

```text
Earth
Ingress
API
PostgreSQL
Ollama
Prometheus
Grafana
Node Exporter
persistent storage
external Apps Script automation
```

---

# REQUIREMENT 26 — VERSION CONTROL

Use:

```text
feature/kubernetes-migration
```

Make meaningful commits.

CI must pass.

Merge to:

```text
main
```

Deploy the merged version.

---

# REQUIREMENT 27 — FINAL VALIDATION

Run:

```text
tests/mission-10/check.sh
```

on LUNA-1.

Do not start the emergency simulation until normal validation passes.

---

# FINAL PROJECT CHECKLIST

```text
[ ] K3s installed
[ ] node Ready
[ ] secret encryption enabled
[ ] luna namespace exists
[ ] ConfigMap exists
[ ] Secret exists
[ ] PostgreSQL StatefulSet Ready
[ ] PostgreSQL PVC Bound
[ ] historical DB restored
[ ] API Deployment has 2 Ready replicas
[ ] API Service has Endpoints
[ ] Ollama Ready
[ ] required model installed
[ ] Prometheus Ready
[ ] Grafana Ready
[ ] Node Exporter Ready
[ ] Ingress works
[ ] NetworkPolicy exists
[ ] API scaling demonstrated
[ ] self-healing demonstrated
[ ] rollout/rollback demonstrated
[ ] persistence demonstrated
[ ] reboot test completed
[ ] AI works
[ ] Earth automation works
[ ] monitoring works
[ ] CI passes
[ ] documentation complete
```

When every item is complete:

```text
DO NOT CELEBRATE YET.
```

Mission Control has one final test.

Open:

```text
capstone/emergency-simulation/BRIEFING.md
```
