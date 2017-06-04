# Copyright Hugh Perkins 2016, 2017
"""
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""
import numpy as np
import pyopencl as cl
import os
import math
import pytest
from test import test_common
from test.test_common import offset_type


basename = os.path.basename(__name__).split('.')[-1]
print('basename', basename)


def test_atomic_add_floats(context, q, float_data, float_data_gpu):
    ll_code = """
declare float @_Z9atomicAddIfET_PS0_S0_(float *, float)

define void @mykernel(float* nocapture %data) #1 {
  %1 = call float @_Z9atomicAddIfET_PS0_S0_(float * %data, float 3.25)
  ret void
}
"""
    cl_code = test_common.ll_to_cl(ll_code, 'mykernel', 1)
    print('cl_code', cl_code)
    # try compiling it, just to be sure...
    float_data[0] = 0
    kernel = test_common.build_kernel(context, cl_code, 'mykernel')
    cl.enqueue_copy(q, float_data_gpu, float_data)
    kernel(q, (128,), (32,), float_data_gpu, offset_type(0), cl.LocalMemory(32))
    from_gpu = np.copy(float_data)
    cl.enqueue_copy(q, from_gpu, float_data_gpu)
    q.finish()
    print('from_gpu[0]', from_gpu[0])
    assert from_gpu[0] == 3.25 * 128


def test_atomic_cas_int(context, q, int_data, int_data_gpu):
    # atomicCAS api based on usage in Eigen unsupported/Eigen/CXX11/src/Tensor/TensorReductionCuda.h
    cu_code = """
__global__ void mykernel(int *data) {
    int tid = threadIdx.x;
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    int numAttempts = 0;
    while(true) {
        numAttempts += 1;
        int oldValue = data[0];
        int newValue = oldValue + 1;
        int returnedOld = atomicCAS(data, oldValue, newValue);
        if(returnedOld == oldValue) {
            break;
        }
    }
    data[1 + gid] = numAttempts;
}
"""
    cl_code = test_common.cu_to_cl(cu_code, '_Z8mykernelPi', 1)
    print('cl_code', cl_code)

    int_data[0] = 0
    kernel = test_common.build_kernel(context, cl_code, '_Z8mykernelPi')
    cl.enqueue_copy(q, int_data_gpu, int_data)
    num_blocks = 4
    threads_per_block = 4
    kernel(q, (num_blocks * threads_per_block,), (threads_per_block,), int_data_gpu, offset_type(0), cl.LocalMemory(32))
    from_gpu = np.copy(int_data)
    cl.enqueue_copy(q, from_gpu, int_data_gpu)
    q.finish()
    print('from_gpu', from_gpu[:17])

    # check two things:
    # - final value of data[0] should equal num_blocks * threads_per_block
    # - the number of attempts should be unique, for each thread

    assert from_gpu[0] == num_blocks * threads_per_block
    seen_num_attempts = set()
    for i in range(num_blocks * threads_per_block):
        num_attempts = from_gpu[i + 1]
        if num_attempts in seen_num_attempts:
            raise Exception('already saw num_attempts %s' % num_attempts)
        seen_num_attempts.add(num_attempts)


def test_atomic_cas_unsignedint(context, q, int_data, int_data_gpu):
    # atomicCAS api based on usage in Eigen unsupported/Eigen/CXX11/src/Tensor/TensorReductionCuda.h
    cu_code = """
__global__ void mykernel(unsigned int *data) {
    int tid = threadIdx.x;
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    int numAttempts = 0;
    while(true) {
        numAttempts += 1;
        unsigned int oldValue = data[0];
        unsigned int newValue = oldValue + 1;
        unsigned int returnedOld = atomicCAS(data, oldValue, newValue);
        if(returnedOld == oldValue) {
            break;
        }
    }
    data[1 + gid] = numAttempts;
}
"""
    cl_code = test_common.cu_to_cl(cu_code, '_Z8mykernelPj', 1)
    print('cl_code', cl_code)

    int_data[0] = 0
    kernel = test_common.build_kernel(context, cl_code, '_Z8mykernelPj')
    cl.enqueue_copy(q, int_data_gpu, int_data)
    num_blocks = 4
    threads_per_block = 4
    kernel(q, (num_blocks * threads_per_block,), (threads_per_block,), int_data_gpu, offset_type(0), cl.LocalMemory(32))
    from_gpu = np.copy(int_data)
    cl.enqueue_copy(q, from_gpu, int_data_gpu)
    q.finish()
    print('from_gpu', from_gpu[:17])

    # check two things:
    # - final value of data[0] should equal num_blocks * threads_per_block
    # - the number of attempts should be unique, for each thread

    assert from_gpu[0] == num_blocks * threads_per_block
    seen_num_attempts = set()
    for i in range(num_blocks * threads_per_block):
        num_attempts = from_gpu[i + 1]
        if num_attempts in seen_num_attempts:
            raise Exception('already saw num_attempts %s' % num_attempts)
        seen_num_attempts.add(num_attempts)
