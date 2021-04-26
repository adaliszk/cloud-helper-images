#!/bin/bash
source /srv/init-env.sh

export LOG_GROUP="OCI>"

log "Manager Container ($(hostname)) started..."
print-spacer

/srv/init-backups.sh | log-format

CMD="${1}"
ARGS=${*:2}

if [[ $CMD =~ ^-[a-z]+ ]]; then
  log "Argument detected, using default command..."
  CMD="watch"
  ARGS=${*}
fi

function run() {
  SCRIPT="${SCRIPTS_PATH}/${1}.sh"

  if [ -f "${SCRIPT}" ]; then
    "${SCRIPT}" "${ARGS[@]}" 2>&1 | log-format
  else
    log "Script not found: ${1}"
    log "exiting..."
  fi
}

run "${CMD}"
