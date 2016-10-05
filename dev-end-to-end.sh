#!/bin/bash

# this is mostly for dev use: builds ir-to-opencl and patch-hostside, then runs it against example cuda/ll code

set -e

make
make easycl

./run-end-to-end-demo.sh "$@"
# ./run-ir-to-opencl-demo.sh "$@"
