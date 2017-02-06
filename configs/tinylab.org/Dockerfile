FROM tinylab/cloud-ubuntu-dev_cn
MAINTAINER Wu Zhangjin <wuzhangjin@gmail.com>

RUN apt-get -y update

RUN apt-get install -y --force-yes --no-install-recommends \
	ruby2.0-dev \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt/archives/*.deb

RUN gem install iconv jekyll jekyll-paginate

EXPOSE 6080
EXPOSE 443
EXPOSE 80
EXPOSE 22

WORKDIR /labs/

ENTRYPOINT ["/tools/lab/entrypoint.sh"]
