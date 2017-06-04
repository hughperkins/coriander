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


def test_floatconstants(context, q, float_data, float_data_gpu):

    code = """
__device__ float4 getvals() {
    return make_float4(0xFFF0000000000000, 0x7FF0000000000000, INFINITY, -INFINITY);
}

__global__ void myKernel(float *data) {
    data[0] = 18442240474082181120.0f; // 0xFFF0000000000000
    data[1] = 9218868437227405312.0f; // 0x7FF0000000000000
    float4 vals = getvals();
    data[2] = vals.x;
    data[3] = vals.y;
    data[4] = vals.w;
    data[5] = vals.z;
    data[6] = INFINITY;
    data[7] = -INFINITY;
    // data[8] = 0xFFEFFFFFFFFFFFFF;
}
"""
    kernel = test_common.compile_code_v3(cl, context, code, test_common.mangle('myKernel', ['float *']), num_clmems=1)['kernel']
    kernel(
        q, (32,), (32,),
        float_data_gpu, offset_type(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print('float_data[0]', float_data[0])
    print('float_data[1]', float_data[1])
    print('float_data[2]', float_data[2])
    print('float_data[3]', float_data[3])
    print('float_data[4]', float_data[4])
    print('float_data[5]', float_data[5])
    print('float_data[6]', float_data[6])
    print('float_data[7]', float_data[7])
    # print('float_data[8]', float_data[8])
    assert float_data[0] > 100000000
    assert float_data[1] > 100000000
    assert float_data[2] > 100000000
    assert float_data[3] > 100000000
    assert float_data[4] == - np.inf
    assert float_data[5] == np.inf
    assert float_data[6] == np.inf
    assert float_data[7] == - np.inf


def test_float_constants_from_ll(context, q, float_data, float_data_gpu):
    ll_code = """
define void @kernel_float_constants(float* nocapture %data) #1 {
  store float 0x3E7AD7F2A0000000, float* %data
  ret void
}
"""
    cl_code = test_common.ll_to_cl(ll_code, 'kernel_float_constants', 1)
    print('cl_code', cl_code)
    # try compiling it, just to be sure...
    kernel = test_common.build_kernel(context, cl_code, 'kernel_float_constants')
    kernel(q, (32,), (32,), float_data_gpu, offset_type(0), cl.LocalMemory(32))
    from_gpu = np.copy(float_data)
    cl.enqueue_copy(q, from_gpu, float_data_gpu)
    q.finish()
    print('from_gpu[0]', from_gpu[0])
    print(type(from_gpu[0]), type(1e-7))
    assert abs(float(from_gpu[0]) - 1e-7) <= 1e-10
    assert 'data[0] = 1e-07f' in cl_code


def test_atomic_add(context, q, float_data, float_data_gpu):
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


def test_umulhi(context, q, int_data, int_data_gpu):
    ll_code = """
declare i32 @_Z8__umulhiii(i32, i32)

define void @test_umulhi(i32* %data) {
  %1 = load i32, i32* %data

  %2 = getelementptr i32, i32* %data, i32 1
  %3 = load i32, i32* %2

  %4 = getelementptr i32, i32* %data, i32 2
  %5 = load i32, i32* %4

  %6 = call i32 @_Z8__umulhiii(i32 %3, i32 %5)
  store i32 %6, i32* %data
  ret void
}
"""
    cl_code = test_common.ll_to_cl(ll_code, 'test_umulhi', 1)
    print('cl_code', cl_code)
    int_data[0] = 0
    int_data[1] = -50
    int_data[2] = 2523123
    cl.enqueue_copy(q, int_data_gpu, int_data)
    kernel = test_common.build_kernel(context, cl_code, 'test_umulhi')
    kernel(q, (32,), (32,), int_data_gpu, offset_type(0), cl.LocalMemory(32))
    from_gpu = np.copy(int_data)
    cl.enqueue_copy(q, from_gpu, int_data_gpu)
    q.finish()
    expected = (np.uint64(np.uint32(2523123)) * np.uint64(np.uint32(-50))) // 2**32
    print('expected', expected)
    print('from_gpu[0]', from_gpu[0])
    assert expected == from_gpu[0].item()


def test_fabs_double(context, q, float_data, float_data_gpu):
    cu_code = """
__global__ void mykernel(float *data) {
    data[0] = fabs(data[0]);
}
"""
    cl_code = test_common.cu_to_cl(cu_code, '_Z8mykernelPf', 1)
    print('cl_code', cl_code)
    float_data[0] = -0.123
    cl.enqueue_copy(q, float_data_gpu, float_data)
    kernel = test_common.build_kernel(context, cl_code, '_Z8mykernelPf')
    kernel(q, (32,), (32,), float_data_gpu, offset_type(0), cl.LocalMemory(32))
    from_gpu = np.copy(float_data)
    cl.enqueue_copy(q, from_gpu, float_data_gpu)
    q.finish()
    expected = 0.123
    print('expected', expected)
    print('from_gpu[0]', from_gpu[0])
    assert abs(expected - from_gpu[0].item()) < 1e-4


@pytest.mark.skip(reason='double parameters to kernels not supported currently')
def test_double_ieeefloats(context, q, float_data, float_data_gpu):
    cu_code = """
__global__ void mykernel(double *data) {
    double d_neginfinity = -INFINITY;
    double d_posinfinity = INFINITY;
    float f_neginfinity = -INFINITY;
    float f_posinfinity = INFINITY;
    data[0] = INFINITY;
    data[1] = -INFINITY;
    data[2] = f_neginfinity;
    data[3] = f_posinfinity;
}
"""
    kernel_name = test_common.mangle('mykernel', ['double*'])
    cl_code = test_common.cu_to_cl(cu_code, kernel_name, num_clmems=1)
    kernel = test_common.build_kernel(context, cl_code, kernel_name)
    kernel(
        q, (32,), (32,),
        float_data_gpu, offset_type(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print(float_data[:4])
    assert float_data[0] == np.inf
    assert float_data[1] == - np.inf
    assert float_data[2] == - np.inf
    assert float_data[3] == np.inf


def test_pow(context, q, float_data, float_data_gpu):

    code = """
__global__ void myKernel(float *data) {
    data[0] = pow(data[1], data[2]);
    data[3] = pow(data[4], data[5]);
    data[5] = pow(data[7], data[8]);
}
"""
    kernel = test_common.compile_code_v3(cl, context, code, test_common.mangle('myKernel', ['float *']), num_clmems=1)['kernel']
    float_data[1] = 1.5
    float_data[2] = 4.6
    float_data[4] = -1.5
    float_data[5] = 4.6
    float_data[7] = 1.5
    float_data[8] = -4.6
    cl.enqueue_copy(q, float_data_gpu, float_data)
    kernel(
        q, (32,), (32,),
        float_data_gpu, offset_type(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print('float_data[0]', float_data[0])
    print('float_data[3]', float_data[3])
    print('float_data[6]', float_data[6])
    expected = pow(float_data[1], float_data[2])
    assert abs(float_data[0] - expected) <= 1e-4


def test_sqrt(context, q, float_data, float_data_gpu):

    code = """
__global__ void myKernel(float *data) {
    data[threadIdx.x] = sqrt(data[threadIdx.x]);
}
"""
    kernel = test_common.compile_code_v3(cl, context, code, test_common.mangle('myKernel', ['float *']), num_clmems=1)['kernel']
    float_data[0] = 1.5
    float_data[1] = 4.6
    float_data[2] = -1.5
    float_data[3] = 0
    float_data_orig = np.copy(float_data)
    cl.enqueue_copy(q, float_data_gpu, float_data)
    kernel(
        q, (32,), (32,),
        float_data_gpu, offset_type(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print('float_data[:4]', float_data[:4])
    for i in range(4):
        if float_data_orig[i] >= 0:
            assert abs(float_data[i] - math.sqrt(float_data_orig[i])) <= 1e-4
        else:
            assert math.isnan(float_data[i])
        # print('float_data[]', i, float_data[i])


def test_sincos(context, q, float_data, float_data_gpu):

    cu_code = """
__global__ void mykernel(float *data) {
    sincosf(0.1, &data[0], &data[1]);
    sincosf(data[2], &data[3], &data[4]);
}
"""
    kernel_name = test_common.mangle('mykernel', ['float*'])
    cl_code = test_common.cu_to_cl(cu_code, kernel_name, num_clmems=1)
    print('cl_code', cl_code)

    float_data[2] = -0.3
    float_data_orig = np.copy(float_data)
    cl.enqueue_copy(q, float_data_gpu, float_data)

    kernel = test_common.build_kernel(context, cl_code, kernel_name)
    kernel(
        q, (32,), (32,),
        float_data_gpu, offset_type(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print(float_data[:5])
    assert abs(float_data[0] - math.sin(0.1)) < 1e-4
    assert abs(float_data[1] - math.cos(0.1)) < 1e-4
    assert abs(float_data[3] - math.sin(float_data_orig[2])) < 1e-4
    assert abs(float_data[4] - math.cos(float_data_orig[2])) < 1e-4


def test_fptosi(context, q, float_data, float_data_gpu, int_data, int_data_gpu):

    code = """
__global__ void myKernel(float *float_data, int *int_data) {
    int_data[0] = (int)float_data[0];
}
"""
    kernel = test_common.compile_code_v3(cl, context, code, test_common.mangle('myKernel', ['float *', 'int *']), num_clmems=2)['kernel']
    float_data[0] = 4.7
    float_data[1] = 1.5
    float_data[2] = 4.6
    cl.enqueue_copy(q, float_data_gpu, float_data)
    kernel(
        q, (32,), (32,),
        float_data_gpu,
        int_data_gpu,
        offset_type(0),
        offset_type(0),
        cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    print('int_data[0]', int_data[0])
    # expected = pow(float_data[1], float_data[2])
    assert int_data[0] == 4


def test_sitofp(context, q, float_data, float_data_gpu, int_data, int_data_gpu):

    code = """
__global__ void myKernel(float *float_data, int *int_data) {
    float_data[0] = (float)int_data[0];
}
"""
    kernel = test_common.compile_code_v3(cl, context, code, test_common.mangle('myKernel', ['float *', 'int *']), num_clmems=2)['kernel']
    int_data[0] = 5
    int_data[1] = 2
    int_data[2] = 4
    cl.enqueue_copy(q, int_data_gpu, int_data)
    kernel(
        q, (32,), (32,),
        float_data_gpu,
        int_data_gpu,
        offset_type(0),
        offset_type(0),
        cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    print('float_data[0]', float_data[0])
    # expected = pow(float_data[1], float_data[2])
    assert float_data[0] == 5


def test_clz(context, q, float_data, float_data_gpu, int_data, int_data_gpu):

    code = """
__global__ void myKernel(int *int_data) {
    int_data[0] = __clz(int_data[1]);
}
"""
    kernel = test_common.compile_code_v3(cl, context, code, test_common.mangle('myKernel', ['int *']), num_clmems=1)['kernel']
    int_data[1] = 15
    cl.enqueue_copy(q, int_data_gpu, int_data)
    kernel(
        q, (32,), (32,),
        int_data_gpu, offset_type(0),
        cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    print('int_data[:2]', int_data[:2])
    # expected = pow(float_data[1], float_data[2])
    # assert float_data[0] == 5
