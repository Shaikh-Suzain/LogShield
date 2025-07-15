#!/bin/bash

echo "[+] Starting Slack Alert Forwarder Script..."

cd "$(dirname "$0")"
nohup python3 slack_alert_forwarder.py > forwarder.log 2>&1 &
echo "[✔] Forwarder running in background. Logs: Scripts/forwarder.log"
