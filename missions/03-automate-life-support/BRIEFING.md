# ⚙️ MISSION 03 — AUTOMATE LIFE SUPPORT

**MISSION ID:** LUNA-M03  
**OBJECTIVE:** Build and deploy LUNA-1's first automated telemetry-processing system

---

## Mission Briefing

LUNA-1 is online, but humans are still checking too much manually. Environmental systems produce oxygen, temperature, pressure, power, and communications data. The station needs software that can read that data, detect abnormal conditions, survive bad records, and generate useful reports.

## Project LUNA Infrastructure Rule

```text
🌎 EARTH MISSION CONTROL
Windows workstation
├── VS Code
├── Git / GitHub
├── browser
└── SSH client
        │
        ▼
🌑 LUNA-1
Ubuntu Server VM
├── station scripts
├── automation
├── databases
└── future server applications
```

You may edit and document code on Earth Mission Control. **Station-side software must ultimately run on LUNA-1.**

Mission 03 teaches Python, Bash, JSON, CSV, error handling, and a simple Git-based deployment workflow.

Open `OBJECTIVES.md`, then `WALKTHROUGH.md`.
