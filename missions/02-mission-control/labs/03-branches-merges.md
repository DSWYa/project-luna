# LAB 03 — BRANCHES AND MERGES

## Objective

Create work independently from `main`, then merge it.

Use `luna-git-training`.

Make sure your working tree is clean:

```bat
git status
```

Create:

```bat
git switch -c feature/crew-documentation
```

Create:

```text
docs\crew.md
```

Add:

```markdown
# Crew Systems

Crew systems documentation placeholder.
```

Commit the file.

Switch back:

```bat
git switch main
```

Verify `docs\crew.md` is not present on `main` yet.

Merge:

```bat
git merge feature/crew-documentation
```

Verify the file now exists.

Push `main`.

---

# Second Branch

Create another branch:

```bat
git switch -c feature/equipment-documentation
```

Create:

```text
docs\equipment.md
```

Commit it.

Switch back to `main`.

Merge it.

Push.

---

# Completion Requirements

You should be able to explain:

- Why the files disappeared when switching back to `main`.
- Why they reappeared after the merge.
- What branch received the changes.
- Why experimental work is often safer on a branch.
