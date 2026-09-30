from pathlib import Path
import json
import subprocess
import sys

print("=" * 52)
print("           PROJECT LUNA VALIDATION")
print("                 MISSION 03")
print("=" * 52)

raw = input("\nEnter full path to your luna-operations repo: ").strip().strip('"')
repo = Path(raw)

passed = 0
failed = 0

def result(label, ok, details=""):
    global passed, failed
    print(f"[{'PASS' if ok else 'FAIL'}] {label}")
    passed += int(ok)
    failed += int(not ok)
    if details:
        print(f"       {details}")

if not repo.exists():
    print("[FAIL] Repository path does not exist.")
    sys.exit(1)

processor = repo / "scripts" / "telemetry" / "telemetry_processor.py"
telemetry = repo / "scripts" / "telemetry" / "telemetry.json"
readme = repo / "scripts" / "telemetry" / "README.md"

result("telemetry_processor.py exists", processor.exists())
result("telemetry.json exists", telemetry.exists())
result("telemetry README exists", readme.exists())

if telemetry.exists():
    try:
        data = json.loads(telemetry.read_text(encoding="utf-8"))
        result("Telemetry JSON syntax is valid", True)
        result("At least six telemetry records exist",
               isinstance(data, list) and len(data) >= 6)
    except Exception as exc:
        result("Telemetry JSON syntax is valid", False, str(exc))

if processor.exists():
    try:
        completed = subprocess.run(
            [sys.executable, str(processor)],
            cwd=repo,
            capture_output=True,
            text=True,
            timeout=15
        )
        result("Processor exits successfully",
               completed.returncode == 0,
               completed.stderr.strip() if completed.returncode else "")
    except Exception as exc:
        result("Processor executes", False, str(exc))

result("Human report generated",
       (repo / "reports" / "life-support-report.txt").exists())

processed = repo / "data" / "processed-telemetry.json"
result("Processed JSON generated", processed.exists())

if processed.exists():
    try:
        json.loads(processed.read_text(encoding="utf-8"))
        result("Processed JSON syntax is valid", True)
    except Exception as exc:
        result("Processed JSON syntax is valid", False, str(exc))

result("Error log generated",
       (repo / "logs" / "telemetry-errors.log").exists())

print("\n" + "=" * 52)
print(f"Passed: {passed}")
print(f"Failed: {failed}")
print("=" * 52)
sys.exit(0 if failed == 0 else 1)
