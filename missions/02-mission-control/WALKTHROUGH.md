# MISSION 02 WALKTHROUGH

Mission 02 takes place primarily on **Earth Mission Control — your normal computer**.

LUNA-1 will remain important, but Git and GitHub are most useful when you understand how your local workstation, remote GitHub repository, and servers relate to one another.

---

# PART 1 — VERIFY OR INSTALL GIT

Open **Command Prompt**.

Run:

```bat
git --version
```

If Git is installed, you should receive something similar to:

```text
git version 2.x.x
```

If Git is not recognized:

1. Open your web browser.
2. Search for **Git for Windows**.
3. Open the official `git-scm.com` download page.
4. Download the current 64-bit Git for Windows installer.
5. Run the installer.
6. For this bootcamp, the default installer choices are generally fine.
7. Finish installation.
8. Close and reopen Command Prompt.
9. Run:

```bat
git --version
```

Do not continue until Git responds.

> Git for Windows normally includes Git Credential Manager. When you later push to GitHub over HTTPS, Windows may open a browser-based sign-in flow. GitHub does not accept your normal account password as a Git password.

---

# PART 2 — CONFIGURE YOUR GIT IDENTITY

Git records an author with every commit.

Check your current settings:

```bat
git config --global user.name
git config --global user.email
```

If they are empty, configure them.

Use the name you want associated with your commits:

```bat
git config --global user.name "Your Name"
```

Then use an email address associated with your GitHub account:

```bat
git config --global user.email "you@example.com"
```

Verify:

```bat
git config --global --list
```

Do not copy the example email literally.

---

# PART 3 — CREATE YOUR FIRST TRAINING REPOSITORY

Go to a safe location such as Documents:

```bat
cd /d %USERPROFILE%\Documents
```

Create a folder:

```bat
mkdir luna-git-training
cd luna-git-training
```

At this moment, this is only a normal folder.

Run:

```bat
git init
```

Git creates a hidden `.git` directory containing repository metadata.

Check:

```bat
git status
```

You should see that you are on a branch and currently have no commits.

A directory becomes a Git repository because it contains Git repository metadata — not because it exists on GitHub.

---

# PART 4 — CREATE YOUR FIRST COMMIT

Create a file:

```bat
echo # LUNA Git Training> README.md
```

Check:

```bat
git status
```

Git should report `README.md` as **untracked**.

This means Git sees the file, but it has never been added to version history.

Stage it:

```bat
git add README.md
```

Check again:

```bat
git status
```

The file is now staged.

Commit it:

```bat
git commit -m "Initialize LUNA Git training repository"
```

Check:

```bat
git status
```

You should see:

```text
nothing to commit, working tree clean
```

---

# THE THREE AREAS

This mental model is important.

```text
WORKING TREE
Files you are editing
      │
      │ git add
      ▼
STAGING AREA
Changes selected for the next commit
      │
      │ git commit
      ▼
COMMIT HISTORY
Saved snapshots
```

`git add` does **not** upload something to GitHub.

`git commit` does **not** upload something to GitHub.

Those actions are local.

---

# PART 5 — MODIFY AND INSPECT A FILE

Open `README.md` in VS Code or Notepad.

Change it to:

```markdown
# LUNA Git Training

Mission Control version-control laboratory.

## Status

Training repository operational.
```

Save it.

Run:

```bat
git status
```

Now:

```bat
git diff
```

Git shows the difference between your working file and the last committed version.

Stage it:

```bat
git add README.md
```

Now try:

```bat
git diff
```

The normal diff may appear empty because the change is staged.

To see staged changes:

```bat
git diff --staged
```

Commit:

```bat
git commit -m "Expand training repository README"
```

---

# PART 6 — VIEW HISTORY

Run:

```bat
git log
```

Press `q` if Git opens the history in a pager.

For a compact history:

```bat
git log --oneline
```

You should see at least two commits.

Commit history is one of Git's biggest benefits.

Instead of files named:

```text
report-final.txt
report-final2.txt
report-final-FINAL.txt
report-final-FINAL-actually-final.txt
```

