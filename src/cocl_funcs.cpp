#include "cocl/cocl_funcs.h"

#include <iostream>

std::ostream &operator<<(std::ostream &os, const cudaFuncAttributes &attr) {
    os << "cudaFuncAttributes{constSizeBytes=" << attr.constSizeBytes
      << ",localSizeBytes=" << attr.localSizeBytes
      << ",maxThreadsPerBlock=" << attr.maxThreadsPerBlock
      << ",numRegs=" << attr.numRegs
      << ",ptxVersion=" << attr.ptxVersion
      << ",sharedSizeBytes=" << attr.sharedSizeBytes
    <<"}";
    return os;
}

// stubs
CUfunc_cache CU_FUNC_CACHE_PREFER_NONE;
CUfunc_cache CU_FUNC_CACHE_PREFER_SHARED;
CUfunc_cache CU_FUNC_CACHE_PREFER_L1;
CUfunc_cache CU_FUNC_CACHE_PREFER_EQUAL;
