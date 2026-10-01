# MISSION 09 — ANSWERS

1. The model is trained weights; the runtime loads and serves them.
2. Ollama.
3. `qwen3:0.6b`
4. In Docker on LUNA-1.
5. Only the internal FastAPI service needs direct access.
6. A model's basic text-processing unit, often a word or word fragment.
7. Information supplied to the model for the current request.
8. Unsupported or false generated content.
9. Basing model output on supplied trusted evidence.
10. To avoid presenting unsupported claims as facts.
11. Untrusted text attempting to override the intended instructions.
12. A ticket may contain user-controlled text rather than trusted AI instructions.
13. Models can be wrong, manipulated, or malformed.
14. It gives the application a predictable output shape.
15. It enforces the application's required types and fields.
16. It keeps the producer contract aligned with the consumer model.
17. To reduce unnecessary output randomness.
18. Local inference can stall or take time; the app needs a failure boundary.
19. Deterministic application code should decide what evidence the model receives.
20. Faster inference, less noise, smaller exposure, easier debugging.
21. AI is advisory and should not control database operations directly.
22. AI is a secondary capability.
23. Secondary failure does not destroy core application functionality.
24. Hypotheses are inference, not confirmed evidence.
25. Local models can still follow malicious instructions embedded in data.
26. To compare output against known evidence and regressions.
27. AI runtime testing is comparatively resource-heavy; CI can still validate syntax/builds quickly.
28. `/root/.ollama`
29. `ollama`
30. Shell execution, container restart/control, DB updates, ticket closure, firewall changes, and arbitrary action execution.
