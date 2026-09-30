MISSION 01 WALKTHROUGH

This walkthrough builds LUNA-1's first server.

Complete the labs when instructed.

PART 1 — INSTALL VIRTUALBOX

Open your web browser.

Search for:

Oracle VirtualBox

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

PART 2 — DOWNLOAD UBUNTU SERVER

Open:

ubuntu.com/download/server

Download the current Ubuntu Server LTS ISO for 64-bit Intel/AMD computers.

You are downloading an .iso file.

An ISO is essentially a virtual installation disc.

Do not extract it.

Keep track of where it downloads.

PART 3 — CREATE LUNA-1

Open VirtualBox.

Click:

New

For the name, enter:

LUNA-1

Choose the downloaded Ubuntu Server ISO if VirtualBox requests an ISO.

If VirtualBox offers an automatic or unattended installation, you may use it, but Project LUNA recommends performing the normal Ubuntu installation yourself so you can see the process.

Allocate approximately:

2 CPU cores
2048-4096 MB RAM
25 GB virtual disk

If your computer has limited resources, 2 GB RAM is acceptable for Mission 01.

Create the VM.

PART 4 — NETWORK CONFIGURATION

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

PART 5 — INSTALL UBUNTU SERVER

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

PART 6 — FIRST LOGIN

You should eventually see something similar to:

luna-1 login:

Enter:

lunaadmin

Enter your password.

Linux will not display password characters while typing.

This is normal.

You should arrive at a command prompt.

Run:

whoami

Expected:

lunaadmin

Run:

hostname

Expected:

luna-1

Run:

pwd

You should be in your home directory.

Congratulations.

LUNA-1 has booted for the first time.

PART 7 — UPDATE LUNA-1

Run:

sudo apt update

Enter your password when requested.

Then:

sudo apt upgrade -y

This may take several minutes.

PART 8 — COMPLETE THE COMMAND-LINE LAB

Open:

labs/01-command-line.md

Complete it before continuing.

PART 9 — COMPLETE THE FILES AND PERMISSIONS LAB

Open:

labs/02-files-permissions.md

Complete it before continuing.

PART 10 — FIND LUNA-1'S NETWORK ADDRESS

Run:

ip a

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

PART 11 — TEST CONNECTIVITY FROM EARTH

Leave LUNA-1 running.

On your Windows computer, open:

PowerShell

Run:

ping YOUR-LUNA-IP

Example:

ping 192.168.1.50

If replies return, Earth Mission Control can reach LUNA-1.

If the ping fails, complete the networking lab and troubleshooting section before continuing.

PART 12 — CONNECT USING SSH

From Windows PowerShell:

ssh lunaadmin@YOUR-LUNA-IP

Example:

ssh lunaadmin@192.168.1.50

The first connection may display a message asking whether you trust the server's identity.

Review it.

Then type:

yes

Enter your LUNA-1 password.

You should now see the Linux command prompt inside your Windows PowerShell window.

Run:

hostname

If the response is:

luna-1

you are remotely controlling your lunar server.

To disconnect:

exit

PART 13 — VERIFY SSH AS A SERVICE

SSH back into LUNA-1.

Run:

systemctl status ssh

You are looking for:

active (running)

Press:

q

if necessary to exit the status view.

PART 14 — INSTALL LUNA-1'S FIRST WEB SERVICE

Install Nginx:

sudo apt install nginx -y

Check it:

systemctl status nginx

You should see:

active (running)

From the server itself:

curl localhost

You should receive HTML.

Now open a browser on your host computer.

Enter:

http://YOUR-LUNA-IP

You should see the Nginx welcome page.

LUNA-1 is now serving network traffic to Earth Mission Control.

PART 15 — CREATE THE LUNA STATUS PAGE

On LUNA-1:

cd /var/www/html

View the files:

ls

Create your own page:

sudo nano index.html

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

PART 16 — CREATE A SNAPSHOT

Shut down Ubuntu cleanly:

sudo shutdown now

Wait for the VM to stop.

In VirtualBox, locate the snapshot interface.

Create a snapshot named:

M01 - Command Server Operational

Description:

Ubuntu installed, networking functional, SSH operational, and Nginx status page deployed.

Snapshots allow you to return the VM to an earlier state.

You will appreciate this later.

PART 17 — COMPLETE THE REMAINING LABS

Complete:

labs/03-networking.md

and:

labs/04-services-ssh.md

Then proceed to:

project/README.md