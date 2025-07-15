import requests
import json

# Replace with your real Slack webhook URL
slack_webhook_url = 'https://hooks.slack.com/services/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'

alert_message = {
    "text": "🚨 *Test Alert from LogShield* 🚨\nSSH Login Failure from IP: `203.0.113.99`\nTime: `2025-07-02T18:47:00Z`"
}

response = requests.post(
    slack_webhook_url,
    data=json.dumps(alert_message),
    headers={'Content-Type': 'application/json'}
)

if response.status_code == 200:
    print("✅ Test alert sent to Slack successfully!")
else:
    print(f"❌ Failed to send alert. Status code: {response.status_code}, Response: {response.text}")
