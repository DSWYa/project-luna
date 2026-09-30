# LAB 02 — REMOTE REPOSITORIES

## Objective

Demonstrate synchronization between a local repository and GitHub.

Use your `luna-git-training` repository.

---

# Task 1 — Inspect the Remote

Run:

```bat
git remote -v
```

Identify:

- The remote name.
- The GitHub URL.

---

# Task 2 — Local to GitHub

Create:

```text
docs\remote-lab.md
```

Add:

```markdown
# Remote Lab

This file originated on Earth Mission Control.
```

Commit it.

Push it.

Verify the file appears on GitHub.

---

# Task 3 — GitHub to Local

Use GitHub's web editor to add this line:

```markdown
This line originated on GitHub.
```

Commit the change using GitHub.

Return to your computer.

Before opening the file locally, run:

```bat
git pull
```

Verify the line arrives.

---

# Checkpoint

Explain this diagram in your own words:

```text
LOCAL                     REMOTE
  │                          │
  │────── git push ─────────>│
  │                          │
  │<───── git pull ──────────│
```

Also explain why you should normally pull before beginning work on a repository you use from multiple computers.
