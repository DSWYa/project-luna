#!/bin/bash

set -e

LAB="$HOME/luna-incident-08"

echo "========================================"
echo "      PROJECT LUNA INCIDENT SYSTEM"
echo "========================================"
echo
echo "Preparing Mission 08 automation incident..."

rm -rf "$LAB"
mkdir -p "$LAB/relay"

cat > "$LAB/relay/main.py" <<'PY'
import json
from pathlib import Path

from fastapi import FastAPI, Request

app = FastAPI()

EVENTS = Path("/data/events.log")
ALERTS = Path("/data/alerts.log")


@app.get("/health")
def health():
    return {"relay": "ONLINE"}


@app.post("/webhook")
async def webhook(request: Request):
    payload = await request.json()

    with EVENTS.open("a") as file:
        file.write(json.dumps(payload) + "\n")

    alerted = False

    if payload.get("severity") == "CRITICAL":
        with ALERTS.open("a") as file:
            file.write(
                f'ALERT: {payload.get("message", "")}\n'
            )

        alerted = True

    return {
        "received": True,
        "alerted": alerted
    }
PY

cat > "$LAB/relay/requirements.txt" <<'REQ'
fastapi[standard-no-fastapi-cloud-cli]
REQ

cat > "$LAB/relay/Dockerfile" <<'DOCKER'
FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

COPY main.py .

CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]
DOCKER

cat > "$LAB/compose.yaml" <<'YAML'
services:
  relay:
    build: ./relay
    ports:
      - "127.0.0.1:8280:8000"
    volumes:
      - ./:/data
YAML

cat > "$LAB/send-event.sh" <<'BASH'
#!/bin/bash

curl -sS \
  -H "Content-Type: application/json" \
  -d '{
    "station": "LUNA-1",
    "source": "life-support",
    "priority": "CRITICAL",
    "message": "Oxygen subsystem requires immediate review"
  }' \
  http://127.0.0.1:8280/webhook

echo
BASH

chmod +x "$LAB/send-event.sh"

touch "$LAB/events.log"
touch "$LAB/alerts.log"

echo
echo "Incident generated:"
echo "$LAB"
echo
echo "Start with:"
echo "cd $LAB"
echo "docker compose up -d --build"
echo "./send-event.sh"
