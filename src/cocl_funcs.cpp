#include "cocl/cocl.h"

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
