#!/bin/bash

set -e
# set -x

export CUDA_HOME=/usr/local/cuda-7.5
TARGET=testcudakernel1

# convert the cuda file to deviceside opencl
make test/generated/${TARGET}-device.ll
make test/generated/${TARGET}-device.cl

# convert the cuda file to patched hostside IR
make test/generated/${TARGET}-hostraw.ll
make test/generated/${TARGET}-hostpatched.ll

# compile the patched IR
make build/${TARGET}-hostpatched.o

# compile our main method
make build/test_call_cl.o

# link, and run
make build/test_call_cl

LD_LIBRARY_PATH=build:$LD_LIBRARY_PATH build/test_call_cl
