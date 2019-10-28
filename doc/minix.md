
# Build minix fs kernel modules

## Method 1

```
$ sudo apt-get -y update
$ sudo apt-get install -y linux-headers-`uname -r`

$ wget -c https://gitee.com/tinylab/linux-stable/repository/archive/v4.4.zip
or
$ cd /path/to/linux-lab
$ make kernel-download

$ cd /path/to/linux-stable
$ cd fs/minix/
$ make -C /lib/modules/`uname -r`/build M=$PWD modules CONFIG_MINIX_FS=m LOCALVERSION=
make -C /lib/modules/`uname -r`/build M=$PWD modules CONFIG_MINIX_FS=m
make: Entering directory '/usr/src/linux-headers-4.4.0-165-generic'
  CC [M]  /labs/linux-lab/minix/module/bitmap.o
  CC [M]  /labs/linux-lab/minix/module/itree_v1.o
  CC [M]  /labs/linux-lab/minix/module/itree_v2.o
  CC [M]  /labs/linux-lab/minix/module/namei.o
  CC [M]  /labs/linux-lab/minix/module/inode.o
  CC [M]  /labs/linux-lab/minix/module/file.o
  CC [M]  /labs/linux-lab/minix/module/dir.o
  LD [M]  /labs/linux-lab/minix/module/minix.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /labs/linux-lab/minix/module/minix.mod.o
  LD [M]  /labs/linux-lab/minix/module/minix.ko
make: Leaving directory '/usr/src/linux-headers-4.4.0-165-generic'
```

## Method 2

```
$ cd /path/to/linux
$ zcat /proc/config.gz > .config
$ cp /boot/config-`uname -r` .config
$ make olddefconfig
$ make modules_prepare
$ make fs/minix/minix.ko CONFIG_MINIX_FS=m LOCALVERSION=
```
