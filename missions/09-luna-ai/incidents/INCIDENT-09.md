# 🚨 INCIDENT INC-009

**SYSTEM:** LUNA AI Incident Analyst  
**RUNTIME:** Docker on LUNA-1

Mission Control reports:

```text
FASTAPI ................. ONLINE
POSTGRESQL .............. ONLINE
OLLAMA .................. ONLINE
MODEL ................... RESPONDING
AI ENDPOINT ............. 502 ERROR
```

The model is generating text.

The application refuses to accept it.

---

# STEP 1 — UPDATE COURSE FILES

On LUNA-1:

```bash
cd ~/project-luna
git pull
```

---

# STEP 2 — GENERATE THE INCIDENT

```bash
cd ~/project-luna/missions/09-luna-ai/incidents
chmod +x trigger-incident.sh
./trigger-incident.sh
```

It creates:

```text
~/luna-incident-09
```

Do not inspect the generator before troubleshooting.

---

# STEP 3 — START THE INCIDENT STACK

```bash
cd ~/luna-incident-09
docker compose up -d --build
```

Then pull the small model:

```bash
docker compose exec ollama \
  ollama pull qwen3:0.6b
```

---

# STEP 4 — TEST

Run:

```bash
curl -i \
  http://127.0.0.1:8390/analyze
```

Mission Control reports a structured-output validation failure.

---

# OBJECTIVE

Determine:

1. Whether Ollama is reachable.
2. Whether the model generates a response.
3. Whether the response is valid JSON.
4. Which field fails application validation.
5. Whether the problem is model availability or schema agreement.
6. The smallest correction.

Useful:

```bash
docker compose logs api
docker compose logs ollama
```

If stuck, open `hint-1.md`.
