// for this one, we need some metadata on how many kernel compiles etc
// so we'll need to include some cocl include files, directly

#include "hostside_opencl_funcs.h"

#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

__global__ void getValue(float *outdata, float *indata) {
    outdata[0] = indata == 0 ? 3.0f : 2.0f;
}

void testfloatstar() {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    float *hostFloats1;
    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);

    CUdeviceptr deviceFloats1;
    cuMemAlloc(&deviceFloats1, N * sizeof(float));

    getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(((float *)deviceFloats1), 0);
    getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(((float *)deviceFloats1), 0);
    getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(((float *)deviceFloats1), 0);
    getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(((float *)deviceFloats1), 0);
    cuStreamSynchronize(stream);

    cout << "num kernels cached " << cocl::getNumCachedKernels() << endl;
    cout << "num kernel calls " << cocl::getNumKernelCalls() << endl;

    assert(cocl::getNumCachedKernels() == 1);
    assert(cocl::getNumKernelCalls() == 4);

    cuMemFreeHost(hostFloats1);
    cuMemFree(deviceFloats1);
    cuStreamDestroy(stream);
}

int main(int argc, char *argv[]) {
    testfloatstar();
    return 0;
}

