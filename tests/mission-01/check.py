import socket
import sys
import urllib.request
from getpass import getpass

print("=" * 48)
print("          PROJECT LUNA VALIDATION")
print("                MISSION 01")
print("=" * 48)

ip = input("\nEnter the IP address of LUNA-1: ").strip()

passed = 0
failed = 0


def result(name, success, message=""):
    global passed, failed

    if success:
        print(f"[PASS] {name}")
        passed += 1
    else:
        print(f"[FAIL] {name}")
        failed += 1

    if message:
        print(f"       {message}")


print("\nBeginning Earth-side validation...\n")

# --------------------------------------------------
# Test 1: Valid IP
# --------------------------------------------------

try:
    socket.inet_aton(ip)
    result("Valid IPv4 address supplied", True)
except OSError:
    result("Valid IPv4 address supplied", False)
    print("\nValidation stopped: invalid IP address.")
    sys.exit(1)


# --------------------------------------------------
# Test 2: SSH port
# --------------------------------------------------

try:
    with socket.create_connection((ip, 22), timeout=3):
        result("SSH service reachable on TCP/22", True)
except Exception as exc:
    result(
        "SSH service reachable on TCP/22",
        False,
        str(exc)
    )


# --------------------------------------------------
# Test 3: HTTP port
# --------------------------------------------------

try:
    with socket.create_connection((ip, 80), timeout=3):
        result("HTTP service reachable on TCP/80", True)
except Exception as exc:
    result(
        "HTTP service reachable on TCP/80",
        False,
        str(exc)
    )


# --------------------------------------------------
# Test 4: Web content
# --------------------------------------------------

try:
    url = f"http://{ip}"
    with urllib.request.urlopen(url, timeout=5) as response:
        content = response.read().decode(
            "utf-8",
            errors="ignore"
        )

    if "LUNA-1" in content.upper():
        result(
            "LUNA-1 identifier found on status page",
            True
        )
    else:
        result(
            "LUNA-1 identifier found on status page",
            False,
            "HTTP works, but the page does not contain LUNA-1."
        )

except Exception as exc:
    result(
        "LUNA-1 status page downloaded",
        False,
        str(exc)
    )


# --------------------------------------------------
# Results
# --------------------------------------------------

total = passed + failed

print("\n" + "=" * 48)
print("              VALIDATION RESULT")
print("=" * 48)

print(f"\nTests passed: {passed}/{total}")

if failed == 0:
    print("""
MISSION 01 VALIDATED

LUNA-1 COMMAND SERVER: OPERATIONAL

Authorization granted to proceed to Mission 02.
""")
else:
    print(f"""
MISSION 01 NOT YET VALIDATED

{failed} test(s) failed.

Review the failed systems, troubleshoot them,
and run validation again.
""")

print("=" * 48)