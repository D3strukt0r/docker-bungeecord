FROM alpine:latest AS build

COPY bin /usr/local/bin
COPY build /build

ARG BUNGEECORD_BASE_URL=https://ci.md-5.net/job/BungeeCord/
ARG BUNGEECORD_JOB_ID=lastStableBuild
ARG BUNGEECORD_FILE_URL=/artifact/bootstrap/target/BungeeCord.jar
ARG BUNGEECORD_URL=${BUNGEECORD_BASE_URL}${BUNGEECORD_JOB_ID}${BUNGEECORD_FILE_URL}

WORKDIR /build
RUN set -eux; \
    apk update; \
    apk add --no-cache bash; \
    /build/build.sh

VOLUME ["/data"]

WORKDIR /data
ENTRYPOINT ["docker-entrypoint"]
