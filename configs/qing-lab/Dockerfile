FROM tinylab/linux-lab
MAINTAINER Wu Zhangjin <wuzhangjin@gmail.com>

RUN apt-get -y update

#### For tinylab.org

RUN apt-get install -y --force-yes --no-install-recommends \
	ruby2.0-dev \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN gem install iconv jekyll jekyll-paginate

#### For linux-0.11-lab/cs630-qemu-lab

RUN apt-get install -y --force-yes --no-install-recommends \
	qemu-system-x86 \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get install -y --force-yes --no-install-recommends \
	bochs vgabios bochsbios bochs-x libltdl7 bochs-sdl bochs-term \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

#### For Markdown-lab

# For Slides, Resume and Article
RUN apt-get install -y --force-yes --no-install-recommends \
	pandoc \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get install -y --force-yes --no-install-recommends \
	texlive-xetex texlive-latex-recommended texlive-latex-extra \
	texlive-fonts-recommended texlive-fonts-extra \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get install -y --force-yes --no-install-recommends \
	latex-cjk-common latex-cjk-chinese \
	latex-cjk-chinese-arphic-bkai00mp latex-cjk-chinese-arphic-bsmi00lp \
	latex-cjk-chinese-arphic-gbsn00lp latex-cjk-chinese-arphic-gkai00mp \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

RUN apt-get install -y --force-yes --no-install-recommends \
	latex-beamer \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

# For gitbook
RUN apt-get install -y --force-yes --no-install-recommends \
	calibre \
    && apt-get autoclean -y \
    && apt-get autoremove -y \
    && rm -rf /var/cache/apt/archives/*.deb

# RUN npm config set registry https://registry.npm.taobao.org
RUN npm install gitbook-cli -g \
    && rm /usr/local/bin/gitbook \
    && sh -c 'echo "nodejs /usr/local/lib/node_modules/gitbook-cli/bin/gitbook.js \$@" > /usr/local/bin/gitbook' \
    && chmod +x /usr/local/bin/gitbook

RUN npm install gitbook-plugin-duoshuo -g
RUN npm install gitbook-plugin-disqus -g
RUN npm install gitbook-plugin-google_code_prettify -g
RUN npm install gitbook-plugin-collapsible-menu -g
RUN npm install gitbook-plugin-maxiang -g
RUN npm install gitbook-plugin-multipart -g

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /labs/

EXPOSE 6080 433 80 22

ENTRYPOINT ["/tools/lab/entrypoint.sh"]
