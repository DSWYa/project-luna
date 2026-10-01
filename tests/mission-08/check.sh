#!/bin/bash

set -u

echo "=============================================="
echo " PROJECT LUNA - MISSION 08 SERVER VALIDATION"
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

[ -f "$REPO/app/automation.py" ] \
    && pass "app/automation.py exists" \
    || fail "app/automation.py exists"

grep -q '^requests' "$REPO/app/requirements.txt" 2>/dev/null \
    && pass "requests dependency exists" \
    || fail "requests dependency exists"

[ -f "$REPO/automation/google-apps-script/Code.gs" ] \
    && pass "Apps Script source is versioned" \
    || fail "Apps Script source is versioned"

[ -f "$REPO/automation/google-apps-script/README.md" ] \
    && pass "Apps Script documentation exists" \
    || fail "Apps Script documentation exists"

[ -f "$REPO/.env" ] \
    && pass ".env exists on LUNA-1" \
    || fail ".env exists on LUNA-1"

if git -C "$REPO" check-ignore .env >/dev/null 2>&1; then
    pass ".env is ignored"
else
    fail ".env is ignored"
fi

if git -C "$REPO" ls-files | grep -qx '.env'; then
    fail ".env is not tracked"
else
    pass ".env is not tracked"
fi

cd "$REPO" || exit 1

if curl -fsS http://127.0.0.1/health >/dev/null 2>&1; then
    pass "LUNA application healthy"
else
    fail "LUNA application healthy"
fi

URL="$(grep '^LUNA_AUTOMATION_WEBHOOK_URL=' .env 2>/dev/null | head -1 | cut -d= -f2-)"
TOKEN="$(grep '^LUNA_AUTOMATION_TOKEN=' .env 2>/dev/null | head -1 | cut -d= -f2-)"

if [ -n "$URL" ]; then
    if curl -fsSL "$URL" >/dev/null 2>&1; then
        pass "Apps Script relay GET reachable"
    else
        fail "Apps Script relay GET reachable"
    fi
else
    fail "Automation webhook URL configured"
fi

if [ -n "$TOKEN" ]; then
    pass "Automation token configured"
else
    fail "Automation token configured"
fi

echo
echo "Passed: $PASS"
echo "Failed: $FAIL"
echo

if [ "$FAIL" -eq 0 ]; then
    echo "MISSION 08 SERVER VALIDATION: PASS"
    echo
    echo "Manually confirm:"
    echo "- Sheet rows arrive"
    echo "- CRITICAL email arrives"
    echo "- invalid token is rejected"
    echo "- daily digest trigger exists"
    exit 0
fi

echo "MISSION 08 NOT YET VALIDATED"
exit 1
