# INCIDENT INC-002 — SOLUTION

Start with:

```bat
git status
```

Git should report an unmerged path.

Open:

```text
STATUS.md
```

You should see conflict markers.

The simulator intentionally caused two branches to change the same status line differently.

Choose a sensible final status.

For example:

```markdown
# LUNA Communications Status

STATUS: DEGRADED - ENGINEERING REVIEW COMPLETE
```

The exact wording is less important than resolving the conflict deliberately.

Remove all:

```text
<<<<<<<
=======
>>>>>>>
```

markers.

Save the file.

Stage it:

```bat
git add STATUS.md
```

Check:

```bat
git status
```

Git should now tell you that conflicts are resolved but the merge is still in progress.

Finish:

```bat
git commit -m "Resolve Mission Control status conflict"
```

Verify:

```bat
git status
```

You should receive:

```text
nothing to commit, working tree clean
```

Inspect history:

```bat
git log --oneline --graph --all
```

---

# Root Cause

Two branches independently modified the same line.

Git could not determine which version represented the correct final state.

Git therefore stopped and required human judgment.

This is a feature, not a failure.

Git refused to silently choose which engineer's change should win.
