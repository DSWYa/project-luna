@echo off
setlocal EnableExtensions DisableDelayedExpansion
title PROJECT LUNA - MISSION 02 VALIDATOR

echo ================================================
echo           PROJECT LUNA VALIDATION
echo                 MISSION 02
echo ================================================
echo.
echo This validator checks the LOCAL luna-operations
echo repository. GitHub Issue completion and screenshot
echo quality still require your own review.
echo.

set /p "REPO=Enter full path to your luna-operations folder: "

if not exist "%REPO%\" (
    echo.
    echo [FAIL] Directory does not exist.
    goto :FAILED
)

set /a PASS=0
set /a FAIL=0

call :check_dir ".git" "Git repository metadata"
call :check_file "README.md" "README.md exists"
call :check_file ".gitignore" ".gitignore exists"
call :check_file "docs\architecture.md" "Architecture documentation exists"
call :check_file "docs\mission-01.md" "Mission 01 retrospective exists"

if exist "%REPO%\scripts\" (
    echo [PASS] scripts directory exists
    set /a PASS+=1
) else (
    echo [FAIL] scripts directory exists
    set /a FAIL+=1
)

if exist "%REPO%\screenshots\" (
    echo [PASS] screenshots directory exists
    set /a PASS+=1
) else (
    echo [FAIL] screenshots directory exists
    set /a FAIL+=1
)

git -C "%REPO%" remote get-url origin >nul 2>&1
if errorlevel 1 (
    echo [FAIL] origin remote configured
    set /a FAIL+=1
) else (
    echo [PASS] origin remote configured
    set /a PASS+=1
)

for /f %%A in ('git -C "%REPO%" rev-list --count HEAD 2^>nul') do set "COMMITS=%%A"

if not defined COMMITS (
    echo [FAIL] Commit history detected
    set /a FAIL+=1
) else (
    echo [INFO] Commit count: %COMMITS%
    if %COMMITS% GEQ 5 (
        echo [PASS] At least five commits
        set /a PASS+=1
    ) else (
        echo [FAIL] At least five commits
        set /a FAIL+=1
    )
)

for /f "delims=" %%A in ('git -C "%REPO%" branch --show-current 2^>nul') do set "BRANCH=%%A"

if /I "%BRANCH%"=="main" (
    echo [PASS] Current branch is main
    set /a PASS+=1
) else (
    echo [FAIL] Current branch is main
    echo        Current branch: %BRANCH%
    set /a FAIL+=1
)

for /f "delims=" %%A in ('git -C "%REPO%" status --porcelain 2^>nul') do set "DIRTY=1"

if defined DIRTY (
    echo [FAIL] Working tree is clean
    set /a FAIL+=1
) else (
    echo [PASS] Working tree is clean
    set /a PASS+=1
)

findstr /I /C:"LUNA" "%REPO%\README.md" >nul 2>&1
if errorlevel 1 (
    echo [FAIL] README identifies Project LUNA
    set /a FAIL+=1
) else (
    echo [PASS] README identifies Project LUNA
    set /a PASS+=1
)

echo.
echo ================================================
echo Passed: %PASS%
echo Failed: %FAIL%
echo ================================================

if %FAIL% EQU 0 (
    echo.
    echo MISSION 02 LOCAL VALIDATION: PASS
    echo.
    echo Manually confirm:
    echo - GitHub repository is public and current
    echo - Architecture branch was merged
    echo - GitHub Issue was created and closed
    echo - Required screenshots are meaningful
    echo.
    exit /b 0
)

:FAILED
echo.
echo MISSION 02 NOT YET VALIDATED
echo Review failed checks and try again.
echo.
exit /b 1

:check_file
if exist "%REPO%\%~1" (
    echo [PASS] %~2
    set /a PASS+=1
) else (
    echo [FAIL] %~2
    set /a FAIL+=1
)
exit /b

:check_dir
if exist "%REPO%\%~1\" (
    echo [PASS] %~2
    set /a PASS+=1
) else (
    echo [FAIL] %~2
    set /a FAIL+=1
)
exit /b
