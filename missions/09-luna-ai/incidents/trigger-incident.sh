#!/bin/bash

set -e

LAB="$HOME/luna-incident-09"

echo "========================================"
echo "      PROJECT LUNA INCIDENT SYSTEM"
echo "========================================"
echo
echo "Preparing Mission 09 AI incident..."

rm -rf "$LAB"
mkdir -p "$LAB/app"

cat > "$LAB/app/requirements.txt" <<'REQ'
fastapi[standard-no-fastapi-cloud-cli]
requests
pydantic
REQ

cat > "$LAB/app/Dockerfile" <<'DOCKER'
FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

COPY main.py .

CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]
DOCKER

cat > "$LAB/app/main.py" <<'PY'
import json

import requests
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel, Field, ValidationError

app = FastAPI()


class Analysis(BaseModel):
    summary: str
    confidence: float = Field(ge=0.0, le=1.0)


BROKEN_SCHEMA = {
    "type": "object",
    "properties": {
        "summary": {
            "type": "string"
        },
        "confidence": {
            "type": "string",
            "enum": [
                "low",
                "medium",
                "high"
            ]
        }
    },
    "required": [
        "summary",
        "confidence"
    ]
}


@app.get("/health")
def health():
    return {
        "api": "ONLINE"
    }


@app.get("/analyze")
def analyze():
    body = {
        "model": "qwen3:0.6b",
        "messages": [
            {
                "role": "system",
                "content": (
                    "Analyze only the supplied evidence. "
                    "Return the requested structured JSON."
                )
            },
            {
                "role": "user",
                "content": (
                    "Evidence: HAB-2 oxygen is 18.8 percent."
                )
            }
        ],
        "stream": False,
        "format": BROKEN_SCHEMA,
        "options": {
            "temperature": 0
        }
    }

    try:
        response = requests.post(
            "http://ollama:11434/api/chat",
            json=body,
            timeout=90
        )

        response.raise_for_status()

        content = response.json()["message"]["content"]

        return Analysis.model_validate_json(content)

    except ValidationError as error:
        raise HTTPException(
            status_code=502,
            detail={
                "error": "ai_schema_validation_failed",
                "validation": json.loads(error.json())
            }
        )

    except requests.RequestException as error:
        raise HTTPException(
            status_code=503,
            detail=str(error)
        )
PY

cat > "$LAB/compose.yaml" <<'YAML'
services:
  ollama:
    image: ollama/ollama
    volumes:
      - ollama_incident:/root/.ollama

  api:
    build: ./app
    ports:
      - "127.0.0.1:8390:8000"
    depends_on:
      - ollama

volumes:
  ollama_incident:
YAML

echo
echo "Incident generated:"
echo "$LAB"
echo
echo "Start with:"
echo "cd $LAB"
echo "docker compose up -d --build"
echo "docker compose exec ollama ollama pull qwen3:0.6b"
