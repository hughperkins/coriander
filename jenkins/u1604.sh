#!/bin/bash

# assumed to run from the base of the cloned Coriander git repo

set -e
set -x

BASEDIR=$(pwd)
hg clone https://bitbucket.org/hughperkins/eigen -b tf-coriander
mkdir build
cd build
cmake  -DEIGEN_TESTS=ON -DEIGEN_HOME=${BASEDIR}/eigen ..
make -j 16
make -j 16 gtest-tests
make -j 16 endtoend-tests
make -j 16 eigen-tests
make run-gtest-tests
make run-endtoend-tests
make run-eigen-tests

# cd docker
# sudo docker build --no-cache ./ -t coriander
