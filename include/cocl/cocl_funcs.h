#pragma once

#include <cstddef>
#include <iostream>
#include <string>
#include <random>

template<typename T>
size_t cudaSetupArgument(T arg, int flags) {
    std::cout << "cudaSetupArgument from cocl_funcs.h" << std::endl;
    return 0;
}
template<typename T>
size_t cudaLaunch(T fn) {
    std::cout << "cudaLaunch from cocl_funcs.h" << std::endl;
    return 0;
}

// used by stream_executor/cl_driver.h; we just declare them for now...
typedef void *CUfunction;
typedef void *CUfunction_attribute;

// struct CUfunc_cache {
// };
typedef void *CUmodule;

typedef const std::discrete_distribution<int> CUfunc_cache;
extern CUfunc_cache CU_FUNC_CACHE_PREFER_NONE;
extern CUfunc_cache CU_FUNC_CACHE_PREFER_SHARED;
extern CUfunc_cache CU_FUNC_CACHE_PREFER_L1;
extern CUfunc_cache CU_FUNC_CACHE_PREFER_EQUAL;

// this is things *used*/needed by the function. (cf what our hardware provides)
// make sure they're low enough that thrust wont send the occupancy to zero...
struct cudaFuncAttributes {
    size_t constSizeBytes = 0;
    size_t localSizeBytes = 512;
    int maxThreadsPerBlock = 256;
    int numRegs = 64;
    int ptxVersion;
    size_t sharedSizeBytes = 4 * 1024;
};
std::ostream &operator<<(std::ostream &os, const cudaFuncAttributes &attr);

typedef void (*fun_ptr_type)();
inline size_t cudaFuncGetAttributes(cudaFuncAttributes *p_attributes, fun_ptr_type fn) {
    std::cout << "cocl.h cudaFuncGetAttributes(p_attributes, fun_ptr_type fn)" << std::endl;
    // throw std::runtime_error("not implemented: cudaFuncGetAttributes()");
    cudaFuncAttributes attrs;
    *p_attributes = attrs;
    std::cout << "cudafuncgetattributes threadsperblock =" << p_attributes->maxThreadsPerBlock << std::endl;
    return 0;
}
inline size_t cudaFuncGetAttributes(cudaFuncAttributes *p_attributes, void *pfn) {
    std::cout << "cocl.h cudaFuncGetAttributes(p_attributes, void *pfn)" << std::endl;
    // throw std::runtime_error("not implemented: cudaFuncGetAttributes()");
    cudaFuncAttributes attrs;
    *p_attributes = attrs;
    return 0;
}
