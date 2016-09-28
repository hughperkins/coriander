// eg replaces tanh by our own stuff

#include "__clang_cuda_runtime_wrapper.h"

#define tanh our_pretend_tanh
#define log our_pretend_log

float our_pretend_tanh(float in);
float our_pretend_log(float in);
