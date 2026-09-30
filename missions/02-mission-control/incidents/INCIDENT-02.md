# 🚨 INCIDENT INC-002

**PRIORITY:** HIGH  
**SYSTEM:** Mission Control Version Control  
**SOURCE:** LUNA Engineering Coordination

---

# Situation

Two engineering teams edited the same Mission Control status record.

Git has refused to complete synchronization automatically.

Automated deployment is paused until the repository is returned to a valid state.

You will reproduce the incident in a disposable training repository.

The simulator will not modify your `luna-operations` portfolio repository.

---

# Run the Incident Simulator

Open Command Prompt.

Navigate to:

```text
project-luna\missions\02-mission-control\incidents
```

Run:

```bat
trigger-incident.bat
```

The simulator will create:

```text
conflict-lab
```

Do not delete the folder.

When the simulator finishes, enter:

```bat
cd conflict-lab
```

---

# Reported Symptoms

Mission Control reports:

```text
REPOSITORY ........ REACHABLE
COMMIT HISTORY .... PRESENT
MERGE ............. FAILED
WORKING TREE ...... REQUIRES ATTENTION
```

---

# Your Objective

Restore the repository to a valid state.

Determine:

1. What Git believes is wrong.
2. Which file is affected.
3. What each side attempted to change.
4. What the final content should be.
5. How to tell Git that the conflict has been resolved.

When complete:

```bat
git status
```

must report a clean working tree.

The repository must contain a completed merge commit.

---

# Restrictions

Do not:

- Delete the entire repository.
- Run the incident simulator again to reset the problem.
- Abort the merge unless you are intentionally restarting your troubleshooting.
- Open the simulator source to discover exactly how it created the problem.

Use Git's own information first.

If stuck for approximately 15 minutes, open:

`hint-1.md`
