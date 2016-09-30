#!/bin/bash

set -e

export CUDA_HOME=/usr/local/cuda-7.5
TARGET=testcudakernel1

echo This demos that we can use standard llvm functionality to build
echo host-side code, from a single unified sourcecode file

# rm build/*.ll >/dev/null 2>&1
# rm build/*.o >/dev/null 2>&1

# clang++-3.8 -I${CUDA_HOME}/include -c examples/${TARGET}.cu --cuda-host-only -O3 -o build/${TARGET}-host.o
clang++-3.8 -I${CUDA_HOME}/include examples/${TARGET}.cu --cuda-host-only -O3 -S -emit-llvm -o build/${TARGET}-host.ll
clang++-3.8 -c build/${TARGET}-host.ll --cuda-host-only -O3 -o build/${TARGET}-host.o

clang++-3.8 -I${CUDA_HOME}/include -c examples/test_call_host.cpp --cuda-host-only -O3 -o build/test_call_host.o
g++ -o build/hostexe build/test_call_host.o build/${TARGET}-host.o -L${CUDA_HOME}/lib64 -lcudart
LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH build/hostexe
