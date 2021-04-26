#!/bin/bash
source /srv/init-env.sh
/srv/init-data.sh

/scripts/restore.sh
print-spacer

function timestamp() {
  find "${DATA_PATH}" -type f -exec stat "{}" \; | sort -nr | cut -d: -f2- | head -n 1
}

LAST_TIMESTAMP="$(timestamp)"

echo "Watching file changes in \"${DATA_PATH}\"..."
while true;
  do
    if [[ "${LAST_TIMESTAMP}" != "$(timestamp)" ]];
      then
        echo "File change detected..."
        LAST_TIMESTAMP=$(timestamp)
        source /scripts/incremental.sh
      fi

    sleep 10
  done
