# 🚨 INCIDENT INC-003

This incident runs on **LUNA-1**.

Update the course repo on Ubuntu:

```bash
cd ~/project-luna
git pull
```

Then:

```bash
cd ~/project-luna/missions/03-automate-life-support/incidents
chmod +x trigger-incident.sh
./trigger-incident.sh
```

The simulator creates:

```text
~/luna-incident-03
```

Enter it:

```bash
cd ~/luna-incident-03
python3 processor.py
```

Determine whether code or input data failed. Success means `report.txt` is created.
