# 📡 MISSION 02 — MISSION CONTROL

**MISSION ID:** LUNA-M02  
**PRIORITY:** HIGH  
**ROLE:** Junior Systems Engineer  
**OBJECTIVE:** Establish version control and Earth-side Mission Control

---

## Mission Briefing

LUNA-1 is online.

The station now has a functioning Linux command server, remote administration, an HTTP service, and basic operations scripts.

That creates a new problem.

The station is beginning to produce files.

Scripts change. Documentation changes. Configuration changes. Engineers make mistakes. Sometimes a working file needs to be restored. Sometimes two people need to work on the same project without overwriting each other.

Mission Control needs a reliable way to answer questions such as:

- What changed?
- Who changed it?
- When did it change?
- Why did it change?
- Can we restore an older version?
- Can two engineers work independently and combine their work later?
- Is Earth holding the same project as the engineer's computer?

The solution is **version control**.

During this mission, you will learn Git and GitHub.

---

# Git vs GitHub

These are related, but they are not the same thing.

**Git** is version-control software that runs on your computer.

**GitHub** is an online platform that hosts Git repositories and provides collaboration features around them.

A useful mental model is:

```text
Git = the version-control engine

GitHub = an online home for Git repositories
```

You can use Git without GitHub.

You can also interact with GitHub through a browser without understanding Git very well.

Project LUNA will teach both.

---

# Mission Architecture

At the end of Mission 01:

```text
          🌎 EARTH
              │
         SSH / HTTP
              │
              ▼
             🌑
           LUNA-1
       Ubuntu Server
```

At the end of Mission 02:

```text
                       ☁️ GITHUB
                           │
                      push │ pull
                           │
             ┌─────────────┴─────────────┐
             │                           │
             ▼                           ▼
        🌎 MISSION CONTROL              🌑 LUNA-1
        Engineer Workspace             Command Server
             │
             └────── versioned work ─────┘
```

You will also create the repository that will become your portfolio project for the rest of the bootcamp:

```text
luna-operations
```

Every later mission will add to it.

---

# Your Mission

You must learn to:

1. Install and configure Git on your workstation.
2. Understand repositories, commits, and working trees.
3. Use `git status`.
4. Stage changes with `git add`.
5. Save changes with `git commit`.
6. Inspect history using `git log`.
7. Compare changes using `git diff`.
8. Ignore files using `.gitignore`.
9. Connect a local repository to GitHub.
10. Push and pull changes.
11. Clone repositories.
12. Create and switch branches.
13. Merge branches.
14. Understand and resolve a merge conflict.
15. Write useful Markdown documentation.
16. Use GitHub Issues for simple work tracking.
17. Build your permanent `luna-operations` portfolio repository.

When Mission Control can reliably track and synchronize LUNA project changes:

**Mission 02 is complete.**

Open `OBJECTIVES.md`, then continue to `WALKTHROUGH.md`.
