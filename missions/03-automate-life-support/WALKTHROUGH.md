# MISSION 03 WALKTHROUGH

Mission 03 takes place primarily on **Earth Mission Control — your normal computer**.

This walkthrough is intentionally explicit. Every time you create something, it will tell you whether it is a **file** or **folder**, where it belongs, what to paste inside it, and what you should expect.

---

# PART 1 — VERIFY PYTHON

Open **Command Prompt**.

Run:

```bat
python --version
```

If that fails:

```bat
py --version
```

You need Python 3.

If neither command works:

1. Open a browser.
2. Search for the official Python website.
3. Download the current Python 3 Windows installer.
4. Run it.
5. If offered, enable **Add Python to PATH**.
6. Finish installation.
7. Close and reopen Command Prompt.
8. Run `python --version` again.

Do not continue until Python responds.

---

# PART 2 — CREATE THE TRAINING FOLDER

Create a **folder** for practice files:

```bat
cd /d %USERPROFILE%\Documents
mkdir luna-python-training
cd luna-python-training
```

Turn this folder into a Git repository:

```bat
git init
```

---

# PART 3 — CREATE THE README FILE

Open `luna-python-training` in VS Code.

Create a **file** named:

```text
README.md
```

Paste:

```markdown
# LUNA Python Training

Mission 03 scripting laboratory.
```

Save.

Commit:

```bat
git add .
git commit -m "Initialize Mission 03 Python training"
```

---

# PART 4 — YOUR FIRST PYTHON FILE

Create a **file** in `luna-python-training` named:

```text
hello_luna.py
```

Paste:

```python
print("PROJECT LUNA")
print("Telemetry processor online")
```

Run:

```bat
python hello_luna.py
```

Expected:

```text
PROJECT LUNA
Telemetry processor online
```

`print()` displays output.

---

# PART 5 — VARIABLES AND TYPES

Replace `hello_luna.py` with:

```python
station = "LUNA-1"
oxygen = 20.8
crew_count = 4
communications_online = True

print(station)
print(oxygen)
print(crew_count)
print(communications_online)
```

Common types:

```text
"LUNA-1"   string
20.8       float
4          integer
True       boolean
```

Add:

```python
print(type(station))
print(type(oxygen))
print(type(crew_count))
print(type(communications_online))
```

Run it again.

---

# PART 6 — F-STRINGS

Create a **file**:

```text
status_output.py
```

Paste:

```python
station = "LUNA-1"
oxygen = 20.8

print(f"Station: {station}")
print(f"Oxygen: {oxygen}%")
```

The `f` lets Python insert values from `{}` into text.

---

# PART 7 — USER INPUT

Create:

```text
crew_check.py
```

Paste:

```python
name = input("Enter engineer name: ")
print(f"Engineer authenticated: {name}")
```

Run it.

Now try:

```python
crew_count = input("Enter crew count: ")
print(type(crew_count))
```

`input()` returns text.

Convert it:

```python
crew_count = int(input("Enter crew count: "))
print(type(crew_count))
```

Common conversions:

```python
int("5")
float("20.5")
str(100)
```

---

# PART 8 — CONDITIONS

Create:

```text
oxygen_check.py
```

Paste:

```python
oxygen = 18.7

if oxygen >= 19.5:
    print("STATUS: NOMINAL")
elif oxygen >= 18.0:
    print("STATUS: WARNING")
else:
    print("STATUS: CRITICAL")
```

Comparison operators:

```text
==   equal
!=   not equal
>    greater than
<    less than
>=   greater than or equal
<=   less than or equal
```

`=` assigns a value.  
`==` compares values.

---

# PART 9 — COMBINING CONDITIONS

Replace `oxygen_check.py` with:

```python
oxygen = 20.4
temperature = 22.0

if oxygen >= 19.5 and temperature >= 18 and temperature <= 26:
    print("Habitat conditions nominal")
else:
    print("Habitat requires review")
```

