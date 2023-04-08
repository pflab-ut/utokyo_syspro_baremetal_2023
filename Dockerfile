FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y mingw-w64 make gcc ovmf

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
USER user

WORKDIR /work
