// eg replaces tanh by our own stuff

//__host__ __device__ int __nvvm_atom_cta_min_gen_i(volatile int *p, int val);
// __host__ __device__ long long __nvvm_atom_cta_min_gen_ll(long long *p, long long val);

// #pragma message "reading fake_funcs.h"

#pragma once

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
template<class T> __device__ T arg (const std::complex<T>& x) {
    return std::arg(x);
}
// #include <random>

namespace cocl {
   // double max(double in1, double in2);
   // double min(double in, double in2);
}
// using cocl::max;
// using cocl::min;

extern "C" {
    __device__ double tanh(double in);
    __device__ double log(double in);
    __device__ double exp(double in);
    __device__ double exp10(double in);
    __device__ float exp10f(float in);
} // extern "C"

__device__ double max(double in1, double in2);
__device__ double min(double in1, double in2);
__host__ __device__ float max(float in1, float in2);
__host__ __device__ float min(float in1, float in2);
__device__ int max(int in1, int in2);
__device__ int min(int in1, int in2);
__device__ long long max(long long in1, long long in2);
__device__ long long min(long long in1, long long in2);

__device__ float fminf(float in1, float in2);
__device__ float fmaxf(float in1, float in2);
__device__ float expf(float in1);
__device__ float logf(float in1);
__device__ float tanf(float in1);
__device__ float cosf(float in1);
__device__ float sinf(float in1);
__device__ float asinf(float in1);
__device__ float tanhf(float in1);
__device__ float acosf(float in1);
__device__ float atanf(float in1);
__device__ float fabsf(float in1);
__device__ float fabs(float in1);
__device__ float sqrtf(float in1);
__device__ float rsqrtf(float in1);
__device__ float ceilf(float in1);
__device__ float floorf(float in1);
__device__ void sincosf(float angle, float *sinres, float *cosres);

__device__ float pow(float in1, float in2);
__device__ float sqrt(float in1);
__device__ float log(float in1);
__device__ float abs(float in1);

__device__ bool isnan(float in1);
__device__ bool isinf(float in1);
__device__ bool isfinite(float in1);

__device__ void memcpy(void *dst, const void *src, size_t count);
__device__ double rsqrt(double x);
// __device__ int __clz(int value);

// inline double rsqrt(double x) {
//     return sqrt(1.0 / x);
// }
inline int __clz(int value);
#define rsqrtf(x) rsqrt(x)
#define sinpif sinpi
#define normcdff normcdf
#define erfcxf erfcx

// #define max cocl::max
// #define min cocl::min

// #define atomicCAS atomic_cmpxchg


// __device__ long long atomicExch(long long* address, long long val);

// #ifdef __CUDA_ARCH__
// #endif

#ifdef __CUDACC__  // means: are we building a .cu file (cf building a .cpp file, eg cocl_dnn_conv.cpp)
template<typename T>
__device__ T atomicCAS(T* address, T compare, T val);
template<typename T>
__device__ T atomicAdd(T* address, T val);
template<typename T>
__device__ T atomicMax(T* address, T val);
template<typename T>
__device__ T atomicExch(T* address, T val);
__device__ unsigned long long atomicExch(unsigned long long *address, unsigned long long val);

__device__ unsigned int atomicInc(unsigned int  *address, unsigned int val);

__device__ bool __isGlobal(const void *ptr);
__device__ void __threadfence_block();
__device__ void syncthreads();
__device__ void __threadfence();
__device__ int __all(int bits);
__device__ int __any(int bits);

// https://en.wikipedia.org/wiki/Find_first_set
__device__ int __clz(int val);
__device__ int __brev(int val);
__device__ int __popc(int val);

template<typename T>
__device__ T __shfl_down(T val, int offset);
template<typename T>
__device__ T __shfl_down(T val, int offset, int warpSize);
template<typename T>
__device__ T __shfl_xor(T val, int offset, int warpSize);

__device__ int __shfl_xor(int a, int b);
__device__ int __umulhi(int magic, int n);

__device__ void __assert_rtn(const char *, const char *, int, const char *);
__device__ void __assert_fail(const char *, const char *, size_t, const char *);

__device__ unsigned int atomicCAS(unsigned int* address, unsigned int compare, unsigned int val);

__device__ inline float __int_as_float(int val) {
    return *(float *)&val;
}
__device__ inline int __float_as_int(float val) {
    return *(int *)&val;
}
#endif // __CUDACC__

int __clzll(long long x);
long long __umul64hi(unsigned long long x, unsigned long long y);

#ifdef __CUDA_ARCH__
// #pragma message "adding asserts"
#define NDEBUG
// #include "assert.h"
// #undef assert
// #define assert(x)
// assert(false);
// #define __assert_fail(a,b,c,d)
//void assert(expr);
#endif // __CUDA_ARCH__

#define __forceinline__ inline
