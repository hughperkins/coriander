#include "multi1.h"

__global__ void k1_incr(float *data, float val) {
    data[threadIdx.x] += val;
}
