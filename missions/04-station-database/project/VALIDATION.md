# MISSION 04 VALIDATION

Run on **LUNA-1**:

```bash
cd ~/project-luna
git pull
sudo -u postgres psql -d luna_operations -f ~/project-luna/tests/mission-04/check.sql
```

Also manually verify documentation, branch usage, commits, and GitHub push.
