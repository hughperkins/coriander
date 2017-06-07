// This is from Eigen unsupported/test/cxx11_tensor_cuda.cu

#define EIGEN_TEST_NO_LONGDOUBLE
#define EIGEN_TEST_NO_COMPLEX
#define EIGEN_TEST_FUNC cuda_nullary
#define EIGEN_USE_GPU

// #if defined __CUDACC_VER__ && __CUDACC_VER__ >= 70500
// #include <cuda_fp16.h>
// #endif
#include <unsupported/Eigen/CXX11/Tensor>

#include "main.h"

#include <iostream>

using Eigen::Tensor;

void test_cuda_nullary() {
  Tensor<float, 1, 0, int> in1(2);
  Tensor<float, 1, 0, int> in2(2);
  in1.setRandom();
  in2.setRandom();

  std::size_t tensor_bytes = in1.size() * sizeof(float);

  float* d_in1;
  float* d_in2;
  cudaMalloc((void**)(&d_in1), tensor_bytes);
  cudaMalloc((void**)(&d_in2), tensor_bytes);
  cudaMemcpy(d_in1, in1.data(), tensor_bytes, cudaMemcpyHostToDevice);
  cudaMemcpy(d_in2, in2.data(), tensor_bytes, cudaMemcpyHostToDevice);

  Eigen::CudaStreamDevice stream;
  Eigen::GpuDevice gpu_device(&stream);

  Eigen::TensorMap<Eigen::Tensor<float, 1, 0, int>, Eigen::Aligned> gpu_in1(
      d_in1, 2);
  Eigen::TensorMap<Eigen::Tensor<float, 1, 0, int>, Eigen::Aligned> gpu_in2(
      d_in2, 2);

  gpu_in1.device(gpu_device) = gpu_in1.constant(3.14f);
  gpu_in2.device(gpu_device) = gpu_in2.random();

  Tensor<float, 1, 0, int> new1(2);
  Tensor<float, 1, 0, int> new2(2);

  assert(cudaMemcpyAsync(new1.data(), d_in1, tensor_bytes, cudaMemcpyDeviceToHost,
                         gpu_device.stream()) == cudaSuccess);
  assert(cudaMemcpyAsync(new2.data(), d_in2, tensor_bytes, cudaMemcpyDeviceToHost,
                         gpu_device.stream()) == cudaSuccess);

  std::cout << "1" << std::endl;
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);
  std::cout << "2" << std::endl;

  for (int i = 0; i < 2; ++i) {
    VERIFY_IS_APPROX(new1(i), 3.14f);
    VERIFY_IS_NOT_EQUAL(new2(i), in2(i));
  }

  cudaFree(d_in1);
  cudaFree(d_in2);
}
