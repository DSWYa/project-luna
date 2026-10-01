# LAB 04 — KUBERNETES TROUBLESHOOTING

Create a disposable Deployment and intentionally cause each condition one at a time.

## Failure 1 — Bad Image

Use a nonexistent image tag.

Observe:

```text
ImagePullBackOff
```

Use:

```text
describe
events
```

Repair it.

## Failure 2 — Failing Liveness Probe

Configure the wrong probe path.

Observe restarts.

Use:

```text
describe
logs
```

Repair it.

## Failure 3 — Service Selector Mismatch

Break a Service selector.

Observe Endpoints.

Repair it.

## Failure 4 — Missing ConfigMap

Reference a nonexistent ConfigMap.

Observe Pod creation/startup behavior.

Repair it.

The goal is to stop treating:

```text
Pod not working
```

as a single category of failure.
