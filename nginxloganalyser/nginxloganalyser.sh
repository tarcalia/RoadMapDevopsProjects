#!/bin/bash

top_ips=$(awk '{print $1}' nginx-access.log | sort | uniq -c | sort -nr | head -5)
paths=$(awk '{print $7}' nginx-access.log | sort | uniq -c | sort -nr | head -5)
status=$(awk '{print $9}' nginx-access.log | sort | uniq -c | sort -nr | head -5)
agent=$(awk -F\" '{print $6}' nginx-access.log | sort | uniq -c | sort -nr | head -5)

echo -e "Top 5 IP addresses with the most requests:\n$top_ips\n"
echo -e "Top 5 most requested paths:\n$paths\n"
echo -e "Top 5 response status codes:\n$status\n"
echo -e "Top 5 user agents:\n$agent"
