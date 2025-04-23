#include <iostream>
#include <chrono>
#include <cuda_runtime.h>

__global__ void pseudorandomTransformKernel(int* data, int N, int steps) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (idx < N) {
        unsigned int state = idx;
        
        // Linear Congruential Generator (LCG)
        for (int i = 0; i < steps; i++) {
            state = (1664525 * state + 1013904223) % 4294967295;
        }
        
        data[idx] = (int)state % 10000;
    }
}

int main() {
    const int N = 1e8;
    const int steps = 5000;
    int *h_array = new int[N];
    int *d_array;

    cudaMalloc((void **)&d_array, N * sizeof(int));

    int blockSize = 256;
    int gridSize = (N + blockSize - 1) / blockSize;

    auto start = std::chrono::high_resolution_clock::now();
    pseudorandomTransformKernel<<<gridSize, blockSize>>>(d_array, N, steps);
    cudaMemcpy(h_array, d_array, N * sizeof(int), cudaMemcpyDeviceToHost);

    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::cout << "Elapsed time: " << duration.count() / 1000 << " milliseconds\n";

    std::cout << "First 10 elements of the array:\n";
    for (int i = 0; i < 10; ++i) {
        std::cout << "array[" << i << "] = " << h_array[i] << "\n";
    }

    delete[] h_array;
    cudaFree(d_array);

    return 0;
}
