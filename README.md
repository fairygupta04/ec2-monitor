# EC2 Monitoring Script 🖥️

A simple Bash script to monitor system health on an AWS EC2 instance.  
It checks disk usage, memory, and running processes, then saves logs daily using cron.

---

# 📌 Features

-  Disk, memory, and CPU usage checks
-  Simple alerts when disk or memory usage is high
-  Auto-runs every day using `cron`
-  Daily logs saved with timestamps
-  Old logs are deleted after 3 days 

---

# 📂 Sample Log Output


----DISK USAGE----
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       6.8G  1.8G  5.0G  26% /
...

----MEMORY USAGE----
Mem: 957Mi used / 322Mi free
...

----TOP PROCESSES----
PID USER     %CPU %MEM COMMAND
1   root      0.0  1.4  systemd
...

## 📦 How to Use

1. Upload the `monitor.sh` file to your EC2 instance.

2. Give it permission to run:

    ```bash
   chmod +x monitor.sh
   
3.Run the script:
  ```bash
  ./monitor.sh
  ```
To make it run every day at 6 AM, add it to cron:

  ```bash
  crontab -e
  0 6 * * * /home/ubuntu/path/to/monitor.sh
  ```
 
🧪 Requirements

AWS EC2 instance (Ubuntu)
Bash
cron installed (usually pre-installed)


📬 Feel free to use or improve it