Git keeps structured history.

---

# PART 7 — CREATE MULTIPLE SMALL COMMITS

Create:

```bat
mkdir docs
```

Create:

```text
docs\station-notes.md
```

Give it this content:

```markdown
# Station Notes

LUNA-1 is the first operational Project LUNA node.
```

Check status:

```bat
git status
```

Stage everything currently changed:

```bat
git add .
```

Commit:

```bat
git commit -m "Add initial station documentation"
```

Create another file:

```text
docs\communications.md
```

Add:

```markdown
# Communications

Earth Mission Control connects to LUNA-1 through SSH and HTTP.
```

Stage and commit it separately:

```bat
git add .
git commit -m "Document Earth to Moon communications"
```

You should now have several commits that each describe one meaningful change.

---

# PART 8 — CREATE A `.gitignore` FILE

Not every file in a project should be tracked by Git.

Some files are temporary, generated automatically, or may contain information that should stay local to your computer.

Git provides a special file called:

```text
.gitignore
```

This is a **text file** that tells Git which files and folders it should normally ignore.

The period at the beginning is part of the filename.

It is:

```text
.gitignore
```

not:

```text
gitignore
```

and not:

```text
.gitignore\
```

---

# Step 1 — Create the File

Make sure you are still inside your:

```text
luna-git-training
```

repository.

Check:

```bat
cd
```

and:

```bat
git status
```

Now create a new file named:

```text
.gitignore
```

You can create it using VS Code:

1. Open your `luna-git-training` folder in VS Code.
2. In the Explorer panel, right-click the repository folder.
3. Click **New File**.
4. Enter:

```text
.gitignore
```

5. Press Enter.

You should now have something like:

```text
luna-git-training/
├── .gitignore
├── README.md
└── docs/
```

---

# Step 2 — Add Ignore Rules

Open `.gitignore`.

Add:

```text
*.log
*.tmp
.env
secrets/
```

Save the file.

Each line is an ignore rule.

---

# What These Rules Mean

This line:

```text
*.log
```

means:

> Ignore files whose names end in `.log`.

Examples:

```text
system.log
error.log
nginx.log
```

This:

```text
*.tmp
```

ignores temporary files such as:

```text
test.tmp
cache.tmp
```

This:

```text
.env
```

ignores a file specifically named:

```text
.env
```

These files are commonly used later to store local configuration or environment variables.

This:

```text
secrets/
```

ignores a **folder** named:

```text
secrets
```

and the files inside it.

Notice the difference:

```text
.gitignore
```

is the actual ignore-rules file.

Inside that file, a rule ending with `/` usually refers to a directory.

---

# Step 3 — Test the Ignore Rules

Create a test log file.

From Command Prompt:

```bat
echo TEST LOG> test.log
```

Check:

```bat
git status
```

You should see `.gitignore` as a new file.

You should **not** see:

```text
test.log
```

Git is ignoring it because of:

```text
*.log
```

---

# Step 4 — Test an Ignored Folder

Create:

```bat
mkdir secrets
```

Inside it, create:

```bat
echo fake-example-password> secrets\password.txt
```

Run:

```bat
git status
```

The `secrets` folder and its contents should not appear as untracked files.

> The example password is intentionally fake. Never put real passwords or secrets into training files.

---

# Step 5 — Commit `.gitignore`

The `.gitignore` file itself **should** be tracked by Git.

Stage it:

```bat
git add .gitignore
```

Commit:

```bat
git commit -m "Add repository ignore rules"
```

Check:

```bat
git status
```

You should have a clean working tree.

---

# Important — `.gitignore` Does Not Delete Files

The ignored files still exist on your computer.

For example:

```text
test.log
```

still exists.

Git is simply choosing not to track it.

Verify:

```bat
dir
```

You should still see the file.

---

# Important — `.gitignore` Is Not Security

This is extremely important.

`.gitignore` helps prevent files from being accidentally added to Git.

It does **not** make files secret.

It does **not** encrypt them.

It does **not** protect a password that was already committed.

Never intentionally commit:

