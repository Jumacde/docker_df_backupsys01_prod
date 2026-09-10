#!/bin/bash
ENV_FILE="$(dirname "$0")/.env"
# check and get log path
if [ -f "$ENV_FILE" ]; then
        export $(grep -v '^#' "$ENV_FILE" | xargs)
else
        echo "ERROR: .env file not found."
        exit 1 # if .env file not found end this script.
fi

# to send a directry path to the Dockerfile
set -a
source .env
set +a

# run command docker using by the docker file
docker buildx build \
	--build-context backupsys01_prod="${BACKUPSYS01_PATH}" \
	-t backupsys_server_test \
	-f Dockerfile \
	.
