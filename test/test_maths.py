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
import pytest
import math
import os
import subprocess
from test import test_common


basename = os.path.basename(__name__).split('.')[-1]
print('basename', basename)


def test_floatconstants(context, q, float_data, float_data_gpu):

    code = """
__device__ float4 getvals() {
    return make_float4(0xFFF0000000000000, 0x7FF0000000000000, 0x7FF0000000000000, 0x7FF0000000000000);
}

__global__ void myKernel(float *data) {
    data[0] = 18442240474082181120.0f; // 0xFFF0000000000000
    data[1] = 9218868437227405312.0f; // 0x7FF0000000000000
    float4 vals = getvals();
    data[2] = vals.x;
    data[3] = vals.y;
}
"""
    prog = test_common.compile_code(cl, context, code)
    prog.__getattr__(test_common.mangle('myKernel', ['float *']))(
        q, (32,), (32,),
        float_data_gpu, np.int64(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print('float_data[0]', float_data[0])
    print('float_data[1]', float_data[1])
    print('float_data[2]', float_data[2])
    print('float_data[3]', float_data[3])
    assert float_data[0] > 100000000
    assert float_data[1] > 100000000
    assert float_data[2] > 100000000
    assert float_data[3] > 100000000
