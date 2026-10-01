# LAB 03 — CONFIGURATION & ROLLOUTS

Requirements:

1. Create a ConfigMap.
2. Create a fake training Secret.
3. Consume both as environment variables.
4. Add readiness probe.
5. Add liveness probe.
6. Add CPU/memory requests.
7. Add CPU/memory limits.
8. Trigger a Deployment rollout.
9. Watch rollout status.
10. Inspect rollout history.
11. Roll back.
12. Verify the old revision becomes healthy.

Explain why:

```text
Secret base64
```

is not the same as encryption.

Confirm:

```bash
sudo k3s secrets-encrypt status
```

shows cluster Secret encryption enabled.
