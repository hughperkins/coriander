kernel void foo(global float *data, int N) {
    int tid = get_global_id(0);
    if(tid < N) {
        data[tid] += 3.0f;
    }
}