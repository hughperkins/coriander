// Copyright Hugh Perkins 2016

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//     http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "hostside_opencl_funcs.h"

#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include <set>

// #include "EasyCL.h"

#include "CL/cl.h"

using namespace std;
using namespace cocl;
using namespace easycl;

extern "C" {
    size_t cudaMalloc(void **p_mem, size_t N);
    size_t cudaFree(void *mem);
    size_t cudaMemsetAsync(void *devPtr, int value, size_t count, void *stream = 0);
    size_t cudaMemcpy(void *dst, const void *, size_t, size_t cudaMemcpyKind);
    size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t kind, void *stream = 0);
    size_t cuMemGetInfo_v2(size_t *free, size_t *total);
    size_t cuMemAlloc_v2(void **mem, size_t bytes);
    size_t cuMemFree_v2(void *mem);
    size_t cuMemsetD8_v2(void *location, unsigned char value, uint32_t count);
    size_t cuMemsetD32_v2(void *location, unsigned int value, uint32_t count);
    size_t cuMemHostAlloc(void **mem, unsigned int bytes, int CU_MEMHOSTALLOC_PORTABLE);
    size_t cuMemFreeHost(void *mem);
    size_t cuDeviceTotalMem_v2(uint64_t *value, void *device);
}

namespace cocl {
    // static vector<cl_mem> clmems;
    int nextIdx = 0;
    map<int, cl_mem> clmemByIdx;  // seems like we could just merge these two maps :-P
    map<void *, int> idxByAddr;
    map<cl_mem, int> sizeByClmem;  // for mapped buffers mostly, ofr now

    set<cl_mem> clmemNeedsMap;
}

size_t cuMemHostAlloc(void **p_mem, unsigned int bytes, int CU_MEMHOSTALLOC_PORTABLE) {
    cout << "cuMemHostAlloc redirected bytes=" << bytes << endl;
    hostside_opencl_funcs_assure_initialized();
    cout << "cuMemHostAlloc using cl, size " << bytes << endl;
    cl_mem float_data_gpu = clCreateBuffer(*ctx, CL_MEM_ALLOC_HOST_PTR, bytes,
                                           NULL, &err);
    cl->checkError(err);
    int idx = nextIdx;
    nextIdx++;
    clmemByIdx[idx] = float_data_gpu;
    // clmems.push_back(float_data_gpu);
    // int idx = clmems.size() - 1;
    // *p_mem = (float *)&clmems[idx];

    *p_mem = clEnqueueMapBuffer (*queue,
        float_data_gpu,
        CL_FALSE,
        CL_MAP_READ | CL_MAP_WRITE,
        0,
        bytes,
        0,
        0,
        0,
        &err
    );
    cl->checkError(err);
    cout << "cuMemHostAlloc after map: " << *p_mem << endl;

    idxByAddr[*p_mem] = idx;
    cout << "ptr " << *p_mem << " idx=" << idx << endl;
    clmemNeedsMap.insert(float_data_gpu);
    sizeByClmem[float_data_gpu] = bytes;

    // CL_MEM_ALLOC_HOST_PTR ?
    return 0;
}

size_t cuMemFreeHost(void *mem) {
    cout << "cuMemFreeHost redirected" << endl;
    return 0;
}

size_t cuMemGetInfo_v2(size_t *free, size_t *total) {
    cout << "cuMemGetInfo_v2 redirected" << endl;
    *free = 1024 * 1024;
    *total = 1024 * 1024;
    return 0;
}

