#!/bin/bash

TARGET=testcudakernel1

clang++-3.8 -I/usr/local/cuda-7.5/include ${TARGET}.cu --cuda-device-only -emit-llvm -O3 -S -o ${TARGET}.ll

# clang++-3.8 -std=c++11 -o run -g -O3 -I/usr/include/llvm-3.8 run.cpp || exit 1
COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"
# clang++-3.8 $(llvm-config-3.8 --cxxflags --ldflags --system-libs --libs core) -std=c++11 -o run -g -O3 -I/usr/include/llvm-3.8 run.cpp -lLLVMCore -lLLVMSupport || exit 1
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I/usr/include/llvm-3.8 ir-to-opencl.cpp ${LINK_FLAGS} || exit 1

build/ir-to-opencl ${TARGET}.ll
