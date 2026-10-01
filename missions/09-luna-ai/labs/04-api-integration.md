# LAB 04 — API INTEGRATION

Build a test FastAPI endpoint:

```text
GET /api/ai/test
```

It should:

1. construct a fixed evidence object,
2. call Ollama,
3. validate output,
4. return the structured result.

Then stop the Ollama container:

```bash
docker compose stop ollama
```

Call the endpoint again.

Requirements:

- application remains online,
- normal non-AI endpoints still work,
- AI endpoint fails cleanly,
- response indicates AI service unavailable.

Restart Ollama afterward:

```bash
docker compose start ollama
```
