FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y build-essential clang libclang-dev wget

RUN useradd -ms /bin/bash afluser
WORKDIR /home/afluser

RUN wget https://lcamtuf.coredump.cx/afl/releases/afl-latest.tgz && \
    tar -xzvf afl-latest.tgz
RUN cd afl-* && \
    make && \
    make install
COPY ./src /home/afluser/src
