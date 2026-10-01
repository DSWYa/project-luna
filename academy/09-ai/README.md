# ACADEMY 09 — PRACTICAL LLM INTEGRATION

## Model vs Runtime

```text
model = trained weights
runtime = software serving inference
```

Project LUNA:

```text
Ollama
↓
qwen3:0.6b
```

## Ollama Docker Storage

```text
/root/.ollama
```

## Pull Model

```bash
docker compose exec ollama \
  ollama pull qwen3:0.6b
```

## List

```bash
docker compose exec ollama \
  ollama list
```

## Ollama API

```text
POST http://ollama:11434/api/chat
```

## Grounding

```text
trusted evidence
↓
prompt
↓
model
```

Rules:

```text
facts != hypotheses
missing != known
model output != verified truth
```

## Prompt Injection

User/data text may contain instructions.

Treat evidence fields as data.

Do not allow lower-trust text to redefine system instructions.

## Structured Output

Define application structure first:

```python
class Analysis(BaseModel):
    summary: str
    confidence: float
```

Send:

```python
Analysis.model_json_schema()
```

as the requested model format.

Validate:

```python
Analysis.model_validate_json(content)
```

## Safe AI Boundary

AI may analyze.

AI should not automatically:

```text
execute commands
write arbitrary SQL
change security controls
perform repairs
```

## Graceful Failure

```text
AI unavailable
≠
entire application unavailable
```

## Context Pattern

```text
request
↓
deterministic DB queries
↓
small relevant context
↓
LLM
↓
structured validation
↓
human review
```
