# Installation

To use Coriander, please build from source:

## Install pre-requisites

### Mac OS X

Download/install llvm-4.0:
```
cd ~
wget http://llvm.org/releases/4.0.0/clang+llvm-4.0.0-x86_64-apple-darwin.tar.xz
tar -xf clang+llvm-4.0.0-x86_64-apple-darwin.tar.xz
mv clang+llvm-4.0.0-x86_64-apple-darwin /usr/local/opt
ln -s /usr/local/opt/clang+llvm-4.0.0-x86_64-apple-darwin /usr/local/opt/llvm-4.0
```

Whenever you use Coriander, please set `CLANG_HOME`, using `export CLANG_HOME=/usr/local/opt/llvm-4.0`

### Ubuntu 16.04

```
sudo apt-get install git cmake cmake-curses-gui libc6-dev-i386 make gcc g++ zlib1g-dev
sudo apt-get install libtinfo-dev
cd ~/Downloads
wget http://releases.llvm.org/4.0.0/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
sudo mkdir -p /usr/local/opt
cd /usr/local/opt
sudo tar -xf ~/Downloads/clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
sudo mv clang+llvm-4.0.0-x86_64-linux-gnu-ubuntu-16.04 llvm-4.0
```

Whenever you use Coriander, please set `CLANG_HOME` to `/usr/local/opt/llvm-4.0`

## Build/installation

```
mkdir -p ~/git
cd ~/git
git clone --recursive https://github.com/hughperkins/Coriander
cd Coriander
mkdir build
cd build
cmake ..
# Note: I usually set build/release type to `Debug`, so this is what is tested
make -j 4

# on Ubuntu:
sudo make install

# or on Mac, if you have homebrew, you dont need sudo:
make install
```

You're good.  If you want you can run some tests:
- `ccmake ..`
- change `BUILD_TESTS` to `ON`, press `c`, press `g`
- `make run-tests`

You can select the GPU using the environment variable `CL_GPUOFFSET`. For example, on a Macbook Pro 4th generation, to run on the Radeon:
```
CL_GPUOFFSET=1 make run-tests
```
(This is important, since the HD530 isnt quite working, on SGEMM currently. But the Radeon runs just fine :-) )

Note that you'll need to continue to export `CLANG_HOME` environment variable when using `cocl`.

## Docker

Docker images run ok on beignet and NVIDIA :-)  (or used to. not tested very recently...)  Please see [docker](docker) for more details.

<img src="https://github.com/hughperkins/Coriander/raw/master/doc/img/dockerfile_beignet_cudasample.png?raw=true" width="600" />

## Gotchas

### `Cannot find source file`

Did you clone with `--recursive`? You might be missing the sub-modules. You can get these by doing:
```
git submodule update --init --recursive
```
