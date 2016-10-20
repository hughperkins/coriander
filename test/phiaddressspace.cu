struct MyStruct {
    float floatvalue;
    int intvalue;
};

// __device__ __host__ float sumStruct(struct MyStruct **p_structs, int N) {
//     float sum = 0;
//     for(int i = 0; i < N; i++) {
//         struct MyStruct *mystruct = p_structs[i];
//         sum += mystruct->floatvalue + float(mystruct->intvalue) * 3.5f;
//     }
//     return sum;
// }

// __global__ void mykernel(float *data, MyStruct *structs, int N) {
//     data[0] = sumStruct(&structs, N);
//     data[3] = sumStruct(&structs, 123);
//     data[4] = sumStruct(&structs, 12300);
// }
