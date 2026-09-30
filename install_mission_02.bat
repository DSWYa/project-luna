@echo off
setlocal EnableExtensions DisableDelayedExpansion
title Project LUNA - Mission 02 Installer
cd /d "%~dp0"

echo ==================================================
echo        PROJECT LUNA - MISSION 02 INSTALLER
echo ==================================================
echo.
echo This script must be run from the root of project-luna.
echo.

if not exist "missions" (
    echo ERROR: The "missions" folder was not found.
    echo Put this BAT file in the root of the project-luna repo and run it again.
    echo.
    pause
    exit /b 1
)

if not exist "academy" (
    echo ERROR: The "academy" folder was not found.
    pause
    exit /b 1
)

echo Creating Mission 02 files...
echo.
if not exist "academy\02-git-github" mkdir "academy\02-git-github"
if not exist "missions\02-mission-control" mkdir "missions\02-mission-control"
if not exist "missions\02-mission-control\incidents" mkdir "missions\02-mission-control\incidents"
if not exist "missions\02-mission-control\labs" mkdir "missions\02-mission-control\labs"
if not exist "missions\02-mission-control\project" mkdir "missions\02-mission-control\project"
if not exist "missions\02-mission-control\quiz" mkdir "missions\02-mission-control\quiz"
if not exist "resources\cheat-sheets" mkdir "resources\cheat-sheets"
if not exist "tests\mission-02" mkdir "tests\mission-02"
if exist "academy\02-git-github\.gitkeep" del /q "academy\02-git-github\.gitkeep" >nul 2>&1
if exist "missions\02-mission-control\.gitkeep" del /q "missions\02-mission-control\.gitkeep" >nul 2>&1
if exist "missions\02-mission-control\incidents\.gitkeep" del /q "missions\02-mission-control\incidents\.gitkeep" >nul 2>&1
if exist "missions\02-mission-control\labs\.gitkeep" del /q "missions\02-mission-control\labs\.gitkeep" >nul 2>&1
if exist "missions\02-mission-control\project\.gitkeep" del /q "missions\02-mission-control\project\.gitkeep" >nul 2>&1
if exist "missions\02-mission-control\quiz\.gitkeep" del /q "missions\02-mission-control\quiz\.gitkeep" >nul 2>&1
if exist "resources\cheat-sheets\.gitkeep" del /q "resources\cheat-sheets\.gitkeep" >nul 2>&1
if exist "tests\mission-02\.gitkeep" del /q "tests\mission-02\.gitkeep" >nul 2>&1

