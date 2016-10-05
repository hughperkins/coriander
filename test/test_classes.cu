namespace mynamespace {
    namespace subnamespace {
        class Foo {
        public:
            int a;
            Foo() {

            }
            ~Foo() {

            }
            void somefunc() {

            }
        };
    }

    class Bar : public subnamespace::Foo {
    public:
        Foo foo;
        int b;
        Bar() {

        }
        ~Bar() {

        }
        void somefunc2() {

        }
    };

    template<typename T>
    class Templated : public subnamespace::Foo {
    public:
        T someattribute;
        void doSomething(T val) {

        }
    };
}

template<typename T>
__global__
void doSomething(mynamespace::Bar bar, mynamespace::Templated<T> t, T *data, int *int_data) {
    bar.a = 123;
    data[0] = t.someattribute;
    int_data[0] = bar.b;
}

__host__ void doSomething_host(mynamespace::Bar bar, mynamespace::Templated<float> t, float *data, int *int_data) {
    doSomething<<<dim3(32), dim3(32)>>>(bar, t, data, int_data);
}
