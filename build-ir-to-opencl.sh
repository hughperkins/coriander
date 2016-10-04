#!/bin/bash

export CUDA_HOME=/usr/local/cuda-7.5

CLANG=clang++-3.8
LLVM_CONFIG=llvm-config-3.8
LLVM_INCLUDE=/usr/include/llvm-3.8

COMPILE_FLAGS="$(${LLVM_CONFIG} --cxxflags) -std=c++11"
LINK_FLAGS="$(${LLVM_CONFIG} --ldflags --system-libs --libs all)"

mkdir -p build

# build build/ir-to-opencl
${CLANG} ${COMPILE_FLAGS} -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I${LLVM_INCLUDE} src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp ${LINK_FLAGS}
