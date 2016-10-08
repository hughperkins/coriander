#!/bin/bash

# This simply demonstrates cuda build for now, built with cuda, running with cuda, using cuda gpu.  No opencl.  cuda.  Just to see how
# this works

# I'm running it like this, to get some sort of minimal code, without having zillions of other tests, files, and so on to handle

set -e

cd test/eigen
mkdir -p build

# export CUDA_HOME=/usr/local/cuda-7.5
export CUDA_HOME=/usr/local/cuda-8.0
export EIGEN_HOME=${HOME}/git/eigen  # this is from bitbucket, latest master, tested using 9628:97c1ebe6ccc2

export PATH=${CUDA_HOME}/bin:$PATH
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

# nvcc -std=c++11 -DEIGEN_TEST_FUNC=test_cuda_elementwise_small -I${EIGEN_HOME} test_cuda_elementwise_small.cu -o build/test_cuda_elementwise_small
nvcc -std=c++11 -DEIGEN_TEST_FUNC=cuda_elementwise_small -I${EIGEN_HOME} test_cuda_elementwise_small.cu -o build/test_cuda_elementwise_small
# nvcc -std=c++11 -DEIGEN_TEST_FUNC=cuda_elementwise_small -I${EIGEN_HOME} -c test_cuda_elementwise_small.cu -o build/test_cuda_elementwise_small.o

build/test_cuda_elementwise_small
