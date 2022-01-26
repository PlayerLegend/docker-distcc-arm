# syntax=docker/dockerfile:1
FROM debian:10
RUN apt update
RUN apt upgrade
RUN apt install -y gcc-aarch64-linux-gnu distcc bash
RUN apt install -y iputils-ping sysvinit-utils htop
COPY link-cross.sh /
RUN sh /link-cross.sh
ENV PATH="$PATH":/usr/lib/distcc
CMD distccd --port 3632 --no-detach --allow 192.168.0.0/24 # --verbose --log-stderr
