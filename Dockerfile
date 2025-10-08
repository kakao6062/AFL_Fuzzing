FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y build-essential clang libclang-dev git vim libtool-bin automake libbison-dev libglib2.0-dev ninja-build

RUN useradd -ms /bin/bash afluser
WORKDIR /home/afluser

RUN git clone https://github.com/AFLplusplus/AFLplusplus.git
RUN cd AFLplusplus && \
    make && \
    make install

WORKDIR /home/afluser/AFLplusplus
RUN cd qemu_mode && \
    ./build_qemu_support.sh && \
    cd .. && \
    make && \
    make install
COPY ./src /home/afluser/src

WORKDIR /home/afluser
