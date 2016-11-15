FROM ubuntu:16.04

ARG GIT_BRANCH=master

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake cmake-curses-gui git llvm-3.8-dev clang-3.8 gcc g++ libc6-dev zlib1g-dev \
    curl ca-certificates build-essential

RUN git clone --recursive https://github.com/hughperkins/cuda-on-cl -b ${GIT_BRANCH}

RUN cd cuda-on-cl && \
    mkdir build && \
    cd build && \
    cmake .. -DBUILD_TESTS=ON && \
    make -j 8

RUN cd cuda-on-cl && \
    cd build && \
    make install
