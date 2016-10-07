


kernel void _Z9testLocalPf(global float* data) {
    local float _ZZ9testLocalPfE8myshared[32];
    label0:;
    int v1 = get_global_id(0);
    long v2 = v1;
    global float* v3 = (&data[v2]);
    global int* v4 = ((global int*)v3);
    int v5 = v4[0];
    local float* v6 = (&(&_ZZ9testLocalPfE8myshared)[0][v2]);
    local int* v7 = ((local int*)v6);
    local int* v8 = (v7);
    v8[0] = v5;
    int v10 = v1 + 1;
    long v11 = v10;
    local float* v12 = (&(&_ZZ9testLocalPfE8myshared)[0][v11]);
    local int* v13 = ((local int*)v12);
    local int* v14 = (v13);
    int v15 = v14[0];
    global int* v16 = ((global int*)data);
    v16[0] = v15;
}

kernel void _Z10testLocal2Pf(global float* data) {
    local float _ZZ10testLocal2PfE8myshared[64];
    label0:;
    int v1 = get_global_id(0);
    long v2 = v1;
    global float* v3 = (&data[v2]);
    global int* v4 = ((global int*)v3);
    int v5 = v4[0];
    local float* v6 = (&(&_ZZ10testLocal2PfE8myshared)[0][v2]);
    local int* v7 = ((local int*)v6);
    local int* v8 = (v7);
    v8[0] = v5;
    int v10 = v1 + 1;
    long v11 = v10;
    local float* v12 = (&(&_ZZ10testLocal2PfE8myshared)[0][v11]);
    local int* v13 = ((local int*)v12);
    local int* v14 = (v13);
    int v15 = v14[0];
    global int* v16 = ((global int*)data);
    v16[0] = v15;
    int v18 = v4[0];
    v14[0] = v18;
    int v20 = v8[0];
    global float* v21 = (&data[1]);
    global int* v22 = ((global int*)v21);
    v22[0] = v20;
}
