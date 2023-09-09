#!/usr/bin/env bash

set -a
. ./.env
set +a

if [[ "$#" -eq 0 ]]
then
    # During the project setup stage, removing `--wait` displays the container
    # startup log and should help with troubleshooting.
    docker compose up --remove-orphans --wait
    docker compose logs -f
    docker compose down
elif [[ "$1" == '--detach' ]]
then
    docker compose up --remove-orphans --wait
elif [[ "$1" == 'run' ]]
then
    docker run --rm -it \
    -u "node" \
    -e "NPM_CONFIG_PREFIX=${NPM_CONFIG_PREFIX}" \
    -e "PATH=${REMOTE_PATH}:${NPM_CONFIG_PREFIX}/bin" \
    -v "${PWD}/${LOCAL_APP_DIR}:${REMOTE_APP_DIR}" \
    -v "${PWD}/volumes/npm-global:${NPM_CONFIG_PREFIX}" \
    -w "${REMOTE_APP_DIR}" \
    "node:${NODE_IMAGE_TAG}" \
    "${@:2}" # pass in all but the first arguments
elif [[ "$1" == 'remote-path' ]]
then
    docker run --rm -it \
    -u "node" \
    "node:${NODE_IMAGE_TAG}" \
    bash -c 'echo $PATH'
elif [[ "$1" != -* ]]
then
    docker exec -it \
    -e "PATH=${REMOTE_PATH}:${NPM_CONFIG_PREFIX}/bin" \
    "${COMPOSE_PROJECT_NAME}-app-1" \
    "$@" # pass in all arguments
else
    echo 'Invalid argument(s)!'
fi

exit 0