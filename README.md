# cuda-on-cl

Build applications written in NVIDIA® CUDA™ code for OpenCL™ 1.2 devices.

## Concept

- *Compile* using `cocl`
- *link* using `-lcocl -lOpenCL`
- at runtime, loads *libOpenCL.so*

## How to use, example

- write a CUDA sourcecode file, or find an existing one
- here's a simple example: [cuda_sample.cu](https://github.com/hughperkins/cuda-on-cl/blob/76a849d9510276bc67167c9a7676d64ff04c3e4a/test/cuda_sample.cu)
```
// a cuda app.  we will convert this to opencl, and run it :-)

#include <iostream>
#include <memory>

using namespace std;

#include <cuda_runtime.h>

__global__ void setValue(float *data, int idx, float value) {
    if(threadIdx.x == 0) {
        data[idx] = value;
    }
}

int main(int argc, char *argv[]) {
    int N = 1024;

    float *gpuFloats;
    cudaMalloc((void**)(&gpuFloats), N * sizeof(float));

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuFloats, 2, 123.0f);

    float hostFloats[4];
    cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    setValue<<<dim3(32, 1, 1), dim3(32, 1, 1)>>>(gpuFloats, 2, 222.0f);
    cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    hostFloats[2] = 444.0f;
    cudaMemcpy(gpuFloats, hostFloats, 4 * sizeof(float), cudaMemcpyHostToDevice);
    hostFloats[2] = 555.0f;
    cudaMemcpy(hostFloats, gpuFloats, 4 * sizeof(float), cudaMemcpyDeviceToHost);
    cout << "hostFloats[2] " << hostFloats[2] << endl;

    cudaFree(gpuFloats);

    return 0;
}
```
- let's save this file eg to `cuda_sample.cu`:
```
$ ls
cuda_sample.cu
```
Run `cocl` to compile it:
```
$ cocl cuda_sample.cu
   ...
   ... (bunch of compily stuff) ...
   ...

    ./cuda_sample.cu compiled into ./cuda_sample

```
Run `./cuda_sample`:
```
$ ./cuda_sample
Using Intel , OpenCL platform: Intel Gen OCL Driver
Using OpenCL device: Intel(R) HD Graphics 5500 BroadWell U-Processor GT2
hostFloats[2] 123
hostFloats[2] 222
hostFloats[2] 444
```

Thats it!  :-)  Youve run your first `cuda-on-cl` program :-)

### Two-step compilation

If you want, you can compile in two steps:

```
cocl -c teststream.cu
g++ -o teststream teststream.o -lcocl -lOpenCL
```
Result is the same:
```
$ ./cuda_sample
Using Intel , OpenCL platform: Intel Gen OCL Driver
Using OpenCL device: Intel(R) HD Graphics 5500 BroadWell U-Processor GT2
hostFloats[2] 123
hostFloats[2] 222
hostFloats[2] 444
```

## Options

| Option | Description |
|--------|-------------|
| -I   | provide an include directory, eg `-I /usr/local/eigen` |
| -o   | output filepath, eg `-o foo.o` |
| -c   | compile to .o file; dont link |

## How it works

Behind the scenes, there are a few parts:
- Device-side, `cocl` converts the CUDA kernels into OpenCL kernels
- Host-side, `cocl`:
  - converts the cuda kernel launch code into opencl kernel launch code, and
  - bakes in the OpenCL code

<img src="doc/img/cudairtoopenclarchitecture6.png?raw=true" width="900" height="400" />

[More detail](doc/how-it-works.md)

## How to build

### Pre-requisites

- Ubuntu 16.04
- 'include' files from CUDA toolkit 7.5, at `/usr/local/cuda-7.5/include`
- OpenCL-enabled GPU, and appropriate OpenCL drivers installed for the GPU

Other operating systems, cuda version, and clang/llvm versions, might work too, but untested.  Your mileage may vary :-)

### Procedure

```
sudo apt-get install git cmake llvm-3.8-dev clang-3.8-dev libc6-dev-i386 make gcc g++
git clone --recursive https://github.com/hughperkins/cuda-on-cl
cd cuda-on-cl
make -j 4
sudo make install
```

## Test

### Pre-requisites

In addition to above requirements for building, you'll need also:
- python 3.5

eg do:
```
sudo apt-get install python-3.5 python-3.5-dev
```

Setup python:
```
pip -install -r test/requirements.txt
```

Run tests:
```
py.test -sv
```

Tests are at [test](test)

## Tensorflow/Eigen usage

- [eigen](doc/eigen.md)

## What's working?

- [whats-working.md](doc/whats-working.md)

## Roadmap

- [roadmap.md](doc/roadmap.md)

## FAQ

- [faq.md](doc/faq.md)

## License

[Apache 2.0](LICENSE)

## News

- Oct 18:
  - installs to `/usr/local` now
  - `libcocl.a` contains `libEasyCL.a` now, no need for `libEasyCL.so` at runtime
  - fixed bug with linking multiple compiled `.cu` files causing error about 'multiple definitions of __opencl_source'
- Oct 16:
  - added streams, including kernel launch on non-default stream
  - removed pinned memory: `cuMemHostAlloc` now just calls `malloc`, see [design.md](doc/design.md) for analysis and thoughts on this.  Let me know if you have any ideas (eg via an issue).
  - added ability to copy to/from device memory, with an offset added
- Oct 15:
  - fixed critical bug where `return;` wasnt being written out.  Which didnt matter when that was at the end of a kernel.  But mattered more when that was the only exit condition for a kernel :-P
  - added event handling
  - ~~added pinned memory handling~~
  - added a bunch of api call implementations for getting information about the driver (mostly stubbed out for now...)
- Oct 10:
  - [test/eigen/test_cuda_elementwise_small.cu](https://github.com/hughperkins/cuda-on-cl/blob/a8f6aa55eb678e534cc7d17a3db26c6b8762d683/test/eigen/test_cuda_elementwise_small.cu) builds and runs ok now
- [Older news](doc/news.md)
