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
  Tensor<int64_t, 3> in1(Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  Tensor<int64_t, 3> in2(Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  Tensor<bool, 3> out(Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  in1.setRandom();
  in2.setRandom();

  std::size_t in1_bytes = in1.size() * sizeof(int64_t);
  std::size_t in2_bytes = in2.size() * sizeof(int64_t);
  std::size_t out_bytes = out.size() * sizeof(bool);

  int64_t* d_in1;
  int64_t* d_in2;
  bool* d_out;
  cudaMalloc((void**)(&d_in1), in1_bytes);
  cudaMalloc((void**)(&d_in2), in2_bytes);
  cudaMalloc((void**)(&d_out), out_bytes);

  cudaMemcpy(d_in1, in1.data(), in1_bytes, cudaMemcpyHostToDevice);
  cudaMemcpy(d_in2, in2.data(), in2_bytes, cudaMemcpyHostToDevice);

  Eigen::CudaStreamDevice stream;
  Eigen::GpuDevice gpu_device(&stream);

  Eigen::TensorMap<Eigen::Tensor<int64_t, 3> > gpu_in1(d_in1, Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  Eigen::TensorMap<Eigen::Tensor<int64_t, 3> > gpu_in2(d_in2, Eigen::array<Eigen::DenseIndex, 3>(72,53,97));
  Eigen::TensorMap<Eigen::Tensor<bool, 3> > gpu_out(d_out, Eigen::array<Eigen::DenseIndex, 3>(72,53,97));

  gpu_out.device(gpu_device) = gpu_in1 == gpu_in2;

  assert(cudaMemcpyAsync(out.data(), d_out, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

  for (int i = 0; i < 72; ++i) {
    for (int j = 0; j < 53; ++j) {
      for (int k = 0; k < 97; ++k) {
        assert(out(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)) == (in1(Eigen::array<Eigen::DenseIndex, 3>(i,j,k)) == in2(Eigen::array<Eigen::DenseIndex, 3>(i,j,k))));
      }
    }
  }

  cudaFree(d_in1);
  cudaFree(d_in2);
  cudaFree(d_out);
  std::cout << "finished ok" << std::endl;
}
