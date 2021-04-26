#!/bin/bash
source /srv/init-env.sh

echo "Remove old backups..."
duplicity "remove-all-but-n-full ${BACKUP_SAVES}" --force "${BACKUP_URL}"
print-spacer

echo "Cleanup..."
duplicity cleanup --force "${BACKUP_URL}"
