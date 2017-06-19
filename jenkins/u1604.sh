#!/bin/bash

# assumed to run from the base of the cloned Coriander git repo

set -e
set -x

BASEDIR=$(pwd)

(
    set +e
    sudo rm -Rf /usr/local/include/cocl
    sudo rm -Rf /usr/local/bin/cocl*
    for libname in cocl easycl clew clblast; do {
        sudo rm -Rf /usr/local/lib${libname}*
    } done
    sudo rm -Rf /usr/local/share/cocl
    sudo rm -Rf /usr/local/include/coriander_plugins
    sudo rm -Rf /usr/local/lib/coriander_plugins
    set -e
)

python2 install_distro.py

hg clone https://bitbucket.org/hughperkins/eigen -b tf-coriander
# mkdir build
cd build
cmake  -DEIGEN_TESTS=ON -DEIGEN_HOME=${BASEDIR}/eigen ..
make -j 16
zip ../artifacts.zip libcocl.so libclew.so libclblast.so libeasycl.so
make -j 16 gtest-tests
make -j 16 endtoend-tests
make -j 16 eigen-tests
make run-gtest-tests
make run-endtoend-tests
make run-eigen-tests

# cd docker
# sudo docker build --no-cache ./ -t coriander
