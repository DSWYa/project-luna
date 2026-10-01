# MISSION 10 — ANSWERS

1. A set of Kubernetes control-plane/node resources that run and manage workloads.
2. A machine that participates in the cluster and runs workloads.
3. Kubernetes's smallest deployable workload unit, containing one or more containers.
4. A Deployment manages desired replicas, replacement, and rollouts.
5. The controller resource that maintains a set of identical Pods for a Deployment.
6. Stateful workloads needing stable identity/storage relationships.
7. Running one Pod per matching node, such as Node Exporter.
8. A stable network endpoint for changing backend Pods.
9. Label selectors.
10. Selector mismatch or no Ready matching Pods.
11. Name resolution for Kubernetes Services/Pods.
12. HTTP/HTTPS routing from outside the cluster to Services.
13. K3s's bundled Traefik controller.
14. A logical resource grouping boundary.
15. Non-secret configuration data.
16. Configuration intended for confidential values.
17. Base64 is reversible encoding, not cryptographic protection.
18. K3s was installed with `--secrets-encryption`.
19. A workload's request for persistent storage.
20. The persistent storage resource satisfying a claim.
21. `local-path`
22. The data is tied to storage on a particular node.
23. Readiness controls traffic eligibility; liveness can trigger container restart.
24. Resources Kubernetes schedules/plans for a workload.
25. An upper resource boundary.
26. Resource state, configuration, conditions, and events.
27. Recent cluster/resource events such as scheduling and probe failures.
28. Logs from a previous crashed/restarted container instance.
29. Watches a Deployment rollout until success/failure.
30. Restores a previous Deployment revision.
31. Changes desired replica count.
32. Rules controlling network traffic to/from selected Pods.
33. PostgreSQL is a separate Pod reached through its Service DNS name.
34. Traefik now provides the ingress/reverse-proxy role.
35. Docker and K3s containerd are separate image stores.
36. Kubelet-visible images are managed in containerd's Kubernetes namespace.
37. It contains real credentials.
38. PVCs are availability/persistence mechanisms, not a substitute for independent backups.
39. Ingress, Service, Endpoints, then Pod readiness.
40. Real incidents often contain independent symptoms; the learner must isolate layers rather than apply one generic fix.
