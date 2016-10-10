


kernel void _Z8setValuePfif(global float* data, int idx, float value) {
    label0:;
    int v1 = get_global_id(0);
    bool v2 = v1 == 0;
    if(v2) {
        goto v4;
    } else {
        goto v5;
    }
    v4:;
    long v6 = idx;
    global float* v7 = (&data[v6]);
    v7[0] = value;
        goto v5;
    v5:;
}
