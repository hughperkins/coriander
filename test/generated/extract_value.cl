


kernel void _Z11test_floatsPf(global float* data) {
    label0:;
    global float* v1 = (&data[1]);
    float v2 = v1[0];
    data[0] = v2;
}

kernel void _Z19test_float4P6float4Pf(global float4* data, global float* data2) {
    label0:;
    float4 v1 = data[0];
    float v2 = ((float*)&v1)[1];
    data2[0] = v2;
}
