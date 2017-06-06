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

alloca is created before we know which address space it should be
we need to handle this, but first we need a test case for this
"""
import numpy as np
import pyopencl as cl
import os
import subprocess
from test import test_common
from test.test_common import offset_type


basename = os.path.basename(__name__).split('.')[-1]
print('basename', basename)


def test_alloca(context, q, float_data, float_data_gpu):

    code = """
__global__ void mykernel(float *data) {
    float *foo = data;
    foo[0] = data[1] + data[2] + data[3];
}
"""
    kernelName = test_common.mangle('mykernel', ['float *'])
    try:
        dict = test_common.compile_code_v2(cl, context, code, kernelName, num_clmems=1)
        prog = dict['prog']
        cl_sourcecode = dict['cl_sourcecode']
        print('cl_sourcecode', cl_sourcecode)
    except Exception as e:
        with open('/tmp/testprog-device.cl', 'r') as f:
            print(f.read())
        raise e
    print('type(offset_type(0))', type(offset_type(0)))
    prog.__getattr__(kernelName)(
        q, (32,), (32,),
        float_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(4))
    # q.finish()
    # cl.enqueue_copy(q, float_data, float_data_gpu)
    # q.finish()
