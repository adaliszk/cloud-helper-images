# Fix Unix permissions for the Windows peeps out there
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# hadolint ignore=DL3007
FROM adaliszk/dos2unix:latest as unix

COPY ./srv /srv
RUN dos2unix /srv/** && chmod +x /srv/**

COPY ./scripts /scripts
RUN dos2unix /scripts/** && chmod +x /scripts/**

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN dos2unix docker-entrypoint.sh && chmod +x /docker-entrypoint.sh

# Build Runtime Environment
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
FROM adaliszk/alpine:3.13 as runtime

RUN apk --no-cache \
  add \
    bash=5.1.0-r0 \
    sed=4.8-r0 \
    tzdata=2021a-r0 \
    musl-locales=0_git20200319-r1 \
    duplicity=0.8.13-r0

ENV \
  BACKUP_URL="file:///backups/volume" \
  BACKUP_RETENTION="6h" \
  BACKUP_SAVES="12" \
  LANG="en_UK.UTF-8" \
  TZ="Etc/UTC"

RUN bash -c "mkdir -p /{data,scripts,backups,logs,status} /tmp/duplicity" \
 && chown 1001:1001 /data /scripts /backups /logs /status /tmp/duplicity

VOLUME ["/data", "/backups", "/logs", "/status"]

COPY --from=unix /srv /srv
COPY --from=unix /scripts /scripts
COPY --from=unix /docker-entrypoint.sh /backup
ENTRYPOINT ["/backup"]
CMD ["watch"]
USER 1001
