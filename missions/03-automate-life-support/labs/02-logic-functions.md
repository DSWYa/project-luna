# LAB 02 — LOGIC AND FUNCTIONS

Create a **Python file** named:

```text
sensor_rules.py
```

Build:

```python
evaluate_oxygen(value)
evaluate_temperature(value)
```

Oxygen rules:

```text
>= 19.5      NOMINAL
18.0-19.49   WARNING
< 18.0       CRITICAL
```

Temperature rules:

```text
18-26        NOMINAL
15-17.99     WARNING
26.01-30     WARNING
< 15         CRITICAL
> 30         CRITICAL
```

Test each function with at least three values.

Then create:

```python
evaluate_module(oxygen, temperature)
```

Return CRITICAL if either input evaluates as critical, WARNING if neither is critical but at least one is warning, otherwise NOMINAL.
