#!/bin/bash

set -u

echo "=============================================="
echo " PROJECT LUNA - MISSION 09 SERVER VALIDATION"
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

cd "$REPO" || exit 1

docker compose ps --services | grep -q '^ollama$' \
    && pass "Ollama service defined" \
    || fail "Ollama service defined"

docker compose ps | grep -q 'ollama' \
    && pass "Ollama container present" \
    || fail "Ollama container present"

docker compose exec -T ollama ollama list 2>/dev/null \
    | grep -q 'qwen3:0.6b' \
    && pass "Required model installed" \
    || fail "Required model installed"

[ -f "$REPO/app/ai_models.py" ] \
    && pass "AI response model exists" \
    || fail "AI response model exists"

[ -f "$REPO/app/ai_client.py" ] \
    && pass "AI client exists" \
    || fail "AI client exists"

[ -f "$REPO/tests/ai/evaluation-cases.json" ] \
    && pass "AI evaluation cases exist" \
    || fail "AI evaluation cases exist"

curl -fsS http://127.0.0.1/api/ai/health >/dev/null 2>&1 \
    && pass "AI health endpoint works" \
    || fail "AI health endpoint works"

curl -fsS http://127.0.0.1/health >/dev/null 2>&1 \
    && pass "Core application remains healthy" \
    || fail "Core application remains healthy"

if docker compose config 2>/dev/null \
    | grep -q '11434:11434'; then
    fail "Ollama is not published broadly"
else
    pass "Ollama is not published broadly"
fi

echo
echo "Passed: $PASS"
echo "Failed: $FAIL"
echo

if [ "$FAIL" -eq 0 ]; then
    echo "MISSION 09 SERVER VALIDATION: PASS"
    echo
    echo "Manually confirm:"
    echo "- prompt injection test documented"
    echo "- hallucination test documented"
    echo "- dashboard AI panel works"
    echo "- resource usage documented"
    exit 0
fi

echo "MISSION 09 NOT YET VALIDATED"
exit 1
