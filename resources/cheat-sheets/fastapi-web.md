# FASTAPI / WEB CHEAT SHEET

Runtime:

```text
LUNA-1 Ubuntu Server
```

Virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Install:

```bash
python -m pip install "fastapi[standard-no-fastapi-cloud-cli]" "psycopg[binary]"
```

Development:

```bash
fastapi dev main.py --host 0.0.0.0
```

Service runtime:

```bash
fastapi run main.py --host 127.0.0.1 --port 8000
```

Route:

```python
@app.get("/health")
def health():
    return {"status": "ONLINE"}
```

Parameterized query:

```python
cursor.execute(
    "SELECT * FROM modules WHERE module_name = %s",
    (name,)
)
```

Fetch:

```javascript
const response = await fetch("/api/modules");
const data = await response.json();
```

Service:

```bash
sudo systemctl status luna-api
sudo systemctl restart luna-api
sudo journalctl -u luna-api -n 50
```

Nginx:

```bash
sudo nginx -t
sudo systemctl reload nginx
```

Layer tests:

```bash
curl http://127.0.0.1:8000/health
curl http://127.0.0.1/health
```
