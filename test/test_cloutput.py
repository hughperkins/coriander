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
from test.test_common import compile_code
from test.test_common import offset_type


@pytest.fixture(scope='module')
def cuSourcecode():
    with open('test/testcudakernel1.cu', 'r') as f:
        return f.read()

# @pytest.fixture(scope='module')
# def testcudakernel1_cl():
#     # cl_path = 'test/generated/testcudakernel1-device.cl'
#     # print(subprocess.check_output([
#     #     'make',
#     #     cl_path
#     # ]).decode('utf-8'))
#     # we need to fix this to be a bit more robust to makefile changes...
#     for file in os.listdir('test/generated'):
#         if file.startswith('testcudakernel'):
#             os.unlink('test/generated/%s' % file)
#     print(subprocess.check_output([
#         'bin/cocl',
#         '-c', '-o', 'test/generated/testcudakernel1.o',
#         'test/testcudakernel1.cu'
#     ] + test_common.cocl_options()).decode('utf-8'))
#     cl_path = 'test/generated/testcudakernel1-device.cl'
#     return cl_path


# @pytest.fixture(scope='module')
# def testcudakernel1(context, testcudakernel1_cl):
#     with open(testcudakernel1_cl, 'r') as f:
#         sourcecode = f.read()

#     prog = cl.Program(context, sourcecode).build()
#     return prog


def test_insertvalue(context, q, float_data, float_data_gpu):
    sourcecode = """
struct mystruct {
    int f0;
    float f1;
};

__device__ struct mystruct doSomething(struct mystruct foo, int somevalue);

__device__ struct mystruct doSomething(struct mystruct foo, int somevalue) {
    foo.f0 = somevalue;
    foo.f1 = 4.5f;
    return foo;
}

__global__ void somekernel(float *data) {
    struct mystruct foo;
    foo.f0 = 3;
    foo.f1 = 4.5;
    foo = doSomething(foo, data[2]);
    data[0] = (int)foo.f0;
    data[1] = foo.f1;
}
"""
    mangledname = test_common.mangle('somekernel', ['float *'])
    cl_code = test_common.cu_to_cl(sourcecode, mangledname, num_clmems=1)
    print('cl_code', cl_code)
    kernel = test_common.build_kernel(context, cl_code, mangledname)


def test_foo(context, q, float_data, float_data_gpu, cuSourcecode):
    kernelName = test_common.mangle('foo', ['float *'])
    testcudakernel1 = compile_code(cl, context, cuSourcecode, kernelName, num_clmems=1)
    testcudakernel1.__getattr__(kernelName)(q, (32,), (32,), float_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(4))
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == 123


def test_copy_float(cuSourcecode, context, q, float_data, float_data_gpu):
    argTypes = ['float *']
    kernelName = test_common.mangle('copy_float', argTypes)
    testcudakernel1 = compile_code(cl, context, cuSourcecode, kernelName, num_clmems=1)
    testcudakernel1.__getattr__(kernelName)(q, (32,), (32,), float_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(4))
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    assert float_data[0] == float_data[1]


def test_use_tid2(cuSourcecode, context, q, int_data, int_data_gpu):
    int_data_orig = np.copy(int_data)
    kernelName = test_common.mangle('use_tid2', ['int *'])
    testcudakernel1 = compile_code(cl, context, cuSourcecode, kernelName, num_clmems=1)
    testcudakernel1.__getattr__(kernelName)(q, (32,), (32,), int_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(4))
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    assert int_data[0] == int_data_orig[0] + 0
    assert int_data[10] == int_data_orig[10] + 10
    assert int_data[31] == int_data_orig[31] + 31


