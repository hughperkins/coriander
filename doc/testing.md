# Testing

The following tests are available:
- gtest
- pytest
- end-to-end
- Eigen

Tests can theoretically be added to any of gtest, pytest, or end-to-end.  Each has its own advantages:

- gtest: good for low-level unit tests. Runs quickly.
- pytest: easy to write unit-tests using bytecode, OpenCL, NVIDIA® CUDA™
- end-to-end: full end to end builds of NVIDIA® CUDA™ source-code files.  Probably the most convincing tests :-)

The Eigen tests are because Eigen is a framework used in Tensorflow, and being able to build/run Eigen is a key pre-requisite for that.

## `gtest` tests

```
cd build
make -j 8 gtest-tests
make run-gtest-tests
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
make -j 8 endtoend-tests
```

### Run
```
make run-endtoend-tests
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
- end-to-end tests are at [test/endtoend](test/endtoend)

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
