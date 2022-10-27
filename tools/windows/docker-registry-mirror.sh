#!/bin/bash
#
# docker-registry-mirror.sh - set registry mirror for windows
#

registry_mirror=$1
[ -z "$registry_mirror" ] && registry_mirror=https://docker.mirrors.ustc.edu.cn

which docker-machine >/dev/null 2>&1
[ $? -ne 0 ] && echo "ERR: No docker-machine found, exit" && exit 1

docker-machine env
eval $(docker-machine env)

grep '"RegistryMirror": \[\]' $DOCKER_CERT_PATH\\config.json
if [ $? -eq 0 ]; then
  sed -i -e "s%\"RegistryMirror\": \[\],%\"RegistryMirror\": \[\"$registry_mirror\"\]%g"

  echo "LOG: Restart docker service to use registry mirror: $registry_mirror"
  docker-machine restart default
else
  docker-machine inspect default | grep -i -A2 registryMirror
fi
