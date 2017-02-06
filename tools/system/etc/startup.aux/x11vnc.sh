#!/bin/bash
#
# x11vnc.sh
#

X11VNC_CONF=/etc/supervisor/conf.d/x11vnc.conf

[ -z "$VNC_SHARED" ] && VNC_SHARED=0

if [ $VNC_SHARED -eq 0 ]; then
    sed -i -e "s%-xkb -shared -forever%-xkb -forever%g" $X11VNC_CONF
else
    sed -i -e "s%-xkb -forever%-xkb -shared -forever%g" $X11VNC_CONF
fi
