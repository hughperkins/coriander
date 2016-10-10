struct class_mynamespace__subnamespace__Foo_nopointers {
    int f0;
};

struct class_mynamespace__Bar_nopointers {
    struct class_mynamespace__subnamespace__Foo_nopointers f0;
    struct class_mynamespace__subnamespace__Foo_nopointers f1;
    int f2;
};

struct class_mynamespace__subnamespace__Foo {
    int f0;
};

struct class_mynamespace__Bar {
    struct class_mynamespace__subnamespace__Foo f0;
    struct class_mynamespace__subnamespace__Foo f1;
    int f2;
};

struct class_mynamespace__Templated_nopointers {
    struct class_mynamespace__subnamespace__Foo_nopointers f0;
    float f1;
};

struct class_mynamespace__Templated {
    struct class_mynamespace__subnamespace__Foo f0;
    float f1;
};

struct class_mynamespace__Templated_0_nopointers {
    struct class_mynamespace__subnamespace__Foo_nopointers f0;
    int f1;
};

struct class_mynamespace__Templated_0 {
    struct class_mynamespace__subnamespace__Foo f0;
    int f1;
};

struct class_mynamespace__Templated_1_nopointers {
    struct class_mynamespace__subnamespace__Foo_nopointers f0;
    float f1;
};

struct class_mynamespace__Templated_1 {
    struct class_mynamespace__subnamespace__Foo f0;
    float f1;
};




kernel void _Z11doSomethingIfEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi(global struct class_mynamespace__Bar_nopointers* bar_nopointers, global struct class_mynamespace__Templated_nopointers* t_nopointers, global float* data, global int* int_data) {
struct class_mynamespace__Bar bar[1];
bar[0].f0.f0 = bar_nopointers[0].f0.f0;
bar[0].f1.f0 = bar_nopointers[0].f1.f0;
bar[0].f2 = bar_nopointers[0].f2;
struct class_mynamespace__Templated t[1];
t[0].f0.f0 = t_nopointers[0].f0.f0;
t[0].f1 = t_nopointers[0].f1;

    label0:;
    int* v1 = (&bar[0].f0.f0);
    v1[0] = 123;
    float* v3 = (&t[0].f1);
    int* v4 = ((int*)v3);
    int v5 = v4[0];
    global int* v6 = ((global int*)data);
    v6[0] = v5;
    int* v8 = (&bar[0].f2);
    int v9 = v8[0];
    int_data[0] = v9;
}

kernel void _Z11doSomethingIiEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi(global struct class_mynamespace__Bar_nopointers* bar_nopointers, global struct class_mynamespace__Templated_0_nopointers* t_nopointers, global int* data, global int* int_data) {
struct class_mynamespace__Bar bar[1];
bar[0].f0.f0 = bar_nopointers[0].f0.f0;
bar[0].f1.f0 = bar_nopointers[0].f1.f0;
bar[0].f2 = bar_nopointers[0].f2;
struct class_mynamespace__Templated_0 t[1];
t[0].f0.f0 = t_nopointers[0].f0.f0;
t[0].f1 = t_nopointers[0].f1;

    label0:;
    int* v1 = (&bar[0].f0.f0);
    v1[0] = 123;
    int* v3 = (&t[0].f1);
    int v4 = v3[0];
    data[0] = v4;
    int* v6 = (&bar[0].f2);
    int v7 = v6[0];
    int_data[0] = v7;
}

kernel void _Z11doSomethingIdEvN11mynamespace3BarENS0_9TemplatedIT_EEPS3_Pi(global struct class_mynamespace__Bar_nopointers* bar_nopointers, global struct class_mynamespace__Templated_1_nopointers* t_nopointers, global float* data, global int* int_data) {
struct class_mynamespace__Bar bar[1];
bar[0].f0.f0 = bar_nopointers[0].f0.f0;
bar[0].f1.f0 = bar_nopointers[0].f1.f0;
bar[0].f2 = bar_nopointers[0].f2;
struct class_mynamespace__Templated_1 t[1];
t[0].f0.f0 = t_nopointers[0].f0.f0;
t[0].f1 = t_nopointers[0].f1;

    label0:;
    int* v1 = (&bar[0].f0.f0);
    v1[0] = 123;
    float* v3 = (&t[0].f1);
    long* v4 = ((long*)v3);
    long v5 = v4[0];
    global long* v6 = ((global long*)data);
    v6[0] = v5;
    int* v8 = (&bar[0].f2);
    int v9 = v8[0];
    int_data[0] = v9;
}
