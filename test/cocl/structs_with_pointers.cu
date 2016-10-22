struct MyStruct {
    float *floats;
    int intvalue;
};

__device__ void foo_dev2(MyStruct *mystruct, float *data);

__device__ void foo_device(MyStruct *mystruct, float *data) {
    data[0] = mystruct[0].floats[0];
}

__global__ void foo(MyStruct *mystruct, float *data) {
    data[0] = mystruct[0].floats[0];
    foo_dev2(mystruct, data);
}

int main(int argc, char *argv[]) {
    return 0;
}
