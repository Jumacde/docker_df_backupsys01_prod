#!/bin/bash

# check .env file in the docker project
ENV_DOCKER="$(dirname "$0")/.env"
if [ -f "$ENV_DOCKER" ]; then
        export $(grep -v '^#' "$ENV_DOCKER" | xargs)
else
        echo "ERROR: .env for docker project not found."
        exit 1 # if .env file not found end this script.
fi

# check .env file in the bash project
ENV_BASH="$(dirname "$0")/.env"
if [ -f "$ENV_BASH" ]; then
	export $(grep -v '^#' "$ENV_BASH" | xargs)
else
	echo "ERROR: .env for bash project not found."
	exit 1
fi

# build command
docker buildx build \
	--build-context backupsys01_prod="${BACKUPSYS01_PATH}" \
	-t backupsys_server_test \
	-f Dockerfile \
	.
# stop and remove the docker container.
docker stop backupsys_server 2>/dev/null
docker rm backupsys_server 2>/dev/null

# start docker and usb mount.
docker run -d \
	--name backupsys_server \
	--restart unless-stopped \
	-v "${DEVICE1}:${DEVICE1}" \
	-v "${DEVICE2}:${DEVICE2}" \
	backupsys_server_test
