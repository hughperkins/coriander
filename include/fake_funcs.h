// eg replaces tanh by our own stuff

//__host__ __device__ int __nvvm_atom_cta_min_gen_i(volatile int *p, int val);
// __host__ __device__ long long __nvvm_atom_cta_min_gen_ll(long long *p, long long val);

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

// stubout_types(SCOPE, cas) \

// stubout_gen(SCOPE, add, d, double) \
// stubout_gen(SCOPE, add, f, float) \
// stubout_gen(SCOPE, add, i, int) \
// stubout_gen(SCOPE, add, ll, long long) \
// stubout_gen(SCOPE, min, i, int) \
// stubout_gen(SCOPE, max, ui, unsigned int) \
// stubout_gen(SCOPE, xchg, d, double) \
// stubout_gen(SCOPE, xchg, i, int) \

stubout_scope(sys)
stubout_scope(cta)

// stubout_gen(sys, xchg, i, int)
// stubout_gen(sys, add, i, int)
// stubout_gen(sys, max, i, int)
// stubout_gen(sys, min, i, int)
// stubout_gen(sys, min, ull, unsigned long long)
// stubout_gen(sys, add, ll, long long)
// stubout_gen(sys, max, ll, long long)

#include "__clang_cuda_runtime_wrapper.h"

// #define cudaMalloc fakeCudaMalloc
// #define cudaFree fakeCudaFree
// #define cudaMemcpy fakeCudaMemcpy

// cudaError_t fakeCudaMalloc(void **, size_t);
// cudaError_t fakeCudaFree(void *);
// cudaError_t cudaMemcpy(void *dst, const void *, size_t, enum cudaMemcpyKind);

#define tanh our_pretend_tanh
#define log our_pretend_log
#define exp our_pretend_exp

namespace std {
float our_pretend_tanh(float in);
float our_pretend_log(float in);
float our_pretend_exp(float in);

// long long our_pretend_log(long long in);
// long our_pretend_log(long in);
// double our_pretend_log(double in);
}

using namespace std;  // trying to fix error about arg
