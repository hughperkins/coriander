


kernel void _Z9testLocalPf(global float* data) {
    local float _ZZ9testLocalPfE8myshared[32];
    label0:;
    int v0 = get_global_id(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    global int*v3 = (global int*)v2;
    int v4 = v3[0];
    local float* v5 = &(&_ZZ9testLocalPfE8myshared)[0][v1];
    local int*v6 = (local int*)v5;
    local int* v7 = (local int*)v6;
    v7[0] = v4;
    int v9 = v0 + 1;
    long v10 = v9;
    local float* v11 = &(&_ZZ9testLocalPfE8myshared)[0][v10];
    local int*v12 = (local int*)v11;
    local int* v13 = (local int*)v12;
    int v14 = v13[0];
    global int*v15 = (global int*)data;
    v15[0] = v14;
}

kernel void _Z10testLocal2Pf(global float* data) {
    local float _ZZ10testLocal2PfE8myshared[64];
    label0:;
    int v0 = get_global_id(0);
    long v1 = v0;
    global float* v2 = &data[v1];
    global int*v3 = (global int*)v2;
    int v4 = v3[0];
    local float* v5 = &(&_ZZ10testLocal2PfE8myshared)[0][v1];
    local int*v6 = (local int*)v5;
    local int* v7 = (local int*)v6;
    v7[0] = v4;
    int v9 = v0 + 1;
    long v10 = v9;
    local float* v11 = &(&_ZZ10testLocal2PfE8myshared)[0][v10];
    local int*v12 = (local int*)v11;
    local int* v13 = (local int*)v12;
    int v14 = v13[0];
    global int*v15 = (global int*)data;
    v15[0] = v14;
    int v17 = v3[0];
    v13[0] = v17;
    int v19 = v7[0];
    global float* v20 = &data[1];
    global int*v21 = (global int*)v20;
    v21[0] = v19;
}
