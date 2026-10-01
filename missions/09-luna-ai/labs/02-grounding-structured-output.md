# LAB 02 — GROUNDING & STRUCTURED OUTPUT

Create a Python test using:

```text
AIIncidentAnalysis
```

Give the model evidence containing:

```text
ticket
module
telemetry
```

Requirements:

1. Return validated structured JSON.
2. Include at least one observed fact.
3. Include at least one hypothesis.
4. Include at least one recommended check.
5. Include missing information.
6. Confidence must be between 0 and 1.
7. Add one piece of information the evidence does **not** contain.
8. Verify the model does not claim it observed that missing information.

If it hallucinates, document the failure.
