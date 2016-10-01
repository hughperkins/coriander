#!/bin/bash

set -e
# set -x

export CUDA_HOME=/usr/local/cuda-7.5
TARGET=testcudakernel1

COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"

mkdir -p build
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/patch-hostside ir-to-opencl/ir-to-opencl-common.cpp -g -O3 -I/usr/include/llvm-3.8 ir-to-opencl/patch-hostside.cpp ${LINK_FLAGS}
clang++-3.8 -I${CUDA_HOME}/include examples/${TARGET}.cu --cuda-host-only -emit-llvm  -O3 -S -o build/${TARGET}-host.ll
build/patch-hostside build/${TARGET}-host.ll build/${TARGET}-host2.ll
clang++-3.8 -c build/${TARGET}-host2.ll -O3 -o build/${TARGET}-host.o

clang++-3.8 -I${CUDA_HOME}/include -c examples/test_call_cl.cpp --cuda-host-only -O3 -o build/test_call_cl.o

g++ -o build/test_call_cl build/test_call_cl.o build/${TARGET}-host.o -L${CUDA_HOME}/lib64 -lcudart -lOpenCL
LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH build/test_call_cl
