#!/bin/bash
source /srv/console.sh

echo "Check for \"${BACKUP_URL}\" status..."
BACKUP_LIST=$(duplicity list-current-files "${BACKUP_URL}" 2>/dev/null)
LIST_AVAILABLE=$?

if [ "${LIST_AVAILABLE}" == "0" ]; then
  echo "Backups are initialized!"
  print-spacer
  echo "${BACKUP_LIST}"
  print-spacer
  /scripts/cleanup.sh
else
  echo "Backups are uninitialized, skipping listing available backups..."
fi

print-spacer
