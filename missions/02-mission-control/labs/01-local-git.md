# LAB 01 — LOCAL VERSION CONTROL

## Objective

Practice the Git edit → stage → commit workflow without using GitHub.

Create a new folder outside the Project LUNA course repository:

```text
luna-local-lab
```

Initialize it as a Git repository.

Create:

```text
README.md
```

with:

```markdown
# LUNA Local Lab

Local version-control test.
```

Create your first commit.

Then create:

```text
status.txt
```

containing:

```text
LUNA-1 ONLINE
```

Commit it separately.

Then change it to:

```text
LUNA-1 ONLINE
MISSION CONTROL CONNECTED
```

Before staging, use Git to inspect exactly what changed.

Commit the change.

---

# Completion Requirements

Your repository should have:

- At least three commits.
- A clean working tree.
- A `README.md`.
- A `status.txt`.

Verify using:

```bat
git status
git log --oneline
```

---

# Questions

Before continuing, answer:

1. What does `git status` tell you?
2. What does `git add` do?
3. What does `git commit` do?
4. Did any of these operations require GitHub?
5. Why might several small commits be more useful than one giant commit?
