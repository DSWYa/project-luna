#!/bin/bash

set -u

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

echo "=============================================="
echo "     ECLIPSE PROTOCOL RECOVERY VALIDATION"
echo "=============================================="
echo

kubectl get nodes >/dev/null 2>&1 \
    && pass "Kubernetes API reachable" \
    || fail "Kubernetes API reachable"

API_ENDPOINTS="$(
  kubectl get endpoints luna-api \
    -n "$NS" \
    -o jsonpath='{.subsets[*].addresses[*].ip}' \
    2>/dev/null \
  || true
)"

[ -n "$API_ENDPOINTS" ] \
    && pass "API Service has endpoints" \
    || fail "API Service has endpoints"

curl -fsS http://127.0.0.1/health >/dev/null 2>&1 \
    && pass "Mission Control health reachable" \
    || fail "Mission Control health reachable"

curl -fsS http://127.0.0.1/api/modules >/dev/null 2>&1 \
    && pass "Database-backed API reachable" \
    || fail "Database-backed API reachable"

OLLAMA_READY="$(
  kubectl get deployment ollama \
    -n "$NS" \
    -o jsonpath='{.status.readyReplicas}' \
    2>/dev/null \
  || echo 0
)"

OLLAMA_READY="${OLLAMA_READY:-0}"

[ "$OLLAMA_READY" -ge 1 ] \
    && pass "Ollama has a Ready replica" \
    || fail "Ollama has a Ready replica"

curl -fsS http://127.0.0.1/api/ai/health >/dev/null 2>&1 \
    && pass "AI endpoint healthy" \
    || fail "AI endpoint healthy"

PROM_CONFIG="$(
  kubectl get configmap prometheus-config \
    -n "$NS" \
    -o jsonpath='{.data.prometheus\.yml}' \
    2>/dev/null \
  || true
)"

echo "$PROM_CONFIG" \
  | grep -q 'node-exporter:9100' \
  && pass "Prometheus targets Node Exporter port 9100" \
  || fail "Prometheus targets Node Exporter port 9100"

DB_POD="$(
  kubectl get pods \
    -n "$NS" \
    -l app=postgres \
    -o jsonpath='{.items[0].metadata.name}' \
    2>/dev/null \
  || true
)"

if [ -n "$DB_POD" ]; then
    ASSIGNMENT="$(
      kubectl exec \
        -n "$NS" \
        "$DB_POD" \
        -- \
        sh -c '
          psql \
            -U "$POSTGRES_USER" \
            -d "$POSTGRES_DB" \
            -tAc "
              SELECT m.module_name
              FROM equipment AS e
              LEFT JOIN modules AS m
                ON e.module_id = m.module_id
              WHERE e.equipment_name =
                '\''Primary Oxygen Scrubber'\'';
            "
        ' \
        2>/dev/null \
      | tr -d '[:space:]'
    )"

    [ "$ASSIGNMENT" = "HAB-1" ] \
        && pass "Primary Oxygen Scrubber assigned to HAB-1" \
        || fail "Primary Oxygen Scrubber assigned to HAB-1"
else
    fail "PostgreSQL Pod available for data check"
fi

echo
echo "Passed: $PASS"
echo "Failed: $FAIL"
echo

if [ "$FAIL" -eq 0 ]; then
    echo "=============================================="
    echo "       ECLIPSE PROTOCOL — RECOVERED"
    echo "=============================================="
    echo
    echo "Complete the after-action report."
    exit 0
fi

echo "RECOVERY INCOMPLETE"
exit 1
