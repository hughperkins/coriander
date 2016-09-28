__device__ float bar(float a, float b) {
    return a + b;
}

__device__ void incrval(float *a) {
    *a += 3;
}

__global__ void somekernel1(float *a) {
    a[0] = a[1];
}

__global__ void foo(float *data) {
        data[0] = 123.0f;
}

__global__ void use_tid(float *data) {
    int tid = threadIdx.x;
    data[tid] = 123.0f;
}

template< typename T >
__device__ T addNumbers(T one, T two) {
    return one + two;
}

__global__ void use_template1(float *data, int *intdata) {
    data[0] = addNumbers(data[1], data[2]);
    intdata[0] = addNumbers(intdata[1], intdata[2]);
}

__global__ void someops_float(float *data) {
    data[0] = data[1] - data[2];
    data[0] += data[1] / data[2];
    data[0] += data[1] * data[2];
    // data[0] += log(data[1]);
    // data[0] += exp(data[1]);
    // data[0] += tanh(data[1]);
    data[0] -= sqrt(data[1]);
}

__global__ void someops_int(int *data) {
    data[0] = data[1] - data[2];
    data[0] += data[1] / data[2];
    data[0] += data[1] + data[2];
    data[0] += data[1] * data[2];
}
