🌑 MISSION 01 — ESTABLISH THE OUTPOST
MISSION ID: LUNA-M01
PRIORITY: CRITICAL
ROLE: Junior Systems Engineer
OBJECTIVE: Establish LUNA-1's first operational server

Mission Briefing
LUNA-1 has power.
It has communications hardware.
It has environmental equipment.
What it does not have is a computer capable of managing any of it.
Mission Control requires the station's first general-purpose server.
This system will eventually support:
- Environmental telemetry
- Equipment monitoring
- Databases
- Maintenance systems
- Internal APIs
- Automation
- Mission Control communications
- AI services
For now, your job is much simpler.
Build the server.
You will create a virtualized Linux server representing the first computer installed at LUNA-1.
By the end of this mission, you must be able to remotely access the server from your own computer without using its virtual console.
You will also deploy LUNA-1's first network service: a simple HTTP status page.

Why Linux?
A huge amount of modern infrastructure runs on Linux.
Linux is commonly used for:
- Web servers
- Cloud infrastructure
- Containers
- Databases
- Networking appliances
- Cybersecurity tools
- Development environments
- Automation
- Kubernetes
You do not need to become a Linux expert during Mission 01.
You need to become comfortable enough that a command line no longer feels mysterious.
Throughout Project LUNA, you will return to this server repeatedly.

Why a Virtual Machine?
Installing Linux directly onto your computer would be inconvenient and potentially destructive.
Instead, you will use a virtual machine, or VM.
A VM is essentially a simulated computer running inside another computer.
Your physical computer is called the:
Host
The simulated computer is called the:
Guest
For Project LUNA:
Your computer = Earth Mission Control
The Ubuntu VM = LUNA-1
Virtualization allows you to experiment safely.
If you completely destroy your server configuration, your actual computer remains unaffected.
That makes virtual machines perfect laboratories.

Mission Architecture
At the beginning:
            🌎 EARTH
        YOUR COMPUTER
              │
              │
              ?
              │
              ▼
             🌑
           LUNA-1

        [NO SERVER]
At the end:
            🌎 EARTH
        YOUR COMPUTER
              │
              │ SSH / HTTP
              │
              ▼
             🌑
           LUNA-1
      ┌────────────────┐
      │ Ubuntu Server  │
      │                │
      │ SSH            │
      │ Web Server     │
      │ Linux Services │
      └────────────────┘

Your Mission
You must:
1. Install a virtualization platform.
2. Create an Ubuntu Server virtual machine.
3. Learn basic Linux navigation.
4. Create and modify files.
5. Understand basic Linux permissions.
6. Identify processes and services.
7. Learn fundamental networking concepts.
8. Determine your server's IP address.
9. Test network connectivity.
10. Install and configure SSH.
11. Remotely connect to LUNA-1.
12. Install a web server.
13. Create a LUNA-1 status page.
14. Troubleshoot an operational incident.
15. Complete the Mission 01 project.
When all required systems are operational:
Mission 01 is complete.

Before Continuing
Open:
OBJECTIVES.md
Then continue to:
WALKTHROUGH.md