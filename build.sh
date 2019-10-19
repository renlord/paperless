#!/bin/sh

IMAGE_NAME=paperless

echo "building for arm64v8, arm32v7 and amd64"
#docker build --no-cache -f Dockerfile.arm64v8 . -t pocoyo/$IMAGE_NAME:arm64v8 && \
docker push pocoyo/$IMAGE_NAME:arm64v8
#docker build --no-cache -f Dockerfile.arm32v7 . -t pocoyo/$IMAGE_NAME:arm32v7 && \
docker push pocoyo/$IMAGE_NAME:arm32v7

docker manifest create pocoyo/$IMAGE_NAME\
    pocoyo/$IMAGE_NAME:arm64v8 \
    pocoyo/$IMAGE_NAME:arm32v7 && \
docker manifest push --purge pocoyo/$IMAGE_NAME
