FROM tinylab/cloud-ubuntu-dev_cn
MAINTAINER Wu Zhangjin wuzhangjin@gmail.com

RUN apt-get -y update

RUN apt-get install -y --force-yes --no-install-recommends \
	qemu-system-x86 \
	bochs vgabios bochsbios bochs-x libltdl7 bochs-sdl bochs-term \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

EXPOSE 6080
EXPOSE 443
EXPOSE 80
EXPOSE 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/entrypoint.sh"]
