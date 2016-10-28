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
import pyopencl.tools
import pytest
import os
import subprocess
from test import test_common


sourcecode = """
__global__ void testDoWhile(int *data, int N) {
    int p = threadIdx.x;
    do {
        p++;
    } while(data[p] != 0);
}

__global__ void testWhile(int *data, int N) {
    int p = threadIdx.x;
    while(data[p] != 0) {
        p++;
    }
}

__global__ void testIf(int *data, int N) {
    int tid = threadIdx.x;
    if(tid < N) {
        data[tid] *= 2;
    }
}

__global__ void testIfElse(int *data, int N) {
    int tid = threadIdx.x;
    if(tid < N) {
        data[tid] *= 2;
        data[tid + 3] *= 2;
    } else {
        data[tid] -= 20;
        data[tid + 5] -= 20;
    }
}

__global__ void testFor(float *data, int N) {
    if(threadIdx.x == 0) {
        float sum = 0.0f;
        for(int i = 0; i < N; i++) {
            sum += data[i];
        }
        data[0] = sum;
    }
}
"""


def compile_code(context, kernelSource):
    for file in os.listdir('/tmp'):
        if file.startswith('testprog'):
            os.unlink('/tmp/%s' % file)
    with open('/tmp/testprog.cu', 'w') as f:
        f.write(kernelSource)
    print(subprocess.check_output([
        'cocl',
        '-c',
        '/tmp/testprog.cu'
    ]).decode('utf-8'))
    with open('/tmp/testprog-device.cl', 'r') as f:
        cl_sourcecode = f.read()
    prog = cl.Program(context, cl_sourcecode).build()
    return prog


def test_testFor(context, q, float_data, float_data_gpu):
    prog = compile_code(context, sourcecode)
    float_data_orig = np.copy(float_data)

    prog.__getattr__(test_common.mangle('testFor', ['float *', 'int']))(q, (32,), (32,), float_data_gpu, np.int64(0), np.int32(32), cl.LocalMemory(4))
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert abs(float_data[0] - sum(float_data_orig[0:32])) < 1e-4
