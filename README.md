# ispconfig-cron-status
Dropin script for Prometheus Node Exporter Textfile Collector

This dropin will create the ispconfig-cron-status.prom file in /var/lib/prometheus/node-exporter/ directory so it will be picked up by the prometheus-node-exporter
This way, you can let prometheus alert you when something is not right with your cron-jobs for ISPConfig.

## Quickstart
Copy the ispconfig-cron-status.sh file to /usr/local/bin
```bash
cp ispconfig-cron-status.sh /usr/local/bin/
```
Chmod the file: 
```bash
chmod +x /usr/local/bin/ispconfig-cron-status.sh
```
Copy the ispconfig-cron-status.service file to /etc/systemd/system/ispconfig-cron-status.service
```bash
cp ispconfig-cron-status.service /etc/systemd/system/ispconfig-cron-status.service
```
Reload systemd daemon: 
```bash
  systemctl daemon-reload
  systemctl start ispconfig-cron-status
  systemctl enable ispconfig-cron-status
```

