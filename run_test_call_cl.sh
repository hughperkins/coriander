#!/bin/bash

set -e

export CUDA_HOME=/usr/local/cuda-7.5
TARGET=testcudakernel1

clang++-3.8 -I${CUDA_HOME}/include -c examples/${TARGET}.cu --cuda-host-only -O3 -o build/${TARGET}-host.o
clang++-3.8 -I${CUDA_HOME}/include -c examples/test_call_cl.cpp --cuda-host-only -O3 -o build/test_call_cl.o
g++ -o build/test_call_cl build/test_call_cl.o build/${TARGET}-host.o -L${CUDA_HOME}/lib64 -lcudart -lOpenCL
LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH build/test_call_cl
