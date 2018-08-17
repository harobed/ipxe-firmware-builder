FROM ubuntu:bionic

RUN apt-get update -y && \
    apt-get install -y git build-essential liblzma-dev mtools mkisofs

COPY build.sh /build.sh
RUN chmod u+x /build.sh