def test_use_template1(context, q, int_data, int_data_gpu, float_data, float_data_gpu):
    code = """
template< typename T >
__device__ T addNumbers(T one, T two) {
    return one + two;
}

__global__ void use_template1(float *data, int *intdata) {
    if(threadIdx.x == 0 && blockIdx.x == 0) {
        data[0] = addNumbers(data[1], data[2]);
        intdata[0] = addNumbers(intdata[1], intdata[2]);
    }
}
"""
    kernelName = test_common.mangle('use_template1', ['float *', 'int *'])
    prog = compile_code(cl, context, code, kernelName, num_clmems=2)
    float_data_orig = np.copy(float_data)
    int_data_orig = np.copy(int_data)

    prog.__getattr__(kernelName)(q, (32,), (32,), float_data_gpu, offset_type(0), int_data_gpu, offset_type(0), offset_type(0), offset_type(0), cl.LocalMemory(4))
    cl.enqueue_copy(q, float_data, float_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    assert float_data[0] == float_data_orig[1] + float_data_orig[2]
    assert int_data[0] == int_data_orig[1] + int_data_orig[2]


def test_ternary(context, q, float_data, float_data_gpu):
    kernelSource = """
__global__ void setValue(float *data, int idx, float value) {
    if(threadIdx.x == 0) {
        data[idx] = value;
    }
}
__global__ void testTernary(float *data) {
    data[0] = data[1] > 0 ? data[2] : data[3];
}
"""
    setValueKernelName = test_common.mangle('setValue', ['float *', 'int', 'float'])
    setValueProg = compile_code(cl, context, kernelSource, setValueKernelName, num_clmems=1)

    testTernaryName = test_common.mangle('testTernary', ['float *'])
    testTernaryProg = compile_code(cl, context, kernelSource, testTernaryName, num_clmems=1)

    float_data_orig = np.copy(float_data)

    def set_float_value(gpu_buffer, idx, value):
        setValueProg.__getattr__(setValueKernelName)(
            q, (32,), (32,), float_data_gpu, offset_type(0), offset_type(0), np.int32(idx), np.float32(value), cl.LocalMemory(4))

    cl.enqueue_copy(q, float_data_gpu, float_data)
    print('float_data[:8]', float_data[:8])
    set_float_value(float_data_gpu, 1, 10)
    testTernaryProg.__getattr__(testTernaryName)(q, (32,), (32,), float_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print('float_data[:8]', float_data[:8])
    assert float_data[0] == float_data_orig[2]

    set_float_value(float_data_gpu, 1, -2)
    testTernaryProg.__getattr__(testTernaryName)(q, (32,), (32,), float_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()
    print('float_data[:8]', float_data[:8])
    assert float_data[0] == float_data_orig[3]


# Note: this test seems to fail on HD5500, but ok on 940M
# The generated opencl code seems correct, so...
# @pytest.mark.xfail(reason='fails on hd5500, not because of cocl itself, I think')
def test_structs(context, q, float_data, float_data_gpu, int_data, int_data_gpu):

    code = """
struct MyStruct {
    int myint;
    float myfloat;
};

__global__ void testStructs(MyStruct *structs, float *float_data, int *int_data) {
    int_data[0] = structs[0].myint;
    float_data[0] = structs[0].myfloat;
    float_data[1] = structs[1].myfloat;
}
"""
    kernel = test_common.compile_code_v3(
        cl, context, code, test_common.mangle('testStructs', ['MyStruct *', 'float *', 'int *']),
        num_clmems=3
    )['kernel']

    # my_struct = np.dtype([("myfloat", np.float32), ("myint", np.int32)])  # I dont know why, but seems these are back to front...
    my_struct = np.dtype([("myint", np.int32), ("myfloat", np.float32)])  # seems these are wrong way around on HD5500.  Works ok on 940M
    my_struct, my_struct_c_decl = pyopencl.tools.match_dtype_to_c_struct(
        context.devices[0], "MyStruct", my_struct)
    my_struct = cl.tools.get_or_register_dtype("MyStruct", my_struct)
    structs = np.empty(2, my_struct)
    structs[0]['myint'] = 123
    structs[0]['myfloat'] = 567
    structs[1]['myint'] = 33
    structs[1]['myfloat'] = 44
    structs_gpu = cl.array.to_device(q, structs)
    # p = structs_gpu.map_to_host(q)
    # print('p', p)
    # q.finish()
    kernel(
        q, (32,), (32,),
        structs_gpu.data, offset_type(0), float_data_gpu, offset_type(0), int_data_gpu, offset_type(0), offset_type(0), offset_type(0), offset_type(0), cl.LocalMemory(4))
    q.finish()
    cl.enqueue_copy(q, float_data, float_data_gpu)
    cl.enqueue_copy(q, int_data, int_data_gpu)
    q.finish()
    print('int_data[0]', int_data[0])
    print('int_data[1]', int_data[1])
    print('float_data[0]', float_data[0])
    print('float_data[1]', float_data[1])
    assert int_data[0] == 123
    assert float_data[0] == 567
    assert float_data[1] == 44
    # assert int_data[1] == 44


# @pytest.mark.xfail
def test_float4(cuSourcecode, context, ctx, q, float_data, float_data_gpu):
    float_data_orig = np.copy(float_data)
    kernelName = test_common.mangle('testFloat4', ['float4 *'])
    testcudakernel1 = compile_code(cl, context, cuSourcecode, kernelName, num_clmems=1)
    testcudakernel1.__getattr__(kernelName)(q, (32,), (32,), float_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(4))
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()

    print('float_data_orig[:8]', float_data_orig[:8])
    print('float_data[:8]', float_data[:8])
    assert float_data[1] == float_data_orig[4 + 2] * float_data_orig[4 + 3]


# @pytest.mark.xfail
def test_float4_test2(cuSourcecode, context, ctx, q, float_data, float_data_gpu):
    float_data_orig = np.copy(float_data)
    kernelName = test_common.mangle('testFloat4_test2', ['float4 *'])
    testcudakernel1 = compile_code(cl, context, cuSourcecode, kernelName, num_clmems=1)
    testcudakernel1.__getattr__(kernelName)(q, (32,), (32,), float_data_gpu, offset_type(0), offset_type(0), cl.LocalMemory(4))
    cl.enqueue_copy(q, float_data, float_data_gpu)
    q.finish()

    print('float_data_orig[:8]', float_data_orig[:8])
    print('float_data[:8]', float_data[:8])
    for i in range(4):
        assert float_data[i] == float_data_orig[i + 4]


def test_long_conflicting_names(context, q):
    cu_source = """
__device__ void mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionname(float *d) {
    d[1] = 1.0f;
}

__device__ void mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnameb(float *d) {
    d[2] = 3.0f;
}

__global__ void mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamec(float *data) {
    data[0] = 123.0f;
    mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionname(data);
    mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnameb(data);
}
"""
    mangled_name = test_common.mangle(
        'mysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamemysuperlongfunctionnamec',
        ['float *'])
    cl_source = test_common.cu_to_cl(cu_source, mangled_name, num_clmems=1)
    print('cl_source', cl_source)
    for line in cl_source.split("\n"):
        if line.strip().startswith('/*'):
            continue
        if not line.strip().replace('kernel ', '').strip().startswith('void'):
            continue
        name = line.replace('kernel ', '').replace('void ', '').split('(')[0]
        if name != '':
            print('name', name)
            # assert len(name) <= 32
    # test_common.build_kernel(context, cl_source, mangled_name[:31])
    test_common.build_kernel(context, cl_source, mangled_name)


def test_short_names(context):
    cu_source = """
__device__ void funca(float *d);

__device__ void funca(float *d) {
    d[1] = 1.0f;
}

__device__ void funcb(float *d, int c) {
    d[2] = 3.0f + 5 - d[c];
}

__global__ void funck(float *data) {
    data[0] = 123.0f;
    funca(data);
    funcb(data, (int)data[6]);
    for(int i = 0; i < 1000; i++) {
        funcb(data + i, (int)data[i + 100]);
    }
}
"""
    mangled_name = test_common.mangle('funck', ['float *'])
    cl_source = test_common.cu_to_cl(cu_source, mangled_name, num_clmems=1)
    print('cl_source', cl_source)

    test_common.build_kernel(context, cl_source, mangled_name[:31])
