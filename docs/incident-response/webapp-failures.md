# 🛡️ Incident Response Playbook – SSH Brute Force Attack

## 📌 Alert Name
**SSH Brute Force Detection**

## 🧭 Description
This alert detects more than 5 failed SSH login attempts from the same source IP within 5 minutes.

---

## 📂 Detection Source
- **Log Type:** SSH
- **Field:** `source.ip`
- **Condition:** Count > 5 failed logins in 5 minutes
- **Dashboard:** SSH Logins
- **Enrichment:** GeoIP

---

## ✅ Response Checklist

- [ ] Confirm source IP in alert (from Kibana alert or Slack notification)
- [ ] View logs in Kibana Discover (filter by `log_type:ssh` and `source.ip:<IP>`)
- [ ] Run `grep <IP> /var/log/auth.log` or use `journalctl`
- [ ] Check if login attempts were successful
- [ ] Block IP using:
  ```bash
  sudo ufw deny from <IP>
