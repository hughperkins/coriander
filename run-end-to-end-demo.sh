#!/bin/bash

set -e
# set -x

export CUDA_HOME=/usr/local/cuda-7.5
TARGET=testcudakernel1

COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"

# convert the cuda file to IR; this bit needs CUDA include files
clang++-3.8 -I${CUDA_HOME}/include examples/${TARGET}.cu --cuda-host-only -emit-llvm  -O3 -S -o examples/generated/${TARGET}-host.ll

# run build/patch-hostside, to patch the IR
build/patch-hostside examples/generated/${TARGET}-host.ll examples/generated/${TARGET}-host2.ll

# compile the patched IR
clang++-3.8 -c examples/generated/${TARGET}-host2.ll -O3 -o build/${TARGET}-host.o

# compile our main method
clang++-3.8 -std=c++11 -Isrc/EasyCL -c examples/test_call_cl.cpp --cuda-host-only -O3 -o build/test_call_cl.o

# link, and run
g++ -o build/test_call_cl build/test_call_cl.o build/${TARGET}-host.o -lOpenCL -Lbuild -lEasyCL
LD_LIBRARY_PATH=build:$LD_LIBRARYP_PATH build/test_call_cl
