__device__ float bar(float a, float b) {
    return a + b;
}

__device__ void incrval(float *a) {
    *a += 3;
}

__global__ void somekernel1(float *a) {
    a[0] = a[1];
}

//__global__ void foo(float *data, int N) {
__global__ void foo(float *data) {
//    int tid = threadIdx.x;
 //   if(tid < N) {
      //  data[tid] += 3.0f;
        data[0] = 123.0f;
  //  }
}
