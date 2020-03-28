# -------
# Builder
# -------

FROM alpine:latest AS build

RUN apk add curl

ARG BUNGEECORD_BASE_URL=https://ci.md-5.net/job/BungeeCord/
ARG BUNGEECORD_JOB_ID=lastStableBuild
ARG BUNGEECORD_FILE_URL=/artifact/bootstrap/target/BungeeCord.jar
ARG BUNGEECORD_URL=${BUNGEECORD_BASE_URL}${BUNGEECORD_JOB_ID}${BUNGEECORD_FILE_URL}

# Download the application
RUN curl -o /bungeecord.jar -fL ${BUNGEECORD_URL}

# -------
# Final Container
# -------

FROM alpine:latest

COPY --from=build /bungeecord.jar /app/
COPY src/*.sh /usr/local/bin/

RUN \
apk add \
\
# Terminal
bash \
# Java environment for Spigot
openjdk8-jre \
# Required for yq and yaml_cli (runs on Python)
python3 py3-pip python py-pip \
# Required to download yaml_cli
git \
# Required by yq
jq && \
# yq
pip3 install yq && \
# yaml_cli
pip install git+https://github.com/Gallore/yaml_cli && \
# Remove .sh for easier usage (https://stackoverflow.com/questions/7450818/rename-all-files-in-directory-from-filename-h-to-filename-half)
for file in /usr/local/bin/*.sh; do mv "$file" "${file/.sh/}"; done && \
# Add execution permissions (not by default)
chmod 755 /usr/local/bin/*

VOLUME ["/data"]

WORKDIR /data
ENTRYPOINT ["entrypoint"]
