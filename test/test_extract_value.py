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
import subprocess
import pyopencl as cl
import pytest
import os
from os import path
import numpy as np
from test import test_common
from test.test_common import offset_type


kernelname = test_common.mangle('test_floats', ['float *'])


@pytest.fixture(scope='module')
def extract_value_cl():
    # lets check it's compileable ll first, using llvm
    ll_filepath = 'test/extract_value.ll'

    with open(ll_filepath, 'r') as f:
        ll_sourcecode = f.read()
    cl_sourcecode = test_common.ll_to_cl(ll_sourcecode=ll_sourcecode, kernelName=kernelname, num_clmems=1)
    return cl_sourcecode


@pytest.fixture(scope='module')
def extract_value(context, extract_value_cl):
    prog = cl.Program(context, extract_value_cl).build()
    return prog


def test_program_compiles(extract_value):
    pass


def test_copy_float(extract_value, q, float_data, float_data_gpu):
    extract_value.__getattr__(kernelname)(q, (32,), (32,), float_data_gpu, offset_type(0), cl.LocalMemory(4))
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == float_data[1]
