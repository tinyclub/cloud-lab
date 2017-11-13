#!/bin/bash
#
# insmod.sh -- insert missing modules in host kernel
#
# Steps to prebuild a kernel module:
#
# 1. Boot the target lab normally and dump out the /proc/config.gz
#
#    $ zcat /proc/config.gz > `uname -r`.defconfig
#
# 2. Boot Linux Lab
#
# 3. Use PC board
#
#    $ make B=pc
#
# 4. Fetch latest kernel tags and checkout the target version
#
#    $ cd linux-stable
#    $ git fetch --tags https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
#    $ cd ..
#    $ make k-o
#
# 5. Update LINUX version in boards/pc/Makefile to v=`uname -r`, version=${v%%-*}
#
# 6. Copy the above saved defconfig to boards/pc/linux_v$version_defconfig
#
# 7. Configure it
#
#    $ make k-c
#
# 8. Enable the module configuration
#
#    $ make k-m
#
# 9. Build the module
#
#    $ make m
#

find /lib/modules/`uname -r`/ -name '*.ko' -print -exec insmod {} \;
