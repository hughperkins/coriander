#!/bin/bash

# clang++-3.8 -I/usr/local/cuda-7.5/include llvm-sample.cu  -S -o llvm-sample.ll --cuda-gpu-arch=sm_30
# clang++-3.8 -I/usr/local/cuda-7.5/include llvm-sample.cu --cuda-device-only -emit-llvm -S -o llvm-sample.ll

clang++-3.8 -I/usr/local/cuda-7.5/include testcudakernel1.cu --cuda-device-only -emit-llvm -S -o testcudakernel1.ll
