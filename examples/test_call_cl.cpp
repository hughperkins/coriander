// This will try launching an opencl kernel, via the host-side function, calling into the device-side kernel
// this needs opencl installed, including working opencl gpu and drivers

#include <iostream>
#include <memory>

#include "EasyCL.h"

#include "CL/cl.h"

using namespace std;

void launchSetValue(float *data, int idx, float value);

size_t grid[3];
size_t block[3];
unique_ptr<CLKernel> kernel;
unique_ptr<EasyCL> cl;

void pretendLaunch(
        const char *kernelName,
        int grid_x, int grid_y, int grid_z,
        int block_x, int block_y, int block_z) {
    // just a mock for now... can we call this from our modified ir?
    cout << "pretendLaunch(" << kernelName << ")" << endl;
    cout << "grid(" << grid_x << ", " << grid_y << ", " << grid_z << ")" << endl;
    cout << "block(" << block_x << ", " << block_y << ", " << block_z << ")" << endl;
    grid[0] = grid_x;
    grid[1] = grid_y;
    grid[2] = grid_z;
    block[0] = block_x;
    block[1] = block_y;
    block[2] = block_z;
    // lets just read the kernel from file for now, with hardcoded filename
    // kernel.reset(buildKernelFromString("", kernelName, "", "internal"));
    kernel.reset(cl->buildKernel("examples/testcudakernel1.cl", kernelName, ""));
}

void setKernelArgFloatStar(float *clmem_as_floatstar) {
    cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    cout << "setKernelArgFloatStar" << endl;
    kernel->inout(p_mem);
}

void setKernelArgInt(int value) {
    // cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    cout << "setkernelargint " << value << endl;
    kernel->in(value);
}

void setKernelArgFloat(float value) {
    // cl_mem *p_mem = (cl_mem *)clmem_as_floatstar;
    cout << "setkernelargfloat " << value << endl;
    kernel->in(value);
}

void kernelGo() {
    size_t global[3];
    for(int i = 0; i < 3; i++) {
        global[i] = grid[i] * block[i];
    }
    cout << "launching kernel?" << endl;
    kernel->run(3, global, block);
    cout << "if we got here, kernel launch didnt cause crash" << endl;
}

int main(int argc, char *argv[]) {
    cl.reset(EasyCL::createForFirstGpuOtherwiseCpu());
    cl_int err;
    cl_context *ctx = cl->context;
    cl_command_queue *queue = cl->queue;

    int N = 1024;
    float *float_data = new float[N];
    cl_mem float_data_gpu = clCreateBuffer(*ctx, CL_MEM_READ_ONLY, N * sizeof(float),
                                           NULL, &err);
    err = clEnqueueWriteBuffer(*queue, float_data_gpu, CL_TRUE, 0,
                                      N * sizeof(float), float_data, 0, NULL, NULL);

    launchSetValue((float *)&float_data_gpu, 2, 123.0f);
    err = clEnqueueReadBuffer(*queue, float_data_gpu, CL_TRUE, 0,
                                      N * sizeof(float), float_data, 0, NULL, NULL);
    cl->finish();

    cout << "value of float_data[2] after calling kernel: " << float_data[2] << endl;

    return 0;
}
