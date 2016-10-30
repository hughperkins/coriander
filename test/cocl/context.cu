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

CUcontext context;
float *hostFloats1;
CUdeviceptr deviceFloats1;

pthread_mutex_t context_mutex = PTHREAD_MUTEX_INITIALIZER;

void *thread_func(void *data) {
    int i = (size_t)data;
    print("thread " + toString(i));

    cuCtxSetCurrent(context);

    CUstream stream;
    cuStreamCreate(&stream, 0);

    for(int it=0; it < 10; it++) {
        getValue<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(((float *)deviceFloats1));
    }

    cuStreamSynchronize(stream);
    cuStreamDestroy(stream);
    return 0;
}

void testfloatstar() {
    const int NUM_THREADS = 4;

    cuCtxCreate_v2(&context, 0, 0);

    cuMemHostAlloc((void **)&hostFloats1, N * sizeof(float), CU_MEMHOSTALLOC_PORTABLE);
    cuMemAlloc(&deviceFloats1, N * sizeof(float));

    pthread_t threads[ NUM_THREADS ];
    for(long long i = 0; i < NUM_THREADS; i++) {
        pthread_create(&threads[i], NULL, thread_func, (void *)i);
    }
    cout << "creaed threads" << endl;
    for(int i = 0; i < NUM_THREADS; i++) {
        pthread_join(threads[i], NULL);
        cout << "joined thread " << i << endl;
    }

    cuMemFreeHost(hostFloats1);
    cuMemFree(deviceFloats1);

    print("num kernels cached " + toString(cocl::getNumCachedKernels()));
    print("num kernels calls " + toString(cocl::getNumKernelCalls()));

    assert(cocl::getNumCachedKernels() == 1);
    assert(cocl::getNumKernelCalls() == 40);
}

int main(int argc, char *argv[]) {
    testfloatstar();
    return 0;
}
