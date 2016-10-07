


kernel void _Z11test_floatsPf(global float* data) {
    label0:;
    global float* v0 = (&data[1]);
    float v1 = v0[0];
    data[0] = v1;
}

kernel void _Z19test_float4P6float4Pf(global float4* data, global float* data2) {
    label0:;
    float4 v0 = data[0];
    float v1 = ((float*)&v0)[1];
    data2[0] = v1;
}
