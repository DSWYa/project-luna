LAB 03 — NETWORKING

Objective

Identify LUNA-1's network configuration and test communication.

Display interfaces:

ip a

Identify:

Your primary interface

Your IPv4 address

Write the address in your notes.

Now:

ip route

Look for:

default via

The associated address is generally your default gateway.

Test the local TCP/IP stack

Run:

ping 127.0.0.1

Stop:

Ctrl + C

Test the default gateway

Run:

ping YOUR-GATEWAY

Stop after several replies.

Test Internet reachability

Run:

ping 8.8.8.8

If it responds, your server can reach the Internet at the IP layer.

Test DNS

Run:

ping google.com

If this works, DNS name resolution is functioning.

For a more direct DNS test:

nslookup google.com

If the command does not exist:

sudo apt install dnsutils -y

Then try again.

Test HTTP

Run:

curl http://example.com

You should receive an HTTP response containing HTML.

Think About It

Imagine:

ping 8.8.8.8

works.

But:

ping google.com

fails.

Internet routing probably works.

What system should you investigate?

DNS.

That reasoning is more important than memorizing the commands.