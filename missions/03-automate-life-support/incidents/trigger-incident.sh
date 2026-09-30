#!/bin/bash
set -e
LAB="$HOME/luna-incident-03"
rm -rf "$LAB"
mkdir -p "$LAB"
cat > "$LAB/telemetry.json" <<'EOF'
[
  {"module":"HAB-1","oxygen":20.8,"temperature":22.1,"pressure":101.2},
  {"module":"HAB-2","oxygen":18.9 "temperature":23.1,"pressure":100.7},
  {"module":"LAB-1","oxygen":20.2,"temperature":21.6,"pressure":101.0}
]
EOF
cat > "$LAB/processor.py" <<'EOF'
import json
with open("telemetry.json","r") as file:
    data=json.load(file)
with open("report.txt","w") as file:
    for row in data:
        file.write(f'{row["module"]}: {row["oxygen"]}\n')
print("Telemetry report generated.")
EOF
echo "Incident generated at $LAB"
