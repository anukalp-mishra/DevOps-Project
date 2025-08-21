#!/bin/bash

THRESHOLD=80

# Extract CPU idle value from `top`
cpu_idle=$(top -bn1 | grep "Cpu(s)" | awk -F'id,' '{ split($1, parts, ","); idle=parts[length(parts)]; gsub(" ", "", idle); print idle }')

# Calculate usage: 100 - idle
cpu_usage=$(echo "100 - $cpu_idle" | awk '{printf "%.0f", $1 - $2}')

# Check if CPU usage exceeds threshold
if [ "$cpu_usage" -gt "$THRESHOLD" ]; then
  echo "High CPU usage: $cpu_usage%"
  # Or for testing: echo "High CPU usage: $cpu_usage%"
else
  echo "CPU usage is normal: $cpu_usage%"
fi