# LAB 02 — GOOGLE APPS SCRIPT

Extend your relay.

Add a second sheet/tab:

```text
Summary
```

Create a function in Apps Script that writes or updates a simple summary containing:

```text
total events
critical events
warning events
info events
```

You may compute counts in Apps Script or use Google Sheets formulas.

Then add the summary function to:

```text
sendDailyDigest()
```

so the daily automation refreshes the summary before sending email.

Do not hard-code real tokens or passwords into `Code.gs`.
