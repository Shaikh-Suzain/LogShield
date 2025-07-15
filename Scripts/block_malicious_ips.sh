#!/bin/bash

# Day 24: Block Malicious IPs Script

# Elasticsearch credentials and index
ES_HOST="http://localhost:9200"
INDEX="filebeat-*"

# Log output
LOG_FILE="Logs/incidents/blocked_ips.log"
mkdir -p Logs/incidents

echo "[+] Running automated IP block script at $(date)"

# Query: failed logins from public IPs
IPS=$(curl -s -X POST "$ES_HOST/$INDEX/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "size": 0,
  "query": {
    "bool": {
      "must": [
        { "match_phrase": { "message": "LOGIN FAILED" } }
      ],
      "must_not": [
        { "range": { "source.ip": { "cidr": "10.0.0.0/8" }}},
        { "range": { "source.ip": { "cidr": "192.168.0.0/16" }}},
        { "range": { "source.ip": { "cidr": "172.16.0.0/12" }}}
      ]
    }
  },
  "aggs": {
    "suspicious_ips": {
      "terms": {
        "field": "source.ip",
        "size": 10
      }
    }
  }
}' | jq -r '.aggregations.suspicious_ips.buckets[].key')

# Simulate blocking or use ufw if available
for ip in $IPS; do
    echo "[!] Blocking $ip"
    
    # Uncomment this line if you want real blocking and have ufw:
    # sudo ufw deny from $ip

    # Log action
    echo "$(date): Blocked IP $ip due to failed logins" >> "$LOG_FILE"
done

echo "[+] Blocking complete. Log saved to $LOG_FILE"
