#!/bin/bash
LOG_DIR="/var/log/myapp"
ARCHIVE_DIR="$LOG_DIR/archive"
mkdir -p $ARCHIVE_DIR
find $LOG_DIR -name "*.log" -mtime +7 -exec gzip {} \; -exec mv {}.gz $ARCHIVE_DIR \;