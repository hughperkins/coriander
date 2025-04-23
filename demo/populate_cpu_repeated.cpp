#include <iostream>
#include <chrono>

void populateHostside(int * array, int N) {
    for (int i = 0; i < N; ++i) {
        array[i] = i * 7;
    }
}

int main() {
    const int N = 1e9;
    int *h_array = new int[N];

    auto start = std::chrono::high_resolution_clock::now();
    while(true) {
        populateHostside(h_array, N);
        std::cout << "." << std::flush;
    }
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
