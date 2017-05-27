#!/bin/bash

# run from 'build' subdir

make -j 8 patch_hostside || exit 1
./patch_hostside --devicellfile ../test/tf/random_op_gpu-device-noopt.ll \
  --hostpatchedfile random_op_gpu-hostpatched.ll \
  --hostrawfile ../test/tf/random_op_gpu-hostraw.ll

# to check:
# _ZN10tensorflow7functor28FillPhiloxRandomKernelLaunchINS_6random27TruncatedNormalDistributionINS2_19SingleSampleAdapterINS2_12PhiloxRandomEEEfEEEEvS5_PNT_17ResultElementTypeExS8_
