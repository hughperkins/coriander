// based (very) loosely on cudnn-training's lenet.cu, and tensorflow's cl_driver.cc

#include <cuda_runtime.h>
#include <iostream>

int main(int argc, char *argv[]) {
    int num_gpus;
    cudaGetDeviceCount(&num_gpus);
    std::cout << "num gpus: " << num_gpus << std::endl;

    for(int gpu=0; gpu < num_gpus; gpu++) {
        cudaSetDevice(gpu);
        CUdevice device;
        cudaGetDevice(&device);
        std::cout << "device: " << device << std::endl;
    }

    for(int gpu=0; gpu < num_gpus; gpu++) {
        CUcontext context;
        cuCtxCreate(&context, 0, gpu);
    }

    return 0;
}
