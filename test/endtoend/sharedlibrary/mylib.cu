#include "mylib.h"

__global__ void mykernel(float *data) {
    data[0] += 3.0f;
}
