#!/bin/bash

set -e

LAB="$HOME/luna-incident-07"

echo "========================================"
echo "      PROJECT LUNA INCIDENT SYSTEM"
echo "========================================"
echo
echo "Preparing Mission 07 monitoring incident..."

rm -rf "$LAB"
mkdir -p "$LAB"

cat > "$LAB/prometheus.yml" <<'YAML'
global:
  scrape_interval: 5s

scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets:
          - prometheus:9090

  - job_name: luna1
    static_configs:
      - targets:
          - node-exporter:9200
YAML

cat > "$LAB/compose.yaml" <<'YAML'
services:
  prometheus:
    image: prom/prometheus
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml:ro
    ports:
      - "127.0.0.1:9190:9090"

  node-exporter:
    image: prom/node-exporter
YAML

echo
echo "Incident generated:"
echo "$LAB"
echo
echo "Start with:"
echo "cd $LAB"
echo "docker compose up -d"
