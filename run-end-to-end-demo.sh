#!/bin/bash

set -e
# set -x

export CUDA_HOME=/usr/local/cuda-7.5
TARGET=testcudakernel1

make

# convert the cuda file to IR; this bit needs CUDA include files
clang++-3.8 -I${CUDA_HOME}/include test/${TARGET}.cu --cuda-host-only -emit-llvm  -O3 -S -o test/generated/${TARGET}-host.ll

# run build/patch-hostside, to patch the IR
build/patch-hostside test/generated/${TARGET}-host.ll test/generated/${TARGET}-host2.ll

# compile the patched IR
clang++-3.8 -c test/generated/${TARGET}-host2.ll -O3 -o build/${TARGET}-host.o

# compile our main method
clang++-3.8 -std=c++11 -Isrc/EasyCL -c test/test_call_cl.cpp --cuda-host-only -O3 -o build/test_call_cl.o

# link, and run
g++ -o build/test_call_cl build/test_call_cl.o build/${TARGET}-host.o -lOpenCL -Lbuild -lEasyCL
LD_LIBRARY_PATH=build:$LD_LIBRARYP_PATH build/test_call_cl
