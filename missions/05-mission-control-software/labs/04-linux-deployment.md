# LAB 04 — LINUX SERVICE DEPLOYMENT

Perform this lab on **LUNA-1**.

Create a small disposable FastAPI service.

Requirements:

1. Create a virtual environment.
2. Create a requirements file.
3. Create an environment file.
4. Create a systemd service.
5. Start it using `systemctl`.
6. Confirm it survives closing the SSH session.
7. Inspect it with `systemctl status`.
8. Inspect logs with `journalctl`.
9. Reach it with `curl`.
10. Restart it successfully.

If the final API uses port 8000, use a training port such as:

```text
8100
```
