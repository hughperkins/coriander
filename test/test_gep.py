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
    ll_code = test_common.cu_to_devicell_explicit_opt(cu_code, opt=1)
    print('ll_code', ll_code)

    cl_code = test_common.ll_to_cl(ll_code, kernel_name, num_clmems=2)
    print('cl_code', cl_code)
