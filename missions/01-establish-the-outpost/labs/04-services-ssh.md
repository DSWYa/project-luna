LAB 04 — SERVICES & REMOTE ADMINISTRATION

Objective

Practice controlling Linux services and administering LUNA-1 remotely.

Check SSH:

systemctl status ssh

Check Nginx:

systemctl status nginx

Stop the web server

Run:

sudo systemctl stop nginx

Check:

systemctl status nginx

From your host browser, try opening:

http://YOUR-LUNA-IP

The page should fail.

Start Nginx:

sudo systemctl start nginx

Refresh your browser.

The page should return.

Restart a service

Run:

sudo systemctl restart nginx

Then:

systemctl status nginx

Test from inside LUNA-1

Run:

curl localhost

This tests the web server locally.

Test from Earth

From Windows PowerShell:

curl.exe http://YOUR-LUNA-IP

This tests the web server across the network.

Notice the difference.

If:

curl localhost

works on the server but your Windows browser cannot connect, the web application itself may not be the problem.

The problem could instead involve:

Networking

Routing

Firewall rules

Addressing

VirtualBox networking

This is the beginning of layered troubleshooting.

Final Exercise

Disconnect from the VM console.

Use only Windows PowerShell.

Connect:

ssh lunaadmin@YOUR-LUNA-IP

Once connected, run:

hostname

Then:

uptime

Then:

systemctl status nginx

Then:

exit

If you successfully performed those tasks without touching the VM console:

Remote administration is operational.