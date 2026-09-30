# ACADEMY 02 — GIT, GITHUB & DOCUMENTATION

This Academy chapter is your Mission 02 reference.

---

# 1. Why Version Control Exists

Without version control, projects often become:

```text
config.txt
config-new.txt
config-new2.txt
config-final.txt
config-final-fixed.txt
config-final-fixed-REAL.txt
```

Version control gives changes identity and history.

Git can tell you:

- What changed.
- When.
- Who committed it.
- What the project looked like earlier.
- Which changes belong together.

---

# 2. Repository

A Git repository is a project tracked by Git.

Initialize:

```bat
git init
```

A hidden `.git` directory stores repository metadata and history.

Do not casually delete `.git`.

Without it, the directory becomes ordinary files rather than the same local repository.

---

# 3. Working Tree, Staging, History

```text
WORKING TREE
    │
    │ git add
    ▼
STAGING AREA
    │
    │ git commit
    ▼
COMMIT HISTORY
```

Working tree:

Files as they currently exist.

Staging area:

Changes selected for the next commit.

Commit:

A recorded project snapshot with metadata and a message.

---

# 4. Essential Commands

Status:

```bat
git status
```

Stage one file:

```bat
git add README.md
```

Stage current changes:

```bat
git add .
```

Commit:

```bat
git commit -m "Describe the change"
```

History:

```bat
git log
```

Compact history:

```bat
git log --oneline
```

Inspect unstaged differences:

```bat
git diff
```

Inspect staged differences:

```bat
git diff --staged
```

---

# 5. Good Commits

A useful commit represents a meaningful change.

Better:

```text
Add LUNA-1 network documentation
```

Worse:

```text
stuff
```

Better:

```text
Fix status report disk usage output
```

Worse:

```text
changes
```

Commit messages should help future-you understand history.

---

# 6. `.gitignore`

Example:

```text
.env
*.log
*.tmp
secrets/
```

This tells Git to ignore matching untracked files.

It is not a vault.

Never use `.gitignore` as justification for placing real secrets in a repository.

---

# 7. Local and Remote Repositories

A local repository exists on your machine.

A remote repository exists elsewhere, such as GitHub.

Inspect remotes:

```bat
git remote -v
```

Add:

```bat
git remote add origin URL
```

Push:

```bat
git push
```

Pull:

```bat
git pull
```

Clone:

```bat
git clone URL
```

---

# 8. `origin`

`origin` is only a conventional remote name.

It is not a special GitHub server.

You can technically name remotes differently, but `origin` is standard and widely understood.

---

# 9. Branches

List:

```bat
git branch
```

Create and switch:

```bat
git switch -c feature/name
```

Switch:

```bat
git switch main
```

Delete completed local branch:

```bat
git branch -d feature/name
```

A branch lets work evolve separately before being combined.

---

# 10. Merge

While on the branch that should receive changes:

```bat
git merge other-branch
```

Example:

```bat
git switch main
git merge docs/architecture
```

This merges `docs/architecture` into `main`.

Direction matters.

---

# 11. Merge Conflicts

Git attempts automatic merges.

When competing edits cannot be safely reconciled, it stops.

Conflict markers resemble:

```text
<<<<<<< HEAD
current branch
=======
other branch
>>>>>>> other-branch
```

Resolution process:

```text
1. git status
2. Open conflicted file
3. Decide final content
4. Remove markers
5. Save
6. git add FILE
7. git commit
8. git status
```

A conflict does not mean the repository is destroyed.

It means Git needs human judgment.

---

# 12. Markdown

Heading:

```markdown
# Heading
```

Subheading:

```markdown
## Subheading
```

Bold:

```markdown
**important**
```

Inline code:

```markdown
`git status`
```

List:

```markdown
- One
- Two
```

Checklist:

```markdown
- [x] Complete
- [ ] Remaining
```

Link:

```markdown
[GitHub](https://github.com)
```

Code fence:

````markdown
```bash
git status
```
````

Table:

```markdown
| Service | Port |
|---|---:|
| SSH | 22 |
| HTTP | 80 |
```

---

# 13. README Philosophy

A README is the front door to a project.

A strong README normally answers:

```text
What is this?
Why does it exist?
What does it use?
How is it structured?
How do I run it?
What currently works?
```

For a portfolio project, assume the reader knows nothing about your bootcamp.

The README must stand on its own.

---

# 14. Common Git Workflow

Start work:

```bat
git pull
git status
```

Make changes.

Inspect:

```bat
git diff
```

Stage:

```bat
git add .
```

Review:

```bat
git status
git diff --staged
```

Commit:

```bat
git commit -m "Meaningful description"
```

Push:

```bat
git push
```

---

# 15. Multi-Computer Workflow

Before working:

```bat
git pull
```

After working:

```bat
git add .
git commit -m "..."
git push
```

Think:

```text
PULL → WORK → COMMIT → PUSH
```

This habit prevents many avoidable conflicts.
