#!/bin/bash

set -e

export CUDA_HOME=/usr/local/cuda-7.5
TARGET=testcudakernel1

clang++-3.8 -include include/fake_funcs.h -I${CUDA_HOME}/include examples/${TARGET}.cu --cuda-device-only -emit-llvm -O3 -S -o examples/${TARGET}.ll

build/ir-to-opencl $1 examples/${TARGET}.ll
