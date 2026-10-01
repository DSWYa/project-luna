# MISSION 08 WALKTHROUGH

Mission 08 connects LUNA-1 to a cloud automation service.

The required path is free-first:

```text
LUNA-1
  ↓ HTTPS webhook
Google Apps Script
  ↓
Google Sheets + email
```

---

# PART 1 — TRIGGER VS ACTION

Most automation systems can be understood as:

```text
TRIGGER
something happens
   ↓
ACTION
do something
```

Example:

```text
TRIGGER
Critical maintenance ticket created

ACTION
Record event in Google Sheets
and send an email
```

---

# PART 2 — WHAT IS A WEBHOOK?

A webhook is an HTTP request sent because an event occurred.

Instead of one system repeatedly asking:

> Anything new?

another system can say:

> Something happened. Here is the data.

Example payload:

```json
{
  "station": "LUNA-1",
  "source": "maintenance",
  "severity": "CRITICAL",
  "message": "HAB-2 oxygen sensor requires inspection"
}
```

---

# PART 3 — SENDER AND RECEIVER

In Project LUNA:

```text
SENDER
LUNA-1

RECEIVER
Google Apps Script web app
```

The sender performs an HTTP POST.

The receiver parses the JSON and performs automation actions.

---

# PART 4 — WHY OUTBOUND AUTOMATION?

Your home/lab LUNA-1 may be:

- behind NAT,
- behind a router,
- on a private IP address,
- protected from inbound internet connections.

Project LUNA does **not** require you to expose a webhook endpoint on your home network.

LUNA-1 sends outbound HTTPS instead.

This is both simpler and a better security boundary for this project.

---

# PART 5 — VERIFY LUNA-1 INTERNET ACCESS

SSH into LUNA-1.

Test DNS/network access:

```bash
curl -I https://script.google.com
```

An HTTP response proves LUNA-1 can reach Google's service.

---

# PART 6 — CREATE THE GOOGLE SHEET

On Earth Mission Control:

1. Open Google Sheets.
2. Create a new blank spreadsheet.
3. Rename it:

```text
LUNA Automation Log
```

4. Rename the first sheet/tab:

```text
Events
```

5. In row 1 create these columns:

```text
Timestamp
Station
Source
Severity
Message
```

Your sheet should resemble:

```text
A          B        C       D         E
Timestamp  Station  Source  Severity  Message
```

---

# PART 7 — OPEN APPS SCRIPT

From the Google Sheet:

1. Click **Extensions**.
2. Click **Apps Script**.

This creates a script project bound to the spreadsheet.

Rename the Apps Script project:

```text
LUNA Earth Relay
```

---

# PART 8 — CREATE THE WEB APP CODE

Open:

```text
Code.gs
```

Replace its contents with:

```javascript
function jsonResponse(data) {
  return ContentService
    .createTextOutput(JSON.stringify(data))
    .setMimeType(ContentService.MimeType.JSON);
}


function doGet(e) {
  return jsonResponse({
    ok: true,
    service: "LUNA Earth Relay",
    status: "ONLINE"
  });
}


function doPost(e) {
  const properties =
    PropertiesService.getScriptProperties();

  const expectedToken =
    properties.getProperty("WEBHOOK_TOKEN");

  const alertEmail =
    properties.getProperty("ALERT_EMAIL");

  let payload;

  try {
    payload = JSON.parse(e.postData.contents);
  } catch (error) {
    return jsonResponse({
      ok: false,
      error: "invalid_json"
    });
  }

  if (!payload.token || payload.token !== expectedToken) {
    return jsonResponse({
      ok: false,
      error: "unauthorized"
    });
  }

  const spreadsheet =
    SpreadsheetApp.getActiveSpreadsheet();

  const sheet =
    spreadsheet.getSheetByName("Events");

  if (!sheet) {
    return jsonResponse({
      ok: false,
      error: "events_sheet_missing"
    });
  }

  const station =
    payload.station || "UNKNOWN";

  const source =
    payload.source || "UNKNOWN";

  const severity =
    payload.severity || "INFO";

  const message =
    payload.message || "";

  sheet.appendRow([
    new Date(),
    station,
    source,
    severity,
    message
  ]);

  if (severity === "CRITICAL" && alertEmail) {
    MailApp.sendEmail(
      alertEmail,
      `[PROJECT LUNA] CRITICAL — ${source}`,
      [
        `Station: ${station}`,
        `Source: ${source}`,
        `Severity: ${severity}`,
        "",
        message
      ].join("\n")
    );
  }

  return jsonResponse({
    ok: true,
    logged: true,
    emailed:
      severity === "CRITICAL" && Boolean(alertEmail)
  });
}
```

