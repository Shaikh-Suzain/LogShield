import requests
import time
from datetime import datetime
from elasticsearch import Elasticsearch

# Config
ES_HOST = "http://localhost:9200"
ES_INDEX = "slack-alerts"
SLACK_WEBHOOK_URL = "https://hooks.slack.com/services/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"  # your real webhook
POLL_INTERVAL = 60  # seconds

# Connect to Elasticsearch
es = Elasticsearch(ES_HOST)

# Track last seen time
last_check = datetime.utcnow().isoformat()

while True:
    query = {
        "query": {
            "range": {
                "@timestamp": {
                    "gt": last_check
                }
            }
        },
        "sort": [
            {"@timestamp": {"order": "asc"}}
        ]
    }

    res = es.search(index=ES_INDEX, body=query)
    hits = res['hits']['hits']
    
    for hit in hits:
        alert = hit['_source']
        message = f"🚨 Alert: *{alert.get('alert', 'Unknown')}*\n{alert.get('message', '')}\n🕒 {alert.get('timestamp', '')}"
        requests.post(SLACK_WEBHOOK_URL, json={"text": message})

        last_check = alert.get('timestamp', last_check)

    time.sleep(POLL_INTERVAL)
