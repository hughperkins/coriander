FROM ubuntu:16.04 as base

ARG GIT_BRANCH=master

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake cmake-curses-gui git gcc g++ libc6-dev zlib1g-dev \
    libtinfo-dev \
    curl ca-certificates build-essential wget xz-utils \
    bash-completion clinfo software-properties-common

WORKDIR /coriander/soft

RUN wget --progress=dot:giga http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz

RUN tar -xf clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz && \
    mv clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04 llvm-4.0

RUN apt-get update && apt-get install python -y

# Now make for specific builds
# AMD devices
FROM base as AMD

# Add clblast
RUN apt-add-repository ppa:cnugteren/clblast -y
    apt-get update && \
    apt-get install -y mesa-opencl-icd libclblast-dev

# Copy in the repo
WORKDIR /coriander
COPY . .
# Build it
WORKDIR /coriander/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Debug -DCLANG_HOME=$PWD/../soft/llvm-4.0 && \
    make -j 4
RUN make -j 4 tests
RUN make install

ENTRYPOINT ["/bin/bash"]

# Nvidia Beignet
FROM base as beignet

RUN apt-get update && \
    apt-get install -y beignet-opencl-icd clinfo

# Copy in the repo
WORKDIR /coriander
COPY . .
# Build it
WORKDIR /coriander/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Debug -DCLANG_HOME=$PWD/../soft/llvm-4.0 && \
    make -j 4
RUN make -j 4 tests
RUN make install
CMD ["/bin/bash"]
ENTRYPOINT /bin/bash

# Nvidia 1404
FROM base as nvidia-1404

RUN apt-get update && apt-get install -y --no-install-recommends \
    nvidia-opencl-icd-361 clinfo

# Copy in the repo
WORKDIR /coriander
COPY . .
# Build it
WORKDIR /coriander/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Debug -DCLANG_HOME=$PWD/../soft/llvm-4.0 && \
    make -j 4
RUN make -j 4 tests
RUN make install
CMD ["/bin/bash"]
ENTRYPOINT /bin/bash
