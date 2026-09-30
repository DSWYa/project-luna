# LAB 04 — ERROR HANDLING

Perform on **LUNA-1**.

Create valid JSON containing good and bad records:

```json
[
  {"module":"HAB-1","oxygen":20.8},
  {"module":"HAB-2","oxygen":"SENSOR_ERROR"},
  {"module":"LAB-1","oxygen":19.9},
  {"module":"STORAGE"}
]
```

Build `safe_processor.py` that catches `KeyError`, `ValueError`, and `TypeError`, continues processing, and counts valid/invalid rows.
