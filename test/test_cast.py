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


def test_sext(context, q, int_data, int_data_gpu):
    ll_code = """
define void @mykernel(i32* %data) {
  %1 = load i32, i32* %data
  %2 = sext i32 %1 to i64
  %3 = lshr i64 %2, 32
  %4 = trunc i64 %3 to i32
  store i32 %4, i32* %data
  ret void
}
"""
    cl_code = test_common.ll_to_cl(ll_code, 'mykernel', 1)
    print('cl_code', cl_code)
    for experiment in [
        {'in': 23, 'out': 0},
        {'in': -1, 'out': -1}
    ]:
        int_data[0] = experiment['in']
        cl.enqueue_copy(q, int_data_gpu, int_data)
        kernel = test_common.build_kernel(context, cl_code, 'mykernel')
        kernel(q, (32,), (32,), int_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(32))
        from_gpu = np.copy(int_data)
        cl.enqueue_copy(q, from_gpu, int_data_gpu)
        q.finish()
        # expected = (np.uint32(int_data[1]) * np.uint32(int_data[2])) >> 32
        expected = experiment['out']
        print('expected', expected)
        print('from_gpu[0]', from_gpu[0])
        assert expected == from_gpu[0].item()
        split_cl = cl_code.split('\n')
        found_long_cast = False
        for line in split_cl:
            if ' >> 32' in line and '(long)' in line:
                found_long_cast = True
        assert found_long_cast
