# LAB 02 — STORAGE & NETWORKING

Perform on **LUNA-1**.

## Storage

Create a named volume.

Use one temporary container to write:

```text
LUNA PERSISTENCE TEST
```

to a file in the volume.

Remove that container.

Use another container to read the same file.

## Networking

Create a custom Docker network.

Run two containers on it.

From one container, reach the other using its **container name** rather than an IP address.

Explain:

- named volume,
- bind mount,
- Docker network,
- container DNS,
- why `localhost` does not mean another container.
