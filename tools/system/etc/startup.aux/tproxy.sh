#!/bin/bash
#
# tproxy.sh -- replace the route with the transparent proxy ip
#

[ -z "$TPROXY" ] && TPROXY=0

if [ $TPROXY -eq 1 ]; then
    [ -z "$DEFAULT_GW" ] && DEFAULT_GW=$(route -n | grep "^0.0.0.0" | tr -s ' ' | cut -d' ' -f2)
    [ -z "$DEFAULT_IFACE" ] && DEFAULT_IFACE=$(ifconfig | head -1 | cut -d' ' -f1)

    if [ -z "$TPROXY_IP" ]; then
        echo "LOG: Please run docker with '-e TPROXY_IP=IP'"
        TPROXY_IP=$(echo $DEFAULT_GW | cut -d'.' -f1-3)".1"
    fi

    echo "LOG: Change the default gateway from $DEFAULT_GW to $TPROXY_IP"

    sudo route del default gw $DEFAULT_GW $DEFAULT_IFACE
    sudo route add default gw $TPROXY_IP $DEFAULT_IFACE
fi
