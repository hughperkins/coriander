#!/bin/bash

# I will simply run this, inside the docker image, like:

# docker run -t cocl bash /cuda-on-cl/docker/docker-unittest.sh

# (at least, thats the plan :-) )

set -x
set -e

cd /cuda-on-cl/build
./cocl_unittests

mkdir /tmp/foo
cd /tmp/foo
cp /cuda-on-cl/test/cocl/cuda_sample.cu .
cocl cuda_sample.cu
./cuda_sample

cd /cuda-on-cl/build
make run-tests

cd /cuda-on-cl
source /env3/bin/activate
pytest -v
