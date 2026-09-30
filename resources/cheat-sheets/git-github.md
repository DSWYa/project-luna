# GIT & GITHUB CHEAT SHEET

## Setup

```bat
git --version
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

---

## Repository

```bat
git init
```

Create repository.

```bat
git status
```

Inspect state.

```bat
git log --oneline
```

Compact history.

---

## Changes

```bat
git diff
```

View unstaged changes.

```bat
git diff --staged
```

View staged changes.

```bat
git add FILE
```

Stage one file.

```bat
git add .
```

Stage current changes.

```bat
git commit -m "Message"
```

Commit staged changes.

---

## Remotes

```bat
git remote -v
```

Show remotes.

```bat
git remote add origin URL
```

Add remote.

```bat
git clone URL
```

Clone repository.

```bat
git pull
```

Retrieve and integrate remote changes.

```bat
git push
```

Send local commits.

First push of a branch may require:

```bat
git push -u origin BRANCH
```

---

## Branches

```bat
git branch
```

List branches.

```bat
git switch -c BRANCH
```

Create and switch.

```bat
git switch BRANCH
```

Switch.

```bat
git merge BRANCH
```

Merge branch into current branch.

```bat
git branch -d BRANCH
```

Delete completed local branch.

---

## Conflict Workflow

```text
git status
    ↓
Open conflicted file
    ↓
Remove conflict markers
    ↓
Choose final content
    ↓
git add FILE
    ↓
git commit
    ↓
git status
```

---

## Everyday Habit

```text
git pull
   ↓
work
   ↓
git status
   ↓
git diff
   ↓
git add .
   ↓
git commit
   ↓
git push
```

---

## Remember

`git add` does not upload.

`git commit` does not upload.

`git push` sends commits to the remote.

Git and GitHub are not the same thing.
