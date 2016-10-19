#pragma once

// stuff for host
// inline int llvm.ptx.read.tid.z() {
//     return 0;
// }

// I'm not sure why these are appearing in host-side code, but they are, so, let's just hide them under the carpet
// for now...
// #define threadIdx nulldim3
// #define blockIdx nulldim3
// #define blockDim nulldim3
// #define gridDim nulldim3

// extern dim3 nulldim3;

// #define __builtin_ptx_read_tid_z(x)

// #define __CUDA_DEVICE_BUILTIN(x,y)
