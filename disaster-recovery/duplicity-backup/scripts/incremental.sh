#!/bin/bash
source /srv/console.sh
/srv/init-data.sh

duplicity incremental --full-if-older-than "${BACKUP_RETENTION}" "${DATA_PATH}" "${BACKUP_URL}"
