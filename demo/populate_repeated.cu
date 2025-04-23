#include <iostream>
#include <chrono>
#include <cuda_runtime.h>

__global__ void populateArray(int *array, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        array[idx] = idx * 7;
    }
}

int main() {
    const int N = 1e9;
    int *h_array = new int[N];
    int *d_array;

    cudaMalloc((void **)&d_array, N * sizeof(int));

    int blockSize = 256;
    int gridSize = (N + blockSize - 1) / blockSize;

    auto start = std::chrono::high_resolution_clock::now();
    while(true) {
        populateArray<<<gridSize, blockSize>>>(d_array, N);
        std::cout << "." << std::flush;
    }
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
