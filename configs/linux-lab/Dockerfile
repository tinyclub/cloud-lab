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

EXPOSE 5900 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/run"]
