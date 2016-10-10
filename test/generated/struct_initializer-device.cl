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

struct Foo_nopointers {
    int f0;
    float f1;
};

struct class_SomeClass_nopointers {
    struct Foo_nopointers f0;
};


constant struct class_SomeClass myg1 = {};

constant struct class_SomeClass myg2 = {};

constant struct Foo foo = {777, 11.0f};

constant struct Bar bar = {12.0f};


float _Z11getFooValue3Foo(global struct Foo_nopointers* foo_nopointers);
float _Z17getSomeClassValue9SomeClassS_(global struct class_SomeClass_nopointers* someclass_nopointers, global struct class_SomeClass_nopointers* c2_nopointers);

float _Z11getFooValue3Foo(global struct Foo_nopointers* foo_nopointers) {
struct Foo foo[1];
foo[0].f0 = foo_nopointers[0].f0;
foo[0].f1 = foo_nopointers[0].f1;

    label0:;
    float* v1 = (&foo[0].f1);
    float v2 = v1[0];
    return v2;
}

float _Z17getSomeClassValue9SomeClassS_(global struct class_SomeClass_nopointers* someclass_nopointers, global struct class_SomeClass_nopointers* c2_nopointers) {
struct class_SomeClass someclass[1];
someclass[0].f0.f0 = someclass_nopointers[0].f0.f0;
someclass[0].f0.f1 = someclass_nopointers[0].f0.f1;
struct class_SomeClass c2[1];
c2[0].f0.f0 = c2_nopointers[0].f0.f0;
c2[0].f0.f1 = c2_nopointers[0].f0.f1;

    label0:;
    float* v1 = (&someclass[0].f0.f1);
    float v2 = v1[0];
    float* v3 = (&c2[0].f0.f1);
    float v4 = v3[0];
    float v5 = v2 + v4;
    return v5;
}

kernel void _Z10somekernelPf(global float* data) {
    int i_08;
    label0:;
    data[0] = 0.0f;
    global float* v2 = (&data[1]);
    v2[0] = 0.0f;
    global float* v4 = (&data[2]);
    global int* v5 = ((global int*)v4);
    v5[0] = 1067282596;
    global float* v7 = (&data[3]);
    v7[0] = 4.68f;
    global float* v9 = (&data[4]);
    v9[0] = 3.45f;
    global float* v11 = (&data[5]);
    v11[0] = 347.0f;
    global float* v13 = (&data[7]);
    float v14 = v13[0];
    float v15 = v14 * 345.0f;
    float v16 = v15 + 2.0f;
    global float* v17 = (&data[6]);
    v17[0] = v16;
        i_08 = 0;
    goto v20;
    label21:;
    global float* v22 = (&data[9]);
    float v23 = v22[0];
    float v24 = (&((&myg1))[0].f0.f1)[0];
    float v25 = v24 * 100.0f;
    float v26 = v23 * v25;
    float v27 = v26 + 2.0f;
    global float* v28 = (&data[8]);
    v28[0] = v27;
    global float* v30 = (&data[11]);
    float v31 = v30[0];
    float v32 = (&((&myg2))[0].f0.f1)[0];
    float v33 = v32 * 100.0f;
    float v34 = v31 * v33;
    float v35 = v34 + 2.0f;
    global float* v36 = (&data[10]);
    v36[0] = v35;
    v20:;
    int v39 = i_08 + 10100;
    long v40 = v39;
    global float* v41 = (&data[v40]);
    float v42 = v41[0];
    float v43 = v42 * 345.0f;
    float v44 = v43 + 2.0f;
    int v45 = i_08 + 100;
    long v46 = v45;
    global float* v47 = (&data[v46]);
    v47[0] = v44;
    int v49 = i_08 + 10101;
    long v50 = v49;
    global float* v51 = (&data[v50]);
    float v52 = v51[0];
    float v53 = v52 * 345.0f;
    float v54 = v53 + 2.0f;
    int v55 = i_08 + 101;
    long v56 = v55;
    global float* v57 = (&data[v56]);
    v57[0] = v54;
    int v59 = i_08 + 2;
    bool exitcond_1 = v59 == 10000;
    if(exitcond_1) {
        goto label21;
    } else {
        i_08 = v59;
        goto v20;
    }
}

kernel void _Z11somekernel2Pf(global float* data) {
    label0:;
    float v1 = (&((&myg1))[0].f0.f1)[0];
    float v2 = (&((&myg2))[0].f0.f1)[0];
    float v3 = v1 + v2;
    data[0] = v3;
}

kernel void _Z11getFooValuePfPi(global float* data, global int* intdata) {
    label0:;
    int v1 = ((constant int*)(&((&foo))[0].f1))[0];
    global int* v2 = ((global int*)data);
    v2[0] = v1;
    int v4 = (&((&foo))[0].f0)[0];
    intdata[0] = v4;
}

kernel void _Z11getBarValuePf(global float* data) {
    label0:;
    int v1 = (((constant int*)(&bar)))[0];
    global int* v2 = ((global int*)data);
    v2[0] = v1;
}
