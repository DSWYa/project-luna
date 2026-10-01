# LAB 04 — CI & DEPLOYMENT AUTOMATION

Requirements:

1. `.github/workflows/ci.yml` exists.
2. CI runs on push.
3. CI runs on pull request.
4. CI checks Python syntax.
5. CI builds the API image.
6. CI validates Compose.
7. Create a temporary branch with a harmless syntax error.
8. Observe CI fail.
9. Correct the error.
10. Observe CI pass.
11. Run `scripts/deploy.sh` on LUNA-1 after a passing CI run.

Explain why this course does not expose your home/lab SSH server to the public internet merely to let a GitHub-hosted runner deploy automatically.
