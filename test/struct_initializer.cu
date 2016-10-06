struct Foo {
    float somefloat;
};

__host__ __device__ float getFooValue(struct Foo foo) {
    return foo.somefloat;
}

class SomeClass {
public:
    SomeClass() {}
    SomeClass(float value) {
        foo.somefloat = value;
    }
    struct Foo foo = { 1.23f };
    float getValue() {
        return foo.somefloat;
    }
    float getValue2() {
        return foo.somefloat * 100.0f + 2.0f;
    }
    float getValue3(float v) {
        return foo.somefloat * 100.0f * v + 2.0f;
    }
};

__host__ __device__ float getSomeClassValue(SomeClass someclass, SomeClass c2) {
    return someclass.foo.somefloat + c2.foo.somefloat;
}

__constant__ SomeClass myg1;
__constant__ SomeClass myg2(7.89f);
__constant__ struct Foo foo = {11.0f};

__global__ void somekernel(float *data) {
    struct Foo bar = { 23.4f };
    data[0] = bar.somefloat;
    data[1] = getFooValue(bar);
    SomeClass someclass;
    data[2] = someclass.foo.somefloat;
    SomeClass c2(3.45f);
    data[3] = getSomeClassValue(someclass, c2);
    data[4] = c2.getValue();
    data[5] = c2.getValue2();
    data[6] = c2.getValue3(data[7]);
    for(int i = 0; i < 10000; i++) {
        data[100+i] = c2.getValue3(data[10100 + i]);
    }
    data[8] = myg1.getValue3(data[9]);
    data[10] = myg2.getValue3(data[11]);
}

__global__ void somekernel2(float *data) {
    data[0] = getSomeClassValue(myg1, myg2);
}

__global__ void getFooValue(float *data) {
    data[0] = foo.somefloat;
}
