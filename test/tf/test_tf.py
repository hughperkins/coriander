"""
Try to run a tf kernel
Check does/doesnt work
"""
import numpy as np
import pyopencl as cl
import subprocess
from test import test_common
from test.test_common import compile_code


def test_cwise_sqrt(context, q, float_data, float_data_gpu):
    options = test_common.cocl_options()
    i = 0
    opt_options = []
    iropencl_options = []
    while i < len(options):
        if options[i] == '--devicell-opt':
            opt_options.append('-' + options[i + 1])
            i += 2
            continue
        if options[i] in ['--run_branching_transforms', '--branches_as_switch']:
            iropencl_options.append(options[i])
            i += 1
            continue
        raise Exception('unknown option ', options[i])
        i += 1
    res = subprocess.run([
        'opt-3.8'
    ] + opt_options + [
        '-S',
        'test/tf/samples/cwise_op_gpu_sqrt-device-noopt.ll',
        '-o', '/tmp/test-opt.ll'
    ], stdout=subprocess.PIPE)
    print(' '.join(res.args))
    assert res.returncode == 0

    res = subprocess.run([
        'build/ir-to-opencl'
    ] + iropencl_options + [
        '--inputfile', '/tmp/test-opt.ll',
        '--outputfile', '/tmp/test-device.cl'
    ], stdout=subprocess.PIPE)
    print(' '.join(res.args))
    assert res.returncode == 0

    with open('/tmp/test-device.cl', 'r') as f:
        cl_sourcecode = f.read()

    prog = cl.Program(context, cl_sourcecode).build()

    N = 10

    # global struct Eigen__TensorEvaluator_7_nopointers* eval_nopointers, global float* eval_ptr0, long eval_ptr0_offset, global float* eval_ptr1, long eval_ptr1_offset, global float* eval_ptr2, long eval_ptr2_offset, long size, local int *scratch

    # what we need:
    # struct Eigen__TensorEvaluator_7_nopointers   Note that none of the values we copy across are actually use, so we can just create a sufficiently large buffer...
    # global float *eval_ptr0  => this will receive the result.  just create a sufficiently large buffer
    # ptr0_offset => 0
    # eval_ptr1 => will contian the data we want to reduce
    # eval_ptr1_offset=> 0
    # eval_ptr2 => just send in a tiny buffer, size 4
    # eval_ptr2_offset => set to -1, means 'null ointer'
    # size =>  eg 10, to reduce 10 values
    # scratch => set to workgroupsize * sizeof(float)

    eval_nopointers_gpu = cl.Buffer(context, cl.mem_flags.READ_WRITE, size=4096)

    eval_ptr0 = np.random.randn(1024).astype(np.float32)
    eval_ptr0_gpu = cl.Buffer(context, cl.mem_flags.READ_WRITE | cl.mem_flags.COPY_HOST_PTR, hostbuf=eval_ptr0)
    eval_ptr0_offset = 0

    eval_ptr1 = np.random.randn(1024).astype(np.float32)
    eval_ptr1_gpu = cl.Buffer(context, cl.mem_flags.READ_WRITE | cl.mem_flags.COPY_HOST_PTR, hostbuf=eval_ptr1)
    eval_ptr1_offset = 0

    eval_ptr2_gpu = cl.Buffer(context, cl.mem_flags.READ_WRITE, size=128)
    eval_ptr2_offset = -1

    size = N

    global_size = 256
    workgroup_size = 256
    scratch = workgroup_size * 4

    prog.__getattr__('_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16ENS_11MakePointerEEEKNS_19TensorCwiseBinaryOpINS0_23scalar_sqrt_gradient_opIfEEKNS4_INS5_IKfLi1ELi1EiEELi16ES7_EEKNS4_INS5_ISC_Li1ELi1ElEELi16ES7_EEEEEENS_9GpuDeviceEEElEEvT_T0_')(
        q, (global_size,), (workgroup_size,),
        eval_nopointers_gpu,
        eval_ptr0_gpu, np.int64(eval_ptr0_offset),
        eval_ptr1_gpu, np.int64(eval_ptr1_offset),
        eval_ptr2_gpu, np.int64(eval_ptr2_offset),
        np.int64(size),
        cl.LocalMemory(scratch)
    )
    # copy eval_ptr0 back, and check the results...
    cl.enqueue_copy(q, eval_ptr0, eval_ptr0_gpu)
    q.finish()
    print('eval_ptr0', eval_ptr0[0])

    assert eval_ptr0[0] != 0

    expected_sum = 0
    for i in range(N):
        expected_sum += eval_ptr1[i]
    print('epxected_sum', expected_sum)
    assert abs(expected_sum - eval_ptr0[0]) < 1e-4
