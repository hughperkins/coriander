FROM ubuntu:16.04

ARG GIT_BRANCH=master

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake cmake-curses-gui git gcc g++ libc6-dev zlib1g-dev \
    libtinfo-dev \
    curl ca-certificates build-essential wget xz-utils \
    bash-completion

RUN git clone --recursive https://github.com/hughperkins/coriander -b ${GIT_BRANCH}

RUN cd coriander && \
    mkdir soft && \
    cd soft && \
    wget http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz

RUN cd coriander/soft && \
    tar -xf clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz && \
    mv clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04 llvm-4.0

RUN cd coriander && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Debug -DCLANG_HOME=$PWD/../soft/llvm-4.0 && \
    make -j 4

RUN cd coriander/build && \
    make -j 4 tests

RUN cd coriander/build && \
    make install
