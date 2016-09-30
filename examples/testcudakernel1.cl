float _Z3barff(float a, float b) {
label0:
float v0 = a + b;
return v0;
}

void _Z7incrvalPf(global float* a) {
label0:
float v0 = a[0];
float v1 = v0 + 3;
a[0] = v1;
}

kernel void _Z11somekernel1Pf(global float* a) {
label0:
global float* v0 = a[1];
global int*v1 = (global int*)v0;
int v2 = v1[0];
global int*v3 = (global int*)a;
v3[0] = v2;
}

kernel void _Z3fooPf(global float* data) {
label0:
data[0] = 123;
}

kernel void _Z7use_tidPf(global float* data) {
label0:
int v0 = get_global_id(0);
long v1 = v0;
global float* v2 = data[v1];
v2[0] = 123;
}

kernel void _Z11use_blockidPf(global float* data) {
label0:
int v0 = get_group_id(0);
long v1 = v0;
global float* v2 = data[v1];
v2[0] = 123;
}

kernel void _Z11use_griddimPf(global float* data) {
label0:
int v0 = get_num_groups(0);
long v1 = v0;
global float* v2 = data[v1];
v2[0] = 123;
}

kernel void _Z12use_blockdimPf(global float* data) {
label0:
int v0 = get_local_size(0);
long v1 = v0;
global float* v2 = data[v1];
v2[0] = 123;
}

kernel void _Z13use_template1PfPi(global float* data, global int* intdata) {
label0:
global float* v0 = data[1];
float v1 = v0[0];
global float* v2 = data[2];
float v3 = v2[0];
float v4 = v1 + v3;
data[0] = v4;
global int* v6 = intdata[1];
int v7 = v6[0];
global int* v8 = intdata[2];
int v9 = v8[0];
int v10 = v9 + v7;
intdata[0] = v10;
}

kernel void _Z13someops_floatPf(global float* data) {
label0:
global float* v0 = data[1];
float v1 = v0[0];
global float* v2 = data[2];
float v3 = v2[0];
float v4 = v1 - v3;
float v5 = v1 / v3;
float v6 = v4 + v5;
float v7 = v3 * v1;
float v8 = v6 + v7;
data[0] = v8;
float v10 = log(v1);
float v11 = data[0];
float v12 = v10 + v11;
data[0] = v12;
float v14 = v0[0];
float v15 = exp(v14);
float v16 = data[0];
float v17 = v15 + v16;
data[0] = v17;
float v19 = v0[0];
float v20 = tanh(v19);
float v21 = data[0];
float v22 = v20 + v21;
float v23 = v0[0];
float v24 = v23;
float v25 = sqrt(v24);
float v26 = v22;
float v27 = v26 - v25;
float v28 = (float)v27;
data[0] = v28;
}

kernel void _Z11someops_intPi(global int* data) {
label0:
global int* v0 = data[1];
int v1 = v0[0];
global int* v2 = data[2];
int v3 = v2[0];
int v4 = v1 / v3;
int v5 = v1 + v4;
int v6 = v5 + v1;
int v7 = v3 * v1;
int v8 = v7 + v6;
int v9 = v1 << v3;
int v10 = v9 + v8;
int v11 = v1 >> v3;
int v12 = v11 + v10;
data[0] = v12;
}

kernel void _Z14testbooleanopsPi(global int* data) {
label0:
int v0 = data[0];
bool v1 = v0 > 0;
global int* v2 = data[1];
int v3 = v2[0];
bool v4 = v3 < 0;
bool v5 = v1 && v4;
int v6 = v5;
global int* v7 = data[2];
v7[0] = v6;
bool v9 = v1 || v4;
int v10 = v9;
global int* v11 = data[3];
v11[0] = v10;
int v13 = v1;
int v14 = v13 ^ 1;
global int* v15 = data[4];
v15[0] = v14;
}

kernel void _Z26testcomparisons_int_signedPi(global int* data) {
label0:
int v0 = data[0];
global int* v1 = data[1];
int v2 = v1[0];
bool v3 = v0 >= v2;
int v4 = v3;
global int* v5 = data[5];
v5[0] = v4;
bool v7 = v0 <= v2;
int v8 = v7;
global int* v9 = data[6];
v9[0] = v8;
bool v11 = v0 > v2;
int v12 = v11;
global int* v13 = data[7];
v13[0] = v12;
bool v15 = v0 < v2;
int v16 = v15;
global int* v17 = data[8];
v17[0] = v16;
bool v19 = v0 == v2;
int v20 = v19;
global int* v21 = data[9];
v21[0] = v20;
bool v23 = v0 != v2;
int v24 = v23;
global int* v25 = data[10];
v25[0] = v24;
}

kernel void _Z21testcomparisons_floatPf(global float* data) {
label0:
float v0 = data[0];
global float* v1 = data[1];
float v2 = v1[0];
bool v3 = v0 >= v2;
float v4 = v3;
global float* v5 = data[5];
v5[0] = v4;
bool v7 = v0 <= v2;
float v8 = v7;
global float* v9 = data[6];
v9[0] = v8;
bool v11 = v0 > v2;
float v12 = v11;
global float* v13 = data[7];
v13[0] = v12;
bool v15 = v0 < v2;
float v16 = v15;
global float* v17 = data[8];
v17[0] = v16;
bool v19 = v0 == v2;
float v20 = v19;
global float* v21 = data[9];
v21[0] = v20;
bool v23 = v0 != v2;
float v24 = v23;
global float* v25 = data[10];
v25[0] = v24;
}

