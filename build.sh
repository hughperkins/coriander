#!/bin/bash

if [[ ! -d build ]]; then {
    mkdir build
} fi

cd build
cmake ..
make -j 8

SUDO=sudo
if [[ $(uname) == Darwin ]]; then {
    SUDO=
} fi

${SUDO} make install
