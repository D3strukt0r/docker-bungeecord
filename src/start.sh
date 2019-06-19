#!/bin/bash

# Verify versions
echo "[    ] Check if Java is available..."
if java -version 2>&1 >/dev/null | grep -q "openjdk version" ; then
    echo -e "\e[1A[ \e[32mOK\e[39m ]"
else
    echo -e "\e[1A[\e[31mFAIL\e[39m]" >&2
    exit 2
fi
java -version

# Download specified BungeeCord version if file doesn't already exist
BUNGEECORD_LOCATION=BungeeCord.jar
if [[ ! -e $BUNGEECORD_LOCATION ]]; then
    echo "[    ] Downloading ${BUNGEECORD_URL:=${BUNGEECORD_BASE_URL:=https://ci.md-5.net/job/BungeeCord/}${BUNGEECORD_VERSION:=lastStableBuild}${BUNGEECORD_FILE_URL:=/artifact/bootstrap/target/BungeeCord.jar}}"
    if ! curl -o $BUNGEECORD_LOCATION -fL $BUNGEECORD_URL; then
        echo -e "\e[1A\e[1A\e[1A\e[1A[\e[31mFAIL\e[39m]\n\n\n" >&2
        exit 2
    else
        echo -e "\e[1A\e[1A\e[1A\e[1A[ \e[32mOK\e[39m ]\n\n\n"
    fi
fi

# Link the plugins folder (required)
echo "[    ] Linking BungeeCord plugins from the volume /plugins..."
# Check whether volume is set up
if [ ! -d /plugins ]; then
    echo -e "\e[1A[FAIL]"
    exit 2
fi
# Link plugins folder from volume to app
ln -s /plugins plugins
if [ $? -eq 0 ]; then
    echo -e "\e[1A[ \e[32mOK\e[39m ]"
else
    echo -e "\e[1A[\e[31mFAIL\e[39m]"
    exit 2
fi

# Link the config (required)
echo "[    ] Linking config.yml from the volume /config..."
# Check whether volume is set up
if [ ! -d /config ]; then
    echo -e "\e[1A[\e[31mFAIL\e[39m]"
    exit 2
fi
# Check whether config.yml exists
if [ ! -f /config/config.yml ]; then
    echo -e "\e[1A[\e[31mFAIL\e[39m]"
    exit 2
fi
# Link config.yml from volume to app
ln -s /config/config.yml config.yml
if [ $? -eq 0 ]; then
    echo -e "\e[1A[ \e[32mOK\e[39m ]"
else
    echo -e "\e[1A[\e[31mFAIL\e[39m]"
    exit 2
fi

# Link the server icon (optional)
echo "[    ] Linking server-icon.png from the volume /icon..."
if [ -d /icon ]; then
    if [ -f /icon/server-icon.png ]; then
        ln -s /icon/server-icon.png server-icon.png
        if [ $? -eq 0 ]; then
            echo -e "\e[1A[ \e[32mOK\e[39m ]"
        else
            echo -e "\e[1A[\e[31mFAIL\e[39m]"
        fi
    else
        echo -e "\e[1A[\e[33mSKIP\e[39m]"
    fi
fi

# Set variables for java runtime
echo "[    ] Setting initial memory to ${JAVA_BASE_MEMORY:=${JAVA_MEMORY:=512M}} and max to ${JAVA_MAX_MEMORY:=${JAVA_MEMORY}}"
JAVA_OPTIONS="-Xms${JAVA_BASE_MEMORY} -Xmx${JAVA_MAX_MEMORY} ${JAVA_OPTIONS}"
echo -e "\e[1A[ \e[32mOK\e[39m ]"

exec java $JAVA_OPTIONS -jar BungeeCord.jar "$@"
