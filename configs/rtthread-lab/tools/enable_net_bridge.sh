#!/bin/bash
#
# enable_net_bridge.sh
#
# Copyright (C) 2016-2020 Wu Zhangjin <lzufalcon@163.com>
#

ip=`ifconfig eth0 | grep "inet " | tr -d -c '^[0-9. ]' | awk '{print $1}'`
route=`route -n | head -3 | tail -1 | tr -s ' ' | cut -d' ' -f2`

echo ip=$ip gateway=$route

brctl addbr br0
brctl addif br0 eth0
ifconfig eth0 down
ifconfig eth0 0.0.0.0 up
ifconfig br0 $ip up
route add default gw $route br0