kernel void _Z15testsyncthreadsPf(global float* data) {
label0:
int v0 = get_global_id(0);
long v1 = v0;
global float* v2 = data[v1];
float v3 = v2[0];
float v4 = v3 * 2;
v2[0] = v4;
barrier(CLK_GLOBAL_MEM_FENCE);
int v7 = v0 + 1;
long v8 = v7;
global float* v9 = data[v8];
float v10 = v9[0];
float v11 = v10 + 2;
v9[0] = v11;
}

kernel void _Z11testDoWhilePii(global int* data, int N) {
int p.0;
label0:
int v0 = get_global_id(0);
p.0 = v0;
goto label1;
label1:
int v2 = p.0 + 1;
long v3 = v2;
global int* v4 = data[v3];
int v5 = v4[0];
bool v6 = v5 == 0;
if(v6) {
        goto label2;
} else {
    p.0 = v2;
    goto label1;
}
label2:
}

kernel void _Z9testWhilePii(global int* data, int N) {
int p.0;
label0:
int v0 = get_global_id(0);
p.0 = v0;
goto label1;
label1:
long v2 = p.0;
global int* v3 = data[v2];
int v4 = v3[0];
bool v5 = v4 == 0;
int v6 = p.0 + 1;
if(v5) {
        goto label2;
} else {
    p.0 = v6;
    goto label1;
}
label2:
}

kernel void _Z6testIfPii(global int* data, int N) {
label0:
int v0 = get_global_id(0);
bool v1 = v0 < N;
if(v1) {
        goto label1;
} else {
        goto label2;
}
label1:
long v3 = v0;
global int* v4 = data[v3];
int v5 = v4[0];
int v6 = v5 << 1;
v4[0] = v6;
goto label2;
label2:
}

kernel void _Z10testIfElsePii(global int* data, int N) {
label0:
int v0 = get_global_id(0);
bool v1 = v0 < N;
long v2 = v0;
global int* v3 = data[v2];
int v4 = v3[0];
if(v1) {
        goto label1;
} else {
        goto label2;
}
label1:
int v6 = v4 << 1;
v3[0] = v6;
int v8 = v0 + 3;
long v9 = v8;
global int* v10 = data[v9];
int v11 = v10[0];
int v12 = v11 << 1;
v10[0] = v12;
goto label3;
label2:
int v15 = v4 + -20;
v3[0] = v15;
int v17 = v0 + 5;
long v18 = v17;
global int* v19 = data[v18];
int v20 = v19[0];
int v21 = v20 + -20;
v19[0] = v21;
goto label3;
label3:
}

kernel void _Z7testForPfi(global float* data, int N) {
int i.02.prol;
int .lcssa5;
float .lcssa.unr;
float .lcssa3;
float .lcssa;
float sum.0.lcssa;
int i.02;
label0:
bool v0 = N > 0;
if(v0) {
        goto label1;
} else {
    sum.0.lcssa = 0;
    goto label9;
}
label1:
int v2 = N + -1;
int xtraiter = N && 3;
bool lcmp.mod = xtraiter == 0;
if(lcmp.mod) {
    .lcssa.unr = ;
    goto label5;
} else {
        goto label2;
}
label2:
i.02.prol = 0;
goto label3;
label3:
long v5 = i.02.prol;
global float* v6 = data[v5];
float v7 = v6[0];
float v8 = sum.01.prol + v7;
int v9 = i.02.prol + 1;
int prol.iter.sub = prol.iter + -1;
bool prol.iter.cmp = prol.iter.sub == 0;
if(prol.iter.cmp) {
    .lcssa5 = v9;
    goto label4;
} else {
    i.02.prol = v9;
    goto label3;
}
label4:
.lcssa.unr = .lcssa4;
goto label5;
label5:
bool v12 = v2 < 3;
if(v12) {
    .lcssa = .lcssa.unr;
    goto label8;
} else {
        goto label6;
}
label6:
i.02 = i.02.unr;
goto label10;
label7:
.lcssa = .lcssa3;
goto label8;
label8:
sum.0.lcssa = .lcssa;
goto label9;
label9:
data[0] = sum.0.lcssa;
label10:
long v19 = i.02;
global float* v20 = data[v19];
float v21 = v20[0];
float v22 = sum.01 + v21;
int v23 = i.02 + 1;
long v24 = v23;
global float* v25 = data[v24];
float v26 = v25[0];
float v27 = v22 + v26;
int v28 = i.02 + 2;
long v29 = v28;
global float* v30 = data[v29];
float v31 = v30[0];
float v32 = v27 + v31;
int v33 = i.02 + 3;
long v34 = v33;
global float* v35 = data[v34];
float v36 = v35[0];
float v37 = v32 + v36;
int v38 = i.02 + 4;
bool exitcond.3 = v38 == N;
if(exitcond.3) {
    .lcssa3 = v37;
    goto label7;
} else {
    i.02 = v38;
    goto label10;
}
}

kernel void _Z11testTernaryPf(global float* data) {
label0:
global float* v0 = data[1];
float v1 = v0[0];
bool v2 = v1 > 0;
global float* v3 = data[2];
global float* v4 = data[3];
float* .in = v2 ? v3 : v4;
int*v5 = (int*).in;
int v6 = v5[0];
global int*v7 = (global int*)data;
v7[0] = v6;
}

