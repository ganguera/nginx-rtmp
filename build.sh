#!/bin/bash
set -e

DOCKER_IMAGE=nginx-rtmp
DOCKER_COMPILE_IMAGE=nginx-rtmp-compile

rm -f nginx.tar.gz

cd compile
docker build -t ${DOCKER_COMPILE_IMAGE} .
docker create --name ${DOCKER_COMPILE_IMAGE} ${DOCKER_COMPILE_IMAGE}

cd ..
docker cp ${DOCKER_COMPILE_IMAGE}:/tmp/nginx.tar.gz ./
docker rm ${DOCKER_COMPILE_IMAGE}
docker build -t ${DOCKER_IMAGE} .
docker run -d --name ${DOCKER_IMAGE} -p 80:80 -p 1935:1935 -t ${DOCKER_IMAGE}
