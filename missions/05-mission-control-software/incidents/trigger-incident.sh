#!/bin/bash

set -e

LAB="$HOME/luna-incident-05"

echo "========================================"
echo "      PROJECT LUNA INCIDENT SYSTEM"
echo "========================================"
echo
echo "Preparing Mission 05 incident..."

rm -rf "$LAB"
mkdir -p "$LAB"

python3 -m venv "$LAB/.venv"

"$LAB/.venv/bin/python" -m pip install --quiet --upgrade pip
"$LAB/.venv/bin/python" -m pip install --quiet "fastapi[standard-no-fastapi-cloud-cli]" "psycopg[binary]"

cat > "$LAB/main.py" <<'PY'
import os

import psycopg
from psycopg.rows import dict_row
from fastapi import FastAPI

app = FastAPI()


def get_connection():
    return psycopg.connect(
        dbname=os.environ.get("LUNA_DB_NAME", "luna_operations"),
        user=os.environ.get("LUNA_DB_USER", "luna_api"),
        password=os.environ["LUNA_DB_PASSWORD"],
        host="127.0.0.1",
        row_factory=dict_row,
    )


@app.get("/health")
def health():
    return {
        "station": "LUNA-1",
        "api": "ONLINE"
    }


@app.get("/api/modules")
def modules():
    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT
                    module_id,
                    module_name,
                    module_type,
                    module_status
                FROM modules
                ORDER BY module_id;
            """)

            return cursor.fetchall()
PY

cat > "$LAB/README.txt" <<'TXT'
MISSION 05 INCIDENT LAB

Required:

export LUNA_DB_PASSWORD="YOUR-LUNA-API-PASSWORD"

Optional if your names differ:

export LUNA_DB_NAME="luna_operations"
export LUNA_DB_USER="luna_api"

Then:

source .venv/bin/activate
fastapi dev main.py --host 0.0.0.0 --port 8100
TXT

echo
echo "Incident generated:"
echo "$LAB"
echo
echo "Read the lab README, then begin troubleshooting."
