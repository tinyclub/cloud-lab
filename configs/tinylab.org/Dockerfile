FROM tinylab/cloud-ubuntu-dev_cn_input
MAINTAINER Wu Zhangjin <wuzhangjin@gmail.com>

RUN apt-get -y update

RUN apt-get install -y --force-yes --no-install-recommends \
	ruby2.0-dev \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN rm -rf /var/lib/apt/lists/*

RUN gem install iconv jekyll jekyll-paginate

EXPOSE 6080 443 80 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/run"]
