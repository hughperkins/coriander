// This is from Eigen unsupported/test/cxx11_tensor_cuda.cu

#define EIGEN_TEST_NO_LONGDOUBLE
#define EIGEN_TEST_NO_COMPLEX
#define EIGEN_TEST_FUNC cuda_elementwise
#define EIGEN_USE_GPU

// #if defined __CUDACC_VER__ && __CUDACC_VER__ >= 70500
// #include <cuda_fp16.h>
// #endif
#include <unsupported/Eigen/CXX11/Tensor>

#include "main.h"

#include <iostream>

using Eigen::Tensor;

void test_cuda_elementwise()
{
  Tensor<float, 3> in1(Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  Tensor<float, 3> in2(Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  Tensor<float, 3> in3(Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  Tensor<float, 3> out(Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  in1.setRandom();
  in2.setRandom();
  in3.setRandom();

  std::size_t in1_bytes = in1.size() * sizeof(float);
  std::size_t in2_bytes = in2.size() * sizeof(float);
  std::size_t in3_bytes = in3.size() * sizeof(float);
  std::size_t out_bytes = out.size() * sizeof(float);

  float* d_in1;
  float* d_in2;
  float* d_in3;
  float* d_out;
  cudaMalloc((void**)(&d_in1), in1_bytes);
  cudaMalloc((void**)(&d_in2), in2_bytes);
  cudaMalloc((void**)(&d_in3), in3_bytes);
  cudaMalloc((void**)(&d_out), out_bytes);

  cudaMemcpy(d_in1, in1.data(), in1_bytes, cudaMemcpyHostToDevice);
  cudaMemcpy(d_in2, in2.data(), in2_bytes, cudaMemcpyHostToDevice);
  cudaMemcpy(d_in3, in3.data(), in3_bytes, cudaMemcpyHostToDevice);

  Eigen::CudaStreamDevice stream;
  Eigen::GpuDevice gpu_device(&stream);

  Eigen::TensorMap<Eigen::Tensor<float, 3> > gpu_in1(d_in1, Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  Eigen::TensorMap<Eigen::Tensor<float, 3> > gpu_in2(d_in2, Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  Eigen::TensorMap<Eigen::Tensor<float, 3> > gpu_in3(d_in3, Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  Eigen::TensorMap<Eigen::Tensor<float, 3> > gpu_out(d_out, Eigen::array<Eigen::DenseIndex, 3>(72,53,97));

  gpu_out.device(gpu_device) = gpu_in1 + gpu_in2 * gpu_in3;

  assert(cudaMemcpyAsync(out.data(), d_out, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

  for (int i = 0; i < 72; ++i) {
    for (int j = 0; j < 53; ++j) {
      for (int k = 0; k < 97; ++k) {
        float diff = out(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)) - (in1(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)) + in2(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)) * in3(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)));
        if(abs(diff) >= 0.00001f) {
          std::cout << "i=" << i << " j=" << j << " k=" << k << " diff=" << diff << std::endl;
        }
        VERIFY_IS_APPROX(out(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)), in1(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)) + in2(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)) * in3(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)));
      }
    }
  }

  cudaFree(d_in1);
  cudaFree(d_in2);
  cudaFree(d_in3);
  cudaFree(d_out);
  std::cout << "finished ok" << std::endl;
}
