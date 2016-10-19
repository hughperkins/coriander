// eg replaces tanh by our own stuff

//__host__ __device__ int __nvvm_atom_cta_min_gen_i(volatile int *p, int val);
// __host__ __device__ long long __nvvm_atom_cta_min_gen_ll(long long *p, long long val);

#pragma message "reading fake_funcs.h"

#include <cstdlib>

#define stubout_gen(SCOPE, OP, SUFFIX, TYPE) \
    TYPE __nvvm_atom_##SCOPE##_##OP##_gen_##SUFFIX(volatile TYPE *p, TYPE val);

//typedef size_t long long;
// #define size_t long long

long long __nvvm_atom_sys_cas_gen_ll(volatile long long *p, long long a, long long b);
long long __nvvm_atom_cta_cas_gen_ll(volatile long long *p, long long a, long long b);
int __nvvm_atom_cta_cas_gen_i(volatile int *p, int a, int b);
int __nvvm_atom_sys_cas_gen_i(volatile int *p, int a, int b);

#define stubout_types(SCOPE, OP) \
stubout_gen(SCOPE, OP, d, double) \
stubout_gen(SCOPE, OP, f, float) \
stubout_gen(SCOPE, OP, i, int) \
stubout_gen(SCOPE, OP, ui, unsigned int) \
stubout_gen(SCOPE, OP, ll, long long) \
stubout_gen(SCOPE, OP, ull, unsigned long long)

#define stubout_scope(SCOPE) \
stubout_types(SCOPE, add) \
stubout_types(SCOPE, max) \
stubout_types(SCOPE, min) \
stubout_types(SCOPE, inc) \
stubout_types(SCOPE, dec) \
stubout_types(SCOPE, or) \
stubout_types(SCOPE, xor) \
stubout_types(SCOPE, and) \
stubout_types(SCOPE, xchg)

stubout_scope(sys)
stubout_scope(cta)

#include "__clang_cuda_runtime_wrapper.h"

// this is for eigen (which calls like:  ::tanh)
// float our_pretend_tanh(float in);
// float our_pretend_log(float in);
// float our_pretend_exp(float in);

// this is for std library:  (which calls like:   std::tanh)
// namespace std {
// float our_pretend_tanh(float in);
// float our_pretend_log(float in);
// float our_pretend_exp(float in);
// }

// namespace cocl {
// float our_pretend_tanh(float in);
// float our_pretend_log(float in);
// float our_pretend_exp(float in);
// }

// namespace std {

// namespace cocl {
// T our_pretend_tanh<T>(T in);
// T our_pretend_log<T>(T in);
// T our_pretend_exp<T>(T in);
// }
// }

// using namespace std;  // trying to fix error about arg

// #define arg std::arg

// #define EIGEN_USING_STD_MATH(FUNC) using std::FUNC;

#include <complex>
template<class T> T arg (const std::complex<T>& x) {
    return std::arg(x);
}
// #include <random>

// #define tanh our_pretend_tanh
// #define log our_pretend_log
// #define exp our_pretend_exp

extern "C" {
double our_pretend_tanh(double in);
double our_pretend_log(double in);
double our_pretend_exp(double in);

double tanh(double in);
double log(double in);
double exp(double in);
}
