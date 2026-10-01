# ECLIPSE PROTOCOL — SOLUTION

Do not read until your own recovery attempt is complete.

---

# FAILURE 1 — API SERVICE SELECTOR

The Service was changed to:

```text
app=luna-api-eclipse
```

but API Pods use:

```text
app=luna-api
```

Result:

```text
Service has no valid endpoints
Ingress cannot route to API
```

Repair the Service selector so it matches the API Pod label.

Verify:

```bash
kubectl get endpoints luna-api -n luna
```

---

# FAILURE 2 — OLLAMA SCALED TO ZERO

The Ollama Deployment's desired replica count became:

```text
0
```

Repair:

```bash
kubectl scale deployment ollama \
  --replicas=1 \
  -n luna
```

Wait for Ready.

Verify:

```text
/api/ai/health
```

---

# FAILURE 3 — PROMETHEUS TARGET PORT

Prometheus was changed to scrape:

```text
node-exporter:9200
```

Correct:

```text
node-exporter:9100
```

Apply the corrected ConfigMap/manifests.

Restart or reload Prometheus as required by your design.

Verify the target is UP.

---

# FAILURE 4 — EQUIPMENT RELATIONSHIP

The:

```text
Primary Oxygen Scrubber
```

still exists.

HAB-1 still exists.

Its:

```text
module_id
```

was changed to:

```text
NULL
```

Restore the relationship to HAB-1 using a targeted SQL update.

Verify with a join.

---

# FINAL LESSON

The incident contained four independent failures:

```text
Kubernetes Service discovery
desired replica state
monitoring configuration
relational data integrity
```

No single restart could correctly repair them all.

The correct strategy was:

```text
observe
localize
verify
repair minimally
validate
```
