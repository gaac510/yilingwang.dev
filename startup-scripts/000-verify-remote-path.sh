#!/usr/bin/env bash

if [[ "$CONFIGURED_REMOTE_PATH" != "$PATH" ]]
then
printf "
================================================================================
The REMOTE_PATH environment variable does not match the container's actual PATH.
You should set REMOTE_PATH to:
$PATH
================================================================================
"
fi
