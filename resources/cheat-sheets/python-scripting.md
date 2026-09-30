# PYTHON & SCRIPTING CHEAT SHEET

Run:

```bat
python script.py
```

Variable:

```python
name = "LUNA-1"
```

Output:

```python
print(name)
print(f"Station: {name}")
```

Input:

```python
value = float(input("Reading: "))
```

Condition:

```python
if value >= 10:
    status = "OK"
elif value >= 5:
    status = "WARNING"
else:
    status = "CRITICAL"
```

Loop:

```python
for item in items:
    print(item)
```

Function:

```python
def evaluate(value):
    return value * 2
```

List:

```python
items = ["A", "B", "C"]
items.append("D")
```

Dictionary:

```python
sensor = {"module": "HAB-1", "oxygen": 20.8}
```

Files:

```python
with open("file.txt", "r") as file:
    data = file.read()

with open("file.txt", "w") as file:
    file.write("text\n")

with open("file.txt", "a") as file:
    file.write("more\n")
```

JSON:

```python
import json
data = json.load(file)
json.dump(data, file, indent=2)
```

Exception:

```python
try:
    value = float(raw)
except ValueError:
    print("Invalid value")
```

Bash:

```bash
name="LUNA-1"
value=$(hostname)
```
