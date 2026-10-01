# 🧠 MISSION 10 KNOWLEDGE CHECK

1. What is a Kubernetes cluster?
2. What is a node?
3. What is a Pod?
4. Why normally use a Deployment instead of directly managing Pods?
5. What is a ReplicaSet?
6. What is a StatefulSet useful for?
7. What is a DaemonSet useful for?
8. What does a Service provide?
9. How does a Service choose backend Pods?
10. What does an empty Service Endpoint list often suggest?
11. What is cluster DNS?
12. What is an Ingress?
13. What component fulfills Project LUNA's Ingress?
14. What is a namespace?
15. What is a ConfigMap?
16. What is a Secret?
17. Why isn't base64 encryption?
18. How is K3s configured to protect Secrets at rest in this mission?
19. What is a PVC?
20. What is a PV?
21. What K3s StorageClass is used?
22. Why isn't local-path storage high availability?
23. Difference between readiness and liveness?
24. What is a resource request?
25. What is a resource limit?
26. What does `kubectl describe` help investigate?
27. What does `kubectl get events` show?
28. What does `kubectl logs --previous` help with?
29. What does `kubectl rollout status` do?
30. What does `kubectl rollout undo` do?
31. What does `kubectl scale` do?
32. What is NetworkPolicy?
33. Why doesn't the API use `127.0.0.1` for PostgreSQL?
34. Why doesn't the final stack need the old Nginx reverse-proxy container?
35. Why must the local API image be imported into K3s/containerd?
36. Why is the containerd namespace `k8s.io` important?
37. Why shouldn't `k8s/secrets.env` be committed?
38. Why do backups still matter when PVCs exist?
39. What should you inspect first when an Ingress returns 503?
40. Why is the final emergency intentionally multi-layered?
