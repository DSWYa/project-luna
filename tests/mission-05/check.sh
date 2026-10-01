#!/bin/bash

set -u

echo "=============================================="
echo " PROJECT LUNA - MISSION 05 SERVER VALIDATION"
echo "=============================================="
echo

PASS=0
FAIL=0

check() {
    local label="$1"
    local command="$2"

    if eval "$command" >/dev/null 2>&1; then
        echo "[PASS] $label"
        PASS=$((PASS + 1))
    else
        echo "[FAIL] $label"
        FAIL=$((FAIL + 1))
    fi
}

check "PostgreSQL active" "systemctl is-active --quiet postgresql"
check "Nginx active" "systemctl is-active --quiet nginx"
check "LUNA API active" "systemctl is-active --quiet luna-api"
check "FastAPI direct health" "curl -fsS http://127.0.0.1:8000/health"
check "Nginx proxied health" "curl -fsS http://127.0.0.1/health"
check "Modules API" "curl -fsS http://127.0.0.1/api/modules"
check "Equipment API" "curl -fsS http://127.0.0.1/api/equipment"
check "Tickets API" "curl -fsS http://127.0.0.1/api/tickets"
check "Telemetry summary API" "curl -fsS http://127.0.0.1/api/telemetry/summary"

echo
echo "Passed: $PASS"
echo "Failed: $FAIL"
echo

if [ "$FAIL" -eq 0 ]; then
    echo "MISSION 05 SERVER VALIDATION: PASS"
    exit 0
fi

echo "MISSION 05 NOT YET VALIDATED"
exit 1
