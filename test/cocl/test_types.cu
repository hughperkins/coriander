// tests we can at least declare them and stuff

#include "cuda.h"

#include <iostream>

int returnerror() {
    return CUDA_ERROR_INVALID_IMAGE;
}

int main(int argc, char *argv[]) {
    CUdevice device;
    std::cout << returnerror() << std::endl;
    std::cout << CUDA_ERROR_INVALID_IMAGE << std::endl;
    std::cout << CUDA_ERROR_NOT_READY << std::endl;
    return 0;
}
