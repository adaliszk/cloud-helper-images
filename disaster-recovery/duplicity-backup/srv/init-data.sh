#!/bin/bash
source /srv/console.sh

echo "Wait for \"${DATA_PATH}\" to be initialized..."
while [ "$(find "${DATA_PATH}" -maxdepth 2 -type f | wc -l || echo "0")" -lt 1 ]; do
  export DATA_INITIALIZED=1
  sleep 5
done

echo "\"${DATA_PATH}\" is initialized!"
export DATA_INITIALIZED=0
print-spacer
