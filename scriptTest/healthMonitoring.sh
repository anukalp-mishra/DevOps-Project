#!/bin/bash
echo "System Health Report:"
echo "CPU Usage:" && top -bn1 | grep "Cpu(s)"
echo "Memory Usage:" && free -m
echo "Disk Usage:" && df -h