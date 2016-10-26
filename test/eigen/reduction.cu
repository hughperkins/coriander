// This is from Eigen unsupported/test/cxx11_tensor_cuda.cu

#define EIGEN_TEST_NO_LONGDOUBLE
#define EIGEN_TEST_NO_COMPLEX
#define EIGEN_TEST_FUNC cuda_reduction
#define EIGEN_USE_GPU

// #if defined __CUDACC_VER__ && __CUDACC_VER__ >= 70500
// #include <cuda_fp16.h>
// #endif
#include <unsupported/Eigen/CXX11/Tensor>

#include "main.h"

#include <iostream>

using Eigen::Tensor;

void test_cuda_reduction()
{
  Tensor<float, 4> in1(72,53,97,113);
  Tensor<float, 2> out(72,97);
  in1.setRandom();

  std::size_t in1_bytes = in1.size() * sizeof(float);
  std::size_t out_bytes = out.size() * sizeof(float);

  float* d_in1;
  float* d_out;
  cudaMalloc((void**)(&d_in1), in1_bytes);
  cudaMalloc((void**)(&d_out), out_bytes);

  cudaMemcpy(d_in1, in1.data(), in1_bytes, cudaMemcpyHostToDevice);

  Eigen::CudaStreamDevice stream;
  Eigen::GpuDevice gpu_device(&stream);

  Eigen::TensorMap<Eigen::Tensor<float, 4> > gpu_in1(d_in1, 72,53,97,113);
  Eigen::TensorMap<Eigen::Tensor<float, 2> > gpu_out(d_out, 72,97);

  array<Eigen::DenseIndex, 2> reduction_axis;
  reduction_axis[0] = 1;
  reduction_axis[1] = 3;

  gpu_out.device(gpu_device) = gpu_in1.maximum(reduction_axis);

  assert(cudaMemcpyAsync(out.data(), d_out, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

  for (int i = 0; i < 72; ++i) {
    for (int j = 0; j < 97; ++j) {
      float expected = 0;
      for (int k = 0; k < 53; ++k) {
        for (int l = 0; l < 113; ++l) {
          expected =
              std::max<float>(expected, in1(i, k, j, l));
        }
      }
      VERIFY_IS_APPROX(out(i,j), expected);
    }
  }

  cudaFree(d_in1);
  cudaFree(d_out);
}
