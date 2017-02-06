# https://github.com/fcwu/docker-ubuntu-vnc-desktop
FROM dorowu/ubuntu-desktop-lxde-vnc
MAINTAINER Falcon wuzhangjin@gmail.com

RUN sed -i -e "s%/archive.ubuntu.com%/cn.archive.ubuntu.com%g" /etc/apt/sources.list

RUN apt-get -y update

RUN apt-get install -y chromium-browser

RUN apt-get install -y ruby
RUN gem sources -r http://rubygems.org/
RUN gem sources -r https://rubygems.org/
RUN gem sources -a https://gems.ruby-china.org/

RUN gem install showterm

RUN apt-get install -y vim

RUN apt-get install -y git ca-certificates

RUN apt-get install -y gcc gdb binutils

RUN apt-get install -y qemu-kvm qemu-system-x86

RUN apt-get install -y cscope exuberant-ctags

RUN apt-get install -y qemu-user qemu-user-static

RUN apt-get install -y qemu-system-arm qemu-system-mips qemu-system-ppc

# For Qemu 0.10
RUN apt-get install -y libsdl1.2-dev

RUN apt-get install -y bridge-utils

RUN apt-get install -y xz-utils

RUN apt-get install -y wget unzip bc

RUN apt-get install -y libncurses-dev

# For pre-built toolchains
RUN apt-get install -y libc6-i386 lib32stdc++6 lib32z1

# For Qemu compiling: need to compile the new targets like aarch64
# http://wiki.qemu.org/Hosts/Linux
RUN apt-get install -y pkg-config libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev libgtk-3-dev

#RUN bash -c 'echo deb http://www.emdebian.org/debian/ wheezy main > /etc/apt/sources.list.d/emdebian.list'
RUN bash -c 'echo deb http://mirrors.ustc.edu.cn/emdebian/toolchains/ wheezy main > /etc/apt/sources.list.d/emdebian.list'

RUN apt-get -y update

RUN apt-get install -y gcc-powerpc-linux-gnu gcc-powerpc64le-linux-gnu openbios-ppc

RUN apt-get install -y gcc-arm-linux-gnueabi gcc-aarch64-linux-gnu

RUN apt-get install -y gcc-4.4

# Install more toolchains

RUN apt-get install -y emdebian-archive-keyring
ADD tools/libgmp3c2_4.3.2+dfsg-2ubuntu1_amd64.deb /
ADD tools/libmpc2_0.9-4_amd64.deb /
RUN dpkg -i /libgmp3c2_4.3.2+dfsg-2ubuntu1_amd64.deb
RUN dpkg -i /libmpc2_0.9-4_amd64.deb
RUN rm /libgmp3c2_4.3.2+dfsg-2ubuntu1_amd64.deb
RUN rm /libmpc2_0.9-4_amd64.deb

RUN apt-get install -y --force-yes gcc-4.3-arm-linux-gnueabi
RUN apt-get install -y --force-yes gcc-4.3-powerpc-linux-gnu
RUN apt-get install -y --force-yes gcc-4.3-mipsel-linux-gnu
RUN apt-get install -y --force-yes gcc-4.7-mipsel-linux-gnu

# Install for alternatives
RUN update-alternatives --install /usr/bin/mipsel-linux-gnu-gcc mipsel-linux-gnu-gcc /usr/bin/mipsel-linux-gnu-gcc-4.7 45
RUN update-alternatives --install /usr/bin/mipsel-linux-gnu-gcc mipsel-linux-gnu-gcc /usr/bin/mipsel-linux-gnu-gcc-4.3 41
RUN update-alternatives --install /usr/bin/arm-linux-gnueabi-gcc arm-linux-gnueabi-gcc /usr/bin/arm-linux-gnueabi-gcc-4.7 45
RUN update-alternatives --install /usr/bin/arm-linux-gnueabi-gcc arm-linux-gnueabi-gcc /usr/bin/arm-linux-gnueabi-gcc-4.3 41
RUN update-alternatives --install /usr/bin/powerpc-linux-gnu-gcc powerpc-linux-gnu-gcc /usr/bin/powerpc-linux-gnu-gcc-4.8 45
RUN update-alternatives --install /usr/bin/powerpc-linux-gnu-gcc powerpc-linux-gnu-gcc /usr/bin/powerpc-linux-gnu-gcc-4.3 41
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 45
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.4 41

