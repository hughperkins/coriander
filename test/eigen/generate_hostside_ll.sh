#!/bin/bash

make test/eigen/generated/test_cuda_elementwise_small-hostraw.ll

# This segfaults right now:
make test/eigen/generated/test_cuda_elementwise_small-hostpatched.ll
