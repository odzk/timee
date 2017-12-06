#!/bin/bash
zip -r /mnt/zaiko/apps/dev_zaiko/backup/app/backup-"$(date '+%d%b%Y')".zip /mnt/zaiko/apps/dev_zaiko
find /mnt/zaiko/apps/dev_zaiko/backup/app/backup* -mtime +14 -exec rm {} \;
