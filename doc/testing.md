# Testing

The following tests are available:
- low-level tests, using gtest
- pyopencl tests
- end-to-end tests
- Eigen tests
  ~~in Eigen repo, https://bitbucket.org/hughperkins/eigen/src/eigen-cl/unsupported/test/Coriander/?at=eigen-cl~~
  - there are tests in the eigen repo, and they somewhat run, but I dont use them for testing, I use the tests in this repo, at [test/eigen](test/eigen), since they're easier for me to use in a 'bite-size' way
- cudnn:
  - I'm using a branch of Tal Ben-Nun's [cudnn-training](https://github.com/tbennun/cudnn-training), at https://github.com/hughperkins/cudnn-training , to add/test cudnn implementation
  - there are tests within Coriander, in the `gtest` tests, eg run `./cocl_unittests tests=*dnn*`

## `gtest` tests

```
cd build
make -j 8 tests
./cocl_unittests
```

No dependencies on graphics card etc.  It simply takes some hand-crafted IR, and writes it to OpenCL.  It never actually tries to run the OpenCL, so it validates:
- can Coriander handle the IR without choking/crashing?
- do the hand-crafted OpenCL expected results match up with the actual cocl outputs?

## pyopencl tests

### Pre-requisites

- built Coriander
- installed python pre-requisites:
```
pip install -r test/requirements.txt
```

### Procedure

```
py.test -v
```

- python tests are at [test](test)

In theory, these should all pass, so please raise an issue for any that are failing, stating your operating system, and providing `clinfo` output

## End-to-end tests

Build:
```
cd build
ccmake ..
make -j 8 tests
```

Run:
```
make run-end-to-end-tests
```

You can run a test by name, eg:
```
make run-offsetkernelargs
```
Result:
```
################################
# running:
################################
LD_LIBRARY_PATH=build: build/test-cocl-offsetkernelargs
Using Intel , OpenCL platform: Intel Gen OCL Driver
Using OpenCL device: Intel(R) HD Graphics 5500 BroadWell U-Processor GT2
126.456
```
- end-to-end tests are at [test/cocl](test/cocl)

## Eigen tests

There are tests in this repo at [test/eigen](test/eigen)

To run them:
- firstly, clone eigen somewhere, let's say, into `~/git/eigen`:
```
mkdir ~/git
cd ~/git
hg clone https://bitbucket.org/hughperkins/eigen
cd eigen
# switch to your preferred branch... eg
hg update tf-coriander
```
from the root of Coriander repo, and having already installed coriander, do:
```
cd test/eigen
mkdir build
cd build
ccmake ..
# press 'c' for configure
# set 'EIGEN_HOME' to the path of the cloned `eigen` folder, from just now
# press 'c' twice, then g'
make run-tests
```
