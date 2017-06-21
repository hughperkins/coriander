# Installation

To use Coriander, please build from source:

## Install pre-requisites

You will need:
- python 2.7
- c++ compiler, and cmake

## Installation

### On Mac OS X

```
git clone --recursive https://github.com/hughperkins/coriander
cd coriander
python install_distro.py
```

### On Linux

```
git clone --recursive https://github.com/hughperkins/coriander
cd coriander
python install_distro.py
```

### On Windows

Windows build is in progress, and doesnt actually run yet. See [installation_windows_inprogress.md](installation_windows_inprogress.md).

## Usage

- Coriander is installed into `~/coriander` directory
- Before using Coriander, you will need to set some environment variables, which you can do by running
```
source ~/coriander/activate
```
- (you'll need to do this each time you open a fresh terminal windows, or ssh session)

## Smoke tests

To run some smoke-tests: from the cloned repository, do:
```
cd build
make -j 8 tests
make run-tests
```

You can select the GPU using the environment variable `CL_GPUOFFSET`. For example, on a Macbook Pro 4th generation, to run on the Radeon:
```
CL_GPUOFFSET=1 make run-tests
```
(This is important, since the HD530 isnt quite working, on SGEMM currently. But the Radeon runs just fine :-) )

## Docker

There are [Docker files](docker).

<img src="https://github.com/hughperkins/Coriander/raw/master/doc/img/dockerfile_beignet_cudasample.png?raw=true" width="600" />

## Gotchas

### `Cannot find source file`

Did you clone with `--recursive`? You might be missing the sub-modules. You can get these by doing:
```
git submodule update --init --recursive
```
