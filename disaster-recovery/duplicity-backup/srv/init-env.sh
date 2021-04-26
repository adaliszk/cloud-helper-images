#!/bin/bash

export SCRIPTS_PATH="/scripts"

export DATA_PATH="/data"
export DATA_INITIALIZED=""

export BACKUP_PATH="/backups"
export BACKUP_LOCAL_VOLUME="file://${BACKUP_PATH}/volume"

# Keep last 3 days
export BACKUP_RETENTION="${BACKUP_RETENTION:-6h}"
export BACKUP_SAVES="${BACKUP_SAVES:-12}"

export LOG_GROUP=""
export LOG_LEVEL="i>"
export LOG_LEVEL_ERROR="e>"
export LOG_LEVEL_WARNING="w>"

export LOG_FORMAT_PREFIX="${LOG_LEVEL} ${LOG_GROUP}"
export LOG_FORMAT_SUFFIX=""

source /srv/console.sh
