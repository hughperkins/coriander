#!/bin/bash

# this is mostly for dev use: builds ir-to-opencl and patch-hostside, then runs it against example cuda/ll code

set -e

./build.sh
./run-end-to-end-demo.sh "$@"
# ./run-ir-to-opencl-demo.sh "$@"
