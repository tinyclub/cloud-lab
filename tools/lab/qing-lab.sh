#!/bin/bash
#
# qing-lab-in-one.sh -- Merge qing-lab of the Labs together to only one lab
#
#     Dockfile - Share most of them and remove repeated packages
#     docker  -- Docker configure files
#     tools   -- Lab specific host/vm tools
#     system  -- Lab specific system directory
#

cat <<EOF
TODO:
    1. system
       configs/xxx-lab/system/home/ubuntu/Desktop/lab.desktop --> configs/qing-lab/system/home/ubuntu/Desktop/xxx-lab/lab.desktop
       configs/*/system/etc/sudoers.d/ubuntu --> configs/qing-lab/system/etc/sudoers.d/ubuntu
       configs/*/system/home/ubuntu/.bashrc --> configs/qing-lab/system/home/ubuntu/.bashrc
    2. tools
       configs/*/tools --> configs/qing-lab/tools/
       configs/*/tools/host-run --> configs/qing-lab/tools/host-run
       configs/*/tools/startup.sh --> configs/qing-lab/tools/container-run
    3. docker
       configs/*/docker/ --> configs/qing-lab/docker/
       configs/*/docker/caps --> configs/qing-lab/docker/caps
       configs/*/docker/limits --> configs/qing-lab/docker/limits
       configs/*/docker/volumemap --> configs/qing-lab/docker/volumemap
       configs/*/docker/devices --> configs/qing-lab/docker/devices
       configs/*/docker/portmap --> configs/qing-lab/docker/portmap
    4. Dockerfile
       configs/*/Dockerfile --> configs/qing-lab/
EOF
