#!/usr/bin/env bash

set -a
. ./.env
set +a

if [[ "$#" -eq 0 ]]; then
    # During the project setup stage, removing `--wait` displays the container
    # startup log and should help with troubleshooting.
    docker compose up --remove-orphans --wait
    docker compose logs -f
    docker compose down
elif [[ "$1" == '--standalone' ]]; then
    docker run --rm -it \
    -u "node" \
    -e "NPM_CONFIG_PREFIX=${NPM_CONFIG_PREFIX}" \
    -e "PATH=${REMOTE_PATH}:${NPM_CONFIG_PREFIX}" \
    -v "${PWD}/app:${APP_DIR}" \
    -w "${APP_DIR}" \
    "node:${NODE_CONTAINER_TAG}" \
    "${@:2}" # pass in all but the first arguments
elif [[ "$1" == '--postgres' ]]; then
    docker exec -it \
    yilingwangdev-postgres-1 \
    "${@:2}" # pass in all but the first arguments
elif [[ "$1" == '--adminer' ]]; then
    docker exec -it \
    yilingwangdev-adminer-1 \
    "${@:2}" # pass in all but the first arguments
else
    docker exec -it \
    yilingwangdev-app-1 \
    "$@" # pass in all arguments
fi