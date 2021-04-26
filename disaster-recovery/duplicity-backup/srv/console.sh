#!/bin/bash

function log() {
  echo -e "${*}" | log-format
}

function log-format() {
  LOG_FORMAT_PREFIX="${LOG_FORMAT_PREFIX}"
  LOG_FORMAT_SUFFIX="${LOG_FORMAT_SUFFIX}"

  cat - \
    | sed -u "s/^/${LOG_FORMAT_PREFIX}/g;s/$/${LOG_FORMAT_SUFFIX}/g;s/  / /g" \
    | sed -u "s/^${LOG_FORMAT_PREFIX}${LOG_FORMAT_SUFFIX}$//g"
}

function print-spacer() {
  echo -e " "
}

function duplicity() {
  DUPLICITY="/usr/bin/duplicity"
  COMMAND=("${1:-incremental}")
  ARGS=${*:2}

  EXEC=(
    "${DUPLICITY}"
    "${COMMAND[@]}"
    "--no-encryption"
    "--allow-source-mismatch"
    "--log-file" "/logs/backup.log"
    "--archive-dir" "/tmp/duplicity"
    "${ARGS[@]}"
  )

  eval "${EXEC[@]}" 2>&1
}