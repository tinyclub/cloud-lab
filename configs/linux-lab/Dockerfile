FROM tinylab/cloud-ubuntu-dev_cn
MAINTAINER Wu Zhangjin <wuzhangjin@gmail.com>

RUN apt-get -y update

RUN apt-get install -y --force-yes --no-install-recommends \
	qemu-system-x86 \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get install -y --force-yes --no-install-recommends \
	qemu-kvm qemu-user bridge-utils \
	qemu-system-arm qemu-system-mips qemu-system-ppc \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

# For Qemu compiling: need to compile the new targets like aarch64
# libsdl1.2-dev: For Qemu 0.10 building
# http://wiki.qemu.org/Hosts/Linux
RUN apt-get install -y --force-yes --no-install-recommends \
	libsdl1.2-dev \
	libncurses-dev \
	bison pkg-config libglib2.0-dev \
	libfdt-dev libpixman-1-dev zlib1g-dev libgtk-3-dev \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

# For pre-built toolchains
RUN apt-get install -y --force-yes --no-install-recommends \
	libc6-i386 lib32stdc++6 lib32z1 \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN bash -c 'echo deb http://www.emdebian.org/debian/ wheezy main > /etc/apt/sources.list.d/emdebian.list'
#RUN bash -c 'echo deb http://mirrors.ustc.edu.cn/emdebian/toolchains/ wheezy main > /etc/apt/sources.list.d/emdebian.list'
RUN apt-get -y update

RUN apt-get install -y --force-yes --no-install-recommends \
	gcc-powerpc-linux-gnu gcc-powerpc64le-linux-gnu openbios-ppc \
	gcc-arm-linux-gnueabi gcc-aarch64-linux-gnu \
	gcc-4.4 \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

# Install more toolchains

RUN apt-get install -y --force-yes --no-install-recommends \
	emdebian-archive-keyring \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

ADD tools/libgmp3c2_4.3.2+dfsg-2ubuntu1_amd64.deb /
ADD tools/libmpc2_0.9-4_amd64.deb /
RUN dpkg -i /libgmp3c2_4.3.2+dfsg-2ubuntu1_amd64.deb \
    && dpkg -i /libmpc2_0.9-4_amd64.deb \
    && rm -f /libgmp3c2_4.3.2+dfsg-2ubuntu1_amd64.deb \
    && rm -f /libmpc2_0.9-4_amd64.deb \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get install -y --force-yes --no-install-recommends \
	gcc-4.3-arm-linux-gnueabi \
	gcc-4.3-powerpc-linux-gnu \
	gcc-4.3-mipsel-linux-gnu \
	gcc-4.7-mipsel-linux-gnu \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb


# Install for alternatives
# and allow update-alternative works with permission
RUN update-alternatives --install /usr/bin/mipsel-linux-gnu-gcc mipsel-linux-gnu-gcc /usr/bin/mipsel-linux-gnu-gcc-4.7 45 \
    && update-alternatives --install /usr/bin/mipsel-linux-gnu-gcc mipsel-linux-gnu-gcc /usr/bin/mipsel-linux-gnu-gcc-4.3 41 \
    && update-alternatives --install /usr/bin/arm-linux-gnueabi-gcc arm-linux-gnueabi-gcc /usr/bin/arm-linux-gnueabi-gcc-4.7 45 \
    && update-alternatives --install /usr/bin/arm-linux-gnueabi-gcc arm-linux-gnueabi-gcc /usr/bin/arm-linux-gnueabi-gcc-4.3 41 \
    && update-alternatives --install /usr/bin/powerpc-linux-gnu-gcc powerpc-linux-gnu-gcc /usr/bin/powerpc-linux-gnu-gcc-4.8 45 \
    && update-alternatives --install /usr/bin/powerpc-linux-gnu-gcc powerpc-linux-gnu-gcc /usr/bin/powerpc-linux-gnu-gcc-4.3 41 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 45 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 41 \
    && chmod a+rw /etc/alternatives/ \
    && chmod a+rw /var/lib/dpkg/alternatives/

# For cross gdb
RUN add-apt-repository -y ppa:fkrull/deadsnakes
RUN apt-get -y update

RUN apt-get install -y --force-yes --no-install-recommends \
	libpython2.6 \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

# Fix up /usr/share/gdb/syscalls/ conflicts issues by strip them from the list file
RUN sed -i -e "/syscalls/d" /var/lib/dpkg/info/*gdb*.list
RUN apt-get install -y --force-yes --no-install-recommends \
	gdb-arm-linux-gnueabi \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN sed -i -e "/syscalls/d" /var/lib/dpkg/info/*gdb*.list
RUN apt-get install -y --force-yes --no-install-recommends \
	gdb-ia64-linux-gnu \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN sed -i -e "/syscalls/d" /var/lib/dpkg/info/*gdb*.list
RUN apt-get install -y --force-yes --no-install-recommends \
	gdb-mipsel-linux-gnu \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN sed -i -e "/syscalls/d" /var/lib/dpkg/info/*gdb*.list
RUN apt-get install -y --force-yes --no-install-recommends \
	gdb-powerpc-linux-gnu \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

# NFS server
RUN apt-get install -y --force-yes --no-install-recommends \
	nfs-kernel-server \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

# TFTP Server
RUN apt-get install -y --force-yes --no-install-recommends \
	tftpd-hpa tftp-hpa \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

# Uboot tools for mkimage
RUN apt-get install -y --force-yes --no-install-recommends \
	u-boot-tools \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN rm -rf /var/lib/apt/lists/*

EXPOSE 6080 443 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/run"]
