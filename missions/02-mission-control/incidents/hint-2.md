# INCIDENT INC-002 — HINT 2

Open the file Git identifies as conflicted.

Look for markers resembling:

```text
<<<<<<< HEAD
one version
=======
another version
>>>>>>> branch-name
```

Those markers are not supposed to remain in the final file.

Decide what the file **should** contain.

Remove the markers.

Save the file.

Then remember the Git lifecycle:

```text
edit
  ↓
stage
  ↓
commit
```

If you remain stuck, open `solution.md`.
