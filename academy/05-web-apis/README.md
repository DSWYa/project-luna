# ACADEMY 05 — WEB, APIs & APPLICATION SERVICES

## Architecture

```text
Client
  ↓ HTTP
Nginx
  ↓ proxy
FastAPI
  ↓ SQL
PostgreSQL
```

All server components run on LUNA-1.

## HTTP Methods

```text
GET     retrieve
POST    create/submit
PUT     replace
PATCH   partial update
DELETE  delete
```

## Common Status Codes

```text
200 OK
201 Created
400 Bad Request
404 Not Found
422 Validation Error
500 Internal Server Error
502 Bad Gateway
```

## FastAPI

```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
def health():
    return {"status": "ONLINE"}
```

## Pydantic

```python
from pydantic import BaseModel

class TicketCreate(BaseModel):
    title: str
    priority: str
```

## Psycopg 3

```python
import psycopg
```

Parameterized SQL:

```python
cursor.execute(
    "SELECT * FROM modules WHERE module_name = %s",
    (module_name,)
)
```

## Fetch

```javascript
const response = await fetch("/api/modules");
const data = await response.json();
```

## Virtual Environment

```bash
python3 -m venv .venv
source .venv/bin/activate
```

## systemd

```bash
sudo systemctl status luna-api
sudo systemctl restart luna-api
sudo journalctl -u luna-api -n 50
```

## Nginx

```nginx
location / {
    proxy_pass http://127.0.0.1:8000;
}
```

## Troubleshooting

```text
Browser
↓
Network
↓
Nginx
↓
FastAPI
↓
Application
↓
PostgreSQL
```
