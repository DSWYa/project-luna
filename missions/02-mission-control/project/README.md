# 🛠️ MISSION 02 FINAL PROJECT

# BUILD THE LUNA OPERATIONS REPOSITORY

The guided Git training is complete.

You will now establish the repository that follows you through the remaining missions.

This is not another training repository.

This will become your primary Project LUNA portfolio repository.

---

# Scenario

LUNA-1 is producing scripts, reports, architecture decisions, and operational documentation.

Mission Control requires a permanent engineering repository where the station's digital systems can evolve in a controlled way.

Create:

```text
luna-operations
```

The repository must exist locally **and** on GitHub.

---

# REQUIREMENT 1 — CREATE THE REPOSITORY

Create a new local directory named:

```text
luna-operations
```

Initialize it with Git.

Create a corresponding **public GitHub repository** named:

```text
luna-operations
```

Connect the local repository to GitHub using the remote name:

```text
origin
```

The primary branch must be:

```text
main
```

---

# REQUIREMENT 2 — BUILD THE INITIAL STRUCTURE

Create:

```text
luna-operations/
├── README.md
├── .gitignore
├── docs/
│   ├── architecture.md
│   └── mission-01.md
├── scripts/
└── screenshots/
```

Git does not track empty directories.

If `scripts` or `screenshots` are empty, you may place a `.gitkeep` file inside them.

---

# REQUIREMENT 3 — `.gitignore`

Your `.gitignore` must ignore at least:

```text
.env
*.log
*.tmp
secrets/
```

You may add additional rules.

---

# REQUIREMENT 4 — README

Your `README.md` must contain these sections:

```markdown
# Project LUNA Operations

## Overview

## Current Architecture

## Technologies

## Mission Progress

## Repository Structure

## Current Status
```

Write actual content beneath each section.

Do not leave the headings empty.

Your README should explain that this repository will grow throughout the bootcamp.

---

# REQUIREMENT 5 — ARCHITECTURE DOCUMENTATION

Create:

```text
docs/architecture.md
```

Document the current Mission 01 architecture.

Include an ASCII diagram similar in concept to:

```text
Earth Mission Control
        │
   SSH / HTTP
        │
        ▼
     LUNA-1
  Ubuntu Server
```

Your exact design may differ.

Document:

- LUNA-1's purpose.
- SSH and its port.
- HTTP and its port.
- Nginx's purpose.
- How Earth Mission Control reaches the server.

---

# REQUIREMENT 6 — MISSION 01 RETROSPECTIVE

Create:

```text
docs/mission-01.md
```

Include:

```markdown
# Mission 01 — Establish the Outpost

## What I Built

## Skills Practiced

## Commands Worth Remembering

## Incident Summary

## What I Learned
```

Write these sections in your own words.

This document is part of your portfolio.

Do not simply copy the course walkthrough.

---

# REQUIREMENT 7 — COMMIT PROGRESSION

Your finished repository must contain **at least five commits**.

Do not create all files and commit them at once.

A reasonable history might resemble:

```text
Initialize LUNA Operations repository
Add Mission 01 documentation
Document current architecture
Add repository ignore rules
Improve project README
```

Your messages do not need to match those exactly.

They should describe the work performed.

---

# REQUIREMENT 8 — USE A BRANCH

Create a branch named:

```text
docs/architecture
```

Make a meaningful improvement to:

```text
docs/architecture.md
```

Commit it on the branch.

Return to `main`.

Merge the branch into `main`.

After confirming the merge, you may delete the branch.

---

# REQUIREMENT 9 — USE A GITHUB ISSUE

On GitHub, create an Issue titled:

```text
Document Mission 01 architecture
```

Give it a useful description and checklist.

Complete the architecture documentation.

Then close the Issue.

This demonstrates that the repository tracks both code **and work**.

---

# REQUIREMENT 10 — PUSH EVERYTHING

Push the completed repository to GitHub.

Your local repository must end with:

```bat
git status
```

reporting:

```text
nothing to commit, working tree clean
```

Your GitHub repository should show the same committed files.

---

# REQUIREMENT 11 — VERIFY FROM ANOTHER LOCATION

Perform one of these:

### Option A

Clone `luna-operations` into a temporary directory on the same computer.

### Option B

Clone it onto another computer.

### Option C

Clone it onto LUNA-1.

The purpose is to prove that your GitHub repository can recreate the project elsewhere.

If you choose LUNA-1:

```bash
cd ~
git clone YOUR-LUNA-OPERATIONS-URL
```

---

# REQUIRED EVIDENCE

Capture:

1. Your GitHub repository homepage.
2. Your rendered README.
3. `git log --oneline`.
4. `git status` showing a clean working tree.
5. Your closed GitHub Issue.
6. Your architecture document rendered on GitHub.

Keep these screenshots in:

```text
screenshots/
```

Once added, commit and push them too.

---

# FINAL SELF-CHECK

```text
[ ] luna-operations exists locally

[ ] luna-operations exists on GitHub

[ ] origin is configured

[ ] main is the primary branch

[ ] README contains meaningful documentation

[ ] .gitignore exists

[ ] architecture.md exists

[ ] mission-01.md exists

[ ] At least five commits exist

[ ] A feature branch was used and merged

[ ] A GitHub Issue was created and closed

[ ] Repository was cloned elsewhere successfully

[ ] Screenshots were added

[ ] Working tree is clean

[ ] All final changes were pushed
```

When complete, proceed to:

`../incidents/INCIDENT-02.md`
