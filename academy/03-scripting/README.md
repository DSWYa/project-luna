# ACADEMY 03 — SCRIPTING, PYTHON & STRUCTURED DATA

This is your Mission 03 reference guide.

## Variables and Types

```python
station = "LUNA-1"   # string
oxygen = 20.8        # float
crew = 4             # integer
online = True        # boolean
```

## Output and Input

```python
print("Hello")
print(f"Oxygen: {oxygen}%")

name = input("Name: ")
value = float(input("Reading: "))
```

## Conditions

```python
if value >= 10:
    status = "OK"
elif value >= 5:
    status = "WARNING"
else:
    status = "CRITICAL"
```

## Lists and Loops

```python
modules = ["HAB-1", "HAB-2"]

for module in modules:
    print(module)
```

## Dictionaries

```python
sensor = {
    "module": "HAB-1",
    "oxygen": 20.8
}
```

## Functions

```python
def evaluate(value):
    if value >= 10:
        return "OK"
    return "LOW"
```

## Text Files

Read:

```python
with open("file.txt", "r") as file:
    data = file.read()
```

Write:

```python
with open("file.txt", "w") as file:
    file.write("text\n")
```

Append:

```python
with open("file.txt", "a") as file:
    file.write("more text\n")
```

## JSON

```python
import json

with open("data.json", "r") as file:
    data = json.load(file)

with open("output.json", "w") as file:
    json.dump(data, file, indent=2)
```

JSON object → Python dictionary  
JSON array → Python list

## CSV

```python
import csv

with open("data.csv", "r", newline="") as file:
    reader = csv.DictReader(file)

    for row in reader:
        print(row)
```

CSV values normally arrive as strings.

## Exceptions

```python
try:
    value = float(raw)
except ValueError:
    print("Invalid number")
```

Multiple expected problems:

```python
except (KeyError, ValueError, TypeError) as error:
    print(error)
```

Malformed JSON:

```python
except json.JSONDecodeError as error:
    print(error)
```

## Bash

Variable:

```bash
station="LUNA-1"
```

Command substitution:

```bash
host=$(hostname)
```

Condition:

```bash
if systemctl is-active --quiet nginx; then
    echo "ONLINE"
else
    echo "OFFLINE"
fi
```

Loop:

```bash
for service in ssh nginx; do
    echo "$service"
done
```

## Automation Design Pattern

```text
INPUT
  ↓
VALIDATE
  ↓
PROCESS
  ↓
OUTPUT
  ↓
LOG
```
