# ECLIPSE PROTOCOL — HINT 1

Do not treat:

```text
Mission Control unavailable
```

as proof that the API Pods are dead.

Start with:

```bash
kubectl get ingress -n luna
kubectl get svc -n luna
kubectl get endpoints -n luna
kubectl get pods -n luna
```

Ask:

```text
Does the Service actually point at Ready API Pods?
```
