FROM tinylab/cloud-ubuntu-dev_cn
MAINTAINER Wu Zhangjin wuzhangjin@gmail.com

RUN apt-get -y update

RUN apt-get install -y --force-yes --no-install-recommends \
	qemu-system-x86 \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN rm -rf /var/lib/apt/lists/*

EXPOSE 6080 443 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/entrypoint.sh"]
