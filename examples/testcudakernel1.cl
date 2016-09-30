float _Z3barff(float a, float b) {
    label0:;
    float v0 = a + b;
    return v0;
}

kernel void _Z3fooPf(global float* data) {
    label0:;
    data[0] = 123;
}

kernel void _Z7use_tidPf(global float* data) {
    label0:;
    int v0 = get_global_id(0);
    long v1 = v0;
    global float* v2 = data + v1;
    v2[0] = 123;
}

kernel void _Z8use_tid2Pi(global int* data) {
    label0:;
    int v0 = get_global_id(0);
    long v1 = v0;
    global int* v2 = data + v1;
    int v3 = v2[0];
    int v4 = v3 + v0;
    v2[0] = v4;
}

kernel void _Z10copy_floatPf(global float* a) {
    label0:;
    global float* v0 = a + 1;
    global int*v1 = (global int*)v0;
    int v2 = v1[0];
    global int*v3 = (global int*)a;
    v3[0] = v2;
}

kernel void _Z11use_blockidPf(global float* data) {
    label0:;
    int v0 = get_group_id(0);
    long v1 = v0;
    global float* v2 = data + v1;
    v2[0] = 123;
}

kernel void _Z11use_griddimPf(global float* data) {
    label0:;
    int v0 = get_num_groups(0);
    long v1 = v0;
    global float* v2 = data + v1;
    v2[0] = 123;
}

kernel void _Z12use_blockdimPf(global float* data) {
    label0:;
    int v0 = get_local_size(0);
    long v1 = v0;
    global float* v2 = data + v1;
    v2[0] = 123;
}

kernel void _Z13use_template1PfPi(global float* data, global int* intdata) {
    label0:;
    int v0 = get_global_id(0);
    bool v1 = v0 == 0;
    if(v1) {
        goto     label1;
} else {
        goto     label2;
}
    label1:;
    global float* v3 = data + 1;
    float v4 = v3[0];
    global float* v5 = data + 2;
    float v6 = v5[0];
    float v7 = v4 + v6;
    data[0] = v7;
    global int* v9 = intdata + 1;
    int v10 = v9[0];
    global int* v11 = intdata + 2;
    int v12 = v11[0];
    int v13 = v12 + v10;
    intdata[0] = v13;
    goto     label2;
    label2:;
}
