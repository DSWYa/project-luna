✅ MISSION 01 COMPLETE

LUNA-1 COMMAND SERVER: OPERATIONAL

Mission Control has confirmed successful communication with the station's first server.

========================================
          PROJECT LUNA
========================================

NODE:          LUNA-1
LINUX:         ONLINE
NETWORK:       ONLINE
SSH:           ONLINE
HTTP:          ONLINE
MISSION:       COMPLETE

========================================

You began this mission with an empty virtual machine.

You now have:

A functioning Linux server

A working virtual network

Remote SSH administration

A running network service

A basic web server

Experience navigating Linux

Experience working with permissions

Experience managing services

Experience troubleshooting a service failure

More importantly, you have built the foundation everything else in Project LUNA will depend on.

What You Should Now Understand

You do not need to memorize every command.

But terms such as these should no longer feel foreign:

VM
Linux
Shell
sudo
IP address
DNS
gateway
TCP
port
SSH
HTTP
service
process
systemd

You should also understand something more important:

When a system fails, you can investigate it one layer at a time.

LUNA-1 ARCHITECTURE

                 🌎 EARTH
             Mission Control
                   │
             SSH │ │ HTTP
                 │ │
                 ▼ ▼
                  🌑
                LUNA-1
        ┌───────────────────┐
        │   Ubuntu Server   │
        │                   │
        │  SSH      :22     │
        │  Nginx    :80     │
        │                   │
        │  Linux Services   │
        └───────────────────┘

One server is now operational.

But a lunar station will soon generate thousands of configuration files, scripts, diagrams, and software changes.

Mission Control needs a way to track them.

That problem belongs to:

MISSION 02 — MISSION CONTROL

Next Technology: Git + GitHub

Proceed when ready.

FILE: resources/cheat-sheets/linux-networking.md

LINUX & NETWORKING CHEAT SHEET

Navigation

pwd

Current directory.

ls

List files.

ls -la

Detailed listing including hidden files.

cd directory

Change directory.

cd ..

Up one directory.

cd ~

Home directory.

Files

touch file.txt

Create file.

mkdir directory

Create directory.

cp source destination

Copy.

mv source destination

Move/rename.

rm file

Delete file.

rm -r directory

Delete directory recursively.

cat file.txt

Display file.

nano file.txt

Edit file.

Users & Permissions

whoami

Current user.

sudo COMMAND

Run command with elevated privileges.

ls -l

View permissions.

chmod +x script.sh

Add execute permission.

Packages

sudo apt update

Refresh package information.

sudo apt upgrade

Install available upgrades.

sudo apt install PACKAGE

Install package.

Processes

ps aux

Display processes.

top

Interactive process viewer.

Services

systemctl status SERVICE

Check service.

sudo systemctl start SERVICE

Start service.

sudo systemctl stop SERVICE

Stop service.

sudo systemctl restart SERVICE

Restart service.

sudo systemctl enable SERVICE

Enable service at startup.

Networking

ip a

View interfaces and addresses.

ip route

View routes/default gateway.

ping ADDRESS

Test network reachability.

nslookup NAME

Query DNS.

curl URL

Send an HTTP request.

SSH

ssh USER@ADDRESS

Connect remotely.

exit

Disconnect.

Common Ports

22   SSH
53   DNS
80   HTTP
443  HTTPS

Troubleshooting Order

When something fails, ask:

1. Is the machine running?
        ↓
2. Does it have an IP address?
        ↓
3. Can I reach the machine?
        ↓
4. Is the service running?
        ↓
5. Does the service work locally?
        ↓
6. Does it work remotely?

Do not change ten things at once.

Test.

Observe.

Narrow the problem.

Then act.