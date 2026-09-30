#!/bin/bash

clear

echo "========================================"
echo "      PROJECT LUNA DIAGNOSTIC TOOL"
echo "========================================"
echo
echo "Initializing LUNA-1 systems check..."
sleep 1

echo "Checking environmental interfaces..."
sleep 1

echo "Checking communications relay..."
sleep 1

echo "Checking mission services..."
sleep 1

# Incident trigger
systemctl stop nginx >/dev/null 2>&1

echo
echo "Mission Control diagnostic sequence complete."
echo
echo "INCIDENT GENERATED."
echo
echo "Return to Earth Mission Control and begin troubleshooting."
echo