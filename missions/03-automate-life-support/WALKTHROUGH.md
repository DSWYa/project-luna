# MISSION 03 WALKTHROUGH

Mission 03 uses both machines:

```text
Earth Mission Control = Windows workstation
LUNA-1                = Ubuntu Server VM
```

The station automation runs on LUNA-1.

---

# PART 1 — VERIFY PYTHON ON LUNA-1

From Windows, SSH into LUNA-1:

```text
ssh lunaadmin@YOUR-LUNA-IP
```

On Ubuntu:

```bash
python3 --version
```

If needed:

```bash
sudo apt update
sudo apt install python3 -y
```

---

# PART 2 — CREATE A TRAINING FOLDER

On LUNA-1:

```bash
cd ~
mkdir -p luna-python-training
cd luna-python-training
```

This is a **folder** used for practice.

---

# PART 3 — FIRST PYTHON FILE

Create a **file**:

```text
hello_luna.py
```

Open it:

```bash
nano hello_luna.py
```

Paste:

```python
print("PROJECT LUNA")
print("Telemetry processor online")
```

Save and run:

```bash
python3 hello_luna.py
```

Expected:

```text
PROJECT LUNA
Telemetry processor online
```

---

# PART 4 — VARIABLES AND TYPES

Replace the file with:

```python
station = "LUNA-1"
oxygen = 20.8
crew_count = 4
communications_online = True

print(station)
print(oxygen)
print(crew_count)
print(communications_online)

print(type(station))
print(type(oxygen))
print(type(crew_count))
print(type(communications_online))
```

Common types:

```text
"LUNA-1"   string
20.8       float
4          integer
True       boolean
```

---

# PART 5 — F-STRINGS

Create a **file** named `status_output.py`:

```python
station = "LUNA-1"
oxygen = 20.8

print(f"Station: {station}")
print(f"Oxygen: {oxygen}%")
```

---

# PART 6 — INPUT AND CONVERSION

Create `crew_check.py`:

```python
name = input("Enter engineer name: ")
print(f"Engineer authenticated: {name}")
```

Numbers from `input()` begin as text. Convert when needed:

```python
crew_count = int(input("Enter crew count: "))
oxygen = float(input("Enter oxygen value: "))
```

---

# PART 7 — CONDITIONS

Create `oxygen_check.py`:

```python
oxygen = 18.7

if oxygen >= 19.5:
    print("STATUS: NOMINAL")
elif oxygen >= 18.0:
    print("STATUS: WARNING")
else:
    print("STATUS: CRITICAL")
```

Remember:

```text
=   assign
==  compare
```

---

# PART 8 — MULTIPLE CONDITIONS

```python
oxygen = 20.4
temperature = 22.0

if oxygen >= 19.5 and temperature >= 18 and temperature <= 26:
    print("Habitat conditions nominal")
else:
    print("Habitat requires review")
```

Use `or` when either condition is enough.

---

# PART 9 — LISTS AND LOOPS

Create `modules.py`:

```python
modules = ["HAB-1", "HAB-2", "LAB-1", "POWER"]

for module in modules:
    print(module)
```

---

# PART 10 — DICTIONARIES

Create `sensor_record.py`:

```python
sensor = {
    "module": "HAB-1",
    "oxygen": 20.8,
    "temperature": 22.1
}

print(sensor["module"])
print(sensor["oxygen"])
```

---

# PART 11 — LIST OF DICTIONARIES

```python
sensors = [
    {"module": "HAB-1", "oxygen": 20.8},
    {"module": "HAB-2", "oxygen": 18.9}
]

for sensor in sensors:
    print(sensor["module"], sensor["oxygen"])
```

---

# PART 12 — FUNCTIONS

Create `functions.py`:

```python
def evaluate_oxygen(oxygen):
    if oxygen >= 19.5:
        return "NOMINAL"
    elif oxygen >= 18.0:
        return "WARNING"
    return "CRITICAL"

print(evaluate_oxygen(20.8))
print(evaluate_oxygen(18.5))
print(evaluate_oxygen(17.2))
```

---

# PART 13 — WRITE, READ, AND APPEND FILES

Create `file_demo.py`:

```python
with open("report.txt", "w") as file:
    file.write("PROJECT LUNA\n")
    file.write("STATUS: OPERATIONAL\n")
```

Read:

