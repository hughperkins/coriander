"""
For now, test it compiles (which it wont...)
"""

import subprocess
import pyopencl as cl
import pytest
import os
from os import path


gpu_idx = int(os.environ.get('TARGET_GPU', 0))

mf = cl.mem_flags

clang_path = 'clang++-3.8'


def mangle(name, param_types):
    mangled = '_Z%s%s' % (len(name), name)
    for param in param_types:
        if param.replace(' ', '') == 'float*':
            mangled += 'Pf'
        elif param.replace(' ', '') == 'int*':
            mangled += 'Pi'
        elif param.replace(' ', '') == 'int':
            mangled += 'i'
        elif param.replace(' ', '') == 'float':
            mangled += 'f'
        elif param.endswith('*'):
            # assume pointer to struct
            param = param.replace(' ', '').replace('*', '')
            mangled += 'P%s%s' % (len(param), param)
        else:
            raise Exception('not implemented %s' % param)
    return mangled


@pytest.fixture(scope='module')
def context():
    platforms = cl.get_platforms()
    i = 0
    ctx = None
    for platform in platforms:
        gpu_devices = platform.get_devices(device_type=cl.device_type.GPU)
        if gpu_idx < i + len(gpu_devices):
            ctx = cl.Context(devices=[gpu_devices[gpu_idx - i]])
            break
        i += len(gpu_devices)

    if ctx is None:
        raise Exception('unable to find gpu at index %s' % gpu_idx)
    print('context', ctx)
    # ctx = cl.create_some_context()
    return ctx


@pytest.fixture(scope='module')
def queue(context):
    q = cl.CommandQueue(context)
    return q


@pytest.fixture(scope='module')
def q(queue):
    return queue


@pytest.fixture(scope='module')
def ctx(context):
    return context


@pytest.fixture(scope='module')
def extract_value_cl():
    ll_filepath = 'tensorflow/generated/cwise_op_gpu_add-deviceside.ll'
    cl_filepath = 'tensorflow/generated/cwise_op_gpu_add-deviceside.cl'

    if not path.isdir('tensorflow/generated'):
        os.makedirs('tensorflow/generated')
    if not path.isfile(cl_filepath) or path.getctime(ll_filepath) > path.getctime(cl_filepath):
        print(subprocess.check_output([
            'build/ir-to-opencl',
            ll_filepath,
            cl_filepath
        ]).decode('utf-8'))
    return cl_filepath


@pytest.fixture(scope='module')
def cwise_op_gpu_add(context, extract_value_cl):
    with open(extract_value_cl, 'r') as f:
        sourcecode = f.read()

    prog = cl.Program(context, sourcecode).build()
    return prog


@pytest.mark.xfail
def test_program_compiles(cwise_op_gpu_add):
    pass
