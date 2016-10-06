struct Foo {
    float f0;
};

struct class_SomeClass {
    struct Foo f0;
};


struct class_SomeClass myg1;

struct class_SomeClass myg2;

struct Foo foo = {11.0f};


float _Z11getFooValue3Foo(struct Foo* foo);
float _Z17getSomeClassValue9SomeClassS_(struct class_SomeClass* someclass, struct class_SomeClass* c2);
void _GLOBAL__sub_I_struct_initializer.cu();

float _Z11getFooValue3Foo(struct Foo* foo) {
    label0:;
    float* v0 = &foo[0].f0;
    float v1 = v0[0];
    return v1;
}

float _Z17getSomeClassValue9SomeClassS_(struct class_SomeClass* someclass, struct class_SomeClass* c2) {
    label0:;
    float* v0 = &someclass[0].f0.f0;
    float v1 = v0[0];
    float* v2 = &c2[0].f0.f0;
    float v3 = v2[0];
    float v4 = v1 + v3;
    return v4;
}

kernel void _Z10somekernelPf(global float* data) {
int i_03;
    label0:;
    data[0] = 23.4f;
    global float* v1 = &data[1];
    v1[0] = 23.4f;
    global float* v3 = &data[2];
    global int*v4 = (global int*)v3;
    v4[0] = 1067282596;
    global float* v6 = &data[3];
    v6[0] = 4.68f;
    global float* v8 = &data[4];
    v8[0] = 3.45f;
    global float* v10 = &data[5];
    v10[0] = 347.0f;
    global float* v12 = &data[7];
    float v13 = v12[0];
    float v14 = v13 * 345.0f;
    float v15 = v14 + 2.0f;
    global float* v16 = &data[6];
    v16[0] = v15;
        i_03 = 0;
    goto label2;
    label1:;
    global float* v19 = &data[9];
    float v20 = v19[0];
    float v21 = float* v25 = &struct class_SomeClass* v27 = (struct class_SomeClass*)myg1;
[0].f0.f0;
[0];
    float v28 = v21 * 100.0f;
    float v29 = v20 * v28;
    float v30 = v29 + 2.0f;
    global float* v31 = &data[8];
    v31[0] = v30;
    global float* v33 = &data[11];
    float v34 = v33[0];
    float v35 = float* v39 = &struct class_SomeClass* v41 = (struct class_SomeClass*)myg2;
[0].f0.f0;
[0];
    float v42 = v35 * 100.0f;
    float v43 = v34 * v42;
    float v44 = v43 + 2.0f;
    global float* v45 = &data[10];
    v45[0] = v44;
    label2:;
    int v48 = i_03 + 10100;
    long v49 = v48;
    global float* v50 = &data[v49];
    float v51 = v50[0];
    float v52 = v51 * 345.0f;
    float v53 = v52 + 2.0f;
    int v54 = i_03 + 100;
    long v55 = v54;
    global float* v56 = &data[v55];
    v56[0] = v53;
    int v58 = i_03 + 10101;
    long v59 = v58;
    global float* v60 = &data[v59];
    float v61 = v60[0];
    float v62 = v61 * 345.0f;
    float v63 = v62 + 2.0f;
    int v64 = i_03 + 101;
    long v65 = v64;
    global float* v66 = &data[v65];
    v66[0] = v63;
    int v68 = i_03 + 2;
    bool exitcond_1 = v68 == 10000;
    if(exitcond_1) {
        goto label1;
    } else {
        i_03 = v68;
        goto label2;
    }
}

kernel void _Z11somekernel2Pf(global float* data) {
    label0:;
    float v0 = float* v4 = (float*)float* v6 = &myg1[0].f0.f0;
;
[0];
    float v7 = float* v11 = (float*)float* v13 = &myg2[0].f0.f0;
;
[0];
    float v14 = v0 + v7;
    data[0] = v14;
}

kernel void _Z11getFooValuePf(global float* data) {
    label0:;
    int v0 = int* v4 = (int*)int*v6 = (int*)foo;
;
[0];
    global int*v7 = (global int*)data;
    v7[0] = v0;
}

void _GLOBAL__sub_I_struct_initializer.cu() {
    label0:;
    float* v4 = &struct class_SomeClass* v6 = (struct class_SomeClass*)myg1;
[0].f0.f0;
[0] = 1.23f;
    float* v11 = &struct class_SomeClass* v13 = (struct class_SomeClass*)myg2;
[0].f0.f0;
[0] = 7.89f;
}
