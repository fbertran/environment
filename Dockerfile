FROM ubuntu:14.04
MAINTAINER Alban Linard <alban@linard.fr>

RUN apt-get update
RUN apt-get --yes install sudo

RUN adduser --disabled-password --gecos "" cosy
RUN adduser cosy sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ADD bin/install   /usr/local/cosy/install
ADD dependencies  /usr/local/cosy/dependencies

USER cosy
RUN cd /usr/local/cosy && ./bin/install --prefix=/usr/local/cosy