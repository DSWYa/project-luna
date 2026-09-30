# MISSION 02 — KNOWLEDGE CHECK ANSWERS

## 1

Git is distributed version-control software.

GitHub is an online service that hosts Git repositories and provides collaboration features.

## 2

B — `git status`

## 3

`git add` places selected changes into the staging area for the next commit.

## 4

`git commit` records the staged snapshot in local repository history.

## 5

No. A commit is local until it is pushed to a remote repository.

## 6

`git diff` shows changes that have not yet been staged by default.

## 7

`.gitignore` defines patterns Git should normally ignore as untracked content.

## 8

Ignored files can still be exposed outside Git, and a secret already committed remains in repository history. `.gitignore` is an accident-prevention tool, not secret storage.

## 9

`origin` is the conventional name for the primary remote repository, often the GitHub repository from which a project was cloned or to which it is pushed.

## 10

`git push` sends local commits to a configured remote repository.

## 11

At a high level, `git pull` retrieves remote changes and integrates them into the current local branch.

## 12

It reduces the chance that you begin work from an outdated local copy and later collide with changes already pushed elsewhere.

## 13

A branch is an independent line of development pointing through repository history.

## 14

It creates a new branch named `feature/example` and switches to it.

## 15

A merge combines changes/history from another branch into the current branch.

## 16

A conflict occurs when Git cannot safely determine how competing changes should be combined automatically.

## 17

They are conflict markers showing competing versions of content.

## 18

Edit the file, remove conflict markers, save the intended final content, `git add` the resolved file, and complete the merge with `git commit`.

## 19

Markdown is lightweight plain-text formatting commonly used for documentation such as GitHub README files.

## 20

A README lets a stranger quickly understand what the project is, why it exists, how it is structured, and how to use or evaluate it.
