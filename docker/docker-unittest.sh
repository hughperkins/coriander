#!/bin/bash

# I will simply run this, inside the docker image, like:

# docker run -t cocl bash /cuda-on-cl/docker/docker-unittest.sh

# (at least, thats the plan :-) )

set -x
set -e

# python stuff...
apt-get install -y --no-install-recommends python3 python3-dev python-virtualenv \
    python3-numpy python3-wheel python3 python3-setuptools 
    python3-mako python3-pip python3-pytest \
    libffi-dev opencl-headers ocl-icd-opencl-dev

pip install pyopencl pytest-pep8

cd /cuda-on-cl/build
./cocl_unittests

mkdir /tmp/foo
cd /tmp/foo
cp /cuda-on-cl/test/cocl/cuda_sample.cu .
cocl cuda_sample.cu
./cuda_sample

cd /cuda-on-cl/build
make run-tests

# . /env3/bin/activate
# pip install numpy
# pip install -r /cuda-on-cl/test/requirements.txt

cd /cuda-on-cl
OFFSET_32BIT=1 pytest -v
