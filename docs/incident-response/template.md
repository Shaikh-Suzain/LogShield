## 🛡️ Incident Response Report – Template

- **Rule Name**: 
- **Date & Time**:
- **Tags**: `#ssh`, `#geoip`, `#bruteforce`, etc.
- **Alert Source**: Elastic Rule (Name)
- **Alert Channel**: Slack / Kibana / Server Log
- **Source IP**: 
- **GeoIP**: 
- **Reputation Check**: (AbuseIPDB/VirusTotal)
- **Triggered Events**:
- **Action Taken**: (Simulated: UFW deny / Slack notify / Dashboard update)
- **Detection Rule JSON (optional)**:
```json
{
  "query": {
    "bool": {
      ...
    }
  }
}
