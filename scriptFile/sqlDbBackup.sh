#!/bin/bash
DB_USER="admin"
DB_PASS="password"
DB_NAME="mydb"
BACKUP_DIR="/db_backups"
DATE=$(date +%F)
FILE="$BACKUP_DIR/db-$DB_NAME-$DATE.sql.gz"
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME | gzip > $FILE