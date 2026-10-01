#!/bin/bash

set -e

LAB="$HOME/luna-incident-06"

echo "========================================"
echo "      PROJECT LUNA INCIDENT SYSTEM"
echo "========================================"
echo
echo "Preparing Mission 06 incident..."

rm -rf "$LAB"
mkdir -p "$LAB/app" "$LAB/nginx" "$LAB/db"

cat > "$LAB/app/main.py" <<'PY'
import os
import psycopg
from psycopg.rows import dict_row
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
def health():
    return {"api": "ONLINE"}

@app.get("/modules")
def modules():
    with psycopg.connect(
        dbname=os.environ["DB_NAME"],
        user=os.environ["DB_USER"],
        password=os.environ["DB_PASSWORD"],
        host=os.environ["DB_HOST"],
        row_factory=dict_row,
    ) as connection:
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT module_id, module_name, status
                FROM modules
                ORDER BY module_id;
            """)
            return cursor.fetchall()
PY

cat > "$LAB/app/requirements.txt" <<'REQ'
fastapi[standard-no-fastapi-cloud-cli]
psycopg[binary]
REQ

cat > "$LAB/app/Dockerfile" <<'DOCKER'
FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["fastapi", "run", "main.py", "--host", "0.0.0.0", "--port", "8000"]
DOCKER

cat > "$LAB/nginx/default.conf" <<'NGINX'
server {
    listen 80;

    location / {
        proxy_pass http://api:8000;
    }
}
NGINX

cat > "$LAB/db/init.sql" <<'SQL'
CREATE TABLE modules (
    module_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    module_name VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL
);

INSERT INTO modules (module_name, status)
VALUES
    ('HAB-1', 'OPERATIONAL'),
    ('HAB-2', 'OPERATIONAL'),
    ('LAB-1', 'OPERATIONAL');
SQL

cat > "$LAB/compose.yaml" <<'YAML'
services:
  db:
    image: postgres:18
    environment:
      POSTGRES_DB: luna_incident
      POSTGRES_USER: luna
      POSTGRES_PASSWORD: luna-training-password
    volumes:
      - incident_db:/var/lib/postgresql
      - ./db/init.sql:/docker-entrypoint-initdb.d/01-init.sql:ro
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U $${POSTGRES_USER} -d $${POSTGRES_DB}"]
      interval: 3s
      timeout: 3s
      retries: 15

  api:
    build: ./app
    environment:
      DB_NAME: luna_incident
      DB_USER: luna
      DB_PASSWORD: luna-training-password
      DB_HOST: 127.0.0.1
    depends_on:
      db:
        condition: service_healthy

  nginx:
    image: nginx:alpine
    ports:
      - "8180:80"
    volumes:
      - ./nginx/default.conf:/etc/nginx/conf.d/default.conf:ro
    depends_on:
      - api

volumes:
  incident_db:
YAML

echo
echo "Incident generated:"
echo "$LAB"
echo
echo "Enter the folder and run:"
echo "docker compose up -d --build"
