# MISSION 05 WALKTHROUGH

Mission 05 turns LUNA-1 into an application server.

All server-side runtime work happens on the Ubuntu Server VM.

---

# PART 1 — THE REQUEST PATH

At the end of this mission:

```text
🌎 Browser
    │ HTTP
    ▼
🌑 Nginx :80
    │ reverse proxy
    ▼
FastAPI :8000
    │ SQL
    ▼
PostgreSQL :5432
```

Each layer has a different job:

```text
Nginx       public web entry point

FastAPI     application logic and API

PostgreSQL  persistent relational data
```

---

# PART 2 — HTTP BASICS

A client sends an HTTP request.

A server sends an HTTP response.

Example:

```text
GET /api/modules
```

means:

> Give me the modules resource.

Common methods:

```text
GET     retrieve data
POST    create/submit data
PUT     replace something
PATCH   partially update something
DELETE  delete something
```

Mission 05 focuses primarily on:

```text
GET
POST
```

---

# PART 3 — STATUS CODES

Useful HTTP status codes:

```text
200 OK
201 Created
400 Bad Request
404 Not Found
422 Validation Error
500 Internal Server Error
502 Bad Gateway
```

Status codes are troubleshooting clues.

---

# PART 4 — PREPARE LUNA-1

From Earth Mission Control:

```text
ssh lunaadmin@YOUR-LUNA-IP
```

On LUNA-1:

```bash
sudo apt update
sudo apt install python3-venv python3-pip -y
```

Verify PostgreSQL:

```bash
sudo systemctl status postgresql
```

Verify Nginx:

```bash
sudo systemctl status nginx
```

Press `q` to leave a status view.

---

# PART 5 — CREATE A TRAINING FOLDER

On LUNA-1:

```bash
cd ~
mkdir -p luna-api-training
cd luna-api-training
```

This is a disposable **folder** for learning FastAPI.

---

# PART 6 — CREATE A VIRTUAL ENVIRONMENT

Run:

```bash
python3 -m venv .venv
```

This creates a **folder** named:

```text
.venv
```

It isolates this project's Python packages from the system Python installation.

Activate it:

```bash
source .venv/bin/activate
```

Your prompt may begin with:

```text
(.venv)
```

Leave the environment later with:

```bash
deactivate
```

---

# PART 7 — INSTALL FASTAPI

With the virtual environment active:

```bash
python -m pip install --upgrade pip
python -m pip install "fastapi[standard-no-fastapi-cloud-cli]"
```

Verify:

```bash
fastapi --help
```

---

# PART 8 — CREATE YOUR FIRST API FILE

Create a **file**:

```text
main.py
```

Open:

```bash
nano main.py
```

Paste:

```python
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def root():
    return {"message": "PROJECT LUNA API ONLINE"}
```

Save.

---

# PART 9 — UNDERSTAND THE ROUTE

This:

```python
app = FastAPI()
```

creates the application.

This:

```python
@app.get("/")
```

means:

> When a GET request reaches `/`, run the function below.

Returning a Python dictionary causes FastAPI to return JSON.

---

# PART 10 — RUN THE DEVELOPMENT SERVER

Run:

```bash
fastapi dev main.py --host 0.0.0.0
```

The development server normally listens on:

```text
8000
```

From Earth Mission Control browse:

```text
http://YOUR-LUNA-IP:8000/
```

Expected JSON:

```json
{
  "message": "PROJECT LUNA API ONLINE"
}
```

Stop with:

```text
Ctrl + C
```

---

# PART 11 — AUTOMATIC API DOCUMENTATION

Start the app again.

Browse:

```text
http://YOUR-LUNA-IP:8000/docs
```

FastAPI generates interactive API documentation automatically.

---

# PART 12 — HEALTH ENDPOINT

Add:

```python
@app.get("/health")
def health():
    return {
        "station": "LUNA-1",
        "status": "ONLINE"
    }
```

Test:

```text
http://YOUR-LUNA-IP:8000/health
```

---

# PART 13 — PATH PARAMETERS

Add:

