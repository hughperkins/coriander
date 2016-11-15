#!/bin/bash

export CLANG_HOME=$1
SYSLIBS=$(${CLANG_HOME}/bin/llvm-config --system-libs core | tr -d '\n')
echo ${SYSLIBS}
