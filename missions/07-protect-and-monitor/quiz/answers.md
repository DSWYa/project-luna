# MISSION 07 — ANSWERS

1. To avoid locking yourself out.
2. Validates SSH daemon configuration syntax.
3. So you retain a working recovery session if the new configuration is wrong.
4. Prevents direct root SSH login.
5. Ubuntu's uncomplicated firewall management frontend.
6. Docker creates NAT/firewall rules for published ports that can bypass the normal UFW path.
7. `ss -tulpn`
8. So it is only reachable locally and through an intentional SSH tunnel.
9. Forwards a local client port through SSH to a destination reachable by the server.
10. To restrict the secret file to its owner.
11. Placeholder configuration, not real secrets.
12. Git history already contains the old committed content.
13. Logs produced by the API Compose service.
14. A time-series monitoring and metrics system.
15. A Linux host metrics exporter.
16. A visualization/dashboard platform.
17. Whether Prometheus considers a scrape target reachable.
18. Prometheus Query Language.
19. A condition Prometheus evaluates against metrics.
20. Monitoring is a separate system with its own configuration and dependencies.
21. Continuous Integration.
22. Continuous Delivery/Deployment.
23. `.github/workflows/`
24. To detect configuration errors before deployment.
25. Public exposure would add unnecessary risk just to automate deployment.
26. It prevents Git from creating a merge commit during deployment pull.
27. Causes a shell script to stop when a command fails.
28. Edit → commit → push → CI pass → SSH → deploy script → health validation.
