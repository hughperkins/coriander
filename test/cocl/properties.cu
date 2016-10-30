// test calling kernels from different threads, in parallel (can be different kernels, or same.  either way, should work, not crash :-) )

#include <iostream>
#include <memory>
#include <cassert>
#include <sstream>

using namespace std;

#include <cuda.h>

const int N = 1024;

int main(int argc, char *argv[]) {
    cudaDeviceProp prop;
    cudaGetDeviceProperties(&prop, 0);
    cout << "maxworkgroupsize " << prop.maxThreadsPerBlock << endl;
    size_t free;
    size_t total;
    cuMemGetInfo(&free, &total);
    cout << "free " << free << " total " << total << endl;
    return 0;
}
