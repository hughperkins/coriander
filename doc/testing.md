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

```
pip install -r test/requirements.txt
```

### Procedure

```
OFFSET_32BIT=1 \
COCL_OPTIONS='--devicell-opt inline --devicell-opt mem2reg --devicell-opt instcombine --devicell-opt O2' \
py.test -v
```

- python tests are at [test](test)

You can modify the options in `COCL_OPTIONS`.  There are passed to the `cocl` command, see section #Options above.

If you set `OFFSET_32BIT` to off in your cmake options, you should remove the `OFFSET_32BIT=1` optio nwhen running py.test

If you get lots of errors, you probably should double-check that you have done `export OFFSET_32BIT=1`.  If you're sure you have, and you're still getting errors, please log an issue with:
  - `git log -n 5 --oneline`, from the coriander directory (via https://gist.github.com )
  - which operating system (eg 'ubuntu 16.04', 'mac sierra')
  - which GPU(s) (eg 'nvidia 940m', 'radeon pro 450', ....)
  - the output of `clinfo` (via https://gist.github.com )
  - the full output of the command that produced the error, as well as the command (via https://gist.github.com )

## End-to-end tests

Run:
```
cd build
ccmake ..
```
turn on `BUILD_TESTS`, and run the build.

Now you can do, from `build` directory:
```
make -j 8 tests
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

### Options

From `ccmake ..`, there are various options you can choose, that affect hte OpenCL code produced.  These options will affect how well the OpenCL generation works, and how acceptable it is to your GPU driver.  If you're reading the OpenCL code ,they will affect readability too.

You can see the section `Options`, in [advanced_usage](doc/advanced_usage.md), for more details.

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
