#!/bin/bash
#
# Restart net servers
#
# Copyright (C) 2016-2020 Wu Zhangjin <lzufalcon@163.com>
#

service tftpd-hpa restart
sleep 1
service rpcbind restart
sleep 1
service nfs-kernel-server restart
