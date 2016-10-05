struct class_mynamespace__subnamespace__Foo {
    int f0;
};

struct class_mynamespace__Bar {
    struct class_mynamespace__subnamespace__Foo f0;
    struct class_mynamespace__subnamespace__Foo f1;
    int f2;
};

struct class_mynamespace__Templated {
    struct class_mynamespace__subnamespace__Foo f0;
    float f1;
};


kernel void _Z11doSomethingIfEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi(global struct class_mynamespace__Bar* bar, global struct class_mynamespace__Templated* t, global float* data, global int* int_data) {
    label0:;
    global int* v0 = &bar[0].f0.f0;
    v0[0] = 123;
    global float* v2 = &t[0].f1;
    global int*v3 = (global int*)v2;
    int v4 = v3[0];
    global int*v5 = (global int*)data;
    v5[0] = v4;
    global int* v7 = &bar[0].f2;
    int v8 = v7[0];
    int_data[0] = v8;
}
