#include <iostream>
using namespace main;

__global__ void mykernel(float *A) {
    int tid = threadIdx.x;
    A[tid] += 3.0f;
}

int main(int argc, char *argv) {
    cout << "hello" << endl;
    return 0;
}
