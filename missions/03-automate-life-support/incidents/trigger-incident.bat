@echo off
setlocal EnableExtensions DisableDelayedExpansion
title PROJECT LUNA - INCIDENT 003

echo ========================================
echo       PROJECT LUNA INCIDENT SYSTEM
echo ========================================
echo.
echo Preparing telemetry incident...
echo.

if exist telemetry-incident-lab rmdir /s /q telemetry-incident-lab
mkdir telemetry-incident-lab
cd telemetry-incident-lab

>telemetry.json echo [
>>telemetry.json echo   {
>>telemetry.json echo     "module": "HAB-1",
>>telemetry.json echo     "oxygen": 20.8,
>>telemetry.json echo     "temperature": 22.1,
>>telemetry.json echo     "pressure": 101.2
>>telemetry.json echo   },
>>telemetry.json echo   {
>>telemetry.json echo     "module": "HAB-2",
>>telemetry.json echo     "oxygen": 18.9
>>telemetry.json echo     "temperature": 23.1,
>>telemetry.json echo     "pressure": 100.7
>>telemetry.json echo   },
>>telemetry.json echo   {
>>telemetry.json echo     "module": "LAB-1",
>>telemetry.json echo     "oxygen": 20.2,
>>telemetry.json echo     "temperature": 21.6,
>>telemetry.json echo     "pressure": 101.0
>>telemetry.json echo   }
>>telemetry.json echo ]

>processor.py echo import json
>>processor.py echo.
>>processor.py echo def evaluate_oxygen(value):
>>processor.py echo     if value ^>= 19.5:
>>processor.py echo         return "NOMINAL"
>>processor.py echo     elif value ^>= 18.0:
>>processor.py echo         return "WARNING"
>>processor.py echo     return "CRITICAL"
>>processor.py echo.
>>processor.py echo with open("telemetry.json", "r") as file:
>>processor.py echo     telemetry = json.load(file)
>>processor.py echo.
>>processor.py echo lines = []
>>processor.py echo.
>>processor.py echo for sensor in telemetry:
>>processor.py echo     module = sensor["module"]
>>processor.py echo     oxygen = float(sensor["oxygen"])
>>processor.py echo     status = evaluate_oxygen(oxygen)
>>processor.py echo     lines.append(f"{module}: {oxygen}%% - {status}")
>>processor.py echo.
>>processor.py echo with open("report.txt", "w") as file:
>>processor.py echo     file.write("\n".join(lines))
>>processor.py echo.
>>processor.py echo print("Telemetry report generated.")

echo Incident generated.
echo Enter telemetry-incident-lab and begin investigation.
pause
