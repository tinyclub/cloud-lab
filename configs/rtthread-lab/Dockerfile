FROM tinylab/cloud-ubuntu-vm
MAINTAINER Wu Zhangjin wuzhangjin@gmail.com

# Building system

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
	scons \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

# Gcc toolchain with libnewlib
# ref: https://launchpad.net/gcc-arm-embedded/

RUN url=https://launchpad.net/gcc-arm-embedded \
    && path=5.0/5-2016-q3-update/+download \
    && file=gcc-arm-none-eabi-5_4-2016q3-20160926-linux \
    && suffix=tar.bz2 \
    && wget -c $url/$path/$file.$suffix \
    && tar jxf $file.$suffix --strip-components=1 -C /usr/local \
    && rm -rf $file \
    && rm $file.$suffix

# For scons --menuconfig

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
	libncurses-dev \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb


EXPOSE 5900 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/run"]
