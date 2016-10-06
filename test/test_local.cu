__global__ void testLocal(float *data) {
    __shared__ float myshared[32];
    int tid = threadIdx.x;
    myshared[tid] = data[tid];
    data[0] = myshared[tid + 1];
}

__global__ void testLocal2(float *data) {
    __shared__ float myshared[64];
    int tid = threadIdx.x;
    myshared[tid] = data[tid];
    data[0] = myshared[tid + 1];
    myshared[tid + 1] = data[tid];
    data[1] = myshared[tid];
}
