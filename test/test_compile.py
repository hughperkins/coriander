import pytest
from test import test_common


test_definitions = {
    "test/struct_initializer.cu": ['somekernel', 'somekernel2', 'getFooValue', 'getBarValue'],
    "test/phiaddressspace.cu": ['mykernel'],
    "test/test_local.cu": ['testLocal', 'testLocal2']
    # pytest.mark.xfail("test/generated/pointerpointer-device.cl"),
    # pytest.mark.xfail("test/eigen/generated/test_cuda_elementwise_small-device.cl"),
    # "test/eigen/generated/test_cuda_nullary-device.cl",
    # "test/eigen/generated/cxx11_tensor_cuda-device.cl"
}


def get_test_definitions():
    tests = []
    for filepath, kernelnames in test_definitions.items():
        for kernelname in kernelnames:
            test = (filepath, kernelname)
            if 'struct' in filepath:
                print('marking xfail')
                # pytest.mark.xfail(test, reason='need global constants')
                test = pytest.mark.xfail(reason='need global constants')(test)
            if 'phiaddress' in filepath:
                test = pytest.mark.xfail(reason='pointer pointer')(test)
            tests.append(test)
    return tests


@pytest.mark.parametrize("cu_filepath,kernelname", get_test_definitions())
def test_compile(context, cu_filepath, kernelname):
    # print(subprocess.check_output([
    #     'make',
    #     cl_filepath
    # ]).decode('utf-8'))

    with open(cu_filepath, 'r') as f:
        cu_code = f.read()

    # mangledname = test_common.mangle(kernelname, ['float*'])
    # if kernelname == 'mykernel':
    #     mangledname = '_Z8mykernelPf'

    try:
        cl_code = test_common.cu_to_cl(cu_code, '')
    except:
        pass

    with open('/tmp/testprog-device.ll') as f:
        ll_code = f.read()

    for line in ll_code.split('\n'):
        if line.startswith('define') and kernelname in line:
            mangledname = line.split('@')[1].split('(')[0]
            break

    print('mangledname', mangledname)

    cl_code = test_common.cu_to_cl(cu_code, mangledname)

    test_common.build_kernel(context, cl_code, mangledname)

    # print(subprocess.check_output([
    #     'bin/cocl', '-c', '-o', cl_filepath.replace('-device.cl', '.o'),
    #     cl_filepath.replace('/generated', '').replace('-device.cl', '.cu')
    # ] + test_common.cocl_options()).decode('utf-8'))

    # with open(cl_filepath, 'r') as f:
    #     sourcecode = f.read()

    # print('compiling cl for %s ...' % cl_filepath)
    # cl.Program(context, sourcecode).build()
    # print('  ... %s compiled ok' % cl_filepath)
