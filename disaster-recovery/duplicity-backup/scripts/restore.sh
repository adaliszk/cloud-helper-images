#!/bin/bash
source /srv/init-env.sh

if [[ -z "${*}" ]]; then
  echo "Restore \"${DATA_PATH}\" to the latest state..."
  duplicity restore "${BACKUP_URL}" "${DATA_PATH}"
else
  echo "Restore \"${DATA_PATH}\" to ${1} state..."
  duplicity restore --time "${1}" "${BACKUP_URL}" "${DATA_PATH}"
fi
