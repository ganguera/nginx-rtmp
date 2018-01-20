FROM alpine:latest
MAINTAINER Guillem Anguera <ganguera@gmail.com>

RUN	apk update
RUN apk add				      \
  		openssl			      \
  		libstdc++		      \
  		ca-certificates		\
  		pcre              \
      ffmpeg            \
      nodejs-npm

RUN npm install -g combine-mpd
RUN rm -rf /tmp/npm-*

ADD	nginx.tar.gz /opt/
ADD	nginx.conf /opt/nginx/conf/nginx.conf
ADD clappr-hls.html /opt/nginx/html/player.html

EXPOSE 80
EXPOSE 1935

ENTRYPOINT ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]
