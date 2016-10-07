struct Foo {
    int f0;
    float f1;
};

struct class_SomeClass {
    struct Foo f0;
};

struct Bar {
    float f0;
};


constant struct class_SomeClass myg1 = {};

constant struct class_SomeClass myg2 = {};

constant struct Foo foo = {777, 11.0f};

constant struct Bar bar = {12.0f};


float _Z11getFooValue3Foo(struct Foo* foo);
float _Z17getSomeClassValue9SomeClassS_(struct class_SomeClass* someclass, struct class_SomeClass* c2);

float _Z11getFooValue3Foo(struct Foo* foo) {
    label0:;
    float* v0 = (&foo[0].f1);
    float v1 = v0[0];
    return v1;
}

float _Z17getSomeClassValue9SomeClassS_(struct class_SomeClass* someclass, struct class_SomeClass* c2) {
    label0:;
    float* v0 = (&someclass[0].f0.f1);
    float v1 = v0[0];
    float* v2 = (&c2[0].f0.f1);
    float v3 = v2[0];
    float v4 = v1 + v3;
    return v4;
}

kernel void _Z10somekernelPf(global float* data) {
int i_08;
    label0:;
    data[0] = 0.0f;
    global float* v1 = (&data[1]);
    v1[0] = 0.0f;
    global float* v3 = (&data[2]);
    global int* v4 = ((global int*)v3);
    v4[0] = 1067282596;
    global float* v6 = (&data[3]);
    v6[0] = 4.68f;
    global float* v8 = (&data[4]);
    v8[0] = 3.45f;
    global float* v10 = (&data[5]);
    v10[0] = 347.0f;
    global float* v12 = (&data[7]);
    float v13 = v12[0];
    float v14 = v13 * 345.0f;
    float v15 = v14 + 2.0f;
    global float* v16 = (&data[6]);
    v16[0] = v15;
        i_08 = 0;
    goto label2;
    label1:;
    global float* v19 = (&data[9]);
    float v20 = v19[0];
    float v21 = (&((&myg1))[0].f0.f1)[0];
    float v22 = v21 * 100.0f;
    float v23 = v20 * v22;
    float v24 = v23 + 2.0f;
    global float* v25 = (&data[8]);
    v25[0] = v24;
    global float* v27 = (&data[11]);
    float v28 = v27[0];
    float v29 = (&((&myg2))[0].f0.f1)[0];
    float v30 = v29 * 100.0f;
    float v31 = v28 * v30;
    float v32 = v31 + 2.0f;
    global float* v33 = (&data[10]);
    v33[0] = v32;
    label2:;
    int v36 = i_08 + 10100;
    long v37 = v36;
    global float* v38 = (&data[v37]);
    float v39 = v38[0];
    float v40 = v39 * 345.0f;
    float v41 = v40 + 2.0f;
    int v42 = i_08 + 100;
    long v43 = v42;
    global float* v44 = (&data[v43]);
    v44[0] = v41;
    int v46 = i_08 + 10101;
    long v47 = v46;
    global float* v48 = (&data[v47]);
    float v49 = v48[0];
    float v50 = v49 * 345.0f;
    float v51 = v50 + 2.0f;
    int v52 = i_08 + 101;
    long v53 = v52;
    global float* v54 = (&data[v53]);
    v54[0] = v51;
    int v56 = i_08 + 2;
    bool exitcond_1 = v56 == 10000;
    if(exitcond_1) {
        goto label1;
    } else {
        i_08 = v56;
        goto label2;
    }
}

kernel void _Z11somekernel2Pf(global float* data) {
    label0:;
    float v0 = (&((&myg1))[0].f0.f1)[0];
    float v1 = (&((&myg2))[0].f0.f1)[0];
    float v2 = v0 + v1;
    data[0] = v2;
}

kernel void _Z11getFooValuePfPi(global float* data, global int* intdata) {
    label0:;
    int v0 = ((constant int*)(&((&foo))[0].f1))[0];
    global int* v1 = ((global int*)data);
    v1[0] = v0;
    int v3 = (&((&foo))[0].f0)[0];
    intdata[0] = v3;
}

kernel void _Z11getBarValuePf(global float* data) {
    label0:;
    int v0 = (((constant int*)(&bar)))[0];
    global int* v1 = ((global int*)data);
    v1[0] = v0;
}
