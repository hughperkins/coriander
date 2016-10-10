# cuda-on-cl

Build CUDA code for OpenCL devices.

## How to use

- write a CUDA sourcecode file, or find an existing one
- just use normal CUDA operations, like cudaMalloc, cudaFree, standard CUDA kernel launch syntax, and so on
- here's a simple example: [cuda_sample.cu](test/cuda_sample.cu)
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
- let's save this file eg to /tmp/foo/cuda_sample.cu:
```
/tmp/foo$ ls
cuda_sample.cu
```
Run `cocl` to create an object file:
```
/tmp/foo$ cocl cuda_sample.cu
   ...
   ... (bunch of compily stuff) ...
   ...

    ./cuda_sample.cu compiled into ./cuda_sample.o

To finish off, you can do:

    g++ -o ./cuda_sample ./cuda_sample.o /home/ubuntu/git/cuda-on-cl/build/hostside_opencl_funcs.o -lOpenCL -L/home/ubuntu/git/cuda-on-cl/build -lEasyCL

... which you can run like:

    LD_LIBRARY_PATH=/home/ubuntu/git/cuda-on-cl/build: ./cuda_sample


```
Do what it says:
```
/tmp/foo$ g++ -o ./cuda_sample ./cuda_sample.o /home/ubuntu/git/cuda-on-cl/build/hostside_opencl_funcs.o -lOpenCL -L/home/ubuntu/git/cuda-on-cl/build -lEasyCL
/tmp/foo$
```
And run it:
```
/tmp/foo$ LD_LIBRARY_PATH=/home/ubuntu/git/cuda-on-cl/build: ./cuda_sample
initialize cl context
Using Intel , OpenCL platform: Intel Gen OCL Driver
Using OpenCL device: Intel(R) HD Graphics 5500 BroadWell U-Processor GT2
cudaMalloc using cl, size 4096
clmems.size() 1 ptr 0xea4c70
cudaConfigureCall
grid_xy 4294967328 grid_z 1
block_xy 4294967328 grid_z 1
grid(32, 1, 1)
block(32, 1, 1)
setKernelArgFloatStar
setKernelArgInt32 2
setKernelArgFloat 123
kernelGo 
cudamempcy using opencl cudaMemcpyKind 2 count=16
hostFloats[2] 123
cudaConfigureCall
grid_xy 4294967328 grid_z 1
block_xy 4294967328 grid_z 1
grid(32, 1, 1)
block(32, 1, 1)
setKernelArgFloatStar
setKernelArgInt32 2
setKernelArgFloat 222
kernelGo 
cudamempcy using opencl cudaMemcpyKind 2 count=16
hostFloats[2] 222
cudamempcy using opencl cudaMemcpyKind 1 count=16
cudamempcy using opencl cudaMemcpyKind 2 count=16
hostFloats[2] 444
cudafree using opencl idx 0
```

Thats it!  :-)  Youve run your first `cuda-on-cl` program :-)

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
make
```
=> `ir-to-opencl`, `patch-hostside`, `libEasyCL.so`, and `hostside_opencl_funcs.o` should be built into `build` subdirectory

To use, you'll need to add `build` to your `PATH` variable:
```
export PATH=$PATH:$PWD/build
```

Thats it!

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

- Oct 10:
  - [test/eigen/test_cuda_elementwise_small.cu](https://github.com/hughperkins/cuda-on-cl/blob/a8f6aa55eb678e534cc7d17a3db26c6b8762d683/test/eigen/test_cuda_elementwise_small.cu) builds and runs ok now
- [Older news](doc/news.md)
