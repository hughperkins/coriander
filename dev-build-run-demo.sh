#!/bin/bash

# this is mostly for dev use: builds ir-to-opencl, then runs it against example cuda/ll code

./build.sh
./run-ir-to-opencl-demo.sh "$@"
