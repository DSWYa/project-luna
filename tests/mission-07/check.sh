#!/bin/bash

set -u

echo "=============================================="
echo " PROJECT LUNA - MISSION 07 SERVER VALIDATION"
echo "=============================================="
echo

REPO="${1:-$HOME/luna-operations}"
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

if systemctl is-active --quiet docker; then pass "Docker active"; else fail "Docker active"; fi
if systemctl is-active --quiet ssh; then pass "SSH active"; else fail "SSH active"; fi

if sudo sshd -t >/dev/null 2>&1; then
    pass "SSH configuration valid"
else
    fail "SSH configuration valid"
fi

EFFECTIVE="$(sudo sshd -T 2>/dev/null)"

echo "$EFFECTIVE" | grep -q '^passwordauthentication no$' \
    && pass "Password authentication disabled" \
    || fail "Password authentication disabled"

echo "$EFFECTIVE" | grep -q '^permitrootlogin no$' \
    && pass "Direct root SSH disabled" \
    || fail "Direct root SSH disabled"

if [ -f "$REPO/.env" ]; then
    MODE="$(stat -c '%a' "$REPO/.env")"
    [ "$MODE" = "600" ] \
        && pass ".env mode is 600" \
        || fail ".env mode is 600"
else
    fail ".env exists on server"
fi

if [ -f "$REPO/.github/workflows/ci.yml" ]; then
    pass "CI workflow exists"
else
    fail "CI workflow exists"
fi

if [ -x "$REPO/scripts/deploy.sh" ]; then
    pass "Deploy script exists and executable"
else
    fail "Deploy script exists and executable"
fi

cd "$REPO" || exit 1

docker compose ps --services | grep -q '^prometheus$' \
    && pass "Prometheus service defined" \
    || fail "Prometheus service defined"

docker compose ps --services | grep -q '^grafana$' \
    && pass "Grafana service defined" \
    || fail "Grafana service defined"

docker compose ps --services | grep -q '^node-exporter$' \
    && pass "Node Exporter service defined" \
    || fail "Node Exporter service defined"

curl -fsS http://127.0.0.1:9090/-/healthy >/dev/null 2>&1 \
    && pass "Prometheus healthy on loopback" \
    || fail "Prometheus healthy on loopback"

curl -fsS http://127.0.0.1:3000/api/health >/dev/null 2>&1 \
    && pass "Grafana healthy on loopback" \
    || fail "Grafana healthy on loopback"

curl -fsS http://127.0.0.1/health >/dev/null 2>&1 \
    && pass "LUNA application healthy" \
    || fail "LUNA application healthy"

echo
echo "Passed: $PASS"
echo "Failed: $FAIL"
echo

if [ "$FAIL" -eq 0 ]; then
    echo "MISSION 07 SERVER VALIDATION: PASS"
    echo
    echo "Manually confirm GitHub Actions is passing and Grafana dashboard exists."
    exit 0
fi

echo "MISSION 07 NOT YET VALIDATED"
exit 1
