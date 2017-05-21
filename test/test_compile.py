import pytest
from test import test_common


test_definitions = [
    {'file': "test/struct_initializer.cu", 'kernels':
        {'somekernel': 2, 'somekernel2': 2, 'getFooValue': 2, 'getBarValue': 2}},
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
                test = pytest.mark.xfail(reason='need global constants')(test)
            tests.append(test)
    return tests


@pytest.mark.parametrize("cu_filepath,kernelname,num_clmems", get_test_definitions())
def test_compile(context, cu_filepath, kernelname, num_clmems):
    with open(cu_filepath, 'r') as f:
        cu_code = f.read()

    try:
        cl_code = test_common.cu_to_cl(cu_code, '', num_clmems=num_clmems)
    except:
        pass

    with open('/tmp/testprog-device.ll') as f:
        ll_code = f.read()

    for line in ll_code.split('\n'):
        if line.startswith('define') and kernelname in line:
            mangledname = line.split('@')[1].split('(')[0]
            break

    print('mangledname', mangledname)

    cl_code = test_common.cu_to_cl(cu_code, mangledname, num_clmems=num_clmems)

    test_common.build_kernel(context, cl_code, mangledname)


def test_no_pointer_struct_ointer(context):
    with open("test/pointerpointer.cu", 'r') as f:
        cu_code = f.read()

    cl_code = test_common.cu_to_cl(cu_code, '_Z11myte6kernelP16TensorEvaluator6PfP9GpuDeviceiii')
    kernel_line = None
    for line in cl_code.split('\n'):
        if line.startswith('kernel'):
            kernel_line = line
    assert kernel_line is not None
    assert 'class_GpuDevice_nopointers' in kernel_line