- Passwords
- API keys
- Access tokens
- Private SSH keys
- Real confidential information

If something sensitive was already committed, adding it to `.gitignore` afterward does not erase it from Git history.

You will learn more about secrets and credential handling later in Project LUNA.

---

# Checkpoint

You should now understand the difference between:

```text
.gitignore
```

A file containing ignore rules.

and:

```text
secrets/
```

An example folder that `.gitignore` has been told not to track.

Your repository should now contain a tracked `.gitignore` file while Git ignores files such as:

```text
test.log
```

---

# PART 9 — COMPLETE LAB 01

Open:

`labs/01-local-git.md`

Complete it before continuing.

---

# PART 10 — CREATE A GITHUB TRAINING REPOSITORY

Open GitHub in your browser.

Sign in.

In the upper-right area, click the **+** menu and choose **New repository**.

Repository name:

```text
luna-git-training
```

Description:

```text
Project LUNA Git and GitHub training repository
```

Choose:

**Public**

For this exercise, do **not** initialize it with:

- README
- `.gitignore`
- License

Your local repository already contains files.

Click **Create repository**.

GitHub should show instructions for pushing an existing repository.

Copy the HTTPS repository URL.

It will resemble:

```text
https://github.com/YOUR-USERNAME/luna-git-training.git
```

---

# PART 11 — CONNECT LOCAL GIT TO GITHUB

Return to Command Prompt inside your local training repository.

Check:

```bat
git remote -v
```

There should currently be no remote.

Add GitHub as `origin`:

```bat
git remote add origin YOUR-REPOSITORY-URL
```

Example:

```bat
git remote add origin https://github.com/example/luna-git-training.git
```

Verify:

```bat
git remote -v
```

Rename your current branch to `main`:

```bat
git branch -M main
```

Push it:

```bat
git push -u origin main
```

Git may ask you to authenticate.

On a normal Git for Windows installation, Git Credential Manager may open a browser window for GitHub authentication.

Follow the GitHub sign-in prompts.

When the push completes, refresh your repository page in the browser.

Your files and commits should now appear online.

---

# LOCAL VS REMOTE

You now have two related repositories.

```text
YOUR COMPUTER                   GITHUB
Local repository        ←→      Remote repository
```

The remote named:

```text
origin
```

points to your GitHub repository.

Display it:

```bat
git remote -v
```

---

# PART 12 — PUSH ANOTHER CHANGE

Edit:

```text
docs\station-notes.md
```

Add:

```markdown
Mission Control repository synchronization confirmed.
```

Save.

Then:

```bat
git status
git add docs\station-notes.md
git commit -m "Confirm Mission Control synchronization"
git push
```

Refresh GitHub.

The new commit should appear.

---

# PART 13 — PULL A CHANGE FROM GITHUB

This time, intentionally make a change using the GitHub website.

1. Open `README.md` on GitHub.
2. Click the pencil/edit button.
3. Add:

```markdown
## Remote Test

This line was added directly from GitHub.
```

4. Click **Commit changes**.
5. Accept the default commit directly to `main`.

Your remote repository now contains a commit your local computer does not have.

Return to Command Prompt.

Run:

```bat
git status
```

Then:

```bat
git pull
```

Open `README.md` locally.

The remote change should now exist on your computer.

This is the basic synchronization cycle:

```text
git pull
git push
```

---

# PART 14 — COMPLETE LAB 02

Open:

`labs/02-github-remotes.md`

Complete it before continuing.

---

# PART 15 — BRANCHES

A branch is an independent line of development.

Imagine Mission Control is stable, but you want to experiment with documentation.

Instead of changing `main` immediately, create a branch:

```bat
git switch -c docs/improve-readme
```

Check:

```bat
git branch
```

The `*` indicates your current branch.

Edit `README.md`.

Add:

```markdown
## Training Objectives

- Track changes
- Synchronize with GitHub
- Work with branches
```

Save.

Then:

```bat
git add README.md
git commit -m "Add training objectives"
```

Your new commit exists on `docs/improve-readme`.

Switch back:

