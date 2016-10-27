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
import math
import os
import subprocess
from test import test_common


basename = os.path.basename(__name__).split('.')[-1]
print('basename', basename)


def test_inlining(context, q, float_data, float_data_gpu):

    code = """
__global__ void myKernel(float *data) {
    data[0] = (data[3] * (data[1] + data[2])) / data[4];
    data[7] = (data[3] / (data[1] - data[2])) * data[4];
}
"""
    for file in os.listdir('/tmp'):
        if file.startswith(basename):
            os.unlink('/tmp/%s' % file)
    with open('/tmp/%s.cu' % basename, 'w') as f:
        f.write(code)
    print(subprocess.check_output([
        'cocl',
        '-c',
        '/tmp/%s.cu' % basename
    ]))

    with open('/tmp/%s-device.cl' % basename, 'r') as f:
        sourcecode = f.read()

    for i in range(10):
        float_data[i] = i + 3
    cl.enqueue_copy(q, float_data_gpu, float_data)
    q.finish()
    prog = cl.Program(context, sourcecode).build()
    prog.__getattr__(test_common.mangle('myKernel', ['float *']))(
        q, (32,), (32,),
        float_data_gpu, np.int64(0))
    q.finish()
    float_data2 = np.zeros((1024,), dtype=np.float32)
    cl.enqueue_copy(q, float_data2, float_data_gpu)
    q.finish()
    print('float_data2[0]', float_data2[0])
    d = float_data
    d2 = float_data2
    expect = (d[3] * (d[1] + d[2])) / d[4]
    assert abs(d2[0] - expect) < 1e-5
