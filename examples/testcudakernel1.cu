__device__ float bar(float a, float b) {
    return a + b;
}

// __device__ void incrval(float *a) {
//     *a += 3;
// }

__global__ void foo(float *data) {
    data[0] = 123.0f;
}

__global__ void use_tid(float *data) {
    int tid = threadIdx.x;
    data[tid] = 123.0f;
}

__global__ void use_tid2(int *data) {
    int tid = threadIdx.x;
    data[tid] = data[tid] + tid;
}

__global__ void copy_float(float *a) {
    a[0] = a[1];
}

__global__ void use_blockid(float *data) {
    int blkid = blockIdx.x;
    data[blkid] = 123.0f;
}

__global__ void use_griddim(float *data) {
    int blkid = gridDim.x;
    data[blkid] = 123.0f;
}

__global__ void use_blockdim(float *data) {
    int blkid = blockDim.x;
    data[blkid] = 123.0f;
}

// template< typename T >
// __device__ T addNumbers(T one, T two) {
//     return one + two;
// }

// __global__ void use_template1(float *data, int *intdata) {
//     data[0] = addNumbers(data[1], data[2]);
//     intdata[0] = addNumbers(intdata[1], intdata[2]);
// }

// __host__ float someHostFunction(float input) {
//     return input * 100.0f;
// }

// __global__ void someops_float(float *data) {
//     data[0] = data[1] - data[2];
//     data[0] += data[1] / data[2];
//     data[0] += data[1] * data[2];
//     data[0] += log(data[1]);
//     data[0] += exp(data[1]);
//     data[0] += tanh(data[1]);
//     data[0] -= sqrt(data[1]);
// }

// __global__ void someops_int(int *data) {
//     data[0] = data[1] - data[2];
//     data[0] += data[1] / data[2];
//     data[0] += data[1] + data[2];
//     data[0] += data[1] * data[2];
//     data[0] += data[1] << data[2];
//     data[0] += data[1] >> data[2];
// }

// __global__ void testbooleanops(int *data) {
//     bool a = data[0] > 0;
//     bool b = data[1] < 0;
//     data[2] = (int)(a && b);
//     data[3] = (int)(a || b);
//     data[4] = (int)(!a);
// }

// __global__ void testcomparisons_int_signed(int *data) {
//     data[5] = (int)(data[0] >= data[1]);
//     data[6] = (int)(data[0] <= data[1]);
//     data[7] = (int)(data[0] > data[1]);
//     data[8] = (int)(data[0] < data[1]);
//     data[9] = (int)(data[0] == data[1]);
//     data[10] = (int)(data[0] != data[1]);
// }

// __global__ void testcomparisons_float(float *data) {
//     data[5] = (data[0] >= data[1]);
//     data[6] = (data[0] <= data[1]);
//     data[7] = (data[0] > data[1]);
//     data[8] = (data[0] < data[1]);
//     data[9] = (data[0] == data[1]);
//     data[10] = (data[0] != data[1]);
// }

// // __global__ void testcomparisons_int_unsigned(unsigned int *data) {
// //     data[5] = (unsigned int)(data[0] >= data[1]);
// //     data[6] = (unsigned int)(data[0] <= data[1]);
// //     data[7] = (unsigned int)(data[0] > data[1]);
// //     data[8] = (unsigned int)(data[0] < data[1]);
// //     data[9] = (unsigned int)(data[0] == data[1]);
// //     data[10] = (unsigned int)(data[0] != data[1]);
// // }

// __global__ void testsyncthreads(float *data) {
//     int tid = threadIdx.x;
//     data[tid] *= 2;
//     syncthreads();
//     data[tid + 1] += 2;
// }

// __global__ void testDoWhile(int *data, int N) {
//     int p = threadIdx.x;
//     do {
//         p++;
//     } while(data[p] != 0);
// }

// __global__ void testWhile(int *data, int N) {
//     int p = threadIdx.x;
//     while(data[p] != 0) {
//         p++;
//     }
// }

// __global__ void testIf(int *data, int N) {
//     int tid = threadIdx.x;
//     if(tid < N) {
//         data[tid] *= 2;
//     }
// }

// __global__ void testIfElse(int *data, int N) {
//     int tid = threadIdx.x;
//     if(tid < N) {
//         data[tid] *= 2;
//         data[tid + 3] *= 2;
//     } else {
//         data[tid] -= 20;
//         data[tid + 5] -= 20;
//     }
// }

// __global__ void testFor(float *data, int N) {
//     float sum = 0.0f;
//     for(int i = 0; i < N; i++) {
//         sum += data[i];
//     }
//     data[0] = sum;
// }

// __global__ void testTernary(float *data) {
//     data[0] = data[1] > 0 ? data[2] : data[3];
// }

// // __global__ void testFloat4(float4 *data) {
// //     float4 myregister4 = data[1];
// //     float *myregisterfloat = (float *)&myregister4;
// //     myregisterfloat[1] = myregisterfloat[2] * myregisterfloat[3];
// //     data[0] = myregister4;
// // }

// // __global__ void testLocal(float *data) {
// //     __shared__ float myshared[32];
// //     int tid = threadIdx.x;
// //     myshared[tid] = data[tid];
// //     data[0] = myshared[tid + 1];
// // }
