#!/bin/bash

# I will simply run this, inside the docker image, like:

# docker run -t cocl bash /Coriander/docker/docker-unittest.sh

# (at least, thats the plan :-) )

set -x
set -e

cd /Coriander/build
./cocl_unittests

mkdir /tmp/foo
cd /tmp/foo
cp /Coriander/test/cocl/cuda_sample.cu .
cocl cuda_sample.cu
./cuda_sample

# python stuff...
# apt-get install -y --no-install-recommends python3 python3-dev python-virtualenv \
#     python3-numpy python3-wheel python3 python3-setuptools \
#     python3-mako python3-pip python3-pytest \
#     libffi-dev opencl-headers ocl-icd-opencl-dev

# pip3 install pyopencl pytest-pep8

# cd /Coriander
# OFFSET_32BIT=1 py.test-3 -v test

# cd /Coriander/build
# make run-tests

# hmmm, the nvidia docker is running ubuntu 14.04 :-P
