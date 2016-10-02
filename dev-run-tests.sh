#!/bin/bash

# This is for maintainer usage primarily: always builds ir-to-opencl first

set -e

export CUDA_HOME=/usr/local/cuda-7.5
COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"

mkdir -p build

# build build/ir-to-opencl
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I/usr/include/llvm-3.8 src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp ${LINK_FLAGS}

./run-ir-to-opencl-demo.sh $1
py.test -sv test $2 $3
