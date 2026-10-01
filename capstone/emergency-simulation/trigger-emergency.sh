#!/bin/bash

set -e

NS="luna"

echo "=============================================="
echo "       PROJECT LUNA — ECLIPSE PROTOCOL"
echo "=============================================="
echo
echo "Checking final platform..."

kubectl get namespace "$NS" >/dev/null

kubectl get svc luna-api \
  -n "$NS" >/dev/null

kubectl get deployment ollama \
  -n "$NS" >/dev/null

kubectl get configmap prometheus-config \
  -n "$NS" >/dev/null

DB_POD="$(
  kubectl get pods \
    -n "$NS" \
    -l app=postgres \
    -o jsonpath='{.items[0].metadata.name}'
)"

if [ -z "$DB_POD" ]; then
    echo "ERROR: PostgreSQL Pod not found."
    exit 1
fi

echo "Injecting operational anomalies..."

# Failure 1:
# Service selector no longer matches API Pods.
kubectl patch svc luna-api \
  -n "$NS" \
  -p '{"spec":{"selector":{"app":"luna-api-eclipse"}}}' \
  >/dev/null

# Failure 2:
# AI workload intentionally removed from desired state.
kubectl scale deployment ollama \
  --replicas=0 \
  -n "$NS" \
  >/dev/null

# Failure 3:
# Monitoring target uses the wrong Node Exporter port.
kubectl get configmap prometheus-config \
  -n "$NS" \
  -o jsonpath='{.data.prometheus\.yml}' \
  | sed 's/node-exporter:9100/node-exporter:9200/g' \
  > /tmp/luna-prometheus-eclipse.yml

kubectl create configmap prometheus-config \
  -n "$NS" \
  --from-file=prometheus.yml=/tmp/luna-prometheus-eclipse.yml \
  --dry-run=client \
  -o yaml \
  | kubectl apply -f - \
  >/dev/null

kubectl rollout restart deployment/prometheus \
  -n "$NS" \
  >/dev/null

rm -f /tmp/luna-prometheus-eclipse.yml

# Failure 4:
# A known equipment relationship is lost.
kubectl exec \
  -n "$NS" \
  "$DB_POD" \
  -- \
  sh -c '
    psql \
      -U "$POSTGRES_USER" \
      -d "$POSTGRES_DB" \
      -c "
        UPDATE equipment
        SET module_id = NULL
        WHERE equipment_name = '\''Primary Oxygen Scrubber'\'';
      "
  ' \
  >/dev/null

echo
echo "ECLIPSE PROTOCOL ACTIVE."
echo
echo "Mission Control reports multiple anomalies."
echo
echo "Begin incident response."
