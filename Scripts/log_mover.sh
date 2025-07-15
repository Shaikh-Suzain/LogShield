#!/bin/bash

mkdir -p Logs/archive
mv Logs/*.log Logs/archive/ 2>/dev/null

echo "Archived on $(date)" >> Logs/archive/log_report.txt
echo "Files in archive: $(ls Logs/archive | wc -l)" >> Logs/archive/log_report.txt
