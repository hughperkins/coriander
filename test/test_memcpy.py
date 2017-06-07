# Copyright Hugh Perkins 2017
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


def test_memcpy(context, q, int_data, int_data_gpu):
    ll_code = """
declare void @_Z6memcpyPvPKvm(i8*, i8*, i64)

define void @mykernel(i32* %data) {
  %1 = bitcast i32* %data to i8*

  %2 = getelementptr i32, i32* %data, i32 8
  %3 = bitcast i32* %2 to i8*

  call void @_Z6memcpyPvPKvm(i8 *%3, i8 *%1, i64 32)
  ret void
}
"""
    cl_code = test_common.ll_to_cl(ll_code, 'mykernel', num_clmems=1)
    print('cl_code', cl_code)
    for i in range(8):
        int_data[i] = 3 + i
    cl.enqueue_copy(q, int_data_gpu, int_data)
    kernel = test_common.build_kernel(context, cl_code, 'mykernel')
    kernel(q, (32,), (32,), int_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(32))
    from_gpu = np.copy(int_data)
    cl.enqueue_copy(q, from_gpu, int_data_gpu)
    q.finish()
    for i in range(8):
        print(i, from_gpu[8 + i])
        assert from_gpu[8 + i] == 3 + i
