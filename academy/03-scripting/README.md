# ACADEMY 03 — SCRIPTING & PYTHON

Station automation runs on **LUNA-1 Ubuntu Server**.

```bash
python3 script.py
```

Deploy:

```text
Earth: git push
LUNA-1: git pull
```

Core Python:

```python
if value >= 10:
    status="OK"

for item in items:
    print(item)

def check(value):
    return value
```

Files:

```python
with open("file.txt","w") as file:
    file.write("text\n")
```

JSON:

```python
import json
data=json.load(file)
json.dump(data,file,indent=2)
```
