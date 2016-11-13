# Copyright Hugh Perkins 2016
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
import subprocess
from test import test_common
from test.test_common import offset_type


def test_local(context, q, float_data, float_data_gpu):
    cu_source = """
    __global__ void foo(float *data) {
        __shared__ float localmem[33];
        int tid = threadIdx.x;
        int warpId = tid % 32;
        localmem[warpId] = data[0];
        data[0] = localmem[warpId + 1];
    }
"""
    kernelName = test_common.mangle('foo', ['float *'])
    cl_sourcecode = test_common.cu_to_cl(cu_source, kernelName)
    print('cl_sourcecode', cl_sourcecode)
    kernel = test_common.build_kernel(context, cl_sourcecode, kernelName)
    float_data_orig = np.copy(float_data)
    kernel(q, (32,), (32,), float_data_gpu, offset_type(0), cl.LocalMemory(4))
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print('before', float_data_orig[:5])
    print('after', float_data[:5])
