@echo off
setlocal
title PROJECT LUNA - INCIDENT GENERATOR

echo ========================================
echo       PROJECT LUNA INCIDENT SYSTEM
echo ========================================
echo.
echo Preparing Mission Control simulation...
echo.

where git >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git was not found.
    echo Complete the Mission 02 walkthrough first.
    pause
    exit /b 1
)

if exist conflict-lab (
    echo Removing previous disposable conflict lab...
    rmdir /s /q conflict-lab
)

mkdir conflict-lab
cd conflict-lab

git init -b main >nul 2>&1
git config user.name "LUNA Incident Simulator"
git config user.email "simulator@project-luna.local"

(
echo # LUNA Communications Status
echo.
echo STATUS: OPERATIONAL
) > STATUS.md

git add STATUS.md >nul
git commit -m "Initialize communications status" >nul

git switch -c earth-control >nul 2>&1

(
echo # LUNA Communications Status
echo.
echo STATUS: DEGRADED - EARTH RELAY INVESTIGATION
) > STATUS.md

git add STATUS.md >nul
git commit -m "Update status from Earth Control" >nul

git switch main >nul 2>&1

(
echo # LUNA Communications Status
echo.
echo STATUS: DEGRADED - LUNAR RELAY INVESTIGATION
) > STATUS.md

git add STATUS.md >nul
git commit -m "Update status from Lunar Operations" >nul

git merge earth-control >nul 2>&1

echo.
echo Incident generated.
echo.
echo Mission Control synchronization has failed.
echo The repository requires engineering attention.
echo.
echo Enter the conflict-lab directory and begin investigation.
echo.
pause
