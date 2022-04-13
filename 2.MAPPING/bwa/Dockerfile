FROM alpine:3.15.2

LABEL maintainer="Yaheng Wang <admin@jjbioinfo.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# https://sourceforge.net/projects/bio-bwa/files/bwa-0.7.17.tar.bz2
# https://github.com/lh3/bwa/releases/download/v0.7.17/bwa-0.7.17.tar.bz2

RUN apk update && \
    apk upgrade && \
    apk --update add bash \
		gcc \
		make \
		musl-dev \
		zlib-dev && \
  wget -c -qO- "https://github.com/lh3/bwa/releases/download/v0.7.17/bwa-0.7.17.tar.bz2" | tar -jx && \
	cd bwa-0.7.17 && \
	sed -i 's/const uint8_t rle_auxtab\[8\];/\/\/const uint8_t rle_auxtab\[8\];/g' rle.h && \
	make && \
	mv bwa /usr/local/bin/bwa && \
  rm -rf /var/cache/apk/* && \
	rm -rf bwa-0.7.17

ENTRYPOINT ["bwa"]
