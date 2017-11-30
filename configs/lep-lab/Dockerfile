FROM tinylab/cloud-ubuntu-dev_cn_input
MAINTAINER Wu Zhangjin wuzhangjin@gmail.com

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /home/ubuntu/

# For lepd
##
## perf heavily depends on host kernel version, it is not meaniful to preinstall it in docker image.
## so, linux-tools-`uname -r` should be installed on the fly?
RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
	libev-dev \ 
	linux-tools-common linux-tools-generic linux-tools-4.4.0-98-generic \
	libncurses5-dev \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        gcc-arm-linux-gnueabi \
	gcc-aarch64-linux-gnu \
	libc6-dev-arm64-cross \
	libc6-dev-armel-cross \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
	qemu-user \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

# For lepv
RUN apt-get -y update \
    && apt-get install -y --force-yes --no-install-recommends \
        python3-pip \
    && pip3 install flask \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN pip3 install flask_socketio

# Can not use python 2.7 by default, for supervisor doesn't work with python >= 3
#RUN update-alternatives --install /usr/bin/python python /usr/bin/python2.7 41 \
#    && update-alternatives --install /usr/bin/python python /usr/bin/python3.4 45 \
#    && update-alternatives --set python /usr/bin/python2.7 \
#    && chmod a+rw /etc/alternatives/ \
#    && chmod a+rw /var/lib/dpkg/alternatives/

EXPOSE 5900 8889 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/run"]