size_t cudaMemcpyAsync (void *dst, const void *src, size_t count, size_t cudaMemcpyKind, void *stream) {
    cout << "cudaMemcpyAsync count=" << count << " cudaMemcpyKind=" << cudaMemcpyKind << " stream=" << stream << endl;

    assert(stream == 0);

    cout << "cudamempcy using opencl cudaMemcpyKind " << cudaMemcpyKind << " count=" << count << endl;
    if(cudaMemcpyKind == 2) {
        // device => host
        int srcidx = idxByAddr[(void *)src];
        cl_mem srcclmem = clmemByIdx[srcidx];
        err = clEnqueueReadBuffer(*queue, srcclmem, CL_TRUE, 0,
                                         count, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == 1) {
        // host => device
        int dstidx = idxByAddr[(void *)dst];
        cl_mem dstclmem = clmemByIdx[dstidx];
        err = clEnqueueWriteBuffer(*queue, dstclmem, CL_TRUE, 0,
                                          count, src, 0, NULL, NULL);
        cl->checkError(err);
    } else {
        cout << "cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
        throw runtime_error("unhandled cudaMemcpyKind");
    }

    return 0;
}

size_t cudaMemsetAsync(void *devPtr, int value, size_t count, void *stream) {
    cout << "cudaMemsetAsync stub value=" << value << " count=" << count << " stream=" << stream << endl;
    assert(stream == 0);

    return 0;
}

size_t cuMemsetD8_v2(void *location, unsigned char value, uint32_t count) {
    cout << "cuMemsetD8_v2 redirected value " << value << " count=" << count << endl;
    cl_int err = clEnqueueFillBuffer(*queue, *voidStarToClmem(location), &value, sizeof(unsigned char), 0, count * sizeof(unsigned char), 0, 0, 0);
    cl->checkError(err);
    return 0;
}

size_t cuMemsetD32_v2(void *location, unsigned int value, uint32_t count) {
    cout << "cuMemsetD32_v2 redirected value " << value << " count=" << count << endl;
    cl_int err = clEnqueueFillBuffer(*queue, *voidStarToClmem(location), &value, sizeof(int), 0, count * sizeof(int), 0, 0, 0);
    cl->checkError(err);
    return 0;
}

size_t cuDeviceTotalMem_v2(uint64_t *value, void *device) {
    cout << "cuDeviceTotalMem_v2 redirected" << endl;
    *value = 1024 * 1024;
    return 0;
}

size_t cudaMemcpy(void *dst, const void *src, size_t bytes, size_t cudaMemcpyKind) {
    cout << "cudamempcy using opencl cudaMemcpyKind " << cudaMemcpyKind << " count=" << bytes << endl;
    if(cudaMemcpyKind == 2) {
        // device => host
        int srcidx = idxByAddr[(void *)src];
        cl_mem srcclmem = clmemByIdx[srcidx];
        err = clEnqueueReadBuffer(*queue, srcclmem, CL_TRUE, 0,
                                         bytes, dst, 0, NULL, NULL);
        cl->checkError(err);
        // cl->finish();
    } else if(cudaMemcpyKind == 1) {
        // host => device
        int dstidx = idxByAddr[(void *)dst];
        cl_mem dstclmem = clmemByIdx[dstidx];
        err = clEnqueueWriteBuffer(*queue, dstclmem, CL_TRUE, 0,
                                          bytes, src, 0, NULL, NULL);
        cl->checkError(err);
    } else {
        cout << "cudaMemcpyKind using opencl " << cudaMemcpyKind << endl;
        throw runtime_error("unhandled cudaMemcpyKind");
    }
    return 0;
}

size_t cudaMalloc(void **p_mem, size_t N) {
    hostside_opencl_funcs_assure_initialized();
    cout << "cudaMalloc using cl, size " << N << endl;
    cl_mem float_data_gpu = clCreateBuffer(*ctx, CL_MEM_READ_WRITE, N,
                                           NULL, &err);
    cl->checkError(err);
    int idx = nextIdx;
    nextIdx++;
    clmemByIdx[idx] = float_data_gpu;
    // int idx = clmems.size() - 1;
    *p_mem = (float *)&clmemByIdx[idx];
    idxByAddr[*p_mem] = idx;
    cout << "ptr " << *p_mem << endl;

    return 0;
}

size_t cudaFree(void *mem) {
    // for(int i = 0 ; i < clmems.size(); i++) {
    //     cout << "cuda free i " << i << " " << &clmems[i] << endl;
    //     // err = clReleaseMemObject(clmems[i]);
    //     // cl->checkError(err);
    // }
    // err = clReleaseMemObject(*(cl_mem *)(*p_mem));
    // cl->checkError(err);

    int idx = idxByAddr[mem];

    cout << "cudafree using opencl idx " << idx << endl;
    err = clReleaseMemObject(clmemByIdx[idx]);
    // err = clReleaseMemObject(*(cl_mem *)mem);
    cl->checkError(err);
    return 0;
}

size_t cuMemAlloc_v2(void **mem, size_t bytes) {
    return cudaMalloc(mem, bytes);
}

size_t cuMemFree_v2(void *mem) {
    return cudaFree(mem);
}

// size_t cuMemsetD32_v2(void *location, int value, uint32 count) {
//     err = clEnqueueFillBuffer(*queue, location, &value, sizeof(int), 0, count * sizeof(int), 0, 0, 0);
// }

