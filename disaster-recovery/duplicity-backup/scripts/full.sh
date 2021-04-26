#!/bin/bash
source /srv/init-env.sh
/srv/init-data.sh

duplicity full "${DATA_PATH}" "${BACKUP_URL}"