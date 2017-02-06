#!/bin/bash

container_ip=$(ifconfig eth0 | grep "inet addr" | sed -e "s/ *inet addr:\([0-9\.]*\) .*/\1/g")
[ -z "$container_ip" ] && container_ip=$(ifconfig br0 | grep "inet addr" | sed -e "s/ *inet addr:\([0-9\.]*\) .*/\1/g")

DESKTOP=/home/$UNIX_USER/Desktop/
local_shortcut_count=`find $DESKTOP -name local.desktop | wc -l`
[ $local_shortcut_count -ne 0 ] \
    && find $DESKTOP -name local.desktop | xargs -i sudo -u $UNIX_USER sed -i -e "s%localhost%$container_ip%g" {}
