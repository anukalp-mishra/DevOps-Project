#!/bin/bash

threshold=75
usages=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$usages" -gt "threshold" ]; then
    echo "Disk space usage is above threshold: $usages%"
    exit 1
else
    echo "Disk space usage is within limits: $usages%"
    exit 0
fi