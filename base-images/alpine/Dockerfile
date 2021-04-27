ARG ALPINE_TAG="3.13"
FROM alpine:${ALPINE_TAG}

RUN addgroup --gid 1001 oci \
 && adduser --uid 1001 --shell /bin/bash -G oci -S oci