Save.

---

# PART 9 — UNDERSTAND `doGet` AND `doPost`

Apps Script reserves these names for web apps:

```text
doGet(e)
doPost(e)
```

A browser GET can trigger:

```javascript
doGet(e)
```

An HTTP POST can trigger:

```javascript
doPost(e)
```

`e.postData.contents` contains the POST request body.

---

# PART 10 — SCRIPT PROPERTIES

Do not write the shared secret directly into source code.

In the Apps Script editor:

1. Click **Project Settings**.
2. Find **Script Properties**.
3. Add:

```text
WEBHOOK_TOKEN
```

4. Add:

```text
ALERT_EMAIL
```

For `ALERT_EMAIL`, use the email address where you want Project LUNA alerts delivered.

Do not place these values into `Code.gs`.

---

# PART 11 — GENERATE A TOKEN

On LUNA-1:

```bash
openssl rand -hex 32
```

You should receive a long random value.

Example shape:

```text
a23f...many-more-random-characters...
```

Do not use the example.

Copy your generated value.

Set the same value as:

```text
WEBHOOK_TOKEN
```

in Apps Script Script Properties.

This token is a simple shared secret for the training relay.

It is not intended to represent enterprise identity/authentication.

---

# PART 12 — DEPLOY THE WEB APP

In Apps Script:

1. Click **Deploy**.
2. Click **New deployment**.
3. Choose **Web app** as the deployment type.
4. Give it a useful description such as:

```text
LUNA Earth Relay v1
```

5. Configure it to execute as you.
6. Choose an access option that allows LUNA-1 to call the web app without an interactive Google sign-in.
7. Deploy.
8. Approve the requested Google permissions.
9. Copy the deployed `/exec` URL.

If your organization does not allow an unauthenticated web-app access option, do not weaken an organization policy. Use an eligible personal/test Google account for the lab or follow your organization's approved method.

---

# PART 13 — TEST GET

From a browser, open the deployed URL.

You should receive JSON similar to:

```json
{
  "ok": true,
  "service": "LUNA Earth Relay",
  "status": "ONLINE"
}
```

Also test from LUNA-1:

```bash
curl -L "YOUR-APPS-SCRIPT-WEB-APP-URL"
```

`-L` follows redirects.

---

# PART 14 — STORE RELAY SETTINGS ON LUNA-1

Inside:

```text
~/luna-operations/.env
```

add:

```text
LUNA_AUTOMATION_WEBHOOK_URL=YOUR-WEB-APP-URL
LUNA_AUTOMATION_TOKEN=YOUR-RANDOM-TOKEN
```

Do not commit `.env`.

Update:

```text
.env.example
```

with:

```text
LUNA_AUTOMATION_WEBHOOK_URL=https://script.google.com/macros/s/REPLACE_ME/exec
LUNA_AUTOMATION_TOKEN=CHANGE_ME
```

---

# PART 15 — SEND A WEBHOOK WITH CURL

On LUNA-1, load the `.env` values into the current shell.

From the repository:

```bash
cd ~/luna-operations
set -a
source .env
set +a
```

Now send:

```bash
curl -L \
  -H "Content-Type: application/json" \
  -d "{
    \"token\": \"$LUNA_AUTOMATION_TOKEN\",
    \"station\": \"LUNA-1\",
    \"source\": \"training\",
    \"severity\": \"INFO\",
    \"message\": \"Mission 08 webhook test\"
  }" \
  "$LUNA_AUTOMATION_WEBHOOK_URL"
```

Expected response contains:

```json
{
  "ok": true
}
```

---

# PART 16 — VERIFY GOOGLE SHEETS

Return to:

```text
LUNA Automation Log
```

You should see a new row.

This proves:

```text
LUNA-1
↓
internet
↓
Apps Script
↓
Google Sheets
```

---

# PART 17 — TEST CRITICAL EMAIL

Send another event:

```bash
curl -L \
  -H "Content-Type: application/json" \
  -d "{
    \"token\": \"$LUNA_AUTOMATION_TOKEN\",
    \"station\": \"LUNA-1\",
    \"source\": \"life-support\",
    \"severity\": \"CRITICAL\",
    \"message\": \"Training alert: oxygen subsystem requires review\"
  }" \
  "$LUNA_AUTOMATION_WEBHOOK_URL"
```

The event should:

