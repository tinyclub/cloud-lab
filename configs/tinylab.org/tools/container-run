#!/bin/bash

JEKYLL_SUPERVISOR_CONF=/etc/supervisor/conf.d/jekyll.conf

container_ip=$(ip addr show eth0 | head -3 | tail -1 | sed -e "s%.*inet \(.*\)/.*%\1%g")
sed -i -e "s% -H HOST_IP% -H $container_ip%g" $JEKYLL_SUPERVISOR_CONF
echo "LOG: Jekyll Local Web Site Address: http://$container_ip/"

DESKTOP=/home/$UNIX_USER/Desktop/
local_shortcut_count=`find $DESKTOP -name local.desktop | wc -l`
[ $local_shortcut_count -ne 0 ] \
    && find $DESKTOP -name local.desktop | xargs -i sudo -u $UNIX_USER sed -i -e "s%localhost%$container_ip%g" {}
