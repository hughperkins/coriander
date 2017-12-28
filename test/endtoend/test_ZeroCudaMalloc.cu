
#include <iostream>
#include <memory>
#include <cassert>

using namespace std;

#include <cuda.h>

int main(int argc, char *argv[]) {
    int num=25;
    CUdeviceptr loc[num];
    for(int i=0; i<num; i++){
	std::cout << "i: " << i << std::endl;
        cuMemAlloc(&loc[i], i);
    }
    for(int i=0; i<num; i++){
        cuMemFree(loc[i]);
    }
    return 0;
}