1. create a Google Sheets row,
2. send an email to `ALERT_EMAIL`.

---

# PART 18 — QUOTAS

Cloud automation services have quotas.

Apps Script quotas vary by account type and may change.

A normal consumer Google account has daily limits on actions such as email recipients.

Project LUNA's training volume should remain far below normal limits.

The engineering lesson is:

> An external dependency is not infinite.

Production systems should consider quotas, retries, and failure behavior.

---

# PART 19 — CREATE A PYTHON WEBHOOK SENDER

Mission 05 already uses Python inside the API.

Add to:

```text
app/requirements.txt
```

this package:

```text
requests
```

Create:

```text
app/automation.py
```

Paste:

```python
import os

import requests


def send_event(source, severity, message):
    url =
        os.environ.get("LUNA_AUTOMATION_WEBHOOK_URL")

    token =
        os.environ.get("LUNA_AUTOMATION_TOKEN")

    if not url or not token:
        print("Automation relay is not configured.")
        return False

    payload = {
        "token": token,
        "station": "LUNA-1",
        "source": source,
        "severity": severity,
        "message": message
    }

    try:
        response = requests.post(
            url,
            json=payload,
            timeout=10
        )

        response.raise_for_status()

        result = response.json()

        if not result.get("ok"):
            print(
                f"Automation relay rejected event: {result}"
            )
            return False

        return True

    except requests.RequestException as error:
        print(
            f"Automation relay request failed: {error}"
        )
        return False

    except ValueError as error:
        print(
            f"Automation relay returned invalid JSON: {error}"
        )
        return False
```

## Important

Python does not allow this:

```python
url =
    ...
```

on separate lines exactly as shown above without parentheses.

Write those two assignments on a single line in your real file:

```python
url = os.environ.get("LUNA_AUTOMATION_WEBHOOK_URL")
token = os.environ.get("LUNA_AUTOMATION_TOKEN")
```

The broken layout above is only showing the pieces visually.

A complete valid version is provided in the Academy reference.

---

# PART 20 — WHY THE SENDER RETURNS `False`

The station's primary operation should not necessarily fail because Google automation is temporarily unavailable.

For example:

```text
Create maintenance ticket
        ↓
database commit succeeds
        ↓
external notification attempted
```

If the external relay is down, the ticket should still exist.

This is **graceful degradation**.

The notification can fail without destroying the primary station operation.

---

# PART 21 — ADD RELAY VARIABLES TO THE API CONTAINER

In the API service of `compose.yaml`, pass:

```yaml
environment:
  LUNA_AUTOMATION_WEBHOOK_URL: ${LUNA_AUTOMATION_WEBHOOK_URL}
  LUNA_AUTOMATION_TOKEN: ${LUNA_AUTOMATION_TOKEN}
```

Keep your existing database environment variables too.

Rebuild after adding `requests`:

```bash
docker compose up -d --build
```

---

# PART 22 — TRIGGER AUTOMATION FROM FASTAPI

Import:

```python
from automation import send_event
```

After a maintenance ticket is successfully committed, call:

```python
send_event(
    source="maintenance",
    severity=new_ticket["priority"],
    message=(
        f'Ticket {new_ticket["ticket_id"]}: '
        f'{new_ticket["title"]}'
    )
)
```

The Apps Script relay logs every ticket event.

Only events whose severity is exactly:

```text
CRITICAL
```

cause email.

---

# PART 23 — TEST FROM `/docs`

Open:

```text
http://YOUR-LUNA-IP/docs
```

Create a normal ticket.

Verify:

```text
Google Sheet row
no CRITICAL email
```

Then create a CRITICAL ticket.

Verify:

```text
Google Sheet row
CRITICAL email
```

You now have:

```text
FastAPI
↓
PostgreSQL
↓
automation sender
↓
Apps Script
↓
Sheet + email
```

---

# PART 24 — SHEETS PRODUCTIVITY FEATURES

Inside the Events sheet:

1. Freeze row 1.
2. Turn on a filter.
3. Filter by Severity.
4. Add conditional formatting for:

```text
CRITICAL
```

5. Create a simple summary area.

Example formula:

```text
=COUNTIF(D:D,"CRITICAL")
```

Another:

```text
=COUNTIF(D:D,"INFO")
```

This turns an event log into a simple operations view.

---

# PART 25 — DAILY DIGEST FUNCTION

Return to Apps Script.

Add:

