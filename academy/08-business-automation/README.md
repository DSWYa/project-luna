# ACADEMY 08 — WEBHOOKS & BUSINESS AUTOMATION

## Trigger / Action

```text
Trigger
something happens
↓
Action
something is done
```

## Webhook

```text
event
↓
HTTP POST
↓
receiver
```

## Apps Script Web App

```javascript
function doGet(e) {
  ...
}

function doPost(e) {
  ...
}
```

POST body:

```javascript
e.postData.contents
```

Parse:

```javascript
const payload =
  JSON.parse(e.postData.contents);
```

Return JSON:

```javascript
return ContentService
  .createTextOutput(JSON.stringify(data))
  .setMimeType(ContentService.MimeType.JSON);
```

## Script Properties

```javascript
const properties =
  PropertiesService.getScriptProperties();

const token =
  properties.getProperty("WEBHOOK_TOKEN");
```

Use properties for configuration that should not live in source code.

## Sheet Append

```javascript
const sheet =
  SpreadsheetApp
    .getActiveSpreadsheet()
    .getSheetByName("Events");

sheet.appendRow([
  new Date(),
  station,
  source,
  severity,
  message
]);
```

## Email

```javascript
MailApp.sendEmail(
  recipient,
  subject,
  body
);
```

## Valid Python Sender

```python
import os

import requests


def send_event(source, severity, message):
    url = os.environ.get(
        "LUNA_AUTOMATION_WEBHOOK_URL"
    )

    token = os.environ.get(
        "LUNA_AUTOMATION_TOKEN"
    )

    if not url or not token:
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

        return bool(result.get("ok"))

    except (
        requests.RequestException,
        ValueError
    ):
        return False
```

## Graceful Degradation

```text
primary operation succeeds
↓
secondary automation attempted
↓
secondary failure logged
but primary record remains
```

## Scheduled Automation

Apps Script installable time-driven triggers can run functions automatically according to a schedule.

## Troubleshooting Layers

```text
sender
↓
network
↓
receiver
↓
authentication
↓
JSON parse
↓
payload mapping
↓
downstream action
↓
quota/permission
```

HTTP success does not prove every downstream action succeeded.
