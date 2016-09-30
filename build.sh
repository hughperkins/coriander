#!/bin/bash

export CUDA_HOME=/usr/local/cuda-7.5

COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"
mkdir -p build
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I/usr/include/llvm-3.8 ir-to-opencl/ir-to-opencl.cpp ${LINK_FLAGS}
