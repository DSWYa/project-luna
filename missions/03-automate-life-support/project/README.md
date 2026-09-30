# 🛠️ MISSION 03 FINAL PROJECT — LUNA LIFE-SUPPORT TELEMETRY PROCESSOR

The permanent code lives in `luna-operations`. The runtime is **LUNA-1 Ubuntu Server**.

## Architecture

```text
Windows / Earth Mission Control
        │ push
        ▼
      GitHub
        │ pull
        ▼
LUNA-1 Ubuntu Server
        └── Python telemetry processor
```

## Build

Inside `luna-operations`, create:

```text
data/
logs/
reports/
scripts/telemetry/
```

Inside `scripts/telemetry/` create:

```text
telemetry_processor.py
telemetry.json
README.md
```

`telemetry.json` must contain at least six modules: HAB-1, HAB-2, LAB-1, POWER, STORAGE, COMMS. At least one record should contain an invalid sensor value while keeping valid JSON syntax.

Create reusable evaluation functions for oxygen, temperature, and pressure using the thresholds from the walkthrough/labs. Compute an overall module state using the most severe reading.

Bad records must not terminate the run. Append errors to:

```text
logs/telemetry-errors.log
```

Generate:

```text
reports/life-support-report.txt
data/processed-telemetry.json
```

The text report must contain module results plus calculated totals for total, valid, invalid, nominal, warning, and critical records. Do not hard-code totals.

Document the processor in `scripts/telemetry/README.md`.

Use a branch:

```text
feature/telemetry-processor
```

Push the completed work.

## Deploy to LUNA-1

SSH into LUNA-1:

```bash
cd ~/luna-operations
git pull
python3 scripts/telemetry/telemetry_processor.py
```

Verify on LUNA-1:

```bash
cat reports/life-support-report.txt
cat data/processed-telemetry.json
cat logs/telemetry-errors.log
```

The mission is not complete until the processor works on the Ubuntu VM.
