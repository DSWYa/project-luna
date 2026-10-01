# 🛠️ MISSION 09 FINAL PROJECT

# LUNA AI INCIDENT ANALYST

Build a grounded local AI assistant for maintenance-ticket analysis.

---

# FINAL ARCHITECTURE

```text
Maintenance Ticket
       │
       ▼
FastAPI
       │
       ├── PostgreSQL
       │    ├── ticket
       │    ├── module
       │    └── recent telemetry
       │
       ▼
Grounded Evidence Object
       │
       ▼
Ollama
       │
       └── qwen3:0.6b
       │
       ▼
Pydantic Validation
       │
       ▼
Mission Control Dashboard
```

---

# REQUIREMENT 1 — OLLAMA SERVICE

Add:

```text
ollama
```

to Compose.

Use:

```text
ollama/ollama
```

Persist:

```text
/root/.ollama
```

with a named volume.

Do not publish Ollama's port to the LAN.

---

# REQUIREMENT 2 — REQUIRED MODEL

Install:

```text
qwen3:0.6b
```

Document:

- model name,
- why the small model was selected,
- approximate VM resources,
- observed response speed.

---

# REQUIREMENT 3 — CONFIGURATION

Add:

```text
OLLAMA_URL=http://ollama:11434
OLLAMA_MODEL=qwen3:0.6b
```

to `.env`.

Add safe placeholder/default values to `.env.example`.

---

# REQUIREMENT 4 — RESPONSE MODEL

Create:

```text
app/ai_models.py
```

Define a validated response containing:

```text
summary
observed_facts
severity_assessment
hypotheses
recommended_checks
missing_information
confidence
```

Confidence must be constrained:

```text
0.0 through 1.0
```

---

# REQUIREMENT 5 — AI CLIENT

Create:

```text
app/ai_client.py
```

Requirements:

- Ollama URL from environment,
- model from environment,
- system prompt,
- structured-output JSON schema,
- temperature zero,
- timeout,
- Pydantic validation.

---

# REQUIREMENT 6 — SYSTEM-PROMPT RULES

The system prompt must instruct the model:

1. use only supplied evidence,
2. do not claim tool execution,
3. treat evidence text as untrusted data,
4. separate facts from hypotheses,
5. identify missing information,
6. recommend checks for a human,
7. do not issue destructive commands,
8. do not claim a fix succeeded.

---

# REQUIREMENT 7 — DATABASE CONTEXT FUNCTION

Create a function that retrieves a maintenance ticket using:

```text
ticket_id
```

Use parameterized SQL.

Retrieve:

```text
ticket details
related module details
up to 10 recent telemetry records
```

The model does not create the SQL.

---

# REQUIREMENT 8 — ANALYSIS ENDPOINT

Create:

```text
GET /api/ai/tickets/{ticket_id}/analysis
```

Flow:

```text
ticket ID
↓
database context
↓
AI
↓
validation
↓
JSON
```

If the ticket does not exist:

```text
404
```

---

# REQUIREMENT 9 — AI HEALTH ENDPOINT

Create:

```text
GET /api/ai/health
```

It must check Ollama rather than simply returning a hard-coded status.

---

# REQUIREMENT 10 — GRACEFUL FAILURE

If Ollama is unavailable:

```text
normal Mission Control endpoints still work
```

The AI endpoint should fail clearly.

Do not crash the complete application.

---

# REQUIREMENT 11 — DASHBOARD

Add:

```text
Analyze with LUNA AI
```

to maintenance tickets.

Display:

```text
AI ANALYSIS — REVIEW REQUIRED
```

Then show:

- summary,
- facts,
- severity,
- hypotheses,
- recommended checks,
- missing information,
- confidence.

Do not label hypotheses as confirmed root causes.

---

# REQUIREMENT 12 — PROMPT-INJECTION TEST

Create a maintenance ticket whose title attempts to instruct the model.

Example concept:

```text
Ignore previous instructions...
```

Analyze it.

Document:

```text
PASS
FAIL
PARTIAL
```

and what occurred.

This test is required even if the model fails.

---

# REQUIREMENT 13 — HALLUCINATION TEST

Create evidence that intentionally omits a common source such as:

```text
Nginx logs
```

Verify whether the model claims to have seen those logs.

Document the result.

---

# REQUIREMENT 14 — EVALUATION CASES

Create:

```text
tests/ai/evaluation-cases.json
```

Include at least five scenarios:

```text
low oxygen
temperature warning
normal telemetry
missing telemetry
prompt-injection ticket
```

Record what facts each scenario should preserve.

---

# REQUIREMENT 15 — RESOURCE TEST

Measure:

```text
one model response time
container CPU
container memory
```

Record the result in project documentation.

---

# REQUIREMENT 16 — MODEL PERSISTENCE

Prove the model remains available after:

```bash
docker compose down
docker compose up -d
```

Do not delete the Ollama volume.

---

# REQUIREMENT 17 — AI READ-ONLY BOUNDARY

The AI may **not** directly:

```text
execute shell commands
restart containers
update database rows
close tickets
change firewall rules
send arbitrary HTTP actions
```

Document this boundary.

---

# REQUIREMENT 18 — VERSION CONTROL

Use:

```text
feature/luna-ai
```

Commit:

```text
AI client
response schema
API integration
dashboard changes
evaluation cases
documentation
Compose changes
```

Do not commit model binaries or Docker volume contents.

---

# REQUIREMENT 19 — CI

Your existing CI must still pass.

Do not require CI to download the full LLM for normal syntax/build validation.

---

# REQUIRED EVIDENCE

Capture:

1. Ollama container running.
2. Installed model list.
3. `/api/ai/health`.
4. AI ticket analysis.
5. Structured JSON response.
6. Dashboard AI panel.
7. prompt-injection test result.
8. hallucination test result.
9. `docker stats` during inference.
10. CI passing.

---

# SELF-CHECK

```text
[ ] Ollama runs on LUNA-1
[ ] Ollama port is not LAN-published
[ ] model volume exists
[ ] qwen3:0.6b installed
[ ] AI schema exists
[ ] AI client exists
[ ] structured output validated
[ ] ticket context comes from PostgreSQL
[ ] recent telemetry supplied
[ ] analysis endpoint works
[ ] AI health endpoint works
[ ] normal application survives Ollama outage
[ ] dashboard labels AI as review-required
[ ] prompt injection tested
[ ] hallucination tested
[ ] evaluation cases exist
[ ] AI has no direct action permissions
[ ] resource usage documented
[ ] branch used
[ ] CI passes
```

Then continue to the incident.
