#!/bin/bash

set -u

echo "=============================================="
echo " PROJECT LUNA - MISSION 06 SERVER VALIDATION"
echo "=============================================="
echo

REPO="${1:-$HOME/luna-operations}"

if [ ! -f "$REPO/compose.yaml" ]; then
    echo "[FAIL] compose.yaml not found at $REPO"
    exit 1
fi

cd "$REPO"

PASS=0
FAIL=0

check() {
    local label="$1"
    shift

    if "$@" >/dev/null 2>&1; then
        echo "[PASS] $label"
        PASS=$((PASS + 1))
    else
        echo "[FAIL] $label"
        FAIL=$((FAIL + 1))
    fi
}

check "Docker daemon accessible" docker info
check "Compose config valid" docker compose config
check "Compose stack has running services" docker compose ps
check "Nginx endpoint reachable" curl -fsS http://127.0.0.1/health
check "Modules API reachable" curl -fsS http://127.0.0.1/api/modules
check "Equipment API reachable" curl -fsS http://127.0.0.1/api/equipment
check "Tickets API reachable" curl -fsS http://127.0.0.1/api/tickets
check "Telemetry summary reachable" curl -fsS http://127.0.0.1/api/telemetry/summary

if docker volume ls --format '{{.Name}}' | grep -q postgres; then
    echo "[PASS] PostgreSQL-like named volume exists"
    PASS=$((PASS + 1))
else
    echo "[FAIL] PostgreSQL-like named volume exists"
    FAIL=$((FAIL + 1))
fi

echo
echo "Passed: $PASS"
echo "Failed: $FAIL"
echo

if [ "$FAIL" -eq 0 ]; then
    echo "MISSION 06 SERVER VALIDATION: PASS"
    exit 0
fi

echo "MISSION 06 NOT YET VALIDATED"
exit 1
