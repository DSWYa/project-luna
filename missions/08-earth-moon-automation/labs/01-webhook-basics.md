# LAB 01 — WEBHOOK BASICS

Perform from LUNA-1.

Use the Apps Script web app created during the walkthrough.

Send three events using `curl`:

```text
INFO
WARNING
CRITICAL
```

Use different messages.

Verify all three appear in Google Sheets.

Verify only CRITICAL produces the immediate alert email.

Then intentionally send one event with:

```text
wrong token
```

Verify it is rejected and not logged.

Explain:

- sender,
- receiver,
- payload,
- shared secret,
- trigger,
- action.
