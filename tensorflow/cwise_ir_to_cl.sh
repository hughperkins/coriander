#!/bin/bash

# attempts to convert the ir from cwise add into opencl

set -e

export CUDA_HOME=/usr/local/cuda-7.5
COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"

mkdir -p build

# build build/ir-to-opencl
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I/usr/include/llvm-3.8 src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp ${LINK_FLAGS}

build/ir-to-opencl --debug tensorflow/generated/cwise_op_gpu_add-deviceside.ll tensorflow/generated/cwise_op_gpu_add-deviceside.cl
