## MISSION 01 WALKTHROUGH

This walkthrough builds LUNA-1's first server.

Complete the labs when instructed.

# PART 1 — INSTALL VIRTUALBOX

Open your web browser.

Search for:
```text
Oracle VirtualBox
```
Open the official VirtualBox website.

Navigate to the downloads page.

Download the installer for your host operating system.

For Windows, choose:

Windows hosts

Run the installer.

Unless you have a specific reason to change a setting, accept the default installation options.

During installation, Windows may warn that network connectivity will temporarily reset.

This is normal because VirtualBox installs virtual networking components.

Complete the installation.

Launch VirtualBox.

# PART 2 — DOWNLOAD UBUNTU SERVER

Open:
```text
ubuntu.com/download/server
```
Download the current Ubuntu Server LTS ISO for 64-bit Intel/AMD computers.

You are downloading an .iso file.

An ISO is essentially a virtual installation disc.

Do not extract it.

Keep track of where it downloads.

# PART 3 — CREATE LUNA-1

Open VirtualBox.

Click:

New

For the name, enter:
```text
LUNA-1
```
Choose the downloaded Ubuntu Server ISO if VirtualBox requests an ISO.

If VirtualBox offers an automatic or unattended installation, you may use it, but Project LUNA recommends performing the normal Ubuntu installation yourself so you can see the process.

Allocate approximately:

2 CPU cores
2048-4096 MB RAM
25 GB virtual disk single file

If your computer has limited resources, 2 GB RAM is acceptable for Mission 01.

Create the VM.

# PART 4 — NETWORK CONFIGURATION

Open the settings for:

LUNA-1

Find:

Network

For Adapter 1, select:

Bridged Adapter

This allows LUNA-1 to behave more like another computer on your local network.

Select your active physical network interface.

For example:

Wi-Fi adapter if you use Wi-Fi

Ethernet adapter if connected by Ethernet

Save the settings.

NOTE:

Some networks do not work well with bridged VMs. If bridged networking fails, NAT can be used instead, but later SSH access may require port forwarding.

Project LUNA assumes Bridged mode whenever possible.

# PART 5 — INSTALL UBUNTU SERVER

Start the VM.

The Ubuntu installer should appear.

Choose your language.

Choose your keyboard configuration.

Continue with the standard Ubuntu Server installation.

When asked about networking, DHCP/default automatic networking is fine for Mission 01.

You do not need a static IP yet.

When asked for storage configuration, use the entire virtual disk.

Remember:

This is the virtual disk, not your actual computer's drive.

Create your user account.

Recommended values:

Your name:
LUNA Engineer

Server name:
luna-1

Username:
lunaadmin

Create a password you can remember.

When the installer asks about SSH:

Enable:

Install OpenSSH server

Do not install unnecessary server packages yet.

Complete the installation.

Reboot when instructed.

If the installer tells you to remove installation media, VirtualBox will usually handle this automatically.

Press Enter if requested.

# PART 6 — FIRST LOGIN

You should eventually see something similar to:

luna-1 login:

Enter:

lunaadmin

Enter your password.

Linux will not display password characters while typing.

This is normal.

You should arrive at a command prompt.

Run:
```bash
whoami
```
Expected:

lunaadmin

Run:
```bash
hostname
```
Expected:

luna-1

Run:
```bash
pwd
```
You should be in your home directory.

Congratulations.

LUNA-1 has booted for the first time.

# PART 7 — UPDATE LUNA-1

Run:
```bash
sudo apt update
```
Enter your password when requested.

Then:
```bash
sudo apt upgrade -y
```
This may take several minutes.

---

# PART 8 — INSTALL GIT

LUNA-1 will eventually need access to configuration files, scripts, documentation, and incident simulations stored in the Project LUNA repository.

Rather than manually copying files to the server, you will install **Git**.

Git is a version-control system.

You will explore Git in much greater depth during Mission 02.

For now, you only need to understand one important idea:

> Git allows you to retrieve and manage a project stored in a repository.

Install Git:

```bash
sudo apt install git -y
```

Verify the installation:

```bash
git --version
```

You should see something similar to:

```text
git version 2.x.x
```

The exact version does not matter.

---

# PART 9 — DOWNLOAD PROJECT LUNA

Return to your home directory:

```bash
cd ~
```

Now clone the Project LUNA repository.

Use:

```bash
git clone YOUR-PROJECT-LUNA-REPOSITORY-URL
```

For example:

```bash
git clone https://github.com/YOUR-USERNAME/project-luna.git
```

Git will download the repository into a new directory.

Verify:

```bash
ls
```

You should now see:

```text
project-luna
```

Enter it:

```bash
cd project-luna
```

List the contents:

```bash
ls
```

You should see directories such as:

```text
academy
missions
resources
simulator
tests
capstone
```

LUNA-1 now has a local copy of the bootcamp repository.

---

## Why Are We Doing This?

Later in Mission 01, Mission Control will provide an incident simulation.

