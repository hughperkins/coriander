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
  const int N = 3;

  Tensor<float, 1> in1(N);
  Tensor<float, 1> out(1);
  in1.setRandom();

  std::size_t in1_bytes = in1.size() * sizeof(float);
  std::size_t out_bytes = out.size() * sizeof(float);

  std::cout << "in1.data(): ";
  for(int i = 0; i < N; i++) {
    std::cout << " " << in1.data()[i];
  }
  std::cout << std::endl;

  float* d_in1;
  float* d_out;
  cudaMalloc((void**)(&d_in1), in1_bytes);
  cudaMalloc((void**)(&d_out), out_bytes);

  cudaMemcpy(d_in1, in1.data(), in1_bytes, cudaMemcpyHostToDevice);

  Eigen::CudaStreamDevice stream;
  Eigen::GpuDevice gpu_device(&stream);

  Eigen::TensorMap<Eigen::Tensor<float, 1> > gpu_in1(d_in1, N);
  Eigen::TensorMap<Eigen::Tensor<float, 1> > gpu_out(d_out, 1);

  array<Eigen::DenseIndex, 1> reduction_axis;
  reduction_axis[0] = 0;

  gpu_out.device(gpu_device) = gpu_in1.sum(reduction_axis);

  assert(cudaMemcpyAsync(out.data(), d_out, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

  std::cout << "out.data()[0] " << out.data()[0] << std::endl;

  assert(cudaMemcpyAsync(in1.data(), d_in1, in1_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);
  std::cout << "in1.data()[0] " << in1.data()[0] << std::endl;

  float sum = 0;
  for (int i = 0; i < N; ++i) {
    sum += in1(i);
  }
  std::cout << "expected sum: " << sum << std:: endl;
  std::cout << "kernel sum: " << out(0) << std::endl;
  VERIFY_IS_APPROX(out(0), sum);

  cudaFree(d_in1);
  cudaFree(d_out);
}
