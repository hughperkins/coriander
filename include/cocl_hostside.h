#pragma once

// stuff for host
// inline int llvm.ptx.read.tid.z() {
//     return 0;
// }

#define threadIdx nulldim3
extern dim3 nulldim3;

// #define __builtin_ptx_read_tid_z(x)

// #define __CUDA_DEVICE_BUILTIN(x,y)
