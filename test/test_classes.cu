namespace mynamespace {
    namespace subnamespace {
        __device__ __host__ class Foo {
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

    __device__ __host__ class Bar : public subnamespace::Foo {
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
}

__global__ void doSomething(mynamespace::Bar bar) {
    bar.a = 123;
}
