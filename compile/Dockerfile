FROM alpine:latest
MAINTAINER Guillem Anguera <ganguera@gmail.com>

ENV NGINX_VERSION 1.13.6
ENV NGINX_RTMP_MODULE 1.2.0

RUN	apk update
RUN apk add						\
			git							\
			gcc							\
			binutils-libs		\
			binutils				\
			gmp							\
			isl							\
			libgomp					\
			libatomic				\
			libgcc					\
			openssl					\
			pkgconf					\
			pkgconfig				\
			mpfr3						\
			mpc1						\
			libstdc++				\
			ca-certificates	\
			libssh2					\
			curl						\
			expat						\
			pcre						\
			musl-dev				\
			libc-dev				\
			pcre-dev				\
			zlib-dev				\
			openssl-dev			\
			make

WORKDIR /tmp
RUN wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
RUN wget https://github.com/arut/nginx-rtmp-module/archive/v${NGINX_RTMP_MODULE}.tar.gz
RUN tar xzf nginx-${NGINX_VERSION}.tar.gz
RUN tar xzf v${NGINX_RTMP_MODULE}.tar.gz

WORKDIR /tmp/nginx-${NGINX_VERSION}
RUN ./configure --prefix=/opt/nginx	--with-http_ssl_module --with-http_stub_status_module --add-module=../nginx-rtmp-module-${NGINX_RTMP_MODULE}
RUN	make
RUN	make install
RUN cp ../nginx-rtmp-module-${NGINX_RTMP_MODULE}/stat.xsl /opt/nginx/html/stat.xsl

WORKDIR	/opt/
RUN	tar cvzf /tmp/nginx.tar.gz nginx
