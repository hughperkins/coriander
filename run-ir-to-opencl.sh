#!/bin/bash

set -e

export CUDA_HOME=/usr/local/cuda-7.5
TARGET=testcudakernel1

clang++-3.8 -include include/fake_funcs.h -I${CUDA_HOME}/include examples/${TARGET}.cu --cuda-device-only -emit-llvm -O3 -S -o examples/${TARGET}.ll

COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"
mkdir -p build
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I/usr/include/llvm-3.8 ir-to-opencl/ir-to-opencl.cpp ${LINK_FLAGS}

build/ir-to-opencl $1 examples/${TARGET}.ll

clang++-3.8 -I${CUDA_HOME}/include -c examples/${TARGET}.cu --cuda-host-only -O3 -o build/${TARGET}-host.o
clang++-3.8 -I${CUDA_HOME}/include -c examples/test_call_host.cpp --cuda-host-only -O3 -o build/test_call_host.o
g++ -o build/hostexe build/test_call_host.o build/${TARGET}-host.o -L${CUDA_HOME}/lib64 -lcudart
LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH build/hostexe