`and` requires both conditions.

Example using `or`:

```python
if oxygen < 18 or temperature > 30:
    print("CRITICAL")
```

---

# PART 10 — LISTS AND LOOPS

Create:

```text
modules.py
```

Paste:

```python
modules = ["HAB-1", "HAB-2", "LAB-1", "POWER"]

for module in modules:
    print(module)
```

A list stores multiple values.

A `for` loop repeats the indented code for each value.

---

# PART 11 — DICTIONARIES

Create:

```text
sensor_record.py
```

Paste:

```python
sensor = {
    "module": "HAB-1",
    "oxygen": 20.8,
    "temperature": 22.1
}

print(sensor["module"])
print(sensor["oxygen"])
```

A dictionary stores key/value pairs.

---

# PART 12 — LISTS OF DICTIONARIES

Replace `sensor_record.py` with:

```python
sensors = [
    {"module": "HAB-1", "oxygen": 20.8},
    {"module": "HAB-2", "oxygen": 18.9}
]

for sensor in sensors:
    oxygen = sensor["oxygen"]

    if oxygen >= 19.5:
        status = "NOMINAL"
    elif oxygen >= 18.0:
        status = "WARNING"
    else:
        status = "CRITICAL"

    print(f'{sensor["module"]}: {status}')
```

This structure appears constantly in real software.

---

# PART 13 — FUNCTIONS

Create:

```text
functions.py
```

Paste:

```python
def evaluate_oxygen(oxygen):
    if oxygen >= 19.5:
        return "NOMINAL"
    elif oxygen >= 18.0:
        return "WARNING"
    else:
        return "CRITICAL"


print(evaluate_oxygen(20.8))
print(evaluate_oxygen(18.5))
print(evaluate_oxygen(17.2))
```

A function packages reusable logic.

`return` sends a result back to the caller.

---

# PART 14 — WRITE A TEXT FILE

Create:

```text
write_report.py
```

Paste:

```python
with open("report.txt", "w") as file:
    file.write("PROJECT LUNA\n")
    file.write("STATUS: OPERATIONAL\n")
```

Run it.

Python creates a **file** named:

```text
report.txt
```

`"w"` means write/replace.

---

# PART 15 — READ AND APPEND FILES

Read:

```python
with open("report.txt", "r") as file:
    contents = file.read()

print(contents)
```

`"r"` means read.

Append:

```python
with open("report.txt", "a") as file:
    file.write("CHECK COMPLETE\n")
```

`"a"` adds content without replacing the existing file.

---

# PART 16 — CREATE A JSON FILE

Create a **file**:

```text
telemetry.json
```

Paste:

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

JSON basics:

- `{}` = object
- `[]` = array
- keys/text use double quotes
- fields are separated by commas

---

# PART 17 — READ JSON

Create:

```text
read_json.py
```

Paste:

```python
import json

with open("telemetry.json", "r") as file:
    sensors = json.load(file)

for sensor in sensors:
    print(sensor["module"])
    print(sensor["oxygen"])
```

Run it.

JSON object → Python dictionary  
JSON array → Python list

---

# PART 18 — WRITE JSON

Create:

```text
write_json.py
```

Paste:

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

Run it.

Python creates:

```text
status.json
```

---

# PART 19 — CREATE A CSV FILE

Create a **file**:

```text
telemetry.csv
```

Paste:

```text
module,oxygen,temperature
HAB-1,20.8,22.1
HAB-2,18.8,23.5
LAB-1,20.2,21.7
```

CSV is a flat row/column format commonly used by spreadsheets and exports.

---

# PART 20 — READ CSV

Create:

```text
read_csv.py
```

Paste:

```python
import csv

with open("telemetry.csv", "r", newline="") as file:
    reader = csv.DictReader(file)

    for row in reader:
        print(row["module"], row["oxygen"])
```

