#!/bin/bash

# clang-3.8 -Dcl_clang_storage_class_specifiers -isystem /home/ubuntu/git/libclc/generic/include -include clc/clc.h -target nvptx64-nvidia-nvcl -xcl testkernel1.cl -emit-llvm -S -o testkernel1.ll

# clang -I${CUDA_HOME}/include -I${CUDA_SDK_INC}
# ~/workspace/cuda_example/mis_kernel.cu -S -emit-llvm -o
# ~/workspace/cuda_example/a.ll

clang-3.8 -x=CUDA testcudakernel1.cu -S -emit-llvm -o testcudakernel1.ll
