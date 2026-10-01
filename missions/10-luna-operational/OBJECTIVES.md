# MISSION 10 — LEARNING OBJECTIVES

By the end of Mission 10, you should be able to demonstrate:

## Kubernetes Architecture

- Explain cluster.
- Explain node.
- Explain control plane.
- Explain Pod.
- Explain Deployment.
- Explain ReplicaSet at a basic level.
- Explain StatefulSet.
- Explain DaemonSet.
- Explain Service.
- Explain Ingress.
- Explain namespace.

## Configuration

- Read Kubernetes YAML.
- Apply manifests declaratively.
- Use ConfigMaps.
- Use Secrets.
- Explain why base64 is not encryption.
- Keep real secrets outside Git.
- Verify K3s secrets encryption at rest.

## Storage

- Explain PV vs PVC.
- Use K3s local-path storage.
- Persist PostgreSQL data.
- Persist Ollama model data.
- Persist Prometheus/Grafana data.
- Explain why local-path storage is node-local.

## Networking

- Use ClusterIP Services.
- Use service DNS.
- Use Traefik Ingress.
- Inspect Endpoints.
- Use NetworkPolicy.
- Explain Pod-to-Service communication.

## Reliability

- Scale Deployments.
- Observe self-healing.
- Use readiness probes.
- Use liveness probes.
- Use resource requests/limits.
- Inspect rollouts.
- Roll back a Deployment.

## Operations

- `kubectl get`
- `kubectl describe`
- `kubectl logs`
- `kubectl exec`
- `kubectl top`
- `kubectl get events`
- `kubectl port-forward`
- `kubectl rollout`
- `kubectl scale`
- `kubectl apply`
- `kubectl diff`

## Migration

- Back up Docker Compose data.
- Stop the Compose stack safely.
- Install K3s.
- Import a locally built image into K3s containerd.
- Deploy LUNA services through manifests.
- Restore PostgreSQL data.
- Verify every previous mission capability.

## Incident Response

- Troubleshoot Ingress.
- Troubleshoot Services/selectors.
- Troubleshoot Pods.
- Troubleshoot monitoring.
- Troubleshoot AI availability.
- Troubleshoot relational data.
- Recover several simultaneous failures.
