
---

### ✅ `geoip-anomalies.md`

```markdown
# 🌍 Incident Response Playbook – GeoIP Anomalies

## 📌 Alert Name
**GeoIP – Public IP Login Failures**

## 🧭 Description
This alert identifies failed login attempts (or other suspicious log activity) from **non-private** IP addresses. Often, these represent potential scanning or brute-force behavior from global sources.

---

## 📂 Detection Source
- **Log Type:** `webapp` or `ssh`
- **Source IP Field:** `source.ip`
- **Geo Field:** `source.geo.location`, `source.geo.country_iso_code`
- **Index:** `filebeat-*`
- **Pipeline Used:** `logshield-geo`

---

## ✅ Response Checklist

- [ ] View triggered alert's source.ip and geo location
- [ ] Open Kibana Discover and run query:
  ```kql
  source.ip: "<ATTACKER_IP>"