Instead of copying the simulation manually onto the server, you will run it directly from the repository.

You will learn how Git actually tracks changes, commits, branches, and collaboration during Mission 02.

For now, remember:

```bash
git clone URL
```

means:

> "Download a local copy of this repository."

---

## Updating the Repository Later

If Mission Control updates Project LUNA after you originally cloned it, you can retrieve the newest changes.

First enter the repository:

```bash
cd ~/project-luna
```

Then:

```bash
git pull
```

You do not need to understand exactly how `git pull` works yet.

That comes in Mission 02.

For now:

```text
git clone = get the repository for the first time

git pull = retrieve newer changes later
```

---

# PART 10 — COMPLETE THE COMMAND-LINE LAB

Open:

```text
missions/01-establish-the-outpost/labs/01-command-line.md
```

Complete it before continuing.

---

# PART 11 — COMPLETE THE FILES AND PERMISSIONS LAB

Open:

labs/02-files-permissions.md

Complete it before continuing.

---

# PART 12 — YOUR FIRST SHELL SCRIPT

So far, you have entered commands one at a time.

Linux can also execute a list of commands stored inside a file.

This is called a **shell script**.

Throughout Project LUNA, scripts will allow us to automate repetitive tasks.

Mission 03 will explore scripting much more deeply.

For Mission 01, you only need the fundamentals.

---

## What Is Bash?

When you enter commands into the Linux terminal, a program called a **shell** interprets what you type.

Ubuntu commonly uses **Bash**.

Bash stands for:

```text
Bourne Again Shell
```

A Bash script is simply a text file containing commands that Bash can execute.

---

## Create a Script

Return home:

```bash
cd ~
```

Create a directory:

```bash
mkdir -p luna-training/scripts
```

Enter it:

```bash
cd luna-training/scripts
```

Create:

```bash
nano hello-luna.sh
```

Enter:

```bash
#!/bin/bash

echo "PROJECT LUNA"
echo "LUNA-1 ONLINE"
```

Save and exit.

---

## The Shebang

The first line:

```bash
#!/bin/bash
```

is called a **shebang**.

It tells Linux which interpreter should execute the script.

In this case:

```text
/bin/bash
```

---

## Comments

Lines beginning with:

```bash
#
```

are comments.

Example:

```bash
#!/bin/bash

# Display station status
echo "LUNA-1 ONLINE"
```

Comments are ignored when the script runs.

They exist for humans reading the code.

---

## echo

The command:

```bash
echo
```

prints text.

Example:

```bash
echo "LUNA-1 ONLINE"
```

Output:

```text
LUNA-1 ONLINE
```

---

## Variables

Variables allow scripts to temporarily store information.

Example:

```bash
station="LUNA-1"
```

To use the variable:

```bash
echo "$station"
```

Complete example:

```bash
#!/bin/bash

station="LUNA-1"

echo "Station:"
echo "$station"
```

---

## Store Command Output

A script can also store the result of another command.

Example:

```bash
current_user=$(whoami)
```

The syntax:

```bash
$(COMMAND)
```

means:

> Run this command and use its output.

Try:

```bash
#!/bin/bash

current_user=$(whoami)

echo "Current User:"
echo "$current_user"
```

You can also write:

```bash
echo "Current User: $current_user"
```

---

## Build a Simple System Report

Create:

```bash
nano system-check.sh
```

Enter:

```bash
#!/bin/bash

hostname_value=$(hostname)
user_value=$(whoami)
date_value=$(date)

echo "=============================="
echo "       LUNA SYSTEM CHECK"
echo "=============================="
echo "Hostname: $hostname_value"
echo "User: $user_value"
echo "Date: $date_value"
echo "=============================="
```

Save the file.

---

## Make the Script Executable

Check its permissions:

```bash
ls -l system-check.sh
```

Now:

```bash
chmod +x system-check.sh
```

Run it:

```bash
./system-check.sh
```

You should receive a formatted system report.

---

## More Useful Commands

You have already learned commands that can be useful inside scripts.

Hostname:

```bash
hostname
```

Current user:

```bash
whoami
```

Current date:

```bash
date
```

System uptime:

```bash
uptime
```

Disk usage:

```bash
df -h
```

IP information:

```bash
ip a
```

Because these are ordinary Linux commands, they can also be placed inside scripts.

For example:

```bash
#!/bin/bash

echo "LUNA-1 DISK STATUS"
df -h
```

---

## Redirecting Output to a File

Normally:

```bash
echo "LUNA-1 ONLINE"
```

prints to the terminal.

Using:

```bash
>
```

redirects the output into a file.

Example:

```bash
echo "LUNA-1 ONLINE" > status.txt
```

Read it:

```bash
cat status.txt
```

Be careful:

```bash
>
```

replaces the contents of the file.

Using:

```bash
>>
```

adds to the end instead.

Example:

```bash
echo "SYSTEM CHECK COMPLETE" >> status.txt
```

