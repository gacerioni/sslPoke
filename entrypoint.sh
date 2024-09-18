#!/bin/sh

# Set mandatory variables (target host and port)
TARGET_HOST=$1
TARGET_PORT=$2

# Optional proxy settings
JAVA_OPTS=""

# If proxy host is provided, add proxy-related Java options
if [ ! -z "$PROXY_HOST" ] && [ ! -z "$PROXY_PORT" ]; then
    JAVA_OPTS="$JAVA_OPTS -Dhttps.proxyHost=$PROXY_HOST -Dhttps.proxyPort=$PROXY_PORT"

    # Optionally, add proxy credentials if provided
    if [ ! -z "$PROXY_USER" ] && [ ! -z "$PROXY_PASS" ]; then
        JAVA_OPTS="$JAVA_OPTS -Dhttps.proxyUser=$PROXY_USER -Dhttps.proxyPassword=$PROXY_PASS"
    fi
fi

# Check if target host and port are provided
if [ -z "$TARGET_HOST" ] || [ -z "$TARGET_PORT" ]; then
    echo "Error: Target host and port must be provided!"
    exit 1
fi

# Run the Java SSLPoke application with the constructed options
exec java $JAVA_OPTS -jar sslPoke.jar $TARGET_HOST $TARGET_PORT