#!/bin/bash
#
# docker-desktop-env.sh -- script to load docker desktop environment
#

which docker-machine >/dev/null 2>&1
if [ $? -eq 0 ]; then
  DOCKER_TOOLBOX_PATH="$(dirname "$(which docker-machine)")"
elif [ -n "$DOCKER_TOOLBOX_INSTALL_PATH" ]; then
  DOCKER_TOOLBOX_PATH="$DOCKER_TOOLBOX_INSTALL_PATH"
else
  DOCKER_TOOLBOX_PATH="/c/Program Files/Docker Toolbox"
fi

if [ -f "$DOCKER_TOOLBOX_PATH"/docker-machine.exe ]; then
  echo "LOG: Clear docker toolbox environment"
  unset DOCKER_TLS_VERIFY
  unset DOCKER_HOST
  unset DOCKER_CERT_PATH
  unset DOCKER_MACHINE_NAME
  unset COMPOSE_CONVERT_WINDOWS_PATHS
  unset DOCKER_TOOLBOX_INSTALL_PATH

  export PATH="$(echo $PATH | sed -e "s%$DOCKER_TOOLBOX_PATH/:%%g;s%$DOCKER_TOOLBOX_PATH:%%g")"
fi

which docker > /dev/null 2>&1
if [ $? -eq 0 ]; then
  DOCKER_DESKTOP_PATH="$(dirname "$(which docker)")"
else
  DOCKER_DESKTOP_PATH="/c/Program Files/Docker/Docker/resources/bin"
fi

if [ -d "$DOCKER_DESKTOP_PATH" ]; then
  DOCKER_DESKTOP_TOP_DIR="$(cd "$DOCKER_DESKTOP_PATH"/../../ && pwd)"
  DOCKER_DESKTOP="$DOCKER_DESKTOP_TOP_DIR/Docker Desktop.exe"
  DOCKER_DAEMON="$DOCKER_DESKTOP_TOP_DIR/resources/dockerd.exe"

  if [ -f "$DOCKER_DESKTOP" ]; then
    echo "LOG: Load environment for 'docker desktop'"

    echo $PATH | grep -q "$DOCKER_DESKTOP_PATH"
    if [ $? -ne 0 ]; then
      echo "LOG: Add path of docker desktop to global PATH"
      export PATH="$DOCKER_DESKTOP_PATH:$PATH"
    fi

    docker ps >/dev/null 2>&1
    if [ $? -ne 0 ] ; then
      echo "LOG: Clean up background tasks"
      taskkill.exe //F //IM "Docker Desktop.exe"
      taskkill.exe //F //IM "dockerd.exe"

      echo "LOG: Start Docker Daemon"
      "$DOCKER_DAEMON"

      echo "LOG: Start Docker Desktop"
      "$DOCKER_DESKTOP" &

      echo "LOG: Wait for Docker Service being ready ..."
      loop=0; wait=60
      while [ $loop -lt $wait ]; do
        loop=`expr $loop + 1`
        echo ".... $loop / $wait"

        docker ps >/dev/null 2>&1
	[ $? -eq 0 ] && break

        sleep 1
      done
    fi
  else
    echo "ERR: No Docker Desktop found, you can try Docker Toolbox with tools/windows/docker-toolbox-env.sh"
  fi
fi