```python
@app.get("/modules/{module_name}")
def get_module(module_name: str):
    return {
        "requested_module": module_name
    }
```

Try:

```text
/modules/HAB-1
```

`HAB-1` becomes the `module_name` value.

---

# PART 14 — QUERY PARAMETERS

Add:

```python
@app.get("/search")
def search(status: str = "OPERATIONAL"):
    return {
        "requested_status": status
    }
```

Try:

```text
/search?status=MAINTENANCE
```

The value after `?` is supplied as a query parameter.

---

# PART 15 — REQUEST BODIES

Add:

```python
from pydantic import BaseModel
```

Create:

```python
class TicketCreate(BaseModel):
    title: str
    priority: str
    module_id: int | None = None
```

Then:

```python
@app.post("/tickets", status_code=201)
def create_ticket(ticket: TicketCreate):
    return {
        "message": "Ticket received",
        "ticket": ticket
    }
```

Open `/docs`.

Use **Try it out** and send:

```json
{
  "title": "Inspect HAB-2 oxygen sensor",
  "priority": "HIGH",
  "module_id": 2
}
```

FastAPI validates the request body.

---

# PART 16 — INSTALL PSYCOPG 3

Stop FastAPI.

With `.venv` active:

```bash
python -m pip install "psycopg[binary]"
```

Psycopg is the Python PostgreSQL adapter used by Project LUNA.

---

# PART 17 — CREATE A DATABASE APPLICATION USER

Enter PostgreSQL:

```bash
sudo -u postgres psql
```

Create:

```sql
CREATE USER luna_api WITH PASSWORD 'CHOOSE-A-LAB-PASSWORD';
```

Grant database access:

```sql
GRANT CONNECT ON DATABASE luna_operations TO luna_api;
```

Connect:

```text
\c luna_operations
```

Grant schema usage:

```sql
GRANT USAGE ON SCHEMA public TO luna_api;
```

Grant table permissions:

```sql
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO luna_api;
```

Grant sequence access:

```sql
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO luna_api;
```

Exit:

```text
\q
```

Use a lab password rather than reusing a personal password.

---

# PART 18 — ENVIRONMENT VARIABLES

Do not hard-code database credentials into source code.

For the current SSH session:

```bash
export LUNA_DB_NAME="luna_operations"
export LUNA_DB_USER="luna_api"
export LUNA_DB_PASSWORD="YOUR-LAB-PASSWORD"
export LUNA_DB_HOST="127.0.0.1"
```

Python can read an environment variable:

```python
import os

password = os.environ["LUNA_DB_PASSWORD"]
```

---

# PART 19 — CREATE `db.py`

Create a **file**:

```text
db.py
```

Paste:

```python
import os
import psycopg
from psycopg.rows import dict_row


def get_connection():
    return psycopg.connect(
        dbname=os.environ["LUNA_DB_NAME"],
        user=os.environ["LUNA_DB_USER"],
        password=os.environ["LUNA_DB_PASSWORD"],
        host=os.environ.get("LUNA_DB_HOST", "127.0.0.1"),
        row_factory=dict_row
    )
```

`dict_row` makes result rows dictionary-like.

---

# PART 20 — TEST THE DATABASE CONNECTION

Create:

```text
db_test.py
```

Paste:

```python
from db import get_connection


with get_connection() as connection:
    with connection.cursor() as cursor:
        cursor.execute("""
            SELECT
                module_id,
                module_name,
                module_type,
                status
            FROM modules
            ORDER BY module_id;
        """)

        modules = cursor.fetchall()


for module in modules:
    print(module)
```

Run:

```bash
python db_test.py
```

You should see Mission 04 module records.

---

# PART 21 — DATABASE-BACKED API

Import into `main.py`:

```python
from db import get_connection
```

Add:

```python
@app.get("/api/modules")
def modules():
    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute("""
                SELECT
                    module_id,
                    module_name,
                    module_type,
                    status
                FROM modules
                ORDER BY module_id;
            """)

            return cursor.fetchall()
```

Run FastAPI again.

Browse:

```text
http://YOUR-LUNA-IP:8000/api/modules
```