---

## A Script Can Generate a Report

Try:

```bash
#!/bin/bash

echo "PROJECT LUNA SYSTEM REPORT" > report.txt
echo "Hostname: $(hostname)" >> report.txt
echo "User: $(whoami)" >> report.txt
echo "Date: $(date)" >> report.txt
echo "" >> report.txt
echo "Disk Usage:" >> report.txt
df -h >> report.txt
```

Run it.

Then:

```bash
cat report.txt
```

You have now created a script that automatically generates documentation.

---

## Important Syntax From This Section

You should recognize:

```bash
#!/bin/bash
```

Use Bash to execute the file.

```bash
# comment
```

Comment.

```bash
echo "text"
```

Display text.

```bash
name="value"
```

Create a variable.

```bash
echo "$name"
```

Use a variable.

```bash
value=$(command)
```

Store command output.

```bash
>
```

Replace a file with command output.

```bash
>>
```

Append command output to a file.

```bash
chmod +x script.sh
```

Make a script executable.

```bash
./script.sh
```

Run a script from the current directory.

---

## Checkpoint

Before continuing, create a script named:

```text
crew-check.sh
```

It must automatically display:

```text
PROJECT LUNA
Hostname: <actual hostname>
Engineer: <actual current user>
Current Time: <actual system date/time>
```

Do not manually type your hostname or username into the output.

Retrieve them from Linux.

Once it works, continue to networking.

---

# PART 13 — FIND LUNA-1'S NETWORK ADDRESS

Run:
```bash
ip a
```
Look for an address associated with your main network interface.

Ignore:

127.0.0.1

That is the loopback address.

You are looking for something resembling:

192.168.x.x

or:

10.x.x.x

Write the address down.

For the rest of the course, examples may use:

192.168.1.50

Your actual address will probably be different.

---

# PART 14 — TEST CONNECTIVITY FROM EARTH

Leave LUNA-1 running.

On your Windows computer, open:

PowerShell

Run:
```bash
ping YOUR-LUNA-IP
```
Example:

ping 192.168.1.50

If replies return, Earth Mission Control can reach LUNA-1.

If the ping fails, complete the networking lab and troubleshooting section before continuing.

# PART 15 — CONNECT USING SSH

From Windows PowerShell:
```bash
ssh lunaadmin@YOUR-LUNA-IP
```
Example:
```bash
ssh lunaadmin@192.168.1.50
```
The first connection may display a message asking whether you trust the server's identity.

Review it.

Then type:
```bash
yes
```
Enter your LUNA-1 password.

You should now see the Linux command prompt inside your Windows PowerShell window.

Run:
```bash
hostname
```
If the response is:

luna-1

you are remotely controlling your lunar server.

To disconnect:
```bash
exit
```

---

# PART 16 — VERIFY SSH AS A SERVICE

SSH back into LUNA-1.

Run:

```bash
systemctl status ssh
```
You are looking for:

```text
active (running)
```
Press:
```bash
q
```
if necessary to exit the status view.

---

# PART 17 — INSTALL LUNA-1'S FIRST WEB SERVICE

Install Nginx:
```bash
sudo apt install nginx -y
```
Check it:
```bash
systemctl status nginx
```
You should see:
```text
active (running)
```
From the server itself:
```bash
curl localhost
```
You should receive HTML.

Now open a browser on your host computer.

Enter:
```text
http://YOUR-LUNA-IP
```
You should see the Nginx welcome page.

LUNA-1 is now serving network traffic to Earth Mission Control.

---

# PART 18 — CREATE THE LUNA STATUS PAGE

On LUNA-1:
```bash
cd /var/www/html
```
View the files:
```bash
ls
```
Create your own page:
```bash
sudo nano index.html
```
Replace the existing contents with:

<!DOCTYPE html>
<html>
<head>
    <title>LUNA-1 Status</title>
</head>
<body>
    <h1>LUNA-1 COMMAND SERVER</h1>
    <p>Status: OPERATIONAL</p>
    <p>Mission: Project LUNA</p>
    <p>Node: luna-1</p>
</body>
</html>

Save in Nano:

Ctrl + O

Press Enter.

Exit:

Ctrl + X

Refresh the webpage on your host computer.

You should now see:

LUNA-1 COMMAND SERVER

Status: OPERATIONAL

Mission: Project LUNA

Node: luna-1

---

# PART 19 — CREATE A SNAPSHOT

Shut down Ubuntu cleanly:

sudo shutdown now

Wait for the VM to stop.

In VirtualBox, locate the snapshot interface.

Create a snapshot named:
```text
M01 - Command Server Operational
```
Description:

Ubuntu installed, networking functional, SSH operational, and Nginx status page deployed.

Snapshots allow you to return the VM to an earlier state.

You will appreciate this later.

---

# PART 20 — COMPLETE THE REMAINING LABS

Complete:

labs/03-networking.md

and:

labs/04-services-ssh.md

Then proceed to:

project/README.md