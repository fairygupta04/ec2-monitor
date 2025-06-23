#!/bin/bash

DATE=$(TZ="Asia/Kolkata" date +"%Y-%m-%d_%H-%M")
LOGFILE="$HOME/monitor_log_$DATE.txt"


{
echo -e "\e[32mEC2 MONITORING STARTED — $DATE\e[0m"
echo "==================================="
echo "----DISK USAGE----"
df -h

echo ""
echo "----DIRECTORY SIZE (/home/*)----"
du -sh /home/* 2>/dev/null

echo ""
echo "----MEMORY USAGE----"
free -h

echo ""
echo "----TOP PROCESSES----"
top -bn1 | head -10

echo ""
echo "----ALERT CHECKS----"

disk_used=$(df / | grep / | awk '{print $5}' | sed 's/%//')
if [ "$disk_used" -gt 80 ]; then
    echo "⚠️ WARNING: Disk usage is high — $disk_used%"
else
    echo "✅ Disk usage OK — $disk_used%"
fi

mem_free=$(free -m | awk '/Mem:/ {print $7}')
if [ "$mem_free" -lt 200 ]; then
    echo "⚠️ WARNING: Low memory — ${mem_free}MB available"
else
    echo "✅ Memory OK — ${mem_free}MB available"
fi

echo ""
echo -e "\e[32mMonitoring complete. Log saved to $LOGFILE\e[0m"
} > "$LOGFILE"


find $HOME -name "monitor_log_*.txt" -type f -mtime +3 -delete
