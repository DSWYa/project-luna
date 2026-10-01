# INCIDENT INC-009 — SOLUTION

The application validates:

```python
confidence: float
```

between:

```text
0.0
and
1.0
```

But the schema sent to Ollama intentionally describes:

```text
confidence
```

as a string.

The model therefore returns something similar to:

```json
{
  "confidence": "high"
}
```

The model obeyed the schema it was given.

Pydantic then rejects that value.

Correct the schema so the model and application agree:

```json
"confidence": {
  "type": "number",
  "minimum": 0,
  "maximum": 1
}
```

or generate the schema directly from the Pydantic model:

```python
AIIncidentAnalysis.model_json_schema()
```

Rebuild/restart the API.

Retest:

```bash
curl http://127.0.0.1:8390/analyze
```

---

# ROOT CAUSE

```text
Docker ............. OK
FastAPI ............ OK
Ollama ............. OK
Model .............. OK
JSON ............... OK
AI schema .......... WRONG
Pydantic ........... CORRECTLY REJECTED OUTPUT
```

Structured output only helps when the producer and consumer agree on the same contract.
