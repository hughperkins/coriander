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

# python stuff...
# lets add python3 virtualenv, so can run the python tests too
# this is not strictly necessary for using/running cuda-on-cl
# in fact, it's not necessary at all :-P
apt-get install -y --no-install-recommends python3 python3-dev python-virtualenv \
    python3-numpy python3-wheel python3-setuptools \
    libffi-dev opencl-headers ocl-icd-opencl-dev

python -m virtualenv -p python3 /env3

. /env3/bin/activate
pip install numpy
pip install -r /cuda-on-cl/test/requirements.txt

cd /cuda-on-cl
pytest -v
