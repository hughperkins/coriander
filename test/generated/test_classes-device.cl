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

struct class_mynamespace__Templated_0 {
    struct class_mynamespace__subnamespace__Foo f0;
    int f1;
};

struct class_mynamespace__Templated_1 {
    struct class_mynamespace__subnamespace__Foo f0;
    float f1;
};




kernel void _Z11doSomethingIfEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi(global struct class_mynamespace__Bar* bar, global struct class_mynamespace__Templated* t, global float* data, global int* int_data) {
    label0:;
    global int* v1 = (&bar[0].f0.f0);
    v1[0] = 123;
    global float* v3 = (&t[0].f1);
    global int* v4 = ((global int*)v3);
    int v5 = v4[0];
    global int* v6 = ((global int*)data);
    v6[0] = v5;
    global int* v8 = (&bar[0].f2);
    int v9 = v8[0];
    int_data[0] = v9;
}

kernel void _Z11doSomethingIiEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi(global struct class_mynamespace__Bar* bar, global struct class_mynamespace__Templated_0* t, global int* data, global int* int_data) {
    label0:;
    global int* v1 = (&bar[0].f0.f0);
    v1[0] = 123;
    global int* v3 = (&t[0].f1);
    int v4 = v3[0];
    data[0] = v4;
    global int* v6 = (&bar[0].f2);
    int v7 = v6[0];
    int_data[0] = v7;
}

kernel void _Z11doSomethingIdEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi(global struct class_mynamespace__Bar* bar, global struct class_mynamespace__Templated_1* t, global float* data, global int* int_data) {
    label0:;
    global int* v1 = (&bar[0].f0.f0);
    v1[0] = 123;
    global float* v3 = (&t[0].f1);
    global long* v4 = ((global long*)v3);
    long v5 = v4[0];
    global long* v6 = ((global long*)data);
    v6[0] = v5;
    global int* v8 = (&bar[0].f2);
    int v9 = v8[0];
    int_data[0] = v9;
}
