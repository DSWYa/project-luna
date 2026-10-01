#!/bin/bash

set -u

echo "=============================================="
echo " PROJECT LUNA - MISSION 10 VALIDATION"
echo "=============================================="
echo

NS="luna"
PASS=0
FAIL=0

pass() {
    echo "[PASS] $1"
    PASS=$((PASS + 1))
}

fail() {
    echo "[FAIL] $1"
    FAIL=$((FAIL + 1))
}

if kubectl get node >/dev/null 2>&1; then
    pass "Kubernetes API reachable"
else
    fail "Kubernetes API reachable"
fi

READY_NODES="$(kubectl get nodes --no-headers 2>/dev/null | awk '$2 ~ /Ready/ {count++} END {print count+0}')"

[ "$READY_NODES" -ge 1 ] \
    && pass "At least one Ready node" \
    || fail "At least one Ready node"

kubectl get namespace "$NS" >/dev/null 2>&1 \
    && pass "luna namespace exists" \
    || fail "luna namespace exists"

sudo k3s secrets-encrypt status 2>/dev/null \
    | grep -q 'Encryption Status: Enabled' \
    && pass "K3s Secret encryption enabled" \
    || fail "K3s Secret encryption enabled"

kubectl get configmap luna-config -n "$NS" >/dev/null 2>&1 \
    && pass "LUNA ConfigMap exists" \
    || fail "LUNA ConfigMap exists"

kubectl get secret luna-secrets -n "$NS" >/dev/null 2>&1 \
    && pass "LUNA Secret exists" \
    || fail "LUNA Secret exists"

kubectl get statefulset postgres -n "$NS" >/dev/null 2>&1 \
    && pass "PostgreSQL StatefulSet exists" \
    || fail "PostgreSQL StatefulSet exists"

kubectl get svc postgres -n "$NS" >/dev/null 2>&1 \
    && pass "PostgreSQL Service exists" \
    || fail "PostgreSQL Service exists"

PVC_COUNT="$(kubectl get pvc -n "$NS" --no-headers 2>/dev/null | grep -c 'Bound' || true)"

[ "$PVC_COUNT" -ge 1 ] \
    && pass "At least one PVC is Bound" \
    || fail "At least one PVC is Bound"

API_READY="$(kubectl get deployment luna-api -n "$NS" -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo 0)"
API_READY="${API_READY:-0}"

[ "$API_READY" -ge 2 ] \
    && pass "At least two API replicas Ready" \
    || fail "At least two API replicas Ready"

kubectl get svc luna-api -n "$NS" >/dev/null 2>&1 \
    && pass "API Service exists" \
    || fail "API Service exists"

API_ENDPOINTS="$(kubectl get endpoints luna-api -n "$NS" -o jsonpath='{.subsets[*].addresses[*].ip}' 2>/dev/null || true)"

[ -n "$API_ENDPOINTS" ] \
    && pass "API Service has Endpoints" \
    || fail "API Service has Endpoints"

kubectl get deployment ollama -n "$NS" >/dev/null 2>&1 \
    && pass "Ollama Deployment exists" \
    || fail "Ollama Deployment exists"

kubectl get deployment prometheus -n "$NS" >/dev/null 2>&1 \
    && pass "Prometheus Deployment exists" \
    || fail "Prometheus Deployment exists"

kubectl get deployment grafana -n "$NS" >/dev/null 2>&1 \
    && pass "Grafana Deployment exists" \
    || fail "Grafana Deployment exists"

kubectl get daemonset node-exporter -n "$NS" >/dev/null 2>&1 \
    && pass "Node Exporter DaemonSet exists" \
    || fail "Node Exporter DaemonSet exists"

kubectl get ingress luna -n "$NS" >/dev/null 2>&1 \
    && pass "LUNA Ingress exists" \
    || fail "LUNA Ingress exists"

kubectl get networkpolicy -n "$NS" >/dev/null 2>&1 \
    && pass "At least one NetworkPolicy exists" \
    || fail "At least one NetworkPolicy exists"

curl -fsS http://127.0.0.1/health >/dev/null 2>&1 \
    && pass "Public application health works" \
    || fail "Public application health works"

curl -fsS http://127.0.0.1/api/modules >/dev/null 2>&1 \
    && pass "Database-backed API works" \
    || fail "Database-backed API works"

curl -fsS http://127.0.0.1/api/ai/health >/dev/null 2>&1 \
    && pass "AI health endpoint works" \
    || fail "AI health endpoint works"

echo
echo "Passed: $PASS"
echo "Failed: $FAIL"
echo

if [ "$FAIL" -eq 0 ]; then
    echo "MISSION 10 PLATFORM VALIDATION: PASS"
    echo
    echo "Project LUNA is ready for the final emergency simulation."
    exit 0
fi

echo "MISSION 10 PLATFORM NOT YET VALIDATED"
exit 1
