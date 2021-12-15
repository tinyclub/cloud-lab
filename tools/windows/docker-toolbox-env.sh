#!/bin/bash
#
# docker-toolbox-env.sh -- script to load docker toolbox environment
#

DOCKER_TOOLBOX_PATH="/c/Program Files/Docker Toolbox/"
if [ -f "$DOCKER_TOOLBOX_PATH"/docker-machine.exe ]; then
  "$DOCKER_TOOLBOX_PATH"/docker-machine.exe env
  eval $("$DOCKER_TOOLBOX_PATH"/docker-machine.exe env)

  echo "$PATH" | grep -q "Docker Toolbox"
  [ $? -ne 0 ] && export PATH="$DOCKER_TOOLBOX_PATH:$PATH"
  echo $PATH
fi
