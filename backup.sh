#!/bin/bash
mysqldump --user=zaiko --password=caster39 zaiko_dev > /mnt/zaiko/apps/dev_zaiko/backup/db/zaiko.sql
zip -r /mnt/zaiko/apps/dev_zaiko/backup/db/zaiko-"$(date '+%d%b%Y')".zip /mnt/zaiko/apps/dev_zaiko/backup/db/zaiko.sql
rm -rf /mnt/zaiko/apps/dev_zaiko/backup/db/zaiko.sql
