# ACADEMY 10 — KUBERNETES / K3S

## Core Model

```text
Cluster
└── Node
    └── Pod
        └── Container
```

Higher-level controllers:

```text
Deployment
StatefulSet
DaemonSet
```

Networking:

```text
Service
Ingress
NetworkPolicy
```

Configuration/storage:

```text
ConfigMap
Secret
PVC
PV
```

## K3s

Install:

```bash
curl -sfL https://get.k3s.io \
  | sh -s - server --secrets-encryption
```

Status:

```bash
sudo systemctl status k3s
```

Node:

```bash
kubectl get nodes
```

All Pods:

```bash
kubectl get pods -A
```

## Namespaces

```bash
kubectl create namespace luna
kubectl get namespaces
```

## Apply

```bash
kubectl apply -f file.yaml
kubectl apply -f k8s/
```

## Inspect

```bash
kubectl get pods -n luna
kubectl get svc -n luna
kubectl get endpoints -n luna
kubectl get ingress -n luna
kubectl get pvc -n luna
```

## Troubleshoot

```bash
kubectl describe pod POD -n luna
kubectl logs POD -n luna
kubectl logs POD -n luna --previous
kubectl get events -n luna --sort-by=.lastTimestamp
```

## Execute

```bash
kubectl exec -it POD -n luna -- sh
```

## Scaling

```bash
kubectl scale deployment NAME \
  --replicas=3 \
  -n luna
```

## Rollout

```bash
kubectl rollout status deployment/NAME -n luna
kubectl rollout history deployment/NAME -n luna
kubectl rollout undo deployment/NAME -n luna
```

## ConfigMap

Non-secret configuration.

## Secret

Confidential configuration.

Base64 is not encryption.

Project LUNA enables K3s Secret encryption at rest.

## Service

Stable network identity for Pods selected by labels.

## Ingress

HTTP/HTTPS routing to Services.

Project LUNA uses K3s Traefik.

## Persistent Storage

```text
Pod
↓
PVC
↓
PV
↓
local-path storage
```

## Image Import

Docker and K3s containerd are separate stores.

```bash
docker save IMAGE -o image.tar

sudo k3s ctr \
  -n k8s.io \
  images import \
  image.tar
```

## Troubleshooting Path

```text
Node
↓
Ingress
↓
Service
↓
Endpoints
↓
Pod readiness
↓
Pod logs
↓
configuration
↓
dependency Services
↓
PVC
↓
events
```
