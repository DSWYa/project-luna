# MISSION 09 — LEARNING OBJECTIVES

By the end of Mission 09, you should be able to:

## AI Fundamentals

- Explain the difference between an LLM and the software serving it.
- Explain tokens at a basic level.
- Explain context.
- Explain why LLM output is probabilistic.
- Explain hallucination.
- Explain grounding.
- Explain prompt injection at a basic level.
- Explain why AI output must be treated as untrusted application output.

## Ollama

- Run Ollama in Docker on LUNA-1.
- Persist model data in a Docker volume.
- Pull a model.
- List installed models.
- Call the Ollama HTTP API.
- Understand `/api/chat`.
- Keep Ollama internal to the Docker network in the final deployment.

## Prompting

- Use a system message.
- Supply structured operational context.
- Label untrusted ticket text as data.
- Instruct a model to avoid unsupported claims.
- Ask for useful operational analysis instead of open-ended conversation.

## Structured Output

- Request JSON output.
- Define a Pydantic response model.
- Generate a JSON schema.
- Validate model output.
- Reject malformed model output.

## LUNA Integration

- Query PostgreSQL for a maintenance ticket.
- Query related module/telemetry context.
- Send only relevant context to the model.
- Return validated AI analysis through FastAPI.
- Display analysis in Mission Control.
- Fail gracefully if Ollama is unavailable.

## AI Safety / Reliability

- Keep AI read-only.
- Never execute model-generated commands automatically.
- Separate facts from hypotheses.
- Treat database/user text as untrusted content.
- Recognize prompt injection attempts.
- Test the model with known scenarios.
