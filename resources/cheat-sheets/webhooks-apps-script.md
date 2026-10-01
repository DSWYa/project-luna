# WEBHOOK / APPS SCRIPT CHEAT SHEET

Webhook:

```text
sender → HTTP POST → receiver
```

Apps Script:

```javascript
function doGet(e) {}
function doPost(e) {}
```

Parse JSON:

```javascript
const payload =
  JSON.parse(e.postData.contents);
```

Script Property:

```javascript
const value =
  PropertiesService
    .getScriptProperties()
    .getProperty("NAME");
```

Append Sheet:

```javascript
sheet.appendRow([
  new Date(),
  value
]);
```

Email:

```javascript
MailApp.sendEmail(
  email,
  subject,
  body
);
```

LUNA environment:

```text
LUNA_AUTOMATION_WEBHOOK_URL
LUNA_AUTOMATION_TOKEN
```

Load `.env` in Bash:

```bash
set -a
source .env
set +a
```

Curl POST:

```bash
curl -L \
  -H "Content-Type: application/json" \
  -d '{"example":"value"}' \
  "$URL"
```

Python:

```python
requests.post(
    url,
    json=payload,
    timeout=10
)
```

Troubleshoot:

```text
internet?
↓
web app GET?
↓
manual POST?
↓
response JSON?
↓
Apps Script execution?
↓
Sheet row?
↓
email/action?
↓
quota?
```
