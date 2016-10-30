// test calling kernels from different threads, in parallel (can be different kernels, or same.  either way, should work, not crash :-) )

#include "pthread.h"

#include "hostside_opencl_funcs.h"

#include <iostream>
#include <memory>
#include <cassert>
#include <sstream>

using namespace std;

#include <cuda.h>

const int N = 1024;

__global__ void getValue(float *outdata) {
    float sum = 0;
    for(int i = 1; i < N; i++) {
        sum += outdata[i];
    }
    outdata[0] = sum;
}

template<typename T>
static std::string toString(T val) {
   std::ostringstream myostringstream;
   myostringstream << val;
   return myostringstream.str();
}

pthread_mutex_t print_mutex = PTHREAD_MUTEX_INITIALIZER;
void print(string message) {
    pthread_mutex_lock(&print_mutex);
    cout << message << endl;
    pthread_mutex_unlock(&print_mutex);
}

// CUcontext context;
CUcontext *context;

pthread_mutex_t context_mutex = PTHREAD_MUTEX_INITIALIZER;

void *thread_func(void *data) {
    int i = (size_t)data;
    print("thread " + toString(i));

    cuCtxSetCurrent(context[i]);

    float *hostFloats1;
    CUdeviceptr deviceFloats1;

    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);
    cuMemAlloc(&deviceFloats1, N * sizeof(float));

    CUstream stream;
    cuStreamCreate(&stream, 0);

    for(int it=0; it < 10; it++) {
        getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(((float *)deviceFloats1));
    }

    cuStreamSynchronize(stream);

    cuMemFreeHost(hostFloats1);
    cuMemFree(deviceFloats1);

    cuStreamDestroy(stream);
    return 0;
}

void testfloatstar() {
    int deviceCount;
    cuDeviceGetCount(&deviceCount);
    cout << "devices: " << deviceCount << endl;
    context = new CUcontext[deviceCount];
    // int NUM_THREADS = 2;

    for(int i = 0; i < deviceCount; i++) {
        cuCtxCreate_v2(&context[i], 0, i);
        cout << "created context " << (void *)context[i] << endl;
    }
    cout << "created contexts" << endl;

    pthread_t threads[ deviceCount ];
    for(long long i = 0; i < deviceCount; i++) {
        pthread_create(&threads[i], NULL, thread_func, (void *)i);
    }
    cout << "creaed threads" << endl;
    for(int i = 0; i < deviceCount; i++) {
        pthread_join(threads[i], NULL);
        cout << "joined thread " << i << endl;
    }

    print("num kernels cached " + toString(cocl::getNumCachedKernels()));
    print("num kernels calls " + toString(cocl::getNumKernelCalls()));

    for(int i = 0; i < deviceCount; i++) {
        cuCtxSetCurrent(context[i]);
        assert(cocl::getNumCachedKernels() == 1);
        assert(cocl::getNumKernelCalls() == 10);
    }

    delete[] context;
}

int main(int argc, char *argv[]) {
    testfloatstar();
    return 0;
}
