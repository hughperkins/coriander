#include "multi1.h"

__global__ void k2_mul(float *data, float val) {
    data[threadIdx.x] *= val;
}
