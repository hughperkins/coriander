// double indirection, ie float **, in kernel parameter

// this test cuts all gpu buffers from one single gpu buffer

#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

struct BoundedArray {
    float *bounded_array[8];
};

__global__ void wipe(int *buffer, int length) {
    length >>= 5;
    int tid = threadIdx.x;
    for(int i = 0; i < length; i++) {
        buffer[(i << 5) + tid] = -1;
    }
}

__global__ void run_bounded_array(struct BoundedArray boundedArray, int numBuffers, int N) {
    for(int i = 0; i < numBuffers; i++) {
        for(int j = 0; j < N; j++) {
            boundedArray.bounded_array[i][j] = 123.0f + i + 1 + j;
        }
    }
}

void test1() {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    const int numBuffers = 3;

    char *gpuArena;
    int mallocSize = numBuffers * N * sizeof(float) + 256 + 1024;
    std::cout << "mallocSize=" << mallocSize << std::endl;
    cudaMalloc((void **)&gpuArena, mallocSize);
    wipe<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>((int *)gpuArena, mallocSize >> 2);

    struct BoundedArray boundedArray;
    float *hostFloats[numBuffers];

    for(int i = 0; i < numBuffers; i++) {
        boundedArray.bounded_array[i] = (float *)(gpuArena + 256 + i * N * sizeof(float));
        std::cout << "bounded_array[" << i << "]=" << (long)boundedArray.bounded_array[i] << std::endl;
        hostFloats[i] = new float[N];
    }

    run_bounded_array<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(boundedArray, numBuffers, N);

    for(int i = 0; i < numBuffers; i++) {
        cudaMemcpy(hostFloats[i], boundedArray.bounded_array[i], N * sizeof(float), cudaMemcpyDeviceToHost);
    }
    cuStreamSynchronize(stream);

    std::cout << std::endl;
    for(int i = 0; i < numBuffers; i++) {
        for(int j=0; j < 4; j++) {
            cout << hostFloats[i][j] << " ";
        }
        cout << endl;
    }

    for(int i = 0; i < numBuffers; i++) {
        for(int j=0; j < N; j++) {
            float expected = 123.0f + 1 + i + j;
            float actual = hostFloats[i][j];
            if(actual != expected) {
                std::cout << "mismatch for i=" << i << " j=" << j << " expected=" << expected << " actual=" << actual << std::endl;
                assert(false);
            }
        }
    }

    for(int i=0; i < numBuffers; i++) {
        delete[] hostFloats[i];
    }
    cudaFree(gpuArena);

    cuStreamDestroy(stream);
    std::cout << "test1 finished ok" << std::endl;
}

struct BoundedArrayUnion {
    float *bounded_array[8];
    float **unbounded_array;
};

__global__ void run_bounded_array_two(struct BoundedArrayUnion mystruct, int useUnbounded, int numBuffers, int N) {
    float **starstar = useUnbounded ? mystruct.unbounded_array : mystruct.bounded_array;
    for(int i = 0; i < numBuffers; i++) {
        for(int j = 0; j < N; j++) {
            starstar[i][j] = 123.0f + i + 1 + j;
        }
    }
}

void test2_bounded() {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    const int numBuffers = 3;

    char *gpuArena;
    int mallocSize = numBuffers * N * sizeof(float) + 256 + 1024;
    std::cout << "mallocSize=" << mallocSize << std::endl;
    cudaMalloc((void **)&gpuArena, mallocSize);
    wipe<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>((int *)gpuArena, mallocSize >> 2);

    struct BoundedArrayUnion boundedArray;
    float *hostFloats[numBuffers];

    for(int i = 0; i < numBuffers; i++) {
        boundedArray.bounded_array[i] = (float *)(gpuArena + 256 + i * N * sizeof(float));
        std::cout << "bounded_array[" << i << "]=" << (long)boundedArray.bounded_array[i] << std::endl;
        hostFloats[i] = new float[N];
    }

    run_bounded_array_two<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(boundedArray, 0, numBuffers, N);

    for(int i = 0; i < numBuffers; i++) {
        cudaMemcpy(hostFloats[i], boundedArray.bounded_array[i], N * sizeof(float), cudaMemcpyDeviceToHost);
    }
    cuStreamSynchronize(stream);

    std::cout << std::endl;
    for(int i = 0; i < numBuffers; i++) {
        for(int j=0; j < 4; j++) {
            cout << hostFloats[i][j] << " ";
        }
        cout << endl;
    }

    for(int i = 0; i < numBuffers; i++) {
        for(int j=0; j < N; j++) {
            float expected = 123.0f + 1 + i + j;
            float actual = hostFloats[i][j];
            if(actual != expected) {
                std::cout << "mismatch for i=" << i << " j=" << j << " expected=" << expected << " actual=" << actual << std::endl;
                assert(false);
            }
        }
    }

    for(int i=0; i < numBuffers; i++) {
        delete[] hostFloats[i];
    }
    cudaFree(gpuArena);

    cuStreamDestroy(stream);
    std::cout << "finished test2_bounded" << std::endl;
}

void test3_unbounded() {
    int N = 1024;

    CUstream stream;
    cuStreamCreate(&stream, 0);

    const int numBuffers = 3;

    char *gpuArena;
    int mallocSize = numBuffers * N * sizeof(float) + 256 + 1024;
    std::cout << "mallocSize=" << mallocSize << std::endl;
    cudaMalloc((void **)&gpuArena, mallocSize);
    wipe<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>((int *)gpuArena, mallocSize >> 2);

    struct BoundedArrayUnion boundedArray;
    float *hostFloats[numBuffers];

    for(int i = 0; i < numBuffers; i++) {
        boundedArray.bounded_array[i] = (float *)(gpuArena + 256 + i * N * sizeof(float));
        std::cout << "bounded_array[" << i << "]=" << (long)boundedArray.bounded_array[i] << std::endl;
        hostFloats[i] = new float[N];
    }

    run_bounded_array_two<<<dim3(1,1,1), dim3(32,1,1), 0, stream>>>(boundedArray, 1, numBuffers, N);

    for(int i = 0; i < numBuffers; i++) {
        cudaMemcpy(hostFloats[i], boundedArray.bounded_array[i], N * sizeof(float), cudaMemcpyDeviceToHost);
    }
    cuStreamSynchronize(stream);

    std::cout << std::endl;
    for(int i = 0; i < numBuffers; i++) {
        for(int j=0; j < 4; j++) {
            cout << hostFloats[i][j] << " ";
        }
        cout << endl;
    }

    for(int i = 0; i < numBuffers; i++) {
        for(int j=0; j < N; j++) {
            float expected = 123.0f + 1 + i + j;
            float actual = hostFloats[i][j];
            if(actual != expected) {
                std::cout << "mismatch for i=" << i << " j=" << j << " expected=" << expected << " actual=" << actual << std::endl;
                assert(false);
            }
        }
    }

    for(int i=0; i < numBuffers; i++) {
        delete[] hostFloats[i];
    }
    cudaFree(gpuArena);

    cuStreamDestroy(stream);
    std::cout << "finished test3_unbounded" << std::endl;
}

int main(int argc, char *argv[]) {
    test1();
    test2_bounded();
    // test3_unbounded();
    return 0;
}
