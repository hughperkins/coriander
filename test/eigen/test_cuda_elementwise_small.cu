// This is from Eigen unsupported/test folder
// will gradually uncomment lines, and fix the issues which thus arise

#define EIGEN_TEST_NO_LONGDOUBLE
#define EIGEN_TEST_NO_COMPLEX
// #define EIGEN_TEST_FUNC cxx11_tensor_cuda
#define EIGEN_USE_GPU

// #if defined __CUDACC_VER__ && __CUDACC_VER__ >= 70500
// #include <cuda_fp16.h>
// #endif
#include <unsupported/Eigen/CXX11/Tensor>

#include "main.h"

using Eigen::Tensor;

// #include "main.h"

void test_cuda_elementwise_small() {
  Tensor<float, 1> in1(Eigen::array<Eigen::DenseIndex, 1>(2));
  Tensor<float, 1> in2(Eigen::array<Eigen::DenseIndex, 1>(2));
  Tensor<float, 1> out(Eigen::array<Eigen::DenseIndex, 1>(2));
  // in1.setRandom();
  // in2.setRandom();

  std::size_t in1_bytes = in1.size() * sizeof(float);
  std::size_t in2_bytes = in2.size() * sizeof(float);
  std::size_t out_bytes = out.size() * sizeof(float);

  float* d_in1;
  float* d_in2;
  float* d_out;
  cudaMalloc((void**)(&d_in1), in1_bytes);
  cudaMalloc((void**)(&d_in2), in2_bytes);
  cudaMalloc((void**)(&d_out), out_bytes);

  // cudaMemcpy(d_in1, in1.data(), in1_bytes, cudaMemcpyHostToDevice);
  // cudaMemcpy(d_in2, in2.data(), in2_bytes, cudaMemcpyHostToDevice);

  // Eigen::CudaStreamDevice stream;
  // Eigen::GpuDevice gpu_device(&stream);

  // Eigen::TensorMap<Eigen::Tensor<float, 1>, Eigen::Aligned> gpu_in1(
  //     d_in1, Eigen::array<Eigen::DenseIndex, 1>(2));
  // Eigen::TensorMap<Eigen::Tensor<float, 1>, Eigen::Aligned> gpu_in2(
  //     d_in2, Eigen::array<Eigen::DenseIndex, 1>(2));
  // Eigen::TensorMap<Eigen::Tensor<float, 1>, Eigen::Aligned> gpu_out(
  //     d_out, Eigen::array<Eigen::DenseIndex, 1>(2));

  // gpu_out.device(gpu_device) = gpu_in1 + gpu_in2;

  // assert(cudaMemcpyAsync(out.data(), d_out, out_bytes, cudaMemcpyDeviceToHost,
  //                        gpu_device.stream()) == cudaSuccess);
  // assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

  // for (int i = 0; i < 2; ++i) {
  //   VERIFY_IS_APPROX(
  //       out(Eigen::array<Eigen::DenseIndex, 1>(i)),
  //       in1(Eigen::array<Eigen::DenseIndex, 1>(i)) + in2(Eigen::array<Eigen::DenseIndex, 1>(i)));
  // }

  cout << "d_out " << d_out << endl;
  cout << "d_in2 " << d_in2 << endl;

  cudaFree(d_in1);
  cudaFree(d_in2);
  cudaFree(d_out);
}

// int main(int argc, char *argv[]) {
//   test_cuda_elementwise_small();
//   return 0;
// }
