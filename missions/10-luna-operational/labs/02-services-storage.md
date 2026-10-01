# LAB 02 — SERVICES & STORAGE

Use a disposable namespace.

Requirements:

1. Create an Nginx Deployment.
2. Create a ClusterIP Service.
3. Inspect Service Endpoints.
4. Reach it using Service DNS from another Pod.
5. Break the Service selector intentionally.
6. Observe empty/wrong Endpoints.
7. Repair it.
8. Create a local-path PVC.
9. Mount the PVC into a Pod.
10. Write a file.
11. Delete the Pod.
12. Recreate a Pod using the same PVC.
13. Prove the file remains.

Explain:

```text
Service
selector
Endpoint
PVC
PV
StorageClass
```
