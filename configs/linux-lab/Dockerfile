FROM tinylab/cloud-ubuntu-vm_embedded
MAINTAINER Wu Zhangjin <wuzhangjin@gmail.com>


RUN sed -i -e "s%archive.ubuntu.com%mirrors.163.com%g" /etc/apt/sources.list

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends  \
	python \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        cpio \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /home/ubuntu/ \
    && rm -rf /var/cache/apt/archives/*.deb

# START: for old gcc
RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i -e "s%archive.ubuntu.com%mirrors.163.com%g;s%focal%trusty%g" /etc/apt/sources.list

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        gcc-4.4 \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        gcc-4.8 \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN \
       update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 42 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 35 \
    && chmod a+rw /etc/alternatives/ \
    && chmod a+rw /var/lib/dpkg/alternatives/

RUN mv /etc/apt/sources.list.bak /etc/apt/sources.list
# END: for old gcc

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        gettext \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        less \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        sshpass \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        python3-serial \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        curl \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        libc6-dev-armel-cross libc6-armel-cross \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        libc6-dev-arm64-cross libc6-arm64-cross \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        libc6-riscv64-cross libc6-dev-riscv64-cross \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        linux-libc-dev-i386-cross \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

# Allow to add new ppa source
RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        gpg-agent \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        btrfs-progs \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        browser-plugin-freshplayer-pepperflash \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

# for mkfs.vfat
RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        dosfstools \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

# for qemu gui support
RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        qemu-system-gui \
        qemu-system-arm \
        qemu-system-mips \
        qemu-system-misc \
        qemu-system-ppc \
        qemu-system-s390x \
        qemu-system-sparc \
        qemu-system-x86 \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

EXPOSE 5900 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/run"]