PostgreSQL data should appear as JSON.

---

# PART 22 — PARAMETERIZED SQL

Do **not** construct SQL by joining raw user input into a query string.

Instead use parameters.

Example:

```python
@app.get("/api/modules/{module_name}")
def module(module_name: str):
    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute(
                """
                SELECT
                    module_id,
                    module_name,
                    module_type,
                    status
                FROM modules
                WHERE module_name = %s;
                """,
                (module_name,)
            )

            return cursor.fetchone()
```

The SQL placeholder is:

```text
%s
```

The value is provided separately:

```python
(module_name,)
```

---

# PART 23 — INSERT THROUGH THE API

Use the `TicketCreate` model.

Add:

```python
@app.post("/api/tickets", status_code=201)
def create_ticket(ticket: TicketCreate):
    with get_connection() as connection:
        with connection.cursor() as cursor:
            cursor.execute(
                """
                INSERT INTO maintenance_tickets (
                    title,
                    priority,
                    status,
                    module_id
                )
                VALUES (%s, %s, 'OPEN', %s)
                RETURNING
                    ticket_id,
                    title,
                    priority,
                    status,
                    module_id;
                """,
                (
                    ticket.title,
                    ticket.priority,
                    ticket.module_id
                )
            )

            new_ticket = cursor.fetchone()

        connection.commit()

    return new_ticket
```

Test through `/docs`.

Then verify the new row in PostgreSQL.

---

# PART 24 — CREATE THE FRONTEND FOLDER

Create:

```bash
mkdir -p static
```

This is a **folder** for browser files.

Create:

```text
static/index.html
```

Paste:

```html
<!DOCTYPE html>
<html>
<head>
    <title>LUNA Mission Control</title>
</head>
<body>
    <h1>LUNA Mission Control</h1>

    <p>Station operations dashboard.</p>

    <h2>Modules</h2>

    <div id="modules">
        Loading...
    </div>

    <script src="/static/app.js"></script>
</body>
</html>
```

---

# PART 25 — JAVASCRIPT `fetch()`

Create:

```text
static/app.js
```

Paste:

```javascript
async function loadModules() {
    const response = await fetch("/api/modules");
    const modules = await response.json();

    const container = document.getElementById("modules");

    container.innerHTML = "";

    for (const module of modules) {
        const line = document.createElement("p");

        line.textContent =
            `${module.module_name} — ${module.status}`;

        container.appendChild(line);
    }
}

loadModules();
```

Flow:

```text
browser
↓
fetch("/api/modules")
↓
FastAPI
↓
PostgreSQL
↓
JSON
↓
JavaScript
↓
page
```

---

# PART 26 — BASIC CSS

Create:

```text
static/style.css
```

Paste:

```css
body {
    font-family: sans-serif;
    max-width: 900px;
    margin: 40px auto;
    padding: 0 20px;
}

h1 {
    margin-bottom: 4px;
}

#modules {
    border: 1px solid #888;
    padding: 16px;
}
```

Inside the `<head>` of `index.html`, add:

```html
<link rel="stylesheet" href="/static/style.css">
```

---

# PART 27 — SERVE STATIC FILES

In `main.py`, import:

```python
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
```

After:

```python
app = FastAPI()
```

add:

```python
app.mount("/static", StaticFiles(directory="static"), name="static")
```

Create:

```python
@app.get("/")
def dashboard():
    return FileResponse("static/index.html")
```

Browse:

```text
http://YOUR-LUNA-IP:8000/
```

The dashboard should now load API data.

---

# PART 28 — `requirements.txt`

Create a **file**:

```text
requirements.txt
```

Add:

```text
fastapi[standard-no-fastapi-cloud-cli]
psycopg[binary]
```

A fresh virtual environment can install dependencies with:

```bash
python -m pip install -r requirements.txt
```

---

# PART 29 — DEVELOPMENT VS SERVICE RUNTIME

During development:

```bash
fastapi dev main.py --host 0.0.0.0
```

is useful.

A real station service must continue running after your SSH session closes.

Linux uses:

```text
systemd
```

