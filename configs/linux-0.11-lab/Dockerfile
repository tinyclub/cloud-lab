FROM dorowu/ubuntu-desktop-lxde-vnc
MAINTAINER Falcon wuzhangjin@gmail.com

RUN sed -i -e "s%/archive.ubuntu.com%/cn.archive.ubuntu.com%g" /etc/apt/sources.list

RUN apt-get -y update

RUN apt-get install -y rsyslog
RUN apt-get install -y fail2ban
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

RUN apt-get install -y bochs vgabios bochsbios bochs-doc bochs-x libltdl7 bochs-sdl bochs-term

RUN apt-get install -y graphviz cflow

RUN apt-get install -y xz-utils

WORKDIR /labs/

EXPOSE 6080

ENTRYPOINT ["/tools/lab/entrypoint.sh"]
