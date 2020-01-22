FROM ubuntu:18.04

MAINTAINER Yaheng Wang(jjbioinfo@163.com)

ENV DEBIAN_FRONTEND noninteractive

# 国内跟换阿里镜像源
RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.aliyun.com\/ubuntu\//g' /etc/apt/sources.list \
&& apt-get update

RUN apt-get install -y curl 

# 安装STAR
ENV STAR_VERSION=2.7.3a

WORKDIR /tmp

RUN curl -L https://github.com/alexdobin/STAR/archive/${STAR_VERSION}.tar.gz -o /tmp/${STAR_VERSION}.tar.gz

RUN tar -zxvf /tmp/${STAR_VERSION}.tar.gz \
&& mv STAR-${STAR_VERSION} /opt/software/

ENV PATH $PATH:/opt/software/STAR-${STAR_VERSION}/bin
