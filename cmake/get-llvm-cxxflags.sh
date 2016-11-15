#!/bin/bash

CLANG_HOME=$1
${CLANG_HOME}/bin/llvm-config --cxxflags | tr -d '\n'
