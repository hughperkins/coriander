#include <iostream>
#include <chrono>

void pseudorandomTransformKernel(int* data, int N, int steps) {
    for(int idx = 0; idx < N; idx++) {
        unsigned int state = idx;
        
        // Linear Congruential Generator (LCG)
        for (int i = 0; i < steps; i++) {
            state = (1664525 * state + 1013904223) % 4294967295;
        }
        
        data[idx] = (int)state % 10000;
        if(idx % (int)1e5 == 0) {
            std::cout << "Processing index: " << idx << "\n";
        }
    }
}

int main() {
    const int N = 1e8;
    const int steps = 5000;
    int *h_array = new int[N];

    auto start = std::chrono::high_resolution_clock::now();
    pseudorandomTransformKernel(h_array, N, steps);

    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    std::cout << "Elapsed time: " << duration.count() / 1000 << " milliseconds\n";

    std::cout << "First 10 elements of the array:\n";
    for (int i = 0; i < 10; ++i) {
        std::cout << "array[" << i << "] = " << h_array[i] << "\n";
    }

    delete[] h_array;

    return 0;
}
