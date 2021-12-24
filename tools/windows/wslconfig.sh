#!/bin/bash
#
# wslconfig.sh -- configure a kernel for wsl2
#
# Usage:
#
#   $ tools/windows/wslconfig.sh labs/linux-lab/boards/x86_64/pc/bsp/kernel/wsl2/linux-msft-wsl-5.10.74.3/bzImage
#

set -x

kernel=$1
[ -z "$kernel" ] && echo "Usage: $0 wsl2_kernel" && exit 0

wslconfig=~/.wslconfig
kernel_path="$(cd $(dirname $kernel) && pwd -W | sed -e 's%/%\\\\%g')\\\\bzImage"

echo "LOG: update kernel path to $wslconfig:"
echo "Kernel: $kernel_path"

if [ ! -f $wslconfig ]; then

  cat <<EOF > $wslconfig
[wsl2]
kernel="$kernel_path"
EOF

else

  sed -i -e "s/^kernel=.*/kernel=$kernel_path/g" ~/.wslconfig

fi

cat ~/.wslconfig
