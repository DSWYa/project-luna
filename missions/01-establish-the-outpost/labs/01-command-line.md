LAB 01 — COMMAND-LINE NAVIGATION

Objective

Become comfortable navigating LUNA-1 without a graphical interface.

Start LUNA-1 and log in.

Display your current location:

pwd

List the contents:

ls

Show hidden files:

ls -la

Move to the filesystem root:

cd /

Run:

pwd

Expected:

/

List the root directories:

ls

Visit:

cd /etc

Then:

pwd

Return home:

cd ~

Create a directory:

mkdir mission-control

Enter it:

cd mission-control

Create three directories:

mkdir logs
mkdir reports
mkdir telemetry

Verify:

ls

Create a file:

touch station-status.txt

Display the detailed contents:

ls -la

Edit the file:

nano station-status.txt

Enter:

LUNA-1 STATUS: OPERATIONAL

Save and exit.

Read the file:

cat station-status.txt

Copy it:

cp station-status.txt reports/status-backup.txt

Verify:

ls reports

Rename the original:

mv station-status.txt luna-status.txt

Verify:

ls

Checkpoint

Without looking above, try to answer:

What command:

Displays your current directory?

Lists files?

Changes directories?

Creates directories?

Copies files?

Moves or renames files?

Displays a text file?

If you cannot remember a command, look it up.

Looking things up is allowed.