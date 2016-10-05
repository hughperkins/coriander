struct class_mynamespace__subnamespace__Foo {
    int f0;
};

struct class_mynamespace__Bar {
    struct class_mynamespace__subnamespace__Foo f0;
    struct class_mynamespace__subnamespace__Foo f1;
    int f2;
};


kernel void _Z11doSomethingN11mynamespace3BarE(global struct class_mynamespace__Bar* bar) {
    label0:;
}