```bat
git switch main
```

Look at `README.md`.

Your branch-specific change should disappear.

Nothing was deleted.

You simply changed which branch you are viewing.

---

# PART 16 — MERGE A BRANCH

Make sure you are on `main`:

```bat
git branch
```

Merge:

```bat
git merge docs/improve-readme
```

Now inspect `README.md`.

The branch change is part of `main`.

Push:

```bat
git push
```

You may optionally delete the completed local branch:

```bat
git branch -d docs/improve-readme
```

---

# PART 17 — UNDERSTANDING MERGE CONFLICTS

Git can often combine independent changes automatically.

Suppose one branch changes:

```text
STATUS: OPERATIONAL
```

to:

```text
STATUS: MAINTENANCE
```

while another branch changes the same line to:

```text
STATUS: CRITICAL
```

Git cannot safely guess which version is correct.

It creates a **merge conflict**.

A conflicted file may contain:

```text
<<<<<<< HEAD
STATUS: MAINTENANCE
=======
STATUS: CRITICAL
>>>>>>> other-branch
```

These are conflict markers.

You resolve the conflict by:

1. Opening the file.
2. Deciding what the final content should be.
3. Removing the conflict markers.
4. Saving the file.
5. Staging it.
6. Committing the resolution.

For example, you may decide the correct final line is:

```text
STATUS: CRITICAL
```

Then:

```bat
git add STATUS.md
git commit -m "Resolve station status conflict"
```

You will practice this shortly.

---

# PART 18 — COMPLETE LAB 03

Open:

`labs/03-branches-merges.md`

Complete it before continuing.

---

# PART 19 — MARKDOWN

Project documentation is part of engineering work.

GitHub automatically renders Markdown files such as:

```text
README.md
```

Basic Markdown:

```markdown
# Main Heading

## Section

### Smaller Section

Normal paragraph.

**Bold text**

*Italic text*

`inline code`

- Item
- Item
- Item
```

A code block:

````markdown
```bash
git status
git add .
git commit -m "Example"
```
````

A link:

```markdown
[GitHub](https://github.com)
```

A table:

```markdown
|Service|Port| Status |
|---    |---:|---     |
| SSH   | 22 | Online |
| HTTP  | 80 | Online |
```

A checkbox:

```markdown
- [x] Server online
- [ ] Database deployed
```

---

# A GOOD README

A portfolio README should help a stranger understand the project.

Useful sections include:

```text
Project Name
Purpose
Architecture
Technologies
Features
Setup
Usage
Screenshots
Known Limitations
What I Learned
```

Documentation should answer:

> What is this?

> Why does it exist?

> How does it work?

> How can someone run it?

---

# PART 20 — COMPLETE LAB 04

Open:

`labs/04-markdown-documentation.md`

Complete it before continuing.

---

# PART 21 — GITHUB ISSUES

GitHub Issues provide lightweight work tracking.

Inside your training repository on GitHub:

1. Click **Issues**.
2. Click **New issue**.
3. Title:

```text
Document LUNA-1 network architecture
```

4. In the description, enter:

```markdown
## Objective

Add documentation showing how Earth Mission Control communicates with LUNA-1.

## Acceptance Criteria

- [ ] Identify SSH
- [ ] Identify HTTP
- [ ] Include ports
```

5. Create the issue.

You have now converted an idea into a trackable work item.

After completing work, issues can be closed.

This basic pattern appears everywhere in software and infrastructure teams:

```text
Requirement
   ↓
Issue / Ticket
   ↓
Work
   ↓
Commit
   ↓
Review / Validation
   ↓
Close
```

You will encounter more structured workflows later.

---

# PART 22 — PREPARE FOR THE PROJECT

The training repository taught the mechanics.

Your final project is different.

You will now create:

```text
luna-operations
```

This is **not** a disposable lab.

It will become your permanent portfolio repository for Project LUNA.

Later missions will add:

- Scripts
- Databases
- APIs
- Containers
- Monitoring
- Automation
- AI
- Kubernetes

Proceed to:

`project/README.md`
