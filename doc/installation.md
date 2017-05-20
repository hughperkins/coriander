# Installation

To use CUDA-on-CL, you need to build from source please. Dont worry: it is quite quick and easy. There is one dependency really, which is clang/llvm-3.8.
Other than that, the installation is quite quick, self-contained (seconds/minutes to build). CUDA-on-CL uses [CLBlast](https://github.com/cnugeteren/CLBlast)
to provide GEMM, GEMV, and to implementat convolutions. However, the source-code for this should be cloned automatically, when you clone CUDA-on-CL,
and the build is handled automatically by CUDA-on-CL build, so should be fairly painless :-)

## Mac OS X pre-requisites

Download/install llvm-3.8:
```
cd ~
wget http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-x86_64-apple-darwin.tar.xz
tar -xf clang+llvm-3.8.0-x86_64-apple-darwin.tar.xz
mv clang+llvm-3.8.0-x86_64-apple-darwin /usr/local/opt
ln -s /usr/local/opt/clang+llvm-3.8.0-x86_64-apple-darwin /usr/local/opt/llvm-3.8
```

Whenever you use CUDA-on-CL, please set `CLANG_HOME`, using `export CLANG_HOME=/usr/local/opt/llvm-3.8`

## Ubuntu 16.04 pre-requisites

```
sudo apt-get install llvm-3.8 llvm-3.8-dev clang-3.8
sudo apt-get install git cmake cmake-curses-gui libc6-dev-i386 make gcc g++ zlib1g-dev
```

Whenever you use CUDA-on-CL, please set `CLANG_HOME` to `/usr/lib/llvm-3.8`

### Build/installation

```
mkdir -p ~/git
cd ~/git
git clone --recursive https://github.com/hughperkins/cuda-on-cl
cd cuda-on-cl
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
- `ccmake`
- change `BUILD_TESTS` to `ON`
- run:
```
make run-tests
```

Note that you'll need to continue to export `CLANG_HOME` environment variable when using `cocl`.

## Docker

Docker images run ok on beignet and NVIDIA :-)  (or used to. not tested very recently...)  Please see [docker](docker) for more details.

<img src="https://github.com/hughperkins/cuda-on-cl/raw/master/doc/img/dockerfile_beignet_cudasample.png?raw=true" width="600" />
