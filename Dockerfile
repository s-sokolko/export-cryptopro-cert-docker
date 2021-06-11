FROM ubuntu:14.04

ARG BASEDIR=/root
ARG REPO=https://github.com/kov-serg/get-cpcert.git
ARG SUBDIR=get-cpcert
ARG WORKDIR=/data

RUN apt -yq update \
    && apt -yq install unzip git wget make cmake gcc g++ pkg-config \
    && cd $BASEDIR \
    && git clone $REPO $SUBDIR \
    && cd $SUBDIR \
    && chmod 0755 *.sh \
    && ./prepare.sh \
    && ./build.sh \
    && cp ./*.so /lib \
    && cp ./get-cpcert /bin/

VOLUME $WORKDIR
WORKDIR $WORKDIR

ENTRYPOINT ["get-cpcert"]