```python
with open("report.txt", "r") as file:
    contents = file.read()

print(contents)
```

Append:

```python
with open("report.txt", "a") as file:
    file.write("CHECK COMPLETE\n")
```

Modes:

```text
r = read
w = write/replace
a = append
```

---

# PART 14 — JSON

Create a **file** named `telemetry.json`:

```json
[
  {
    "module": "HAB-1",
    "oxygen": 20.8,
    "temperature": 22.1,
    "pressure": 101.2
  },
  {
    "module": "HAB-2",
    "oxygen": 18.8,
    "temperature": 23.5,
    "pressure": 100.8
  }
]
```

Create `read_json.py`:

```python
import json

with open("telemetry.json", "r") as file:
    sensors = json.load(file)

for sensor in sensors:
    print(sensor["module"], sensor["oxygen"])
```

Mapping:

```text
JSON object → Python dictionary
JSON array  → Python list
```

---

# PART 15 — WRITE JSON

Create `write_json.py`:

```python
import json

report = {
    "station": "LUNA-1",
    "status": "OPERATIONAL",
    "alerts": 0
}

with open("status.json", "w") as file:
    json.dump(report, file, indent=2)
```

---

# PART 16 — CSV

Create `telemetry.csv`:

```text
module,oxygen,temperature
HAB-1,20.8,22.1
HAB-2,18.8,23.5
LAB-1,20.2,21.7
```

Create `read_csv.py`:

```python
import csv

with open("telemetry.csv", "r", newline="") as file:
    reader = csv.DictReader(file)

    for row in reader:
        oxygen = float(row["oxygen"])
        print(row["module"], oxygen)
```

---

# PART 17 — EXCEPTIONS

Create `error_demo.py`:

```python
value = "SENSOR_ERROR"

try:
    oxygen = float(value)
    print(oxygen)
except ValueError:
    print("Invalid oxygen reading")
```

Handle several record problems:

```python
except (KeyError, ValueError, TypeError) as error:
    print(f"Invalid telemetry record: {error}")
```

---

# PART 18 — MALFORMED JSON

Create `broken.json`:

```json
[
  {
    "module": "HAB-1"
    "oxygen": 20.8
  }
]
```

Create `json_error.py`:

```python
import json

try:
    with open("broken.json", "r") as file:
        data = json.load(file)
except FileNotFoundError:
    print("Telemetry file not found")
except json.JSONDecodeError as error:
    print(f"Telemetry JSON is malformed: {error}")
```

---

# PART 19 — BASIC PROCESSOR

Create `processor.py`:

```python
import json


def evaluate_oxygen(value):
    if value >= 19.5:
        return "NOMINAL"
    elif value >= 18.0:
        return "WARNING"
    return "CRITICAL"


with open("telemetry.json", "r") as file:
    sensors = json.load(file)

for sensor in sensors:
    try:
        module = sensor["module"]
        oxygen = float(sensor["oxygen"])
        status = evaluate_oxygen(oxygen)
        print(f"{module}: O2 {oxygen}% - {status}")
    except (KeyError, ValueError, TypeError) as error:
        print(f"Invalid telemetry record: {error}")
```

---

# PART 20 — BASH CONDITIONS

Create `~/service-check.sh`:

```bash
#!/bin/bash

service_name="nginx"

if systemctl is-active --quiet "$service_name"; then
    echo "$service_name: ONLINE"
else
    echo "$service_name: OFFLINE"
fi
```

Make executable:

```bash
chmod +x ~/service-check.sh
~/service-check.sh
```

---

# PART 21 — BASH LOOPS

Create `~/service-list.sh`:

```bash
#!/bin/bash

services="ssh nginx"

for service in $services; do
    if systemctl is-active --quiet "$service"; then
        echo "$service: ONLINE"
    else
        echo "$service: OFFLINE"
    fi
done
```

---

# PART 22 — GIT DEPLOYMENT TO LUNA-1

The permanent project belongs in `luna-operations`.

Earth Mission Control:

```text
edit → git add → git commit → git push
```

LUNA-1:

```bash
cd ~/luna-operations
git pull
```

If the repo is not on LUNA-1 yet:

```bash
cd ~
git clone YOUR-LUNA-OPERATIONS-URL
```

This is your first simple deployment workflow.

---

# PART 23 — COMPLETE LABS

Complete all files in `labs/`, then move to `project/README.md`.
