from pathlib import Path
import json, subprocess, sys
repo=Path(input("Path to luna-operations on LUNA-1: ").strip())
checks=[]
def check(name,ok):
    checks.append(ok); print(("[PASS] " if ok else "[FAIL] ")+name)
p=repo/"scripts"/"telemetry"/"telemetry_processor.py"
t=repo/"scripts"/"telemetry"/"telemetry.json"
check("processor exists",p.exists())
check("telemetry exists",t.exists())
if t.exists():
    try:
        data=json.loads(t.read_text()); check("JSON parses",True); check("6+ records",len(data)>=6)
    except Exception: check("JSON parses",False)
if p.exists():
    r=subprocess.run([sys.executable,str(p)],cwd=repo); check("processor runs",r.returncode==0)
check("report exists",(repo/"reports"/"life-support-report.txt").exists())
check("processed JSON exists",(repo/"data"/"processed-telemetry.json").exists())
check("error log exists",(repo/"logs"/"telemetry-errors.log").exists())
sys.exit(0 if all(checks) else 1)