echo Writing content...
echo.
>"missions\02-mission-control\BRIEFING.md" type nul
>>"missions\02-mission-control\BRIEFING.md" echo(# 📡 MISSION 02 — MISSION CONTROL
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(**MISSION ID:** LUNA-M02  
>>"missions\02-mission-control\BRIEFING.md" echo(**PRIORITY:** HIGH  
>>"missions\02-mission-control\BRIEFING.md" echo(**ROLE:** Junior Systems Engineer  
>>"missions\02-mission-control\BRIEFING.md" echo(**OBJECTIVE:** Establish version control and Earth-side Mission Control
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(---
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(## Mission Briefing
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(LUNA-1 is online.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(The station now has a functioning Linux command server, remote administration, an HTTP service, and basic operations scripts.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(That creates a new problem.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(The station is beginning to produce files.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(Scripts change. Documentation changes. Configuration changes. Engineers make mistakes. Sometimes a working file needs to be restored. Sometimes two people need to work on the same project without overwriting each other.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(Mission Control needs a reliable way to answer questions such as:
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(- What changed?
>>"missions\02-mission-control\BRIEFING.md" echo(- Who changed it?
>>"missions\02-mission-control\BRIEFING.md" echo(- When did it change?
>>"missions\02-mission-control\BRIEFING.md" echo(- Why did it change?
>>"missions\02-mission-control\BRIEFING.md" echo(- Can we restore an older version?
>>"missions\02-mission-control\BRIEFING.md" echo(- Can two engineers work independently and combine their work later?
>>"missions\02-mission-control\BRIEFING.md" echo(- Is Earth holding the same project as the engineer's computer?
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(The solution is **version control**.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(During this mission, you will learn Git and GitHub.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(---
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(# Git vs GitHub
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(These are related, but they are not the same thing.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(**Git** is version-control software that runs on your computer.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(**GitHub** is an online platform that hosts Git repositories and provides collaboration features around them.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(A useful mental model is:
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(```text
>>"missions\02-mission-control\BRIEFING.md" echo(Git = the version-control engine
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(GitHub = an online home for Git repositories
>>"missions\02-mission-control\BRIEFING.md" echo(```
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(You can use Git without GitHub.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(You can also interact with GitHub through a browser without understanding Git very well.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(Project LUNA will teach both.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(---
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(# Mission Architecture
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(At the end of Mission 01:
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(```text
>>"missions\02-mission-control\BRIEFING.md" echo(          🌎 EARTH
>>"missions\02-mission-control\BRIEFING.md" echo(              │
>>"missions\02-mission-control\BRIEFING.md" echo(         SSH / HTTP
>>"missions\02-mission-control\BRIEFING.md" echo(              │
>>"missions\02-mission-control\BRIEFING.md" echo(              ▼
>>"missions\02-mission-control\BRIEFING.md" echo(             🌑
>>"missions\02-mission-control\BRIEFING.md" echo(           LUNA-1
>>"missions\02-mission-control\BRIEFING.md" echo(       Ubuntu Server
>>"missions\02-mission-control\BRIEFING.md" echo(```
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(At the end of Mission 02:
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(```text
>>"missions\02-mission-control\BRIEFING.md" echo(                       ☁️ GITHUB
>>"missions\02-mission-control\BRIEFING.md" echo(                           │
>>"missions\02-mission-control\BRIEFING.md" echo(                      push │ pull
>>"missions\02-mission-control\BRIEFING.md" echo(                           │
>>"missions\02-mission-control\BRIEFING.md" echo(             ┌─────────────┴─────────────┐
>>"missions\02-mission-control\BRIEFING.md" echo(             │                           │
>>"missions\02-mission-control\BRIEFING.md" echo(             ▼                           ▼
>>"missions\02-mission-control\BRIEFING.md" echo(        🌎 MISSION CONTROL              🌑 LUNA-1
>>"missions\02-mission-control\BRIEFING.md" echo(        Engineer Workspace             Command Server
>>"missions\02-mission-control\BRIEFING.md" echo(             │
>>"missions\02-mission-control\BRIEFING.md" echo(             └────── versioned work ─────┘
>>"missions\02-mission-control\BRIEFING.md" echo(```
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(You will also create the repository that will become your portfolio project for the rest of the bootcamp:
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(```text
>>"missions\02-mission-control\BRIEFING.md" echo(luna-operations
>>"missions\02-mission-control\BRIEFING.md" echo(```
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(Every later mission will add to it.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(---
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(# Your Mission
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(You must learn to:
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(1. Install and configure Git on your workstation.
>>"missions\02-mission-control\BRIEFING.md" echo(2. Understand repositories, commits, and working trees.
>>"missions\02-mission-control\BRIEFING.md" echo(3. Use `git status`.
>>"missions\02-mission-control\BRIEFING.md" echo(4. Stage changes with `git add`.
>>"missions\02-mission-control\BRIEFING.md" echo(5. Save changes with `git commit`.
>>"missions\02-mission-control\BRIEFING.md" echo(6. Inspect history using `git log`.
>>"missions\02-mission-control\BRIEFING.md" echo(7. Compare changes using `git diff`.
>>"missions\02-mission-control\BRIEFING.md" echo(8. Ignore files using `.gitignore`.
>>"missions\02-mission-control\BRIEFING.md" echo(9. Connect a local repository to GitHub.
>>"missions\02-mission-control\BRIEFING.md" echo(10. Push and pull changes.
>>"missions\02-mission-control\BRIEFING.md" echo(11. Clone repositories.
>>"missions\02-mission-control\BRIEFING.md" echo(12. Create and switch branches.
>>"missions\02-mission-control\BRIEFING.md" echo(13. Merge branches.
>>"missions\02-mission-control\BRIEFING.md" echo(14. Understand and resolve a merge conflict.
>>"missions\02-mission-control\BRIEFING.md" echo(15. Write useful Markdown documentation.
>>"missions\02-mission-control\BRIEFING.md" echo(16. Use GitHub Issues for simple work tracking.
>>"missions\02-mission-control\BRIEFING.md" echo(17. Build your permanent `luna-operations` portfolio repository.
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(When Mission Control can reliably track and synchronize LUNA project changes:
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(**Mission 02 is complete.**
>>"missions\02-mission-control\BRIEFING.md" echo(
>>"missions\02-mission-control\BRIEFING.md" echo(Open `OBJECTIVES.md`, then continue to `WALKTHROUGH.md`.
>"missions\02-mission-control\OBJECTIVES.md" type nul
>>"missions\02-mission-control\OBJECTIVES.md" echo(# MISSION 02 — LEARNING OBJECTIVES
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(By the end of this mission, you should be able to explain or demonstrate the following without following the walkthrough line-by-line.
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(---
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(## Git Fundamentals
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Explain the purpose of version control.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Explain the difference between Git and GitHub.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Explain the difference between a repository and a normal folder.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Explain the working tree, staging area, and commit history.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Initialize a Git repository.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Inspect repository state with `git status`.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Stage files with `git add`.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Create commits with useful commit messages.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- View commit history.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Inspect uncommitted changes.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Explain what `.gitignore` does.
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(## Remote Repositories
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Explain local versus remote repositories.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Identify a repository's `origin`.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Clone a GitHub repository.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Push local commits to GitHub.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Pull changes from GitHub.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Explain why pulling before beginning work can prevent problems.
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(## Branches and Merging
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Explain what a branch represents.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Create and switch branches.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Make independent commits on a branch.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Merge a branch into another branch.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Recognize a merge conflict.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Resolve a basic text merge conflict.
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(## Documentation
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Create Markdown headings.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Create lists.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Format inline code and code blocks.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Create links.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Add simple tables.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Write a useful project README.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Document requirements and architecture.
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(## GitHub Workflow
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Create a repository.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Create an Issue.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Use an Issue to describe a unit of work.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Close an Issue after the work is completed.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Navigate repository commit history.
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(---
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(# Mission Completion Standard
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(You are ready for Mission 03 when you can:
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Create a local Git repository from scratch.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Make multiple meaningful commits.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Explain what changed between commits.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Connect a local repository to GitHub.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Push and pull successfully.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Work on a feature branch and merge it.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Resolve a simple merge conflict.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Create readable Markdown documentation.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Maintain a clean working tree.
>>"missions\02-mission-control\OBJECTIVES.md" echo(- Explain why committing everything once at the end is poor version-control practice.
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(You do not need to memorize every Git command.
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(You should understand the lifecycle:
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(```text
>>"missions\02-mission-control\OBJECTIVES.md" echo(EDIT
>>"missions\02-mission-control\OBJECTIVES.md" echo(  ↓
>>"missions\02-mission-control\OBJECTIVES.md" echo(STATUS
>>"missions\02-mission-control\OBJECTIVES.md" echo(  ↓
>>"missions\02-mission-control\OBJECTIVES.md" echo(STAGE
>>"missions\02-mission-control\OBJECTIVES.md" echo(  ↓
>>"missions\02-mission-control\OBJECTIVES.md" echo(COMMIT
>>"missions\02-mission-control\OBJECTIVES.md" echo(  ↓
>>"missions\02-mission-control\OBJECTIVES.md" echo(PUSH
>>"missions\02-mission-control\OBJECTIVES.md" echo(```
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(And when moving between computers:
>>"missions\02-mission-control\OBJECTIVES.md" echo(
>>"missions\02-mission-control\OBJECTIVES.md" echo(```text
>>"missions\02-mission-control\OBJECTIVES.md" echo(PULL
>>"missions\02-mission-control\OBJECTIVES.md" echo(  ↓
>>"missions\02-mission-control\OBJECTIVES.md" echo(WORK
>>"missions\02-mission-control\OBJECTIVES.md" echo(  ↓
>>"missions\02-mission-control\OBJECTIVES.md" echo(COMMIT
>>"missions\02-mission-control\OBJECTIVES.md" echo(  ↓
>>"missions\02-mission-control\OBJECTIVES.md" echo(PUSH
>>"missions\02-mission-control\OBJECTIVES.md" echo(```
>"missions\02-mission-control\WALKTHROUGH.md" type nul
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# MISSION 02 WALKTHROUGH
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Mission 02 takes place primarily on **Earth Mission Control — your normal computer**.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(LUNA-1 will remain important, but Git and GitHub are most useful when you understand how your local workstation, remote GitHub repository, and servers relate to one another.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 1 — VERIFY OR INSTALL GIT
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Open **Command Prompt**.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Run:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git --version
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(If Git is installed, you should receive something similar to:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git version 2.x.x
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(If Git is not recognized:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(1. Open your web browser.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(2. Search for **Git for Windows**.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(3. Open the official `git-scm.com` download page.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(4. Download the current 64-bit Git for Windows installer.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(5. Run the installer.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(6. For this bootcamp, the default installer choices are generally fine.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(7. Finish installation.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(8. Close and reopen Command Prompt.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(9. Run:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git --version
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Do not continue until Git responds.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^> Git for Windows normally includes Git Credential Manager. When you later push to GitHub over HTTPS, Windows may open a browser-based sign-in flow. GitHub does not accept your normal account password as a Git password.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 2 — CONFIGURE YOUR GIT IDENTITY
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Git records an author with every commit.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Check your current settings:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git config --global user.name
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git config --global user.email
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(If they are empty, configure them.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Use the name you want associated with your commits:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git config --global user.name "Your Name"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Then use an email address associated with your GitHub account:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git config --global user.email "you@example.com"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Verify:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git config --global --list
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Do not copy the example email literally.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 3 — CREATE YOUR FIRST TRAINING REPOSITORY
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Go to a safe location such as Documents:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(cd /d %%USERPROFILE%%\Documents
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Create a folder:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(mkdir luna-git-training
>>"missions\02-mission-control\WALKTHROUGH.md" echo(cd luna-git-training
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(At this moment, this is only a normal folder.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Run:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git init
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Git creates a hidden `.git` directory containing repository metadata.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Check:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You should see that you are on a branch and currently have no commits.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(A directory becomes a Git repository because it contains Git repository metadata — not because it exists on GitHub.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 4 — CREATE YOUR FIRST COMMIT
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Create a file:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(echo # LUNA Git Training^> README.md
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Check:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Git should report `README.md` as **untracked**.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(This means Git sees the file, but it has never been added to version history.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Stage it:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git add README.md
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Check again:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(The file is now staged.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Commit it:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git commit -m "Initialize LUNA Git training repository"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Check:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You should see:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(nothing to commit, working tree clean
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# THE THREE AREAS
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(This mental model is important.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(WORKING TREE
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Files you are editing
>>"missions\02-mission-control\WALKTHROUGH.md" echo(      │
>>"missions\02-mission-control\WALKTHROUGH.md" echo(      │ git add
>>"missions\02-mission-control\WALKTHROUGH.md" echo(      ▼
>>"missions\02-mission-control\WALKTHROUGH.md" echo(STAGING AREA
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Changes selected for the next commit
>>"missions\02-mission-control\WALKTHROUGH.md" echo(      │
>>"missions\02-mission-control\WALKTHROUGH.md" echo(      │ git commit
>>"missions\02-mission-control\WALKTHROUGH.md" echo(      ▼
>>"missions\02-mission-control\WALKTHROUGH.md" echo(COMMIT HISTORY
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Saved snapshots
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(`git add` does **not** upload something to GitHub.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(`git commit` does **not** upload something to GitHub.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Those actions are local.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 5 — MODIFY AND INSPECT A FILE
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Open `README.md` in VS Code or Notepad.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Change it to:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# LUNA Git Training
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Mission Control version-control laboratory.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(## Status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Training repository operational.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Save it.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Run:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Now:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git diff
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Git shows the difference between your working file and the last committed version.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Stage it:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git add README.md
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Now try:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git diff
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(The normal diff may appear empty because the change is staged.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(To see staged changes:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git diff --staged
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Commit:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git commit -m "Expand training repository README"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 6 — VIEW HISTORY
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Run:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git log
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Press `q` if Git opens the history in a pager.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(For a compact history:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git log --oneline
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You should see at least two commits.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Commit history is one of Git's biggest benefits.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Instead of files named:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(report-final.txt
>>"missions\02-mission-control\WALKTHROUGH.md" echo(report-final2.txt
>>"missions\02-mission-control\WALKTHROUGH.md" echo(report-final-FINAL.txt
>>"missions\02-mission-control\WALKTHROUGH.md" echo(report-final-FINAL-actually-final.txt
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Git keeps structured history.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 7 — CREATE MULTIPLE SMALL COMMITS
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Create:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(mkdir docs
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Create:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(docs\station-notes.md
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Give it this content:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# Station Notes
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(LUNA-1 is the first operational Project LUNA node.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Check status:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Stage everything currently changed:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git add .
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Commit:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git commit -m "Add initial station documentation"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Create another file:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(docs\communications.md
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Add:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# Communications
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Earth Mission Control connects to LUNA-1 through SSH and HTTP.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Stage and commit it separately:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git add .
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git commit -m "Document Earth to Moon communications"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You should now have several commits that each describe one meaningful change.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 8 — `.gitignore`
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Not every file belongs in version control.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Examples may include:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Temporary files
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Local credentials
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Build output
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Cache directories
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Logs
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Large generated data
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Create:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(.gitignore
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Add:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(*.log
>>"missions\02-mission-control\WALKTHROUGH.md" echo(*.tmp
>>"missions\02-mission-control\WALKTHROUGH.md" echo(.env
>>"missions\02-mission-control\WALKTHROUGH.md" echo(secrets/
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Save it.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Now create:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(echo TEST LOG^> test.log
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Run:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(`test.log` should not appear as an untracked file.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Commit the ignore rules:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git add .gitignore
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git commit -m "Add repository ignore rules"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# IMPORTANT — `.gitignore` IS NOT SECURITY
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(A `.gitignore` file helps prevent accidental tracking.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(It does not erase secrets that were already committed.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Never intentionally commit:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Passwords
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- API keys
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Access tokens
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Private keys
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Real confidential information
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Later missions will discuss secrets in greater depth.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 9 — COMPLETE LAB 01
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Open:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(`labs/01-local-git.md`
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Complete it before continuing.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 10 — CREATE A GITHUB TRAINING REPOSITORY
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Open GitHub in your browser.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Sign in.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(In the upper-right area, click the **+** menu and choose **New repository**.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Repository name:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(luna-git-training
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Description:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Project LUNA Git and GitHub training repository
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Choose:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(**Public**
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(For this exercise, do **not** initialize it with:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- README
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- `.gitignore`
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- License
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Your local repository already contains files.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Click **Create repository**.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(GitHub should show instructions for pushing an existing repository.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Copy the HTTPS repository URL.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(It will resemble:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(https://github.com/YOUR-USERNAME/luna-git-training.git
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 11 — CONNECT LOCAL GIT TO GITHUB
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Return to Command Prompt inside your local training repository.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Check:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git remote -v
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(There should currently be no remote.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Add GitHub as `origin`:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git remote add origin YOUR-REPOSITORY-URL
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Example:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git remote add origin https://github.com/example/luna-git-training.git
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Verify:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git remote -v
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Rename your current branch to `main`:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git branch -M main
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Push it:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git push -u origin main
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Git may ask you to authenticate.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(On a normal Git for Windows installation, Git Credential Manager may open a browser window for GitHub authentication.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Follow the GitHub sign-in prompts.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(When the push completes, refresh your repository page in the browser.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Your files and commits should now appear online.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# LOCAL VS REMOTE
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You now have two related repositories.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(YOUR COMPUTER                   GITHUB
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Local repository        ←→      Remote repository
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(The remote named:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(origin
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(points to your GitHub repository.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Display it:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git remote -v
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 12 — PUSH ANOTHER CHANGE
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Edit:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(docs\station-notes.md
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Add:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Mission Control repository synchronization confirmed.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Save.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Then:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git add docs\station-notes.md
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git commit -m "Confirm Mission Control synchronization"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git push
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Refresh GitHub.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(The new commit should appear.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 13 — PULL A CHANGE FROM GITHUB
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(This time, intentionally make a change using the GitHub website.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(1. Open `README.md` on GitHub.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(2. Click the pencil/edit button.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(3. Add:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(## Remote Test
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(This line was added directly from GitHub.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(4. Click **Commit changes**.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(5. Accept the default commit directly to `main`.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Your remote repository now contains a commit your local computer does not have.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Return to Command Prompt.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Run:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Then:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git pull
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Open `README.md` locally.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(The remote change should now exist on your computer.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(This is the basic synchronization cycle:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git pull
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git push
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 14 — COMPLETE LAB 02
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Open:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(`labs/02-github-remotes.md`
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Complete it before continuing.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 15 — BRANCHES
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(A branch is an independent line of development.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Imagine Mission Control is stable, but you want to experiment with documentation.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Instead of changing `main` immediately, create a branch:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git switch -c docs/improve-readme
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Check:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git branch
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(The `*` indicates your current branch.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Edit `README.md`.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Add:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(## Training Objectives
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Track changes
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Synchronize with GitHub
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Work with branches
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Save.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Then:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git add README.md
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git commit -m "Add training objectives"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Your new commit exists on `docs/improve-readme`.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Switch back:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git switch main
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Look at `README.md`.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Your branch-specific change should disappear.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Nothing was deleted.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You simply changed which branch you are viewing.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 16 — MERGE A BRANCH
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Make sure you are on `main`:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git branch
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Merge:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git merge docs/improve-readme
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Now inspect `README.md`.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(The branch change is part of `main`.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Push:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git push
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You may optionally delete the completed local branch:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git branch -d docs/improve-readme
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 17 — UNDERSTANDING MERGE CONFLICTS
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Git can often combine independent changes automatically.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Suppose one branch changes:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(STATUS: OPERATIONAL
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(to:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(STATUS: MAINTENANCE
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(while another branch changes the same line to:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(STATUS: CRITICAL
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Git cannot safely guess which version is correct.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(It creates a **merge conflict**.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(A conflicted file may contain:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^<^<^<^<^<^<^< HEAD
>>"missions\02-mission-control\WALKTHROUGH.md" echo(STATUS: MAINTENANCE
>>"missions\02-mission-control\WALKTHROUGH.md" echo(=======
>>"missions\02-mission-control\WALKTHROUGH.md" echo(STATUS: CRITICAL
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^>^>^>^>^>^>^> other-branch
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(These are conflict markers.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You resolve the conflict by:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(1. Opening the file.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(2. Deciding what the final content should be.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(3. Removing the conflict markers.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(4. Saving the file.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(5. Staging it.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(6. Committing the resolution.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(For example, you may decide the correct final line is:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(STATUS: CRITICAL
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Then:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bat
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git add STATUS.md
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git commit -m "Resolve station status conflict"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You will practice this shortly.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 18 — COMPLETE LAB 03
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Open:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(`labs/03-branches-merges.md`
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Complete it before continuing.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 19 — MARKDOWN
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Project documentation is part of engineering work.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(GitHub automatically renders Markdown files such as:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(README.md
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Basic Markdown:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# Main Heading
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(## Section
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(### Smaller Section
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Normal paragraph.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(**Bold text**
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(*Italic text*
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(`inline code`
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Item
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Item
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Item
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(A code block:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(````markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```bash
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git status
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git add .
>>"missions\02-mission-control\WALKTHROUGH.md" echo(git commit -m "Example"
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(````
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(A link:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo([GitHub]^(https://github.com^)
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(A table:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^| Service ^| Port ^| Status ^|
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^|---^|---:^|---^|
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^| SSH ^| 22 ^| Online ^|
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^| HTTP ^| 80 ^| Online ^|
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(A checkbox:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- [x] Server online
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- [ ] Database deployed
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# A GOOD README
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(A portfolio README should help a stranger understand the project.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Useful sections include:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Project Name
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Purpose
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Architecture
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Technologies
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Features
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Setup
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Usage
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Screenshots
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Known Limitations
>>"missions\02-mission-control\WALKTHROUGH.md" echo(What I Learned
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Documentation should answer:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^> What is this?
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^> Why does it exist?
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^> How does it work?
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(^> How can someone run it?
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 20 — COMPLETE LAB 04
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Open:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(`labs/04-markdown-documentation.md`
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Complete it before continuing.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 21 — GITHUB ISSUES
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(GitHub Issues provide lightweight work tracking.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Inside your training repository on GitHub:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(1. Click **Issues**.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(2. Click **New issue**.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(3. Title:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Document LUNA-1 network architecture
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(4. In the description, enter:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```markdown
>>"missions\02-mission-control\WALKTHROUGH.md" echo(## Objective
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Add documentation showing how Earth Mission Control communicates with LUNA-1.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(## Acceptance Criteria
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- [ ] Identify SSH
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- [ ] Identify HTTP
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- [ ] Include ports
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(5. Create the issue.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You have now converted an idea into a trackable work item.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(After completing work, issues can be closed.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(This basic pattern appears everywhere in software and infrastructure teams:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Requirement
>>"missions\02-mission-control\WALKTHROUGH.md" echo(   ↓
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Issue / Ticket
>>"missions\02-mission-control\WALKTHROUGH.md" echo(   ↓
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Work
>>"missions\02-mission-control\WALKTHROUGH.md" echo(   ↓
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Commit
>>"missions\02-mission-control\WALKTHROUGH.md" echo(   ↓
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Review / Validation
>>"missions\02-mission-control\WALKTHROUGH.md" echo(   ↓
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Close
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You will encounter more structured workflows later.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(---
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(# PART 22 — PREPARE FOR THE PROJECT
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(The training repository taught the mechanics.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Your final project is different.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(You will now create:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```text
>>"missions\02-mission-control\WALKTHROUGH.md" echo(luna-operations
>>"missions\02-mission-control\WALKTHROUGH.md" echo(```
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(This is **not** a disposable lab.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(It will become your permanent portfolio repository for Project LUNA.
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Later missions will add:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Scripts
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Databases
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- APIs
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Containers
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Monitoring
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Automation
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- AI
>>"missions\02-mission-control\WALKTHROUGH.md" echo(- Kubernetes
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(Proceed to:
>>"missions\02-mission-control\WALKTHROUGH.md" echo(
>>"missions\02-mission-control\WALKTHROUGH.md" echo(`project/README.md`
>"missions\02-mission-control\labs\01-local-git.md" type nul
>>"missions\02-mission-control\labs\01-local-git.md" echo(# LAB 01 — LOCAL VERSION CONTROL
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(## Objective
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Practice the Git edit → stage → commit workflow without using GitHub.
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Create a new folder outside the Project LUNA course repository:
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(```text
>>"missions\02-mission-control\labs\01-local-git.md" echo(luna-local-lab
>>"missions\02-mission-control\labs\01-local-git.md" echo(```
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Initialize it as a Git repository.
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Create:
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(```text
>>"missions\02-mission-control\labs\01-local-git.md" echo(README.md
>>"missions\02-mission-control\labs\01-local-git.md" echo(```
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(with:
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(```markdown
>>"missions\02-mission-control\labs\01-local-git.md" echo(# LUNA Local Lab
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Local version-control test.
>>"missions\02-mission-control\labs\01-local-git.md" echo(```
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Create your first commit.
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Then create:
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(```text
>>"missions\02-mission-control\labs\01-local-git.md" echo(status.txt
>>"missions\02-mission-control\labs\01-local-git.md" echo(```
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(containing:
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(```text
>>"missions\02-mission-control\labs\01-local-git.md" echo(LUNA-1 ONLINE
>>"missions\02-mission-control\labs\01-local-git.md" echo(```
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Commit it separately.
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Then change it to:
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(```text
>>"missions\02-mission-control\labs\01-local-git.md" echo(LUNA-1 ONLINE
>>"missions\02-mission-control\labs\01-local-git.md" echo(MISSION CONTROL CONNECTED
>>"missions\02-mission-control\labs\01-local-git.md" echo(```
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Before staging, use Git to inspect exactly what changed.
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Commit the change.
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(---
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(# Completion Requirements
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Your repository should have:
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(- At least three commits.
>>"missions\02-mission-control\labs\01-local-git.md" echo(- A clean working tree.
>>"missions\02-mission-control\labs\01-local-git.md" echo(- A `README.md`.
>>"missions\02-mission-control\labs\01-local-git.md" echo(- A `status.txt`.
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Verify using:
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(```bat
>>"missions\02-mission-control\labs\01-local-git.md" echo(git status
>>"missions\02-mission-control\labs\01-local-git.md" echo(git log --oneline
>>"missions\02-mission-control\labs\01-local-git.md" echo(```
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(---
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(# Questions
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(Before continuing, answer:
>>"missions\02-mission-control\labs\01-local-git.md" echo(
>>"missions\02-mission-control\labs\01-local-git.md" echo(1. What does `git status` tell you?
>>"missions\02-mission-control\labs\01-local-git.md" echo(2. What does `git add` do?
>>"missions\02-mission-control\labs\01-local-git.md" echo(3. What does `git commit` do?
>>"missions\02-mission-control\labs\01-local-git.md" echo(4. Did any of these operations require GitHub?
>>"missions\02-mission-control\labs\01-local-git.md" echo(5. Why might several small commits be more useful than one giant commit?
>"missions\02-mission-control\labs\02-github-remotes.md" type nul
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(# LAB 02 — REMOTE REPOSITORIES
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(## Objective
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Demonstrate synchronization between a local repository and GitHub.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Use your `luna-git-training` repository.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(---
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(# Task 1 — Inspect the Remote
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Run:
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```bat
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(git remote -v
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Identify:
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(- The remote name.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(- The GitHub URL.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(---
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(# Task 2 — Local to GitHub
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Create:
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```text
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(docs\remote-lab.md
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Add:
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```markdown
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(# Remote Lab
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(This file originated on Earth Mission Control.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Commit it.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Push it.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Verify the file appears on GitHub.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(---
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(# Task 3 — GitHub to Local
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Use GitHub's web editor to add this line:
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```markdown
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(This line originated on GitHub.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Commit the change using GitHub.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Return to your computer.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Before opening the file locally, run:
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```bat
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(git pull
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Verify the line arrives.
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(---
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(# Checkpoint
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Explain this diagram in your own words:
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```text
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(LOCAL                     REMOTE
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(  │                          │
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(  │────── git push ─────────^>│
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(  │                          │
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(  │^<───── git pull ──────────│
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(```
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(
>>"missions\02-mission-control\labs\02-github-remotes.md" echo(Also explain why you should normally pull before beginning work on a repository you use from multiple computers.
>"missions\02-mission-control\labs\03-branches-merges.md" type nul
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(# LAB 03 — BRANCHES AND MERGES
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(## Objective
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Create work independently from `main`, then merge it.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Use `luna-git-training`.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Make sure your working tree is clean:
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```bat
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(git status
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Create:
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```bat
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(git switch -c feature/crew-documentation
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Create:
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```text
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(docs\crew.md
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Add:
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```markdown
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(# Crew Systems
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Crew systems documentation placeholder.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Commit the file.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Switch back:
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```bat
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(git switch main
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Verify `docs\crew.md` is not present on `main` yet.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Merge:
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```bat
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(git merge feature/crew-documentation
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Verify the file now exists.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Push `main`.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(---
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(# Second Branch
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Create another branch:
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```bat
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(git switch -c feature/equipment-documentation
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Create:
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```text
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(docs\equipment.md
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(```
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Commit it.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Switch back to `main`.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Merge it.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(Push.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(---
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(# Completion Requirements
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(You should be able to explain:
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(- Why the files disappeared when switching back to `main`.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(- Why they reappeared after the merge.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(- What branch received the changes.
>>"missions\02-mission-control\labs\03-branches-merges.md" echo(- Why experimental work is often safer on a branch.
>"missions\02-mission-control\labs\04-markdown-documentation.md" type nul
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(# LAB 04 — MARKDOWN DOCUMENTATION
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(## Objective
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(Create documentation that another engineer could actually read.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(Inside `luna-git-training`, create:
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(```text
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(docs\luna-1.md
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(```
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(Your document must contain:
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- A level-1 heading.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- At least two level-2 headings.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- A bullet list.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- A numbered list.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- Inline code.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- A fenced code block.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- A table.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- At least two checkboxes.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(Suggested subject:
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(**LUNA-1 Command Server Operations Guide**
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(Include useful Mission 01 information such as:
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- Server purpose.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- SSH port.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- HTTP port.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- Commands used to check services.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(- Basic troubleshooting order.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(Commit and push the documentation.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(Open it on GitHub and verify that the Markdown renders correctly.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(---
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(# Reflection
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(Good documentation should reduce the number of questions the next engineer needs to ask.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(Read your document as if you had never seen Project LUNA.
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(
>>"missions\02-mission-control\labs\04-markdown-documentation.md" echo(Would it still make sense?
>"missions\02-mission-control\project\README.md" type nul
>>"missions\02-mission-control\project\README.md" echo(# 🛠️ MISSION 02 FINAL PROJECT
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# BUILD THE LUNA OPERATIONS REPOSITORY
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(The guided Git training is complete.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(You will now establish the repository that follows you through the remaining missions.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(This is not another training repository.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(This will become your primary Project LUNA portfolio repository.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# Scenario
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(LUNA-1 is producing scripts, reports, architecture decisions, and operational documentation.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Mission Control requires a permanent engineering repository where the station's digital systems can evolve in a controlled way.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Create:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(luna-operations
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(The repository must exist locally **and** on GitHub.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 1 — CREATE THE REPOSITORY
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Create a new local directory named:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(luna-operations
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Initialize it with Git.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Create a corresponding **public GitHub repository** named:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(luna-operations
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Connect the local repository to GitHub using the remote name:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(origin
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(The primary branch must be:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(main
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 2 — BUILD THE INITIAL STRUCTURE
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Create:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(luna-operations/
>>"missions\02-mission-control\project\README.md" echo(├── README.md
>>"missions\02-mission-control\project\README.md" echo(├── .gitignore
>>"missions\02-mission-control\project\README.md" echo(├── docs/
>>"missions\02-mission-control\project\README.md" echo(│   ├── architecture.md
>>"missions\02-mission-control\project\README.md" echo(│   └── mission-01.md
>>"missions\02-mission-control\project\README.md" echo(├── scripts/
>>"missions\02-mission-control\project\README.md" echo(└── screenshots/
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Git does not track empty directories.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(If `scripts` or `screenshots` are empty, you may place a `.gitkeep` file inside them.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 3 — `.gitignore`
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Your `.gitignore` must ignore at least:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(.env
>>"missions\02-mission-control\project\README.md" echo(*.log
>>"missions\02-mission-control\project\README.md" echo(*.tmp
>>"missions\02-mission-control\project\README.md" echo(secrets/
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(You may add additional rules.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 4 — README
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Your `README.md` must contain these sections:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```markdown
>>"missions\02-mission-control\project\README.md" echo(# Project LUNA Operations
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## Overview
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## Current Architecture
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## Technologies
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## Mission Progress
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## Repository Structure
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## Current Status
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Write actual content beneath each section.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Do not leave the headings empty.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Your README should explain that this repository will grow throughout the bootcamp.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 5 — ARCHITECTURE DOCUMENTATION
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Create:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(docs/architecture.md
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Document the current Mission 01 architecture.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Include an ASCII diagram similar in concept to:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(Earth Mission Control
>>"missions\02-mission-control\project\README.md" echo(        │
>>"missions\02-mission-control\project\README.md" echo(   SSH / HTTP
>>"missions\02-mission-control\project\README.md" echo(        │
>>"missions\02-mission-control\project\README.md" echo(        ▼
>>"missions\02-mission-control\project\README.md" echo(     LUNA-1
>>"missions\02-mission-control\project\README.md" echo(  Ubuntu Server
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Your exact design may differ.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Document:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(- LUNA-1's purpose.
>>"missions\02-mission-control\project\README.md" echo(- SSH and its port.
>>"missions\02-mission-control\project\README.md" echo(- HTTP and its port.
>>"missions\02-mission-control\project\README.md" echo(- Nginx's purpose.
>>"missions\02-mission-control\project\README.md" echo(- How Earth Mission Control reaches the server.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 6 — MISSION 01 RETROSPECTIVE
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Create:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(docs/mission-01.md
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Include:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```markdown
>>"missions\02-mission-control\project\README.md" echo(# Mission 01 — Establish the Outpost
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## What I Built
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## Skills Practiced
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## Commands Worth Remembering
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## Incident Summary
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(## What I Learned
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Write these sections in your own words.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(This document is part of your portfolio.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Do not simply copy the course walkthrough.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 7 — COMMIT PROGRESSION
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Your finished repository must contain **at least five commits**.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Do not create all files and commit them at once.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(A reasonable history might resemble:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(Initialize LUNA Operations repository
>>"missions\02-mission-control\project\README.md" echo(Add Mission 01 documentation
>>"missions\02-mission-control\project\README.md" echo(Document current architecture
>>"missions\02-mission-control\project\README.md" echo(Add repository ignore rules
>>"missions\02-mission-control\project\README.md" echo(Improve project README
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Your messages do not need to match those exactly.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(They should describe the work performed.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 8 — USE A BRANCH
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Create a branch named:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(docs/architecture
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Make a meaningful improvement to:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(docs/architecture.md
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Commit it on the branch.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Return to `main`.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Merge the branch into `main`.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(After confirming the merge, you may delete the branch.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 9 — USE A GITHUB ISSUE
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(On GitHub, create an Issue titled:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(Document Mission 01 architecture
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Give it a useful description and checklist.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Complete the architecture documentation.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Then close the Issue.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(This demonstrates that the repository tracks both code **and work**.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 10 — PUSH EVERYTHING
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Push the completed repository to GitHub.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Your local repository must end with:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```bat
>>"missions\02-mission-control\project\README.md" echo(git status
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(reporting:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(nothing to commit, working tree clean
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Your GitHub repository should show the same committed files.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIREMENT 11 — VERIFY FROM ANOTHER LOCATION
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Perform one of these:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(### Option A
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Clone `luna-operations` into a temporary directory on the same computer.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(### Option B
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Clone it onto another computer.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(### Option C
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Clone it onto LUNA-1.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(The purpose is to prove that your GitHub repository can recreate the project elsewhere.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(If you choose LUNA-1:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```bash
>>"missions\02-mission-control\project\README.md" echo(cd ~
>>"missions\02-mission-control\project\README.md" echo(git clone YOUR-LUNA-OPERATIONS-URL
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# REQUIRED EVIDENCE
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Capture:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(1. Your GitHub repository homepage.
>>"missions\02-mission-control\project\README.md" echo(2. Your rendered README.
>>"missions\02-mission-control\project\README.md" echo(3. `git log --oneline`.
>>"missions\02-mission-control\project\README.md" echo(4. `git status` showing a clean working tree.
>>"missions\02-mission-control\project\README.md" echo(5. Your closed GitHub Issue.
>>"missions\02-mission-control\project\README.md" echo(6. Your architecture document rendered on GitHub.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Keep these screenshots in:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo(screenshots/
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(Once added, commit and push them too.
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(---
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(# FINAL SELF-CHECK
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(```text
>>"missions\02-mission-control\project\README.md" echo([ ] luna-operations exists locally
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] luna-operations exists on GitHub
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] origin is configured
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] main is the primary branch
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] README contains meaningful documentation
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] .gitignore exists
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] architecture.md exists
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] mission-01.md exists
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] At least five commits exist
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] A feature branch was used and merged
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] A GitHub Issue was created and closed
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] Repository was cloned elsewhere successfully
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] Screenshots were added
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] Working tree is clean
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo([ ] All final changes were pushed
>>"missions\02-mission-control\project\README.md" echo(```
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(When complete, proceed to:
>>"missions\02-mission-control\project\README.md" echo(
>>"missions\02-mission-control\project\README.md" echo(`../incidents/INCIDENT-02.md`
>"missions\02-mission-control\incidents\INCIDENT-02.md" type nul
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(# 🚨 INCIDENT INC-002
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(**PRIORITY:** HIGH  
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(**SYSTEM:** Mission Control Version Control  
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(**SOURCE:** LUNA Engineering Coordination
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(---
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(# Situation
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Two engineering teams edited the same Mission Control status record.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Git has refused to complete synchronization automatically.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Automated deployment is paused until the repository is returned to a valid state.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(You will reproduce the incident in a disposable training repository.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(The simulator will not modify your `luna-operations` portfolio repository.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(---
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(# Run the Incident Simulator
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Open Command Prompt.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Navigate to:
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```text
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(project-luna\missions\02-mission-control\incidents
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Run:
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```bat
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(trigger-incident.bat
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(The simulator will create:
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```text
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(conflict-lab
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Do not delete the folder.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(When the simulator finishes, enter:
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```bat
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(cd conflict-lab
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(---
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(# Reported Symptoms
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Mission Control reports:
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```text
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(REPOSITORY ........ REACHABLE
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(COMMIT HISTORY .... PRESENT
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(MERGE ............. FAILED
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(WORKING TREE ...... REQUIRES ATTENTION
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(---
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(# Your Objective
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Restore the repository to a valid state.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Determine:
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(1. What Git believes is wrong.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(2. Which file is affected.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(3. What each side attempted to change.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(4. What the final content should be.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(5. How to tell Git that the conflict has been resolved.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(When complete:
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```bat
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(git status
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(```
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(must report a clean working tree.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(The repository must contain a completed merge commit.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(---
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(# Restrictions
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Do not:
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(- Delete the entire repository.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(- Run the incident simulator again to reset the problem.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(- Abort the merge unless you are intentionally restarting your troubleshooting.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(- Open the simulator source to discover exactly how it created the problem.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(Use Git's own information first.
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(If stuck for approximately 15 minutes, open:
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(
>>"missions\02-mission-control\incidents\INCIDENT-02.md" echo(`hint-1.md`
>"missions\02-mission-control\incidents\hint-1.md" type nul
>>"missions\02-mission-control\incidents\hint-1.md" echo(# INCIDENT INC-002 — HINT 1
>>"missions\02-mission-control\incidents\hint-1.md" echo(
>>"missions\02-mission-control\incidents\hint-1.md" echo(When Git is confused about repository state, your first command should usually be:
>>"missions\02-mission-control\incidents\hint-1.md" echo(
>>"missions\02-mission-control\incidents\hint-1.md" echo(```bat
>>"missions\02-mission-control\incidents\hint-1.md" echo(git status
>>"missions\02-mission-control\incidents\hint-1.md" echo(```
>>"missions\02-mission-control\incidents\hint-1.md" echo(
>>"missions\02-mission-control\incidents\hint-1.md" echo(Read the output carefully.
>>"missions\02-mission-control\incidents\hint-1.md" echo(
>>"missions\02-mission-control\incidents\hint-1.md" echo(Git will normally tell you:
>>"missions\02-mission-control\incidents\hint-1.md" echo(
>>"missions\02-mission-control\incidents\hint-1.md" echo(- Whether a merge is occurring.
>>"missions\02-mission-control\incidents\hint-1.md" echo(- Which files require attention.
>>"missions\02-mission-control\incidents\hint-1.md" echo(- What action it expects next.
>>"missions\02-mission-control\incidents\hint-1.md" echo(
>>"missions\02-mission-control\incidents\hint-1.md" echo(If you remain stuck, open `hint-2.md`.
>"missions\02-mission-control\incidents\hint-2.md" type nul
>>"missions\02-mission-control\incidents\hint-2.md" echo(# INCIDENT INC-002 — HINT 2
>>"missions\02-mission-control\incidents\hint-2.md" echo(
>>"missions\02-mission-control\incidents\hint-2.md" echo(Open the file Git identifies as conflicted.
>>"missions\02-mission-control\incidents\hint-2.md" echo(
>>"missions\02-mission-control\incidents\hint-2.md" echo(Look for markers resembling:
>>"missions\02-mission-control\incidents\hint-2.md" echo(
>>"missions\02-mission-control\incidents\hint-2.md" echo(```text
>>"missions\02-mission-control\incidents\hint-2.md" echo(^<^<^<^<^<^<^< HEAD
>>"missions\02-mission-control\incidents\hint-2.md" echo(one version
>>"missions\02-mission-control\incidents\hint-2.md" echo(=======
>>"missions\02-mission-control\incidents\hint-2.md" echo(another version
>>"missions\02-mission-control\incidents\hint-2.md" echo(^>^>^>^>^>^>^> branch-name
>>"missions\02-mission-control\incidents\hint-2.md" echo(```
>>"missions\02-mission-control\incidents\hint-2.md" echo(
>>"missions\02-mission-control\incidents\hint-2.md" echo(Those markers are not supposed to remain in the final file.
>>"missions\02-mission-control\incidents\hint-2.md" echo(
>>"missions\02-mission-control\incidents\hint-2.md" echo(Decide what the file **should** contain.
>>"missions\02-mission-control\incidents\hint-2.md" echo(
>>"missions\02-mission-control\incidents\hint-2.md" echo(Remove the markers.
>>"missions\02-mission-control\incidents\hint-2.md" echo(
>>"missions\02-mission-control\incidents\hint-2.md" echo(Save the file.
>>"missions\02-mission-control\incidents\hint-2.md" echo(
>>"missions\02-mission-control\incidents\hint-2.md" echo(Then remember the Git lifecycle:
>>"missions\02-mission-control\incidents\hint-2.md" echo(
>>"missions\02-mission-control\incidents\hint-2.md" echo(```text
>>"missions\02-mission-control\incidents\hint-2.md" echo(edit
>>"missions\02-mission-control\incidents\hint-2.md" echo(  ↓
>>"missions\02-mission-control\incidents\hint-2.md" echo(stage
>>"missions\02-mission-control\incidents\hint-2.md" echo(  ↓
>>"missions\02-mission-control\incidents\hint-2.md" echo(commit
>>"missions\02-mission-control\incidents\hint-2.md" echo(```
>>"missions\02-mission-control\incidents\hint-2.md" echo(
>>"missions\02-mission-control\incidents\hint-2.md" echo(If you remain stuck, open `solution.md`.
>"missions\02-mission-control\incidents\solution.md" type nul
>>"missions\02-mission-control\incidents\solution.md" echo(# INCIDENT INC-002 — SOLUTION
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Start with:
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(```bat
>>"missions\02-mission-control\incidents\solution.md" echo(git status
>>"missions\02-mission-control\incidents\solution.md" echo(```
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Git should report an unmerged path.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Open:
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(```text
>>"missions\02-mission-control\incidents\solution.md" echo(STATUS.md
>>"missions\02-mission-control\incidents\solution.md" echo(```
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(You should see conflict markers.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(The simulator intentionally caused two branches to change the same status line differently.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Choose a sensible final status.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(For example:
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(```markdown
>>"missions\02-mission-control\incidents\solution.md" echo(# LUNA Communications Status
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(STATUS: DEGRADED - ENGINEERING REVIEW COMPLETE
>>"missions\02-mission-control\incidents\solution.md" echo(```
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(The exact wording is less important than resolving the conflict deliberately.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Remove all:
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(```text
>>"missions\02-mission-control\incidents\solution.md" echo(^<^<^<^<^<^<^<
>>"missions\02-mission-control\incidents\solution.md" echo(=======
>>"missions\02-mission-control\incidents\solution.md" echo(^>^>^>^>^>^>^>
>>"missions\02-mission-control\incidents\solution.md" echo(```
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(markers.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Save the file.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Stage it:
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(```bat
>>"missions\02-mission-control\incidents\solution.md" echo(git add STATUS.md
>>"missions\02-mission-control\incidents\solution.md" echo(```
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Check:
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(```bat
>>"missions\02-mission-control\incidents\solution.md" echo(git status
>>"missions\02-mission-control\incidents\solution.md" echo(```
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Git should now tell you that conflicts are resolved but the merge is still in progress.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Finish:
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(```bat
>>"missions\02-mission-control\incidents\solution.md" echo(git commit -m "Resolve Mission Control status conflict"
>>"missions\02-mission-control\incidents\solution.md" echo(```
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Verify:
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(```bat
>>"missions\02-mission-control\incidents\solution.md" echo(git status
>>"missions\02-mission-control\incidents\solution.md" echo(```
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(You should receive:
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(```text
>>"missions\02-mission-control\incidents\solution.md" echo(nothing to commit, working tree clean
>>"missions\02-mission-control\incidents\solution.md" echo(```
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Inspect history:
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(```bat
>>"missions\02-mission-control\incidents\solution.md" echo(git log --oneline --graph --all
>>"missions\02-mission-control\incidents\solution.md" echo(```
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(---
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(# Root Cause
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Two branches independently modified the same line.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Git could not determine which version represented the correct final state.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Git therefore stopped and required human judgment.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(This is a feature, not a failure.
>>"missions\02-mission-control\incidents\solution.md" echo(
>>"missions\02-mission-control\incidents\solution.md" echo(Git refused to silently choose which engineer's change should win.
>"missions\02-mission-control\incidents\trigger-incident.bat" type nul
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(@echo off
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(setlocal
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(title PROJECT LUNA - INCIDENT GENERATOR
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo ========================================
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo       PROJECT LUNA INCIDENT SYSTEM
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo ========================================
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo Preparing Mission Control simulation...
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(where git ^>nul 2^>^&1
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(if errorlevel 1 ^(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(    echo ERROR: Git was not found.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(    echo Complete the Mission 02 walkthrough first.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(    pause
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(    exit /b 1
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(^)
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(if exist conflict-lab ^(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(    echo Removing previous disposable conflict lab...
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(    rmdir /s /q conflict-lab
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(^)
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(mkdir conflict-lab
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(cd conflict-lab
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git init -b main ^>nul 2^>^&1
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git config user.name "LUNA Incident Simulator"
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git config user.email "simulator@project-luna.local"
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(^(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo # LUNA Communications Status
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo STATUS: OPERATIONAL
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(^) ^> STATUS.md
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git add STATUS.md ^>nul
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git commit -m "Initialize communications status" ^>nul
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git switch -c earth-control ^>nul 2^>^&1
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(^(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo # LUNA Communications Status
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo STATUS: DEGRADED - EARTH RELAY INVESTIGATION
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(^) ^> STATUS.md
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git add STATUS.md ^>nul
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git commit -m "Update status from Earth Control" ^>nul
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git switch main ^>nul 2^>^&1
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(^(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo # LUNA Communications Status
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo STATUS: DEGRADED - LUNAR RELAY INVESTIGATION
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(^) ^> STATUS.md
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git add STATUS.md ^>nul
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git commit -m "Update status from Lunar Operations" ^>nul
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(git merge earth-control ^>nul 2^>^&1
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo Incident generated.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo Mission Control synchronization has failed.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo The repository requires engineering attention.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo Enter the conflict-lab directory and begin investigation.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(echo.
>>"missions\02-mission-control\incidents\trigger-incident.bat" echo(pause
>"missions\02-mission-control\quiz\knowledge-check.md" type nul
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(# 🧠 MISSION 02 KNOWLEDGE CHECK
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(Try answering before opening the answer file.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(---
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 1
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What is the difference between Git and GitHub?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 2
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(Which command shows the current repository state?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(A. `git log`  
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(B. `git status`  
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(C. `git push`  
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(D. `git clone`
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 3
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What does `git add` do?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 4
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What does `git commit` do?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 5
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(Does creating a commit automatically upload it to GitHub?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 6
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What is the purpose of:
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(```bat
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(git diff
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(```
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 7
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What is the purpose of `.gitignore`?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 8
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(Why should `.gitignore` not be treated as a security system for secrets?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 9
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What does the remote name `origin` usually represent?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 10
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What does:
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(```bat
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(git push
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(```
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(do?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 11
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What does:
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(```bat
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(git pull
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(```
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(do at a high level?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 12
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(Why should you normally pull before working when you use the same repository from multiple computers?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 13
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What is a branch?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 14
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What does:
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(```bat
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(git switch -c feature/example
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(```
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(do?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 15
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What is a merge?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 16
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(Why does Git sometimes create a merge conflict?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 17
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What do these markers indicate?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(```text
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(^<^<^<^<^<^<^<
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(=======
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(^>^>^>^>^>^>^>
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(```
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 18
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(After manually resolving a conflict, what Git steps usually finish the resolution?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 19
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(What is Markdown?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(## 20
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(Why is a README valuable in a portfolio repository?
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(---
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(# Practical Check
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(Without following the walkthrough:
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(1. Create a new Git repository.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(2. Create and commit a README.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(3. Make a second change.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(4. Inspect the diff.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(5. Commit it.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(6. Create a branch.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(7. Make and commit a change on the branch.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(8. Return to `main`.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(9. Merge the branch.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(10. Display compact history.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(11. Confirm the working tree is clean.
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(
>>"missions\02-mission-control\quiz\knowledge-check.md" echo(If you can do this while only consulting the cheat sheet occasionally, you are ready to continue.
>"missions\02-mission-control\quiz\answers.md" type nul
>>"missions\02-mission-control\quiz\answers.md" echo(# MISSION 02 — KNOWLEDGE CHECK ANSWERS
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 1
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(Git is distributed version-control software.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(GitHub is an online service that hosts Git repositories and provides collaboration features.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 2
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(B — `git status`
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 3
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(`git add` places selected changes into the staging area for the next commit.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 4
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(`git commit` records the staged snapshot in local repository history.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 5
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(No. A commit is local until it is pushed to a remote repository.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 6
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(`git diff` shows changes that have not yet been staged by default.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 7
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(`.gitignore` defines patterns Git should normally ignore as untracked content.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 8
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(Ignored files can still be exposed outside Git, and a secret already committed remains in repository history. `.gitignore` is an accident-prevention tool, not secret storage.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 9
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(`origin` is the conventional name for the primary remote repository, often the GitHub repository from which a project was cloned or to which it is pushed.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 10
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(`git push` sends local commits to a configured remote repository.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 11
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(At a high level, `git pull` retrieves remote changes and integrates them into the current local branch.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 12
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(It reduces the chance that you begin work from an outdated local copy and later collide with changes already pushed elsewhere.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 13
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(A branch is an independent line of development pointing through repository history.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 14
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(It creates a new branch named `feature/example` and switches to it.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 15
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(A merge combines changes/history from another branch into the current branch.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 16
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(A conflict occurs when Git cannot safely determine how competing changes should be combined automatically.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 17
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(They are conflict markers showing competing versions of content.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 18
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(Edit the file, remove conflict markers, save the intended final content, `git add` the resolved file, and complete the merge with `git commit`.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 19
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(Markdown is lightweight plain-text formatting commonly used for documentation such as GitHub README files.
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(## 20
>>"missions\02-mission-control\quiz\answers.md" echo(
>>"missions\02-mission-control\quiz\answers.md" echo(A README lets a stranger quickly understand what the project is, why it exists, how it is structured, and how to use or evaluate it.
>"missions\02-mission-control\COMPLETE.md" type nul
>>"missions\02-mission-control\COMPLETE.md" echo(# ✅ MISSION 02 COMPLETE
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(# EARTH MISSION CONTROL: OPERATIONAL
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(```text
>>"missions\02-mission-control\COMPLETE.md" echo(========================================
>>"missions\02-mission-control\COMPLETE.md" echo(             PROJECT LUNA
>>"missions\02-mission-control\COMPLETE.md" echo(========================================
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(LUNA-1 ............... ONLINE
>>"missions\02-mission-control\COMPLETE.md" echo(GIT .................. ONLINE
>>"missions\02-mission-control\COMPLETE.md" echo(GITHUB ............... SYNCED
>>"missions\02-mission-control\COMPLETE.md" echo(DOCUMENTATION ........ ONLINE
>>"missions\02-mission-control\COMPLETE.md" echo(VERSION HISTORY ...... ACTIVE
>>"missions\02-mission-control\COMPLETE.md" echo(MISSION CONTROL ...... OPERATIONAL
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(========================================
>>"missions\02-mission-control\COMPLETE.md" echo(```
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(You now have more than a server.
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(You have a controlled engineering project.
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(During this mission you practiced:
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(- Git repositories
>>"missions\02-mission-control\COMPLETE.md" echo(- Working trees
>>"missions\02-mission-control\COMPLETE.md" echo(- Staging
>>"missions\02-mission-control\COMPLETE.md" echo(- Commits
>>"missions\02-mission-control\COMPLETE.md" echo(- Commit history
>>"missions\02-mission-control\COMPLETE.md" echo(- Diffs
>>"missions\02-mission-control\COMPLETE.md" echo(- `.gitignore`
>>"missions\02-mission-control\COMPLETE.md" echo(- GitHub remotes
>>"missions\02-mission-control\COMPLETE.md" echo(- Push and pull
>>"missions\02-mission-control\COMPLETE.md" echo(- Cloning
>>"missions\02-mission-control\COMPLETE.md" echo(- Branches
>>"missions\02-mission-control\COMPLETE.md" echo(- Merging
>>"missions\02-mission-control\COMPLETE.md" echo(- Merge conflicts
>>"missions\02-mission-control\COMPLETE.md" echo(- Markdown
>>"missions\02-mission-control\COMPLETE.md" echo(- README documentation
>>"missions\02-mission-control\COMPLETE.md" echo(- GitHub Issues
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(Most importantly, you created:
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(```text
>>"missions\02-mission-control\COMPLETE.md" echo(luna-operations
>>"missions\02-mission-control\COMPLETE.md" echo(```
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(That repository will now evolve during every remaining mission.
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(---
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(# Architecture After Mission 02
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(```text
>>"missions\02-mission-control\COMPLETE.md" echo(                       ☁️ GITHUB
>>"missions\02-mission-control\COMPLETE.md" echo(                     luna-operations
>>"missions\02-mission-control\COMPLETE.md" echo(                           │
>>"missions\02-mission-control\COMPLETE.md" echo(                      push │ pull
>>"missions\02-mission-control\COMPLETE.md" echo(                           │
>>"missions\02-mission-control\COMPLETE.md" echo(             ┌─────────────┴─────────────┐
>>"missions\02-mission-control\COMPLETE.md" echo(             ▼                           ▼
>>"missions\02-mission-control\COMPLETE.md" echo(        🌎 EARTH                       🌑 LUNA-1
>>"missions\02-mission-control\COMPLETE.md" echo(     Mission Control                Command Server
>>"missions\02-mission-control\COMPLETE.md" echo(          │                             │
>>"missions\02-mission-control\COMPLETE.md" echo(          └──── versioned systems ──────┘
>>"missions\02-mission-control\COMPLETE.md" echo(```
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(---
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(# A New Problem
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(Mission Control can now track changes.
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(But LUNA-1 still depends on humans manually checking:
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(- Disk usage
>>"missions\02-mission-control\COMPLETE.md" echo(- Connectivity
>>"missions\02-mission-control\COMPLETE.md" echo(- System status
>>"missions\02-mission-control\COMPLETE.md" echo(- Logs
>>"missions\02-mission-control\COMPLETE.md" echo(- Reports
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(That does not scale.
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(The station needs software capable of performing repetitive work automatically.
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(Your next assignment:
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(# MISSION 03 — AUTOMATE LIFE SUPPORT
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(**Primary skills:** scripting, Python, structured data, and automation.
>>"missions\02-mission-control\COMPLETE.md" echo(
>>"missions\02-mission-control\COMPLETE.md" echo(Before beginning Mission 03, make sure your final Mission 02 changes are committed and pushed.
>"academy\02-git-github\README.md" type nul
>>"academy\02-git-github\README.md" echo(# ACADEMY 02 — GIT, GITHUB ^& DOCUMENTATION
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(This Academy chapter is your Mission 02 reference.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 1. Why Version Control Exists
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Without version control, projects often become:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(config.txt
>>"academy\02-git-github\README.md" echo(config-new.txt
>>"academy\02-git-github\README.md" echo(config-new2.txt
>>"academy\02-git-github\README.md" echo(config-final.txt
>>"academy\02-git-github\README.md" echo(config-final-fixed.txt
>>"academy\02-git-github\README.md" echo(config-final-fixed-REAL.txt
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Version control gives changes identity and history.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Git can tell you:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(- What changed.
>>"academy\02-git-github\README.md" echo(- When.
>>"academy\02-git-github\README.md" echo(- Who committed it.
>>"academy\02-git-github\README.md" echo(- What the project looked like earlier.
>>"academy\02-git-github\README.md" echo(- Which changes belong together.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 2. Repository
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(A Git repository is a project tracked by Git.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Initialize:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git init
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(A hidden `.git` directory stores repository metadata and history.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Do not casually delete `.git`.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Without it, the directory becomes ordinary files rather than the same local repository.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 3. Working Tree, Staging, History
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(WORKING TREE
>>"academy\02-git-github\README.md" echo(    │
>>"academy\02-git-github\README.md" echo(    │ git add
>>"academy\02-git-github\README.md" echo(    ▼
>>"academy\02-git-github\README.md" echo(STAGING AREA
>>"academy\02-git-github\README.md" echo(    │
>>"academy\02-git-github\README.md" echo(    │ git commit
>>"academy\02-git-github\README.md" echo(    ▼
>>"academy\02-git-github\README.md" echo(COMMIT HISTORY
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Working tree:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Files as they currently exist.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Staging area:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Changes selected for the next commit.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Commit:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(A recorded project snapshot with metadata and a message.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 4. Essential Commands
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Status:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git status
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Stage one file:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git add README.md
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Stage current changes:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git add .
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Commit:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git commit -m "Describe the change"
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(History:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git log
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Compact history:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git log --oneline
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Inspect unstaged differences:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git diff
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Inspect staged differences:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git diff --staged
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 5. Good Commits
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(A useful commit represents a meaningful change.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Better:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(Add LUNA-1 network documentation
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Worse:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(stuff
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Better:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(Fix status report disk usage output
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Worse:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(changes
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Commit messages should help future-you understand history.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 6. `.gitignore`
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Example:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(.env
>>"academy\02-git-github\README.md" echo(*.log
>>"academy\02-git-github\README.md" echo(*.tmp
>>"academy\02-git-github\README.md" echo(secrets/
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(This tells Git to ignore matching untracked files.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(It is not a vault.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Never use `.gitignore` as justification for placing real secrets in a repository.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 7. Local and Remote Repositories
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(A local repository exists on your machine.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(A remote repository exists elsewhere, such as GitHub.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Inspect remotes:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git remote -v
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Add:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git remote add origin URL
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Push:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git push
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Pull:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git pull
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Clone:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git clone URL
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 8. `origin`
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(`origin` is only a conventional remote name.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(It is not a special GitHub server.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(You can technically name remotes differently, but `origin` is standard and widely understood.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 9. Branches
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(List:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git branch
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Create and switch:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git switch -c feature/name
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Switch:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git switch main
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Delete completed local branch:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git branch -d feature/name
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(A branch lets work evolve separately before being combined.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 10. Merge
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(While on the branch that should receive changes:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git merge other-branch
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Example:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git switch main
>>"academy\02-git-github\README.md" echo(git merge docs/architecture
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(This merges `docs/architecture` into `main`.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Direction matters.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 11. Merge Conflicts
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Git attempts automatic merges.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(When competing edits cannot be safely reconciled, it stops.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Conflict markers resemble:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(^<^<^<^<^<^<^< HEAD
>>"academy\02-git-github\README.md" echo(current branch
>>"academy\02-git-github\README.md" echo(=======
>>"academy\02-git-github\README.md" echo(other branch
>>"academy\02-git-github\README.md" echo(^>^>^>^>^>^>^> other-branch
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Resolution process:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(1. git status
>>"academy\02-git-github\README.md" echo(2. Open conflicted file
>>"academy\02-git-github\README.md" echo(3. Decide final content
>>"academy\02-git-github\README.md" echo(4. Remove markers
>>"academy\02-git-github\README.md" echo(5. Save
>>"academy\02-git-github\README.md" echo(6. git add FILE
>>"academy\02-git-github\README.md" echo(7. git commit
>>"academy\02-git-github\README.md" echo(8. git status
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(A conflict does not mean the repository is destroyed.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(It means Git needs human judgment.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 12. Markdown
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Heading:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```markdown
>>"academy\02-git-github\README.md" echo(# Heading
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Subheading:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```markdown
>>"academy\02-git-github\README.md" echo(## Subheading
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Bold:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```markdown
>>"academy\02-git-github\README.md" echo(**important**
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Inline code:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```markdown
>>"academy\02-git-github\README.md" echo(`git status`
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(List:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```markdown
>>"academy\02-git-github\README.md" echo(- One
>>"academy\02-git-github\README.md" echo(- Two
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Checklist:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```markdown
>>"academy\02-git-github\README.md" echo(- [x] Complete
>>"academy\02-git-github\README.md" echo(- [ ] Remaining
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Link:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```markdown
>>"academy\02-git-github\README.md" echo([GitHub]^(https://github.com^)
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Code fence:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(````markdown
>>"academy\02-git-github\README.md" echo(```bash
>>"academy\02-git-github\README.md" echo(git status
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(````
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Table:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```markdown
>>"academy\02-git-github\README.md" echo(^| Service ^| Port ^|
>>"academy\02-git-github\README.md" echo(^|---^|---:^|
>>"academy\02-git-github\README.md" echo(^| SSH ^| 22 ^|
>>"academy\02-git-github\README.md" echo(^| HTTP ^| 80 ^|
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 13. README Philosophy
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(A README is the front door to a project.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(A strong README normally answers:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(What is this?
>>"academy\02-git-github\README.md" echo(Why does it exist?
>>"academy\02-git-github\README.md" echo(What does it use?
>>"academy\02-git-github\README.md" echo(How is it structured?
>>"academy\02-git-github\README.md" echo(How do I run it?
>>"academy\02-git-github\README.md" echo(What currently works?
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(For a portfolio project, assume the reader knows nothing about your bootcamp.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(The README must stand on its own.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 14. Common Git Workflow
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Start work:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git pull
>>"academy\02-git-github\README.md" echo(git status
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Make changes.
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Inspect:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git diff
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Stage:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git add .
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Review:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git status
>>"academy\02-git-github\README.md" echo(git diff --staged
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Commit:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git commit -m "Meaningful description"
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Push:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git push
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(---
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(# 15. Multi-Computer Workflow
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Before working:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git pull
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(After working:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```bat
>>"academy\02-git-github\README.md" echo(git add .
>>"academy\02-git-github\README.md" echo(git commit -m "..."
>>"academy\02-git-github\README.md" echo(git push
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(Think:
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(```text
>>"academy\02-git-github\README.md" echo(PULL → WORK → COMMIT → PUSH
>>"academy\02-git-github\README.md" echo(```
>>"academy\02-git-github\README.md" echo(
>>"academy\02-git-github\README.md" echo(This habit prevents many avoidable conflicts.
>"resources\cheat-sheets\git-github.md" type nul
>>"resources\cheat-sheets\git-github.md" echo(# GIT ^& GITHUB CHEAT SHEET
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(## Setup
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git --version
>>"resources\cheat-sheets\git-github.md" echo(git config --global user.name "Your Name"
>>"resources\cheat-sheets\git-github.md" echo(git config --global user.email "you@example.com"
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(---
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(## Repository
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git init
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Create repository.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git status
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Inspect state.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git log --oneline
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Compact history.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(---
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(## Changes
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git diff
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(View unstaged changes.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git diff --staged
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(View staged changes.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git add FILE
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Stage one file.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git add .
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Stage current changes.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git commit -m "Message"
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Commit staged changes.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(---
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(## Remotes
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git remote -v
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Show remotes.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git remote add origin URL
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Add remote.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git clone URL
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Clone repository.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git pull
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Retrieve and integrate remote changes.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git push
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Send local commits.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(First push of a branch may require:
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git push -u origin BRANCH
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(---
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(## Branches
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git branch
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(List branches.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git switch -c BRANCH
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Create and switch.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git switch BRANCH
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Switch.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git merge BRANCH
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Merge branch into current branch.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```bat
>>"resources\cheat-sheets\git-github.md" echo(git branch -d BRANCH
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Delete completed local branch.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(---
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(## Conflict Workflow
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```text
>>"resources\cheat-sheets\git-github.md" echo(git status
>>"resources\cheat-sheets\git-github.md" echo(    ↓
>>"resources\cheat-sheets\git-github.md" echo(Open conflicted file
>>"resources\cheat-sheets\git-github.md" echo(    ↓
>>"resources\cheat-sheets\git-github.md" echo(Remove conflict markers
>>"resources\cheat-sheets\git-github.md" echo(    ↓
>>"resources\cheat-sheets\git-github.md" echo(Choose final content
>>"resources\cheat-sheets\git-github.md" echo(    ↓
>>"resources\cheat-sheets\git-github.md" echo(git add FILE
>>"resources\cheat-sheets\git-github.md" echo(    ↓
>>"resources\cheat-sheets\git-github.md" echo(git commit
>>"resources\cheat-sheets\git-github.md" echo(    ↓
>>"resources\cheat-sheets\git-github.md" echo(git status
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(---
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(## Everyday Habit
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(```text
>>"resources\cheat-sheets\git-github.md" echo(git pull
>>"resources\cheat-sheets\git-github.md" echo(   ↓
>>"resources\cheat-sheets\git-github.md" echo(work
>>"resources\cheat-sheets\git-github.md" echo(   ↓
>>"resources\cheat-sheets\git-github.md" echo(git status
>>"resources\cheat-sheets\git-github.md" echo(   ↓
>>"resources\cheat-sheets\git-github.md" echo(git diff
>>"resources\cheat-sheets\git-github.md" echo(   ↓
>>"resources\cheat-sheets\git-github.md" echo(git add .
>>"resources\cheat-sheets\git-github.md" echo(   ↓
>>"resources\cheat-sheets\git-github.md" echo(git commit
>>"resources\cheat-sheets\git-github.md" echo(   ↓
>>"resources\cheat-sheets\git-github.md" echo(git push
>>"resources\cheat-sheets\git-github.md" echo(```
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(---
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(## Remember
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(`git add` does not upload.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(`git commit` does not upload.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(`git push` sends commits to the remote.
>>"resources\cheat-sheets\git-github.md" echo(
>>"resources\cheat-sheets\git-github.md" echo(Git and GitHub are not the same thing.
>"tests\mission-02\check.bat" type nul
>>"tests\mission-02\check.bat" echo(@echo off
>>"tests\mission-02\check.bat" echo(setlocal EnableExtensions DisableDelayedExpansion
>>"tests\mission-02\check.bat" echo(title PROJECT LUNA - MISSION 02 VALIDATOR
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(echo ================================================
>>"tests\mission-02\check.bat" echo(echo           PROJECT LUNA VALIDATION
>>"tests\mission-02\check.bat" echo(echo                 MISSION 02
>>"tests\mission-02\check.bat" echo(echo ================================================
>>"tests\mission-02\check.bat" echo(echo.
>>"tests\mission-02\check.bat" echo(echo This validator checks the LOCAL luna-operations
>>"tests\mission-02\check.bat" echo(echo repository. GitHub Issue completion and screenshot
>>"tests\mission-02\check.bat" echo(echo quality still require your own review.
>>"tests\mission-02\check.bat" echo(echo.
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(set /p "REPO=Enter full path to your luna-operations folder: "
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(if not exist "%%REPO%%\" ^(
>>"tests\mission-02\check.bat" echo(    echo.
>>"tests\mission-02\check.bat" echo(    echo [FAIL] Directory does not exist.
>>"tests\mission-02\check.bat" echo(    goto :FAILED
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(set /a PASS=0
>>"tests\mission-02\check.bat" echo(set /a FAIL=0
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(call :check_dir ".git" "Git repository metadata"
>>"tests\mission-02\check.bat" echo(call :check_file "README.md" "README.md exists"
>>"tests\mission-02\check.bat" echo(call :check_file ".gitignore" ".gitignore exists"
>>"tests\mission-02\check.bat" echo(call :check_file "docs\architecture.md" "Architecture documentation exists"
>>"tests\mission-02\check.bat" echo(call :check_file "docs\mission-01.md" "Mission 01 retrospective exists"
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(if exist "%%REPO%%\scripts\" ^(
>>"tests\mission-02\check.bat" echo(    echo [PASS] scripts directory exists
>>"tests\mission-02\check.bat" echo(    set /a PASS+=1
>>"tests\mission-02\check.bat" echo(^) else ^(
>>"tests\mission-02\check.bat" echo(    echo [FAIL] scripts directory exists
>>"tests\mission-02\check.bat" echo(    set /a FAIL+=1
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(if exist "%%REPO%%\screenshots\" ^(
>>"tests\mission-02\check.bat" echo(    echo [PASS] screenshots directory exists
>>"tests\mission-02\check.bat" echo(    set /a PASS+=1
>>"tests\mission-02\check.bat" echo(^) else ^(
>>"tests\mission-02\check.bat" echo(    echo [FAIL] screenshots directory exists
>>"tests\mission-02\check.bat" echo(    set /a FAIL+=1
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(git -C "%%REPO%%" remote get-url origin ^>nul 2^>^&1
>>"tests\mission-02\check.bat" echo(if errorlevel 1 ^(
>>"tests\mission-02\check.bat" echo(    echo [FAIL] origin remote configured
>>"tests\mission-02\check.bat" echo(    set /a FAIL+=1
>>"tests\mission-02\check.bat" echo(^) else ^(
>>"tests\mission-02\check.bat" echo(    echo [PASS] origin remote configured
>>"tests\mission-02\check.bat" echo(    set /a PASS+=1
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(for /f %%%%A in ^('git -C "%%REPO%%" rev-list --count HEAD 2^^^>nul'^) do set "COMMITS=%%%%A"
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(if not defined COMMITS ^(
>>"tests\mission-02\check.bat" echo(    echo [FAIL] Commit history detected
>>"tests\mission-02\check.bat" echo(    set /a FAIL+=1
>>"tests\mission-02\check.bat" echo(^) else ^(
>>"tests\mission-02\check.bat" echo(    echo [INFO] Commit count: %%COMMITS%%
>>"tests\mission-02\check.bat" echo(    if %%COMMITS%% GEQ 5 ^(
>>"tests\mission-02\check.bat" echo(        echo [PASS] At least five commits
>>"tests\mission-02\check.bat" echo(        set /a PASS+=1
>>"tests\mission-02\check.bat" echo(    ^) else ^(
>>"tests\mission-02\check.bat" echo(        echo [FAIL] At least five commits
>>"tests\mission-02\check.bat" echo(        set /a FAIL+=1
>>"tests\mission-02\check.bat" echo(    ^)
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(for /f "delims=" %%%%A in ^('git -C "%%REPO%%" branch --show-current 2^^^>nul'^) do set "BRANCH=%%%%A"
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(if /I "%%BRANCH%%"=="main" ^(
>>"tests\mission-02\check.bat" echo(    echo [PASS] Current branch is main
>>"tests\mission-02\check.bat" echo(    set /a PASS+=1
>>"tests\mission-02\check.bat" echo(^) else ^(
>>"tests\mission-02\check.bat" echo(    echo [FAIL] Current branch is main
>>"tests\mission-02\check.bat" echo(    echo        Current branch: %%BRANCH%%
>>"tests\mission-02\check.bat" echo(    set /a FAIL+=1
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(for /f "delims=" %%%%A in ^('git -C "%%REPO%%" status --porcelain 2^^^>nul'^) do set "DIRTY=1"
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(if defined DIRTY ^(
>>"tests\mission-02\check.bat" echo(    echo [FAIL] Working tree is clean
>>"tests\mission-02\check.bat" echo(    set /a FAIL+=1
>>"tests\mission-02\check.bat" echo(^) else ^(
>>"tests\mission-02\check.bat" echo(    echo [PASS] Working tree is clean
>>"tests\mission-02\check.bat" echo(    set /a PASS+=1
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(findstr /I /C:"LUNA" "%%REPO%%\README.md" ^>nul 2^>^&1
>>"tests\mission-02\check.bat" echo(if errorlevel 1 ^(
>>"tests\mission-02\check.bat" echo(    echo [FAIL] README identifies Project LUNA
>>"tests\mission-02\check.bat" echo(    set /a FAIL+=1
>>"tests\mission-02\check.bat" echo(^) else ^(
>>"tests\mission-02\check.bat" echo(    echo [PASS] README identifies Project LUNA
>>"tests\mission-02\check.bat" echo(    set /a PASS+=1
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(echo.
>>"tests\mission-02\check.bat" echo(echo ================================================
>>"tests\mission-02\check.bat" echo(echo Passed: %%PASS%%
>>"tests\mission-02\check.bat" echo(echo Failed: %%FAIL%%
>>"tests\mission-02\check.bat" echo(echo ================================================
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(if %%FAIL%% EQU 0 ^(
>>"tests\mission-02\check.bat" echo(    echo.
>>"tests\mission-02\check.bat" echo(    echo MISSION 02 LOCAL VALIDATION: PASS
>>"tests\mission-02\check.bat" echo(    echo.
>>"tests\mission-02\check.bat" echo(    echo Manually confirm:
>>"tests\mission-02\check.bat" echo(    echo - GitHub repository is public and current
>>"tests\mission-02\check.bat" echo(    echo - Architecture branch was merged
>>"tests\mission-02\check.bat" echo(    echo - GitHub Issue was created and closed
>>"tests\mission-02\check.bat" echo(    echo - Required screenshots are meaningful
>>"tests\mission-02\check.bat" echo(    echo.
>>"tests\mission-02\check.bat" echo(    exit /b 0
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(:FAILED
>>"tests\mission-02\check.bat" echo(echo.
>>"tests\mission-02\check.bat" echo(echo MISSION 02 NOT YET VALIDATED
>>"tests\mission-02\check.bat" echo(echo Review failed checks and try again.
>>"tests\mission-02\check.bat" echo(echo.
>>"tests\mission-02\check.bat" echo(exit /b 1
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(:check_file
>>"tests\mission-02\check.bat" echo(if exist "%%REPO%%\%%~1" ^(
>>"tests\mission-02\check.bat" echo(    echo [PASS] %%~2
>>"tests\mission-02\check.bat" echo(    set /a PASS+=1
>>"tests\mission-02\check.bat" echo(^) else ^(
>>"tests\mission-02\check.bat" echo(    echo [FAIL] %%~2
>>"tests\mission-02\check.bat" echo(    set /a FAIL+=1
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(exit /b
>>"tests\mission-02\check.bat" echo(
>>"tests\mission-02\check.bat" echo(:check_dir
>>"tests\mission-02\check.bat" echo(if exist "%%REPO%%\%%~1\" ^(
>>"tests\mission-02\check.bat" echo(    echo [PASS] %%~2
>>"tests\mission-02\check.bat" echo(    set /a PASS+=1
>>"tests\mission-02\check.bat" echo(^) else ^(
>>"tests\mission-02\check.bat" echo(    echo [FAIL] %%~2
>>"tests\mission-02\check.bat" echo(    set /a FAIL+=1
>>"tests\mission-02\check.bat" echo(^)
>>"tests\mission-02\check.bat" echo(exit /b

echo.
echo ==================================================
echo Mission 02 installation complete.
echo ==================================================
echo.
echo Created or updated:
echo   missions\02-mission-control
echo   academy\02-git-github\README.md
echo   resources\cheat-sheets\git-github.md
echo   tests\mission-02\check.bat
echo.
echo Next:
echo   1. Review git status
echo   2. Commit these course changes
echo   3. Open missions\02-mission-control\BRIEFING.md
echo.
echo Suggested course-author commit:
echo   git add .
echo   git commit -m "Build Mission 02 Git and GitHub curriculum"
echo   git push
echo.
pause