for long-running services.

---

# PART 30 — SYSTEMD UNIT FILE

The final application will live at:

```text
/home/lunaadmin/luna-operations/app
```

The systemd **file** will be:

```text
/etc/systemd/system/luna-api.service
```

Example:

```ini
[Unit]
Description=Project LUNA Mission Control API
After=network.target postgresql.service

[Service]
User=lunaadmin
WorkingDirectory=/home/lunaadmin/luna-operations/app
EnvironmentFile=/home/lunaadmin/luna-operations/app/luna-api.env
ExecStart=/home/lunaadmin/luna-operations/app/.venv/bin/fastapi run main.py --host 127.0.0.1 --port 8000
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Key fields:

```text
User
    Linux account running the process

WorkingDirectory
    application folder

EnvironmentFile
    configuration/secrets file

ExecStart
    command to start the process

Restart
    restart behavior
```

---

# PART 31 — ENVIRONMENT FILE

Create on LUNA-1:

```text
/home/lunaadmin/luna-operations/app/luna-api.env
```

Example:

```text
LUNA_DB_NAME=luna_operations
LUNA_DB_USER=luna_api
LUNA_DB_PASSWORD=YOUR-LAB-PASSWORD
LUNA_DB_HOST=127.0.0.1
```

Do not commit this file.

Protect it:

```bash
chmod 600 luna-api.env
```

Your `.gitignore` should include:

```text
.env
*.env
.venv/
```

---

# PART 32 — CONTROL YOUR SERVICE

After creating the unit:

```bash
sudo systemctl daemon-reload
```

Start:

```bash
sudo systemctl start luna-api
```

Check:

```bash
sudo systemctl status luna-api
```

Enable at boot:

```bash
sudo systemctl enable luna-api
```

Restart:

```bash
sudo systemctl restart luna-api
```

View recent logs:

```bash
sudo journalctl -u luna-api -n 50
```

Follow live:

```bash
sudo journalctl -u luna-api -f
```

---

# PART 33 — WHY FASTAPI BINDS TO `127.0.0.1`

During training you used:

```text
0.0.0.0:8000
```

so Earth could connect directly.

For the deployed service:

```text
127.0.0.1:8000
```

means FastAPI accepts direct connections only from LUNA-1 itself.

Nginx runs on LUNA-1, so it can reach FastAPI.

Architecture:

```text
Earth
  │
  ▼
Nginx :80
  │
  ▼
127.0.0.1:8000
FastAPI
```

---

# PART 34 — NGINX REVERSE PROXY

Create a **file**:

```text
/etc/nginx/sites-available/luna
```

Paste:

```nginx
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:8000;

        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Enable it:

```bash
sudo ln -s /etc/nginx/sites-available/luna /etc/nginx/sites-enabled/luna
```

If the default site is still enabled:

```bash
sudo rm -f /etc/nginx/sites-enabled/default
```

Test:

```bash
sudo nginx -t
```

Only if the test succeeds:

```bash
sudo systemctl reload nginx
```

Earth can now browse:

```text
http://YOUR-LUNA-IP/
```

---

# PART 35 — TROUBLESHOOT BY LAYER

If the dashboard fails:

## 1. Is LUNA-1 reachable?

From Earth:

```text
ping YOUR-LUNA-IP
```

## 2. Is Nginx running?

```bash
sudo systemctl status nginx
```

## 3. Is FastAPI running?

```bash
sudo systemctl status luna-api
```

## 4. Does FastAPI respond locally?

```bash
curl http://127.0.0.1:8000/health
```

## 5. Does Nginx proxy locally?

```bash
curl http://127.0.0.1/health
```

## 6. Is PostgreSQL running?

```bash
sudo systemctl status postgresql
```

## 7. What does the application log say?

```bash
sudo journalctl -u luna-api -n 50
```

---

# PART 36 — COMPLETE THE LABS

Complete:

```text
labs/01-http-fastapi.md
labs/02-database-api.md
labs/03-frontend-fetch.md
labs/04-linux-deployment.md
```

Then continue to:

```text
project/README.md
```