```javascript
function sendDailyDigest() {
  const properties =
    PropertiesService.getScriptProperties();

  const alertEmail =
    properties.getProperty("ALERT_EMAIL");

  if (!alertEmail) {
    return;
  }

  const sheet =
    SpreadsheetApp
      .getActiveSpreadsheet()
      .getSheetByName("Events");

  if (!sheet) {
    return;
  }

  const values =
    sheet.getDataRange().getValues();

  if (values.length <= 1) {
    return;
  }

  const now = new Date();

  const cutoff =
    new Date(
      now.getTime() - 24 * 60 * 60 * 1000
    );

  const recent =
    values.slice(1).filter(row => {
      const timestamp = row[0];

      return timestamp instanceof Date &&
        timestamp >= cutoff;
    });

  const critical =
    recent.filter(
      row => row[3] === "CRITICAL"
    );

  const body = [
    "PROJECT LUNA DAILY AUTOMATION DIGEST",
    "",
    `Events in last 24 hours: ${recent.length}`,
    `Critical events: ${critical.length}`
  ].join("\n");

  MailApp.sendEmail(
    alertEmail,
    "[PROJECT LUNA] Daily Automation Digest",
    body
  );
}
```

Save.

---

# PART 26 — CREATE A TIME-DRIVEN TRIGGER

In Apps Script:

1. Open **Triggers** using the clock/alarm icon.
2. Click **Add Trigger**.
3. Function:

```text
sendDailyDigest
```

4. Event source:

```text
Time-driven
```

5. Choose a daily schedule.
6. Save.
7. Approve permissions if prompted.

Apps Script now runs the function automatically.

This is scheduled automation instead of event-driven webhook automation.

---

# PART 27 — EVENT VS SCHEDULE

Webhook:

```text
event occurs
↓
run immediately
```

Time trigger:

```text
time arrives
↓
run scheduled task
```

Real automation platforms use both patterns.

---

# PART 28 — VERSION THE APPS SCRIPT SOURCE

Cloud configuration should still be documented.

Inside `luna-operations`, create:

```text
automation/google-apps-script/
```

Create:

```text
Code.gs
README.md
```

Copy the Apps Script source into:

```text
Code.gs
```

Do **not** include:

```text
WEBHOOK_TOKEN
ALERT_EMAIL
```

Those remain Script Properties.

The README should explain deployment but contain no real secrets.

---

# PART 29 — OPTIONAL ZAPIER COMPARISON

Zapier uses the same mental model:

```text
TRIGGER
↓
ACTION
```

As of this course version, Zapier's free plan is intended for basic two-step workflows.

Zapier's current documentation around webhook availability can differ between pages/accounts.

Therefore:

> Zapier is not required to complete Mission 08.

If your Zapier editor allows a Webhooks Catch Hook without requiring a paid feature or trial, you may complete the optional lab.

If it shows:

```text
Premium
Upgrade
Trial required
```

skip it.

Do not pay for Project LUNA.

---

# PART 30 — OPTIONAL ZAPIER CATCH HOOK

If available to your account:

1. Create a new Zap.
2. Trigger:
   `Webhooks by Zapier`.
3. Event:
   `Catch Hook`.
4. Copy the webhook URL.
5. From LUNA-1 send a test JSON payload using `curl`.
6. Confirm Zapier detects the payload.
7. Add one free action such as a test record/logging action available to your account.
8. Publish only if it remains inside the free plan.

The objective is to recognize that Zapier is implementing the same:

```text
webhook → parse fields → action
```

pattern you built manually.

---

# PART 31 — TROUBLESHOOTING AUTOMATION

If no Sheet row appears:

## Layer 1 — Does LUNA-1 have internet?

```bash
curl -I https://script.google.com
```

## Layer 2 — Is the web app alive?

```bash
curl -L "$LUNA_AUTOMATION_WEBHOOK_URL"
```

## Layer 3 — Does manual POST work?

Use the training `curl`.

## Layer 4 — Did the relay return `ok: true`?

Read the JSON body.

## Layer 5 — Does Apps Script show an execution?

Use the Apps Script **Executions** view.

## Layer 6 — Did the Sheet row appear?

Check `Events`.

## Layer 7 — Was email supposed to send?

Only:

```text
severity = CRITICAL
```

triggers immediate email.

## Layer 8 — Has an external quota or permission blocked the action?

Check execution errors.

---

# PART 32 — COMPLETE THE LABS

Complete:

```text
labs/01-webhook-basics.md
labs/02-apps-script.md
labs/03-station-integration.md
labs/04-zapier-optional.md
```

Then continue to:

```text
project/README.md
```
