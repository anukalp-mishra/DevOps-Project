#!/bin/bash
SRC="/var/www/html"
DEST="/backup"
DATE=$(date +%F)
tar -czf "$DEST/backup-$DATE.tar.gz" "$SRC"
echo "Backup created at $DEST/backup-$DATE.tar.gz"