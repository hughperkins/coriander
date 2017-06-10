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
make -j 8 cocl_unittests
make run-cocl_unittests
```

No dependencies on graphics card etc.  It simply takes some hand-crafted IR, and writes it to OpenCL.  It never actually tries to run the OpenCL, so it validates:
- can Coriander handle the IR without choking/crashing?
- do the hand-crafted OpenCL expected results match up with the actual cocl outputs?

gtest tests are at [test/gtest](test/gtest)

## pyopencl tests

### Pre-requisites

- built Coriander (from `build` folder, do `make -j 8`)
- installed python pre-requisites:
```
pip install -r test/requirements.txt
```

### Run

```
py.test -v
```

- python tests are at [test](test)

In theory, these should all pass, so please raise an issue for any that are failing, stating your operating system, and providing `clinfo` output

## End-to-end tests

### Build
```
make -j 8 end-to-end-tests
```

### Run
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

### Pre-requisites

- have mercurial installed (so you can download Eigen)
- have downloaded a Coriander-adapted version of Eigen, eg:
```
hg clone https://github.com/hughperkins/eigen
cd eigen
hg update tf-coriander
```

### Build

- build Coriander tests as normal, but set `EIGEN_TESTS` to `ON` in the `ccmake ..` options
- make sure to specify `EIGEN_HOME`, which should be set to the downloaded Eigen folder, from 'pre-requisites', above
Then do:
```
make -j 8 eigen-tests
```

### Run

```
make run-eigen-tests
```

Eigen tests are at [test/eigen](test/eigen)
