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


def test_return(context):
    """
    check address space of a function taht returns a global pointer
    """
    source = """
    __device__ float *myfunc();

    __device__ float *foo(float *in) {
        if(in[0] > 0) {
            return in + 10;
        } else {
            return in + 27;
        }
    }

    __global__ void mykernel(float *a) {
        foo(a);
    }
"""
    kernelName = test_common.mangle('mykernel', ['float*'])
    dict = test_common.compile_code_v3(cl, context, source, kernelName)
    # prog = dict['prog']
    cl_sourcecode = dict['cl_sourcecode']
    print('cl_sourcecode', cl_sourcecode)
