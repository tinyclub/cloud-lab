#!/bin/bash
#
# wslconfig.sh -- configure a kernel for wsl2
#
# Usage:
#
#   $ tools/windows/wslconfig.sh labs/linux-lab/boards/x86_64/pc/bsp/kernel/wsl2/linux-msft-wsl-5.10.74.3/bzImage
#   $ tools/windows/wslconfig.sh labs/linux-lab/boards/x86_64/pc/bsp/kernel/wsl2/linux-msft-wsl-5.10.74.3
#   $ tools/windows/wslconfig.sh labs/linux-lab/boards/x86_64/pc/bsp/kernel/wsl2/
#

TOP_DIR="$(cd "$(dirname "$0")"/../../ && pwd)"

kernel=$1
[ -z "$kernel" ] && kernel="$TOP_DIR"/labs/linux-lab/boards/x86_64/pc/bsp/kernel/wsl2
[ -d "$kernel" ] && kernel="$(find "$kernel" -name "bzImage" | grep wsl | sort -r | head -1)"
[ ! -f "$kernel" ] && echo "Usage: $0 wsl2_kernel" && exit 0

wslconfig=~/.wslconfig
kernel_path="$(cd "$(dirname "$kernel")" && pwd -W | sed -e 's%/%\\\\%g')\\\\bzImage"

echo "LOG: Update kernel path to $wslconfig:"
echo "LOG: Kernel: $kernel_path"

dos2unix ~/.wslconfig

if [ ! -f $wslconfig ]; then

  cat <<EOF > $wslconfig
[wsl2]
kernel=$kernel_path
EOF

else

  kernel_path="$(echo "$kernel_path"| sed -e 's%\\\\%\\\\\\\\%g')"
  sed -i -e 's/^kernel=.*/kernel='"$kernel_path"'/g' ~/.wslconfig

fi

unix2dos ~/.wslconfig

echo "LOG: Check wsl configuration"
cat ~/.wslconfig
