# 🧠 MISSION 09 — ACTIVATE THE STATION AI

**MISSION ID:** LUNA-M09  
**PRIORITY:** HIGH  
**ROLE:** Junior Systems Engineer  
**OBJECTIVE:** Add a grounded local AI incident analyst to LUNA-1

---

## Mission Briefing

LUNA-1 can now:

- collect operational data,
- store it in PostgreSQL,
- expose it through FastAPI,
- display it in Mission Control,
- run in containers,
- monitor itself,
- send automation events to Earth,
- and validate changes through CI.

The station produces more information than one engineer can comfortably inspect during an incident.

Mission Control wants an assistant.

Not an autonomous commander.

Not a system that invents station state.

Not an AI with permission to execute arbitrary repairs.

The first LUNA AI will have one job:

> Read specific operational evidence and help an engineer interpret it.

---

# Final Architecture

```text
🌎 Earth Mission Control
        │
        │ HTTP
        ▼
🌑 LUNA-1
│
├── Nginx
│      │
│      ▼
├── FastAPI
│      │
│      ├── PostgreSQL
│      │      └── tickets + telemetry
│      │
│      └── Ollama API
│             └── local LLM
│
└── Docker
```

The model runs locally on LUNA-1 through Ollama.

No paid AI API is required.

---

# Required Model

Project LUNA uses:

```text
qwen3:0.6b
```

for the required exercises.

It is intentionally small so the mission remains realistic on a CPU-only VM.

Small models have limitations.

The goal is to learn **AI integration engineering**, not to pretend a tiny local model has perfect reasoning.

If your VM has plenty of RAM, you may optionally test a larger compatible model later.

---

# The Grounding Rule

The AI must distinguish:

```text
FACT
directly supplied by LUNA systems

INFERENCE
a conclusion suggested by those facts

UNKNOWN
something the evidence does not establish
```

The model must not claim it:

- checked a log it never received,
- queried a database it never accessed,
- restarted a service,
- verified a fix,
- or observed a sensor that was not in its context.

---

# The Human-Control Rule

Mission 09 does **not** give the LLM permission to:

```text
run shell commands
change firewall rules
restart containers
modify PostgreSQL
close tickets
send arbitrary web requests
```

The AI produces analysis.

A human engineer decides what action to take.

---

# What You Will Learn

- AI model vs AI runtime
- LLM fundamentals
- tokens and context
- local inference
- Ollama
- Ollama HTTP API
- prompts
- system instructions
- grounding
- hallucination risk
- prompt injection
- structured outputs
- JSON schemas
- Pydantic validation
- AI timeouts
- graceful AI failure
- database-to-AI context
- FastAPI AI endpoints
- displaying AI results in the dashboard
- evaluating AI output against known evidence

Open `OBJECTIVES.md`, then continue to `WALKTHROUGH.md`.
