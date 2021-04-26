#!/bin/bash
source /srv/init-env.sh

duplicity collection-status "${BACKUP_URL}"
