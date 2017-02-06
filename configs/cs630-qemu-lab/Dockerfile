# https://github.com/fcwu/docker-ubuntu-vnc-desktop
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

RUN apt-get install -y qemu-user qemu-user-static

RUN apt-get install -y wget unzip bc

WORKDIR /labs/

EXPOSE 6080
EXPOSE 22

ENTRYPOINT ["/tools/lab/entrypoint.sh"]
