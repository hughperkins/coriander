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


def test_basic1_from_ll(context, q, int_data, int_data_gpu):
    ll_code = """
define void @mykernel(i32* %data) {
    %1 = getelementptr i32, i32* %data, i32 0
    ret void
}
"""
    cl_code = test_common.ll_to_cl(ll_code, "mykernel", 1)
    print('cl_code', cl_code)


def test_basic1_from_cu(context, q, int_data, int_data_gpu):
    cu_code = """
__global__ void mykernel(int *data) {
    int v = data[3];
    data[1] = v;
}
"""
    ll_code = test_common.cu_to_ll_noopt(cu_code)
    print('ll_code', ll_code)
    kernel_name = '_Z8mykernelPi'
    cl_code = test_common.ll_to_cl(ll_code, kernel_name, 1)
    print('cl_code', cl_code)
    kernel = test_common.build_kernel(context, cl_code, kernel_name)
    int_data[3] = 123
    cl.enqueue_copy(q, int_data_gpu, int_data)
    kernel(
        q, (32,), (32,),
        int_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    print('int_data[1]', int_data[1])


def test_gep(context, q, float_data, float_data_gpu):
    cu_code = """

struct T1 {
    float f0[5];
    float f1[5];
};

struct T2 {
    struct T1 t1a;
    struct T1 t1b;
};

struct T3 {
    struct T2 t2a;
    struct T2 t2b;
};

__global__ void mykernel(struct T3 t3, float *data) {
    data[0] = t3.t2a.t1a.f0[3];
    // data[1] = t3.t2b.t1b.f1[2];
}
"""
    # kernel_name = test_common.mangle('mykernel', ['struct*', 'float*'])
    kernel_name = '_Z8mykernel2T3Pf'
    # ll_code = test_common.cu_to_devicell_explicit_opt(cu_code, opt=1)
    ll_code = test_common.cu_to_ll(cu_code)
    print('ll_code', ll_code)

    cl_code = test_common.ll_to_cl(ll_code, kernel_name, num_clmems=2)
    print('cl_code', cl_code)
