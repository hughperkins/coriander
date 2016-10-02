#!/bin/bash

set -e

export CUDA_HOME=/usr/local/cuda-7.5
TARGET=testcudakernel1

# convert incoming .cu file to device-side IR.  This bit needs CUDA include files
clang++-3.8 -include include/fake_funcs.h -I${CUDA_HOME}/include examples/${TARGET}.cu --cuda-device-only -emit-llvm -O3 -S -o examples/${TARGET}.ll

# run ir-to-opencl, to convert the IR into OpenCL.  This bit only depends on clang, not on CUDA
build/ir-to-opencl $1 examples/${TARGET}.ll
