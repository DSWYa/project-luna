# LAB 04 — ERROR HANDLING

Create a **JSON file** named:

```text
broken_telemetry.json
```

Paste:

```json
[
  {"module": "HAB-1", "oxygen": 20.8},
  {"module": "HAB-2", "oxygen": "SENSOR_ERROR"},
  {"module": "LAB-1", "oxygen": 19.9},
  {"module": "STORAGE"}
]
```

Create a **Python file** named:

```text
safe_processor.py
```

Requirements:

- Load the JSON.
- Loop through every record.
- Retrieve module and oxygen.
- Convert oxygen to a float.
- Print valid readings.
- Catch `KeyError`, `ValueError`, and `TypeError`.
- Print a useful error message.
- Continue processing later records.

LAB-1 should still be processed even though HAB-2 is bad.

Extension: count valid and invalid records.
