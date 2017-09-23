# Eigen tests

Eigen is used by Tensorflow, so being able to build and run Eigen is a pre-requisite for running Tensorflow.

There are tests in Eigen repository itelf, but I find I use these tests instead, which are a subset of the Eigen repo tests,
and represent operations that are needed to build convolutional networks in Tensorflow.

## Pre-requisites

- [clang-4.0.0](http://releases.llvm.org/download.html#4.0.0)
- have installed [coriander](https://github.com/hughperkins/coriander)
- NVIDIA® CUDA™ Toolkit should not be in the include search path, ie not in /usr/local etc
- have mercurial installed (so you can download Eigen)
- have downloaded a Coriander-adapted version of Eigen, eg:
```
hg clone https://github.com/hughperkins/eigen
cd eigen
hg update tf-coriander
```

## How to run

- simply build Coriander tests as normal, but select 'EIGEN_TESTS' in the `ccmake ..` options
- make sure to specify EIGEN_HOME, which should be set to the downloaded Eigen folder, from 'pre-requisites', above
