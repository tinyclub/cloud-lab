FROM tinylab/cloud-ubuntu-vm_embedded
MAINTAINER Wu Zhangjin <wuzhangjin@gmail.com>

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        flex \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /home/ubuntu/ \
    && rm -rf /var/cache/apt/archives/*.deb

# For 5.0.10 @ x86_64/pc

RUN add-apt-repository ppa:ubuntu-toolchain-r/test \
    && apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        gcc-8 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 46 \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /home/ubuntu/ \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        libelf-dev libssl-dev \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /home/ubuntu/ \
    && rm -rf /var/cache/apt/archives/*.deb

# For debootstrap rootfs chroot

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        qemu-user-static \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /home/ubuntu/ \
    && rm -rf /var/cache/apt/archives/*.deb

# For qemu virtfs/9pnet building

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        libattr1-dev libcap-dev \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /home/ubuntu/ \
    && rm -rf /var/cache/apt/archives/*.deb

EXPOSE 5900 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/run"]