CSV values arrive as strings.

Convert numeric values:

```python
oxygen = float(row["oxygen"])
```

---

# PART 21 — EXCEPTIONS

Create:

```text
error_demo.py
```

Paste:

```python
value = "SENSOR_ERROR"
oxygen = float(value)
```

Run it.

You should receive a `ValueError`.

Now replace it with:

```python
value = "SENSOR_ERROR"

try:
    oxygen = float(value)
    print(oxygen)
except ValueError:
    print("Invalid oxygen reading")
```

The error is now handled.

---

# PART 22 — HANDLE BAD SENSOR RECORDS

Create:

```text
safe_record.py
```

Paste:

```python
sensor = {
    "module": "HAB-1",
    "oxygen": "ERROR"
}

try:
    module = sensor["module"]
    oxygen = float(sensor["oxygen"])
    print(f"{module}: {oxygen}")
except (KeyError, ValueError, TypeError) as error:
    print(f"Invalid telemetry record: {error}")
```

These exceptions cover several common telemetry problems.

---

# PART 23 — MALFORMED JSON

Create a **file**:

```text
broken.json
```

Paste:

```json
[
  {
    "module": "HAB-1"
    "oxygen": 20.8
  }
]
```

This is invalid JSON because a comma is missing.

Create:

```text
json_error.py
```

Paste:

```python
import json

try:
    with open("broken.json", "r") as file:
        data = json.load(file)

    print(data)

except FileNotFoundError:
    print("Telemetry file not found")

except json.JSONDecodeError as error:
    print(f"Telemetry JSON is malformed: {error}")
```

Run it.

This teaches an important difference:

```text
Valid JSON containing a bad sensor value
                ≠
Malformed JSON syntax
```

---

# PART 24 — BUILD A SMALL PROCESSOR

Create:

```text
processor.py
```

Paste:

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
    module = sensor["module"]
    oxygen = float(sensor["oxygen"])
    status = evaluate_oxygen(oxygen)

    print(f"{module}: O2 {oxygen}% - {status}")
```

You now have the basic shape of the final project.

---

# PART 25 — CONTINUE AFTER A BAD RECORD

Change record processing to:

```python
for sensor in sensors:
    try:
        module = sensor["module"]
        oxygen = float(sensor["oxygen"])
        status = evaluate_oxygen(oxygen)

        print(f"{module}: {status}")

    except (KeyError, ValueError, TypeError) as error:
        print(f"Invalid telemetry record: {error}")
```

One bad sensor no longer has to stop every later record.

---

# PART 26 — BASH CONDITIONS

SSH into LUNA-1.

Create a **file**:

```text
~/service-check.sh
```

Open it:

```bash
nano ~/service-check.sh
```

Paste:

```bash
#!/bin/bash

service_name="nginx"

if systemctl is-active --quiet "$service_name"; then
    echo "$service_name: ONLINE"
else
    echo "$service_name: OFFLINE"
fi
```

Make it executable:

```bash
chmod +x ~/service-check.sh
```

Run:

```bash
~/service-check.sh
```

---

# PART 27 — BASH LOOPS

Create a **file**:

```text
~/service-list.sh
```

Paste:

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

Make it executable and run it.

---

# PART 28 — BASH RUNNING PYTHON

A Bash script can run another program:

```bash
#!/bin/bash

echo "Starting telemetry processor..."
python3 processor.py
echo "Telemetry processor finished."
```

This is useful when several commands need to run in sequence.

---

# PART 29 — COMMIT YOUR TRAINING WORK

Back in `luna-python-training`:

```bat
git status
git add .
git commit -m "Complete Python and telemetry training"
```

---

# PART 30 — COMPLETE THE LABS

Complete:

```text
labs/01-python-basics.md
labs/02-logic-functions.md
labs/03-json-csv.md
labs/04-error-handling.md
```

Then continue to:

```text
project/README.md
```
