#!/bin/bash

TARGET=testcudakernel1

# if [[ $(clang++ --version | grep 3.9.0 | wc -l) == 0 ]]; then {
#     echo "plesae ensure that clang++ 3.9.0 is at the start of youor PATH var"
#     exit 1
# } fi

clang++-3.8 -I/usr/local/cuda-7.5/include data/${TARGET}.cu --cuda-device-only -emit-llvm -O3 -S -o data/${TARGET}.ll || exit 1
# clang++ -I/usr/local/cuda-7.5/include -c data/${TARGET}.cu -save-temps -O3 -S || exit 1

COMPILE_FLAGS="$(llvm-config-3.8 --cxxflags) -std=c++11"
LINK_FLAGS="$(llvm-config-3.8 --ldflags --system-libs --libs all)"
mkdir -p build
clang++-3.8 ${COMPILE_FLAGS} -fcxx-exceptions -o build/ir-to-opencl -g -O3 -I/usr/include/llvm-3.8 ir-to-opencl/ir-to-opencl.cpp ${LINK_FLAGS} || exit 1

build/ir-to-opencl $1 data/${TARGET}.ll
