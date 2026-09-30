# 🚨 INCIDENT INC-003

**PRIORITY:** CRITICAL  
**SYSTEM:** Life-Support Telemetry Pipeline

Mission Control reports that a previously working telemetry processor stopped after a sensor synchronization.

No code deployment was scheduled.

## Run the Simulator

Open Command Prompt and navigate to:

```text
project-luna\missions\03-automate-life-support\incidents
```

Run:

```bat
trigger-incident.bat
```

It creates a disposable **folder**:

```text
telemetry-incident-lab
```

Do not inspect the simulator before solving the incident.

Enter:

```bat
cd telemetry-incident-lab
```

Run:

```bat
python processor.py
```

## Objective

Determine:

1. What exception occurs.
2. Which file causes it.
3. Whether the root cause is code or input data.
4. The smallest correction required.

Success means `python processor.py` completes and creates `report.txt`.

If stuck after about 15 minutes, open `hint-1.md`.
