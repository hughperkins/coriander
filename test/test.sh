#!/bin/bash

set -e

make build/ir-to-opencl

./run-ir-to-opencl-demo.sh $1
py.test -sv test
