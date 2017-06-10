#!/bin/bash

set -e
set -x

mkdir -p build
touch build/foo
rm build/*
cocl -fPIC -c mylib.cu -o build/mylib.o
cocl -fPIC -c main.cu -o build/main.o
# g++ -o build/testsharedlib build/mylib.o build/main.o -lcocl -lOpenCL
# build/testsharedlib

g++ -shared -o build/libmylib.so build/mylib.o
g++ -o build/main -pie build/main.o -Lbuild -lmylib -lcocl -lOpenCL
LD_LIBRARY_PATH=build build/main

# clang++-3.8 -c -fPIC -o build/child.o child.cpp
# clang++-3.8 -c -o build/main.o main.cpp
# g++ -shared -o build/libmylib.so build/child.o
# g++ -o build/main build/main.o -Lbuild -lmylib

# LD_LIBRARY_PATH=build build/main
