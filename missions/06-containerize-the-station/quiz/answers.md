# MISSION 06 — ANSWERS

1. An image is a template; a container is an instance of that image.
2. Downloads an image.
3. Creates and starts a container from an image.
4. Detached/background mode.
5. Host port 8080 forwards to container port 80.
6. Docker-managed persistent storage.
7. A host path mounted into a container.
8. Container filesystems are disposable; database data must survive recreation.
9. `/var/lib/postgresql`
10. A virtual network connecting containers.
11. By container/service DNS name.
12. The current container itself.
13. Build instructions for an image.
14. Chooses the base image.
15. Sets the working directory inside the image.
16. Runs a command during image build.
17. Defines the default startup command.
18. Excludes files from the Docker build context.
19. A declarative way to define a multi-container application.
20. Creates/starts the Compose services in the background.
21. Stops/removes Compose containers and network while preserving named volumes by default.
22. `-v` removes Compose-managed volumes and can destroy persistent database data.
23. A command Docker uses to determine application readiness/health.
24. Lets dependent services wait for a dependency to become healthy.
25. Nginx is the public entry point; API and database can remain internal.
26. `127.0.0.1` means the API container, while `db` resolves to the PostgreSQL service.
27. It contains secrets/configuration that should not enter Git history.
28. `docker compose logs`
29. `docker compose exec api sh`
30. Docker daemon access through the Docker group effectively grants root-level control of the host.
