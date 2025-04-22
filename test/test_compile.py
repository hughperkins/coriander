import pytest
from test import test_common


test_definitions = [
    {'file': "test/struct_initializer.cu", 'kernels':
        {'somekernel': 1, 'somekernel2': 1, 'getFooValue': 2, 'getBarValue': 1}},
    {'file': "test/phiaddressspace.cu", 'kernels': {'mykernel': 2}},
    {'file': "test/test_local.cu", 'kernels': {'testLocal': 2, 'testLocal2': 2}},
    {'file': "test/pointerpointer.cu", 'kernels': {'mykernel': 2, 'myte6kernel': 3}}
]


def get_test_definitions():
    tests = []
    # for filepath, kernelnames in test_definitions.items():
    for defn in test_definitions:
        filepath = defn['file']
        clmems_by_kernel = defn['kernels']
        # for kernelname in kernelnames:
        for kernelname, num_clmems in clmems_by_kernel.items():
            test = (filepath, kernelname, num_clmems)
            if 'struct' in filepath:
                print('marking xfail')
                # TODO: fix this
                # test = pytest.mark.xfail(reason='need global constants')(test)
            tests.append(test)
    return tests


TEST_DEFINITIONS = get_test_definitions()
print('TEST_DEFINITIONS', TEST_DEFINITIONS)


@pytest.mark.parametrize("cu_filepath,kernelname,num_clmems", TEST_DEFINITIONS)
def test_compile(context, cu_filepath, kernelname, num_clmems):
    with open(cu_filepath, 'r') as f:
        cu_code = f.read()

    ll_sourcecode = test_common.cu_to_ll(cu_code)

    for line in ll_sourcecode.split('\n'):
        if line.startswith('define') and kernelname in line:
            mangledname = line.split('@')[1].split('(')[0]
            break

    print('mangledname', mangledname)

    cl_code = test_common.cu_to_cl(cu_code, mangledname, num_clmems=num_clmems)
    print('got cl_code')

    test_common.build_kernel(context, cl_code, mangledname)
    print('after build kernel')


@pytest.mark.xfail(reason='need to re-implement global variables')
def test_no_pointer_struct_pointer(context):
    with open("test/pointerpointer.cu", 'r') as f:
        cu_code = f.read()

    cl_code = test_common.cu_to_cl(cu_code, '_Z11myte6kernelP16TensorEvaluator6PfP9GpuDeviceiii', num_clmems=3)
    kernel_line = None
    for line in cl_code.split('\n'):
        print(line)
        if line.startswith('kernel'):
            kernel_line = line
    assert kernel_line is not None
    assert 'class_GpuDevice_nopointers' in cl_code
    # assert 'class_GpuDevice_nopointers' in kernel_line
