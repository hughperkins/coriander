#!/bin/bash

# This is for maintainer usage primarily: always builds ir-to-opencl first

set -e

make build/ir-to-opencl

./run-ir-to-opencl-demo.sh $1
py.test -sv test $2 $3
