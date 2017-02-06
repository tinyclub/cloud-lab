FROM ubuntu:14.04
MAINTAINER Falcon wuzhangjin@gmail.com

RUN sed -i -e "s%/archive.ubuntu.com%/cn.archive.ubuntu.com%g" /etc/apt/sources.list

RUN apt-get -y update

RUN apt-get install -y vim
RUN apt-get install -y git ca-certificates
RUN apt-get install -y gcc
RUN apt-get install -y make
RUN apt-get install -y nodejs

RUN apt-get install -y ruby2.0
RUN apt-get install -y ruby2.0-dev
ADD tools/ruby-switch /
RUN /ruby-switch 2.0
RUN rm /ruby-switch

RUN gem sources -r http://rubygems.org/
RUN gem sources -r https://rubygems.org/
RUN gem sources -a https://gems.ruby-china.org/

RUN gem install iconv
RUN gem install jekyll
RUN gem install jekyll-paginate

RUN apt-get install -y openssh-server
RUN apt-get install -y rsyslog
RUN apt-get install -y fail2ban

RUN apt-get install -y pwgen
RUN apt-get install -y supervisor

WORKDIR /labs/

EXPOSE 80
EXPOSE 22

ENTRYPOINT ["/tools/lab/entrypoint.sh"]
