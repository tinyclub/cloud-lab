#!/bin/bash
#
# Restart net servers
#
# Copyright (C) 2016-2021 Wu Zhangjin <falcon@ruma.tech>
#

service tftpd-hpa restart
sleep 1
service rpcbind restart
sleep 1
service nfs-kernel-server restart
