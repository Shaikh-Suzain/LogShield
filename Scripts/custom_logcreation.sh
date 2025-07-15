mkdir -p Logs/custom_logs

cat <<EOF > Logs/custom_logs/webapp.log
[INFO] 2025-06-29 22:00:01 - User 'admin' logged in
[ERROR] 2025-06-29 22:01:02 - Failed login attempt from 192.168.0.45
[INFO] 2025-06-29 22:02:11 - User 'test' logged out
[WARN] 2025-06-29 22:03:45 - Suspicious activity detected
EOF