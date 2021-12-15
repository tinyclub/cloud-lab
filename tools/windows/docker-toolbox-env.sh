#!/bin/bash
#
# docker-toolbox-env.sh -- script to load docker toolbox environment
#

which docker-machine >/dev/null 2>&1
if [ $? -eq 0 ]; then
  DOCKER_TOOLBOX_PATH="$(dirname "$(which docker-machine)")"
else
  DOCKER_TOOLBOX_PATH="/c/Program Files/Docker Toolbox"
fi

if [ -f "$DOCKER_TOOLBOX_PATH"/docker-machine.exe ]; then
  echo "LOG: Export docker toolbox environment"
  "$DOCKER_TOOLBOX_PATH"/docker-machine.exe env
  eval $("$DOCKER_TOOLBOX_PATH"/docker-machine.exe env)

  echo "LOG: Add path of docker toolbox to global PATH"
  echo "$PATH" | grep -q "Docker Toolbox"
  [ $? -ne 0 ] && export PATH="$DOCKER_TOOLBOX_PATH:$PATH"
  echo $PATH

  echo "LOG: Check and start docker toolbox"
  docker-machine ls | grep -q default
  [ $? -ne 0 ] && "$DOCKER_TOOLBOX_PATH"/start.sh uname
fi
