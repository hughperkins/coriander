#!/bin/bash

set -e

# ./build.sh

./run-ir-to-opencl-demo.sh $1
py.test -sv test
