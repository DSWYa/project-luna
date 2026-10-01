# MISSION 07 — LEARNING OBJECTIVES

By the end of Mission 07, you should be able to:

## Host Security

- Create an Ed25519 SSH key.
- Install a public key on LUNA-1.
- Verify key authentication before disabling password authentication.
- Validate SSH configuration before reload.
- Prevent direct root SSH login.
- Configure basic UFW host rules.
- Explain why Docker-published ports require special firewall awareness.
- Audit listening sockets.

## Secrets

- Keep `.env` files out of Git.
- Verify ignored files.
- Apply restrictive Linux file permissions.
- Explain why deleting a secret from the latest Git version does not automatically remove it from history.
- Separate example configuration from real configuration.

## Logs

- Read Docker Compose logs.
- Read systemd/journald logs.
- Inspect recent and live logs.
- Use logs to isolate a failing layer.

## Monitoring

- Explain metrics.
- Run Prometheus.
- Run Node Exporter.
- Run Grafana.
- Keep monitoring interfaces private.
- Use SSH port forwarding to reach private services.
- Query Prometheus with basic PromQL.
- Create basic Grafana panels.
- Create a Prometheus alert rule.

## CI

- Explain continuous integration.
- Create a GitHub Actions workflow.
- Run checks on push and pull request.
- Validate Python syntax.
- Build the API Docker image.
- Validate Docker Compose configuration.
- Interpret a failed workflow.

## Deployment

- Create a repeatable deployment shell script.
- Pull code.
- validate Compose,
- build,
- deploy,
- and verify health.
