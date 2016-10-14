#!/bin/bash

set -e

CUDA_HOME=/usr/local/cuda-7.5
CLANG=clang++-3.8

g++ -o build/testcontext -I${CUDA_HOME}/include test/testcontext.cpp -Lbuild -lcocl -lEasyCL -lOpenCL
LD_LIBRARY_PATH=build build/testcontext
