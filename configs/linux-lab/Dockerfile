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

RUN mv /etc/apt/sources.list.bak /etc/apt/sources.list

RUN \
       update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 42 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 35 \
    && chmod a+rw /etc/alternatives/ \
    && chmod a+rw /var/lib/dpkg/alternatives/

EXPOSE 5900 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/run"]
