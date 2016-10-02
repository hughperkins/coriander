#!/bin/bash

# this is mostly for dev use: builds ir-to-opencl, then runs it against example cuda/ll code

set -e

./build.sh
./run-ir-to-opencl-demo.sh "$@"
