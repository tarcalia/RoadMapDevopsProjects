#!/bin/bash
# Optional to run commands on server instead of local machine
#ssh -i /path/to/private_key username@remote_host

total_cpu=$(mpstat)
memory_usage=$(free -m)
disk_usage=$(df -h --total | grep total)
top_cpu_usage=$(ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -6)
top_memory_usage=$(ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -6)

echo "Total cpu: $total_cpu\n"
echo -e "Total memory usage:\n$memory_usage\n"
echo -e "Total disk usage:\n$disk_usage\n"
echo -e "Top 5 processes by CPU usage:\n$top_cpu_usage\n"
echo -e "Top 5 processes by memory usage:\n$top_memory_usage"
