LAB 02 — USERS, FILES & PERMISSIONS

Linux permissions become extremely important later when Project LUNA begins running applications and services.

Start inside:

cd ~/mission-control

Create:

touch classified.txt

Run:

ls -l classified.txt

You may see something resembling:

-rw-r--r-- 1 lunaadmin lunaadmin 0 ... classified.txt

The exact output may differ.

The permission portion:

-rw-r--r--

can be divided into:

- | rw- | r-- | r--
    USER GROUP OTHER

r means read.

w means write.

x means execute.

Change the file so only your user can read and write it:

chmod 600 classified.txt

Check:

ls -l classified.txt

You should now see permissions similar to:

-rw-------

Create a script:

nano status.sh

Enter:

#!/bin/bash
echo "LUNA-1 STATUS: OPERATIONAL"

Save it.

Try:

./status.sh

You may receive:

Permission denied

Check:

ls -l status.sh

Add execute permission:

chmod +x status.sh

Run:

./status.sh

Expected:

LUNA-1 STATUS: OPERATIONAL

Why this matters

Later, applications may fail because:

A file cannot be read.

A script cannot execute.

A service does not own a directory.

A user has too much access.

A user has too little access.

Permissions are both a troubleshooting concept and a security concept.

You will return to them.