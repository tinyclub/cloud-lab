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

EXPOSE 5900 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/run"]
