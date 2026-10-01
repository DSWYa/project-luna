# KUBERNETES / K3S CHEAT SHEET

Cluster:

```bash
kubectl get nodes
kubectl get pods -A
kubectl get svc -A
```

Namespace:

```bash
kubectl get all -n luna
```

Pods:

```bash
kubectl get pods -n luna
kubectl describe pod POD -n luna
kubectl logs POD -n luna
kubectl logs POD -n luna --previous
kubectl exec -it POD -n luna -- sh
```

Services:

```bash
kubectl get svc -n luna
kubectl get endpoints -n luna
```

Ingress:

```bash
kubectl get ingress -n luna
kubectl describe ingress NAME -n luna
```

Storage:

```bash
kubectl get pvc -n luna
kubectl get pv
kubectl get storageclass
```

Events:

```bash
kubectl get events \
  -n luna \
  --sort-by=.lastTimestamp
```

Usage:

```bash
kubectl top nodes
kubectl top pods -n luna
```

Apply:

```bash
kubectl apply --dry-run=server -f k8s/
kubectl diff -f k8s/
kubectl apply -f k8s/
```

Scale:

```bash
kubectl scale deployment luna-api \
  --replicas=3 \
  -n luna
```

Rollout:

```bash
kubectl rollout status deployment/luna-api -n luna
kubectl rollout history deployment/luna-api -n luna
kubectl rollout undo deployment/luna-api -n luna
```

Port-forward:

```bash
kubectl port-forward svc/grafana 3000:3000 -n luna
```

Secret encryption:

```bash
sudo k3s secrets-encrypt status
```

K3s logs:

```bash
sudo journalctl -u k3s -n 100
```

Image store:

```bash
sudo k3s ctr -n k8s.io images list
```
