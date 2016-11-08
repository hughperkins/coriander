import os
import subprocess


clang_path = 'clang++-3.8'


def cocl_options():
    options = []
    # if os.environ.get('COCL_BRANCHES_AS_SWITCH', '0') != '0':
    #     options.append('--branches_as_switch')

    # if os.environ.get('COCL_RUN_TRANSFORMS', '0') != '0':
    #     options.append('--run_transforms')

    options = os.environ.get('COCL_OPTIONS', '').split()

    print('options', options)
    return options


def mangle(name, param_types):
    mangled = '_Z%s%s' % (len(name), name)
    for param in param_types:
        if param.replace(' ', '') == 'float*':
            mangled += 'Pf'
        elif param.replace(' ', '') == 'double*':
            mangled += 'Pd'
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


def compile_code(cl, context, kernelSource):
    for file in os.listdir('/tmp'):
        if file.startswith('testprog'):
            os.unlink('/tmp/%s' % file)
    with open('/tmp/testprog.cu', 'w') as f:
        f.write(kernelSource)
    # args = get_cl_generation_options()
    # if not branching_transformations:
    #     args.append('--no_branching_transforms')
    res = subprocess.run([
        'bin/cocl',
        '-c',
        '/tmp/testprog.cu'
    ] + cocl_options(), stdout=subprocess.PIPE)
    print(' '.join(res.args))
    print(res.stdout.decode('utf-8'))
    assert res.returncode == 0
    with open('/tmp/testprog-device.cl', 'r') as f:
        cl_sourcecode = f.read()
    prog = cl.Program(context, cl_sourcecode).build()
    return prog


def compile_code_v2(cl, context, kernelSource):
    """
    returns dict
    """
    for file in os.listdir('/tmp'):
        if file.startswith('testprog'):
            os.unlink('/tmp/%s' % file)
    with open('/tmp/testprog.cu', 'w') as f:
        f.write(kernelSource)
    res = subprocess.run([
        'bin/cocl',
        '-c',
        '/tmp/testprog.cu'
    ] + cocl_options(), stdout=subprocess.PIPE)
    print(' '.join(res.args))
    print(res.stdout.decode('utf-8'))
    assert res.returncode == 0
    with open('/tmp/testprog-device.cl', 'r') as f:
        cl_sourcecode = f.read()
    prog = cl.Program(context, cl_sourcecode).build()
    return {'prog': prog, 'cl_sourcecode': cl_sourcecode}