# Allow update-alternative works with permission
RUN chmod a+rw /etc/alternatives/
RUN chmod a+rw /var/lib/dpkg/alternatives/

# For cross gdb
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:fkrull/deadsnakes
RUN apt-get -y update
RUN apt-get install --force-yes -y libpython2.6

# Fixup /usr/share/gdb/syscalls/ conflicts issues by strip them from the list file
RUN sed -i -e "/syscalls/d" /var/lib/dpkg/info/*gdb*.list
RUN apt-get install -y gdb-arm-linux-gnueabi
RUN sed -i -e "/syscalls/d" /var/lib/dpkg/info/*gdb*.list
RUN apt-get install -y gdb-ia64-linux-gnu
RUN sed -i -e "/syscalls/d" /var/lib/dpkg/info/*gdb*.list
RUN apt-get install -y gdb-mipsel-linux-gnu
RUN sed -i -e "/syscalls/d" /var/lib/dpkg/info/*gdb*.list
RUN apt-get install -y gdb-powerpc-linux-gnu

# NFS server
RUN apt-get install -y nfs-kernel-server

# TFTP Server
RUN apt-get install -y tftpd-hpa tftp-hpa

# Uboot tools for mkimage
RUN apt-get install -y u-boot-tools

# Bison
RUN apt-get install -y bison

# For Slides, Resume and Article
RUN apt-get install -y pandoc

RUN apt-get install -y texlive-xetex texlive-latex-recommended texlive-latex-extra
RUN apt-get install -y texlive-fonts-recommended texlive-fonts-extra
RUN apt-get install -y latex-cjk-common latex-cjk-chinese
RUN apt-get install -y latex-cjk-chinese-arphic-bkai00mp latex-cjk-chinese-arphic-bsmi00lp
RUN apt-get install -y latex-cjk-chinese-arphic-gbsn00lp latex-cjk-chinese-arphic-gkai00mp
RUN apt-get install -y latex-beamer

# For gitbook

RUN apt-get install -y nodejs npm
RUN apt-get install -y calibre

# RUN npm config set registry https://registry.npm.taobao.org
RUN npm install gitbook-cli -g
RUN rm /usr/local/bin/gitbook
RUN sh -c 'echo "nodejs /usr/local/lib/node_modules/gitbook-cli/bin/gitbook.js \$@" > /usr/local/bin/gitbook'
RUN chmod +x /usr/local/bin/gitbook

RUN npm install gitbook-plugin-duoshuo -g
RUN npm install gitbook-plugin-disqus -g
RUN npm install gitbook-plugin-google_code_prettify -g
RUN npm install gitbook-plugin-collapsible-menu -g
RUN npm install gitbook-plugin-maxiang -g
RUN npm install gitbook-plugin-multipart -g

# RUN gitbook fetch latest

# Chinese support
RUN apt-get install -y ibus ibus-sunpinyin dbus-x11
RUN apt-get install -y terminator
RUN apt-get install -y fonts-arphic-bkai00mp fonts-arphic-bsmi00lp
RUN apt-get install -y fonts-arphic-gbsn00lp fonts-arphic-gkai00mp
RUN apt-get install -y fonts-arphic-ukai fonts-arphic-uming
RUN apt-get install -y ttf-wqy-microhei ttf-wqy-zenhei #ttf-mscorefonts-installer

RUN apt-get install -y ruby2.0
RUN apt-get install -y ruby2.0-dev

ADD tools/ruby-switch /
RUN /ruby-switch 2.0
RUN rm /ruby-switch

RUN gem install iconv
RUN gem install jekyll
RUN gem install jekyll-paginate

RUN apt-get install -y bochs vgabios bochsbios bochs-doc bochs-x libltdl7 bochs-sdl bochs-term

RUN apt-get install -y wget unzip bc

RUN apt-get install -y graphviz cflow

RUN apt-get install -y xz-utils

WORKDIR /labs/

EXPOSE 6080
EXPOSE 80
EXPOSE 22

ENTRYPOINT ["/tools/lab/entrypoint.sh"]
