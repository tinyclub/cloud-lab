#!/bin/bash
#
# docker-toolbox-env.sh -- script to load docker toolbox environment
#

which docker-machine >/dev/null 2>&1
if [ $? -eq 0 ]; then
  DOCKER_TOOLBOX_PATH="$(dirname "$(which docker-machine)")"
elif [ -n "$DOCKER_TOOLBOX_INSTALL_PATH" ]; then
  DOCKER_TOOLBOX_PATH="$DOCKER_TOOLBOX_INSTALL_PATH"
else
  DOCKER_TOOLBOX_PATH="/c/Program Files/Docker Toolbox"
fi

docker_path="$(which docker)" >/dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "$docker_path" | grep -q "Docker Toolbox"
  if [ $? -ne 0 ]; then
    echo "LOG: Remove path of docker desktop out of global PATH"
    DOCKER_DESKTOP_PATH="$(dirname "$docker_path")"
    export PATH="$(echo $PATH | sed -e "s%$DOCKER_DESKTOP_PATH/:%%g;s%$DOCKER_DESKTOP_PATH:%%g")"
  fi
fi

DOCKER_MACHINE="$DOCKER_TOOLBOX_PATH"/docker-machine.exe
DOCKER_TOOL="$DOCKER_TOOLBOX_PATH"/docker
if [ -f "$DOCKER_MACHINE" ]; then
  echo "LOG: Check and start docker toolbox"
  "$DOCKER_MACHINE" ls | grep -q default
  [ $? -ne 0 ] && "$DOCKER_TOOLBOX_PATH"/start.sh uname

  echo "LOG: Check docker service"
  "$DOCKER_TOOL" ps >/dev/null
  [ $? -ne 0 ] && "$DOCKER_TOOL" start default

  echo "LOG: Load environment for 'docker toolbox'"
  echo "LOG: Export docker toolbox environment"
  "$DOCKER_MACHINE" env
  eval $("$DOCKER_MACHINE" env)

  echo "LOG: Add path of docker toolbox to global PATH"
  echo "$PATH" | grep -q "Docker Toolbox"
  [ $? -ne 0 ] && export PATH="$DOCKER_TOOLBOX_PATH:$PATH"
else
  echo "ERR: No Docker Toolbox found, you can try Docker Desktop with tools/windows/docker-desktop-env.sh"
fi
