# 🛠️ MISSION 03 FINAL PROJECT

# LUNA LIFE-SUPPORT TELEMETRY PROCESSOR

This project combines only skills introduced during Mission 03.

## 1 — Create the Folders

Inside your permanent `luna-operations` repository, create these **folders** if needed:

```text
reports
logs
data
```

Inside `scripts`, create a **folder**:

```text
telemetry
```

Expected structure:

```text
luna-operations/
├── data/
├── logs/
├── reports/
└── scripts/
    └── telemetry/
```

## 2 — Create the Input File

Inside `scripts/telemetry`, create a **file**:

```text
telemetry.json
```

Add at least six records for:

- HAB-1
- HAB-2
- LAB-1
- POWER
- STORAGE
- COMMS

Normal records contain:

```text
module
oxygen
temperature
pressure
```

At least one record must contain an invalid sensor value while the JSON syntax remains valid.

Example:

```json
{
  "module": "STORAGE",
  "oxygen": "SENSOR_ERROR",
  "temperature": 19.4,
  "pressure": 100.6
}
```

## 3 — Create the Python Program

Inside `scripts/telemetry`, create a **Python file**:

```text
telemetry_processor.py
```

It must load `telemetry.json`.

## 4 — Evaluation Functions

Create separate functions for oxygen, temperature, and pressure.

Oxygen:

```text
>= 19.5      NOMINAL
18.0-19.49   WARNING
< 18.0       CRITICAL
```

Temperature:

```text
18-26        NOMINAL
15-17.99     WARNING
26.01-30     WARNING
< 15         CRITICAL
> 30         CRITICAL
```

Pressure:

```text
98-103       NOMINAL
95-97.99     WARNING
103.01-106   WARNING
< 95         CRITICAL
> 106        CRITICAL
```

## 5 — Overall Status

For each valid module:

- Any CRITICAL sensor → CRITICAL
- Otherwise any WARNING sensor → WARNING
- Otherwise → NOMINAL

## 6 — Handle Bad Records

Catch expected record errors such as:

```text
KeyError
ValueError
TypeError
```

A bad module must not stop later valid modules.

## 7 — Create an Error Log

Write errors to:

```text
logs/telemetry-errors.log
```

Use append mode:

```python
"a"
```

Include the module name when available.

## 8 — Create a Human Report

Generate:

```text
reports/life-support-report.txt
```

Include each valid module's readings and statuses.

At the bottom include generated totals:

```text
TOTAL RECORDS:
VALID:
INVALID:
NOMINAL:
WARNING:
CRITICAL:
```

Do not hard-code the totals.

## 9 — Create Processed JSON

Generate:

```text
data/processed-telemetry.json
```

Each valid processed record must include at least:

```text
module
oxygen
temperature
pressure
overall_status
```

Use:

```python
json.dump(..., indent=2)
```

## 10 — Terminal Summary

Print a concise summary when the program finishes.

## 11 — Documentation

Inside `scripts/telemetry`, create a **Markdown file**:

```text
README.md
```

Document:

- purpose,
- input,
- outputs,
- thresholds,
- how to run,
- error behavior.

## 12 — Git Workflow

Create a branch:

```text
feature/telemetry-processor
```

Use multiple meaningful commits.

Merge into `main`.

Push the final work.

## Self-Check

```text
[ ] folders exist
[ ] telemetry.json exists
[ ] six or more records exist
[ ] one sensor value is invalid
[ ] telemetry_processor.py exists
[ ] oxygen function works
[ ] temperature function works
[ ] pressure function works
[ ] overall status works
[ ] bad record does not crash processing
[ ] error log is generated
[ ] human report is generated
[ ] processed JSON is generated
[ ] summary prints
[ ] README documents the tool
[ ] branch was merged
[ ] final work was pushed
```

Continue to `../incidents/INCIDENT-03.md`.
