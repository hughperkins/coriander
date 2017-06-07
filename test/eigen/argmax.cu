// Basically lifted straight from test/cxx11_tensor_argmax_cuda.cu

#define EIGEN_TEST_NO_LONGDOUBLE
#define EIGEN_TEST_NO_COMPLEX
#define EIGEN_TEST_FUNC argmax_all
#define EIGEN_USE_GPU

// this is needed on Beignet 1.2.1, Intel HD5500 (as far as I can tell?)
// #define EIGEN_DEFAULT_DENSE_INDEX_TYPE int32_t

// #define CALL_SUBTEST_1(expr) expr
// #define CALL_SUBTEST_2(expr) expr
// #define CALL_SUBTEST_3(expr) expr

#include <unsupported/Eigen/CXX11/Tensor>

#include "main.h"

#include <iostream>

using Eigen::Tensor;

void test_cuda_simple_argmax_tiny_rowmajor()
{
  std::cout << "test" << std::endl;
  #define N 5
  Tensor<float, 1, RowMajor> in(Eigen::array<DenseIndex, 1>(N));
  Tensor<DenseIndex, 1, RowMajor> out_max(Eigen::array<DenseIndex, 1>(1));

  in(0) = 3.0f;
  in(1) = 4.0f;
  in(2) = 7.0f;
  in(3) = 5.0f;
  in(4) = 1.0f;

  std::size_t in_bytes = in.size() * sizeof(float);
  std::size_t out_bytes = out_max.size() * sizeof(DenseIndex);

  float* d_in;
  DenseIndex* d_out_max;

  cudaMalloc((void**)(&d_in), in_bytes);
  cudaMalloc((void**)(&d_out_max), out_bytes);


  cudaMemcpy(d_in, in.data(), in_bytes, cudaMemcpyHostToDevice);

  Eigen::CudaStreamDevice stream;
  Eigen::GpuDevice gpu_device(&stream);

  Eigen::TensorMap<Eigen::Tensor<float, 1, RowMajor>, Aligned > gpu_in(d_in, Eigen::array<DenseIndex, 1>(N));
  Eigen::TensorMap<Eigen::Tensor<DenseIndex, 1, RowMajor>, Aligned > gpu_out_max(d_out_max, Eigen::array<DenseIndex, 1>(1));

  gpu_out_max.device(gpu_device) = gpu_in.argmax();

  assert(cudaMemcpyAsync(out_max.data(), d_out_max, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

  VERIFY_IS_EQUAL(out_max(Eigen::array<DenseIndex, 1>(0)), 2);

  cudaFree(d_in);
  cudaFree(d_out_max);
}

void test_cuda_simple_argmax_rowmajor()
{
  std::cout << "test" << std::endl;
  Tensor<float, 3, RowMajor> in(Eigen::array<DenseIndex, 3>(72,53,97));
  Tensor<DenseIndex, 1, RowMajor> out_max(Eigen::array<DenseIndex, 1>(1));
  in.setRandom();
  in *= in.constant(100.0);
  in(21, 29, 76) = -1000.0;
  in(37, 43, 88) = 1000.0;

  std::size_t in_bytes = in.size() * sizeof(float);
  std::size_t out_bytes = out_max.size() * sizeof(DenseIndex);

  float* d_in;
  DenseIndex* d_out_max;
  cudaMalloc((void**)(&d_in), in_bytes);
  cudaMalloc((void**)(&d_out_max), out_bytes);

  cudaMemcpy(d_in, in.data(), in_bytes, cudaMemcpyHostToDevice);

  Eigen::CudaStreamDevice stream;
  Eigen::GpuDevice gpu_device(&stream);

  Eigen::TensorMap<Eigen::Tensor<float, 3, RowMajor>, Aligned > gpu_in(d_in, Eigen::array<DenseIndex, 3>(72,53,97));
  Eigen::TensorMap<Eigen::Tensor<DenseIndex, 1, RowMajor>, Aligned > gpu_out_max(d_out_max, Eigen::array<DenseIndex, 1>(1));

  gpu_out_max.device(gpu_device) = gpu_in.argmax();

  assert(cudaMemcpyAsync(out_max.data(), d_out_max, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

  VERIFY_IS_EQUAL(out_max(Eigen::array<DenseIndex, 1>(0)), 37*53*97 + 43*97 + 88);

  cudaFree(d_in);
  cudaFree(d_out_max);
}

void test_cuda_simple_argmin_rowmajor()
{
  std::cout << "test" << std::endl;
  Tensor<float, 3, RowMajor> in(Eigen::array<DenseIndex, 3>(72,53,97));
  Tensor<DenseIndex, 1, RowMajor> out_min(Eigen::array<DenseIndex, 1>(1));
  in.setRandom();
  in *= in.constant(100.0);
  in(21, 29, 76) = -1000.0;
  in(37, 43, 88) = 1000.0;

  std::size_t in_bytes = in.size() * sizeof(float);
  std::size_t out_bytes = out_min.size() * sizeof(DenseIndex);

  float* d_in;
  DenseIndex* d_out_min;
  cudaMalloc((void**)(&d_in), in_bytes);
  cudaMalloc((void**)(&d_out_min), out_bytes);

  cudaMemcpy(d_in, in.data(), in_bytes, cudaMemcpyHostToDevice);

  Eigen::CudaStreamDevice stream;
  Eigen::GpuDevice gpu_device(&stream);

  Eigen::TensorMap<Eigen::Tensor<float, 3, RowMajor>, Aligned > gpu_in(d_in, Eigen::array<DenseIndex, 3>(72,53,97));
  Eigen::TensorMap<Eigen::Tensor<DenseIndex, 1, RowMajor>, Aligned > gpu_out_min(d_out_min, Eigen::array<DenseIndex, 1>(1));

  gpu_out_min.device(gpu_device) = gpu_in.argmin();

  assert(cudaMemcpyAsync(out_min.data(), d_out_min, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

  VERIFY_IS_EQUAL(out_min(Eigen::array<DenseIndex, 1>(0)), 21*53*97 + 29*97 + 76);

  cudaFree(d_in);
  cudaFree(d_out_min);
}

void test_cuda_simple_argmax_colmajor()
{
  std::cout << "test" << std::endl;
  Tensor<float, 3, ColMajor> in(Eigen::array<DenseIndex, 3>(72,53,97));
  Tensor<DenseIndex, 1, ColMajor> out_max(Eigen::array<DenseIndex, 1>(1));
  in.setRandom();
  in *= in.constant(100.0);
  in(21, 29, 76) = -1000.0;
  in(37, 43, 88) = 1000.0;

  std::size_t in_bytes = in.size() * sizeof(float);
  std::size_t out_bytes = out_max.size() * sizeof(DenseIndex);

  float* d_in;
  DenseIndex* d_out_max;
  cudaMalloc((void**)(&d_in), in_bytes);
  cudaMalloc((void**)(&d_out_max), out_bytes);

  cudaMemcpy(d_in, in.data(), in_bytes, cudaMemcpyHostToDevice);

  Eigen::CudaStreamDevice stream;
  Eigen::GpuDevice gpu_device(&stream);

  Eigen::TensorMap<Eigen::Tensor<float, 3, ColMajor>, Aligned > gpu_in(d_in, Eigen::array<DenseIndex, 3>(72,53,97));
  Eigen::TensorMap<Eigen::Tensor<DenseIndex, 1, ColMajor>, Aligned > gpu_out_max(d_out_max, Eigen::array<DenseIndex, 1>(1));

  gpu_out_max.device(gpu_device) = gpu_in.argmax();

  assert(cudaMemcpyAsync(out_max.data(), d_out_max, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

  VERIFY_IS_EQUAL(out_max(Eigen::array<DenseIndex, 1>(0)), 88*53*72 + 43*72 + 37);

  cudaFree(d_in);
  cudaFree(d_out_max);
}

void test_cuda_simple_argmin_colmajor()
{
  std::cout << "test" << std::endl;
  Tensor<float, 3, ColMajor> in(Eigen::array<DenseIndex, 3>(72,53,97));
  Tensor<DenseIndex, 1, ColMajor> out_min(Eigen::array<DenseIndex, 1>(1));
  in.setRandom();
  in *= in.constant(100.0);
  in(21, 29, 76) = -1000.0;
  in(37, 43, 88) = 1000.0;

  std::size_t in_bytes = in.size() * sizeof(float);
  std::size_t out_bytes = out_min.size() * sizeof(DenseIndex);

  float* d_in;
  DenseIndex* d_out_min;
  cudaMalloc((void**)(&d_in), in_bytes);
  cudaMalloc((void**)(&d_out_min), out_bytes);

  cudaMemcpy(d_in, in.data(), in_bytes, cudaMemcpyHostToDevice);

  Eigen::CudaStreamDevice stream;
  Eigen::GpuDevice gpu_device(&stream);

  Eigen::TensorMap<Eigen::Tensor<float, 3, ColMajor>, Aligned > gpu_in(d_in, Eigen::array<DenseIndex, 3>(72,53,97));
  Eigen::TensorMap<Eigen::Tensor<DenseIndex, 1, ColMajor>, Aligned > gpu_out_min(d_out_min, Eigen::array<DenseIndex, 1>(1));

  gpu_out_min.device(gpu_device) = gpu_in.argmin();

  assert(cudaMemcpyAsync(out_min.data(), d_out_min, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
  assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

  VERIFY_IS_EQUAL(out_min(Eigen::array<DenseIndex, 1>(0)), 76*53*72 + 29*72 + 21);

  cudaFree(d_in);
  cudaFree(d_out_min);
}

template <int DataLayout>
void test_cuda_argmax_dim()
{
  Tensor<float, 4, DataLayout> tensor(2,3,5,7);
  std::vector<int> dims;
  dims.push_back(2); dims.push_back(3); dims.push_back(5); dims.push_back(7);

  for (int dim = 0; dim < 4; ++dim) {
    tensor.setRandom();
    tensor = (tensor + tensor.constant(0.5)).log();

    array<DenseIndex, 3> out_shape;
    for (int d = 0; d < 3; ++d) out_shape[d] = (d < dim) ? dims[d] : dims[d+1];

    Tensor<DenseIndex, 3, DataLayout> tensor_arg(out_shape);

    array<DenseIndex, 4> ix;
    for (int i = 0; i < 2; ++i) {
      for (int j = 0; j < 3; ++j) {
        for (int k = 0; k < 5; ++k) {
          for (int l = 0; l < 7; ++l) {
            ix[0] = i; ix[1] = j; ix[2] = k; ix[3] = l;
            if (ix[dim] != 0) continue;
            // suppose dim == 1, then for all i, k, l, set tensor(i, 0, k, l) = 10.0
            tensor(ix) = 10.0;
          }
        }
      }
    }

    std::size_t in_bytes = tensor.size() * sizeof(float);
    std::size_t out_bytes = tensor_arg.size() * sizeof(DenseIndex);

    float* d_in;
    DenseIndex* d_out;
    cudaMalloc((void**)(&d_in), in_bytes);
    cudaMalloc((void**)(&d_out), out_bytes);

    cudaMemcpy(d_in, tensor.data(), in_bytes, cudaMemcpyHostToDevice);

    Eigen::CudaStreamDevice stream;
    Eigen::GpuDevice gpu_device(&stream);

    Eigen::TensorMap<Eigen::Tensor<float, 4, DataLayout>, Aligned > gpu_in(d_in, Eigen::array<DenseIndex, 4>(2, 3, 5, 7));
    Eigen::TensorMap<Eigen::Tensor<DenseIndex, 3, DataLayout>, Aligned > gpu_out(d_out, out_shape);

    gpu_out.device(gpu_device) = gpu_in.argmax(dim);

    assert(cudaMemcpyAsync(tensor_arg.data(), d_out, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
    assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

    VERIFY_IS_EQUAL(tensor_arg.size(),
                    size_t(2*3*5*7 / tensor.dimension(dim)));

    for (DenseIndex n = 0; n < tensor_arg.size(); ++n) {
      // Expect max to be in the first index of the reduced dimension
      VERIFY_IS_EQUAL(tensor_arg.data()[n], 0);
    }

    for (int i = 0; i < 2; ++i) {
      for (int j = 0; j < 3; ++j) {
        for (int k = 0; k < 5; ++k) {
          for (int l = 0; l < 7; ++l) {
            ix[0] = i; ix[1] = j; ix[2] = k; ix[3] = l;
            if (ix[dim] != tensor.dimension(dim) - 1) continue;
            // suppose dim == 1, then for all i, k, l, set tensor(i, 2, k, l) = 20.0
            tensor(ix) = 20.0;
          }
        }
      }
    }

    cudaMemcpy(d_in, tensor.data(), in_bytes, cudaMemcpyHostToDevice);

    gpu_out.device(gpu_device) = gpu_in.argmax(dim);

    assert(cudaMemcpyAsync(tensor_arg.data(), d_out, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
    assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

    for (DenseIndex n = 0; n < tensor_arg.size(); ++n) {
      // Expect max to be in the last index of the reduced dimension
      VERIFY_IS_EQUAL(tensor_arg.data()[n], tensor.dimension(dim) - 1);
    }

    cudaFree(d_in);
    cudaFree(d_out);
  }
}

template <int DataLayout>
void test_cuda_argmin_dim()
{
  Tensor<float, 4, DataLayout> tensor(2,3,5,7);
  std::vector<int> dims;
  dims.push_back(2); dims.push_back(3); dims.push_back(5); dims.push_back(7);

  for (int dim = 0; dim < 4; ++dim) {
    tensor.setRandom();
    tensor = (tensor + tensor.constant(0.5)).log();

    array<DenseIndex, 3> out_shape;
    for (int d = 0; d < 3; ++d) out_shape[d] = (d < dim) ? dims[d] : dims[d+1];

    Tensor<DenseIndex, 3, DataLayout> tensor_arg(out_shape);

    array<DenseIndex, 4> ix;
    for (int i = 0; i < 2; ++i) {
      for (int j = 0; j < 3; ++j) {
        for (int k = 0; k < 5; ++k) {
          for (int l = 0; l < 7; ++l) {
            ix[0] = i; ix[1] = j; ix[2] = k; ix[3] = l;
            if (ix[dim] != 0) continue;
            // suppose dim == 1, then for all i, k, l, set tensor(i, 0, k, l) = 10.0
            tensor(ix) = -10.0;
          }
        }
      }
    }

    std::size_t in_bytes = tensor.size() * sizeof(float);
    std::size_t out_bytes = tensor_arg.size() * sizeof(DenseIndex);

    float* d_in;
    DenseIndex* d_out;
    cudaMalloc((void**)(&d_in), in_bytes);
    cudaMalloc((void**)(&d_out), out_bytes);

    cudaMemcpy(d_in, tensor.data(), in_bytes, cudaMemcpyHostToDevice);

    Eigen::CudaStreamDevice stream;
    Eigen::GpuDevice gpu_device(&stream);

    Eigen::TensorMap<Eigen::Tensor<float, 4, DataLayout>, Aligned > gpu_in(d_in, Eigen::array<DenseIndex, 4>(2, 3, 5, 7));
    Eigen::TensorMap<Eigen::Tensor<DenseIndex, 3, DataLayout>, Aligned > gpu_out(d_out, out_shape);

    gpu_out.device(gpu_device) = gpu_in.argmin(dim);

    assert(cudaMemcpyAsync(tensor_arg.data(), d_out, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
    assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

    VERIFY_IS_EQUAL(tensor_arg.size(),
                    2*3*5*7 / tensor.dimension(dim));

    for (DenseIndex n = 0; n < tensor_arg.size(); ++n) {
      // Expect min to be in the first index of the reduced dimension
      VERIFY_IS_EQUAL(tensor_arg.data()[n], 0);
    }

    for (int i = 0; i < 2; ++i) {
      for (int j = 0; j < 3; ++j) {
        for (int k = 0; k < 5; ++k) {
          for (int l = 0; l < 7; ++l) {
            ix[0] = i; ix[1] = j; ix[2] = k; ix[3] = l;
            if (ix[dim] != tensor.dimension(dim) - 1) continue;
            // suppose dim == 1, then for all i, k, l, set tensor(i, 2, k, l) = 20.0
            tensor(ix) = -20.0;
          }
        }
      }
    }

    cudaMemcpy(d_in, tensor.data(), in_bytes, cudaMemcpyHostToDevice);

    gpu_out.device(gpu_device) = gpu_in.argmin(dim);

    assert(cudaMemcpyAsync(tensor_arg.data(), d_out, out_bytes, cudaMemcpyDeviceToHost, gpu_device.stream()) == cudaSuccess);
    assert(cudaStreamSynchronize(gpu_device.stream()) == cudaSuccess);

    for (DenseIndex n = 0; n < tensor_arg.size(); ++n) {
      // Expect max to be in the last index of the reduced dimension
      VERIFY_IS_EQUAL(tensor_arg.data()[n], tensor.dimension(dim) - 1);
    }

    cudaFree(d_in);
    cudaFree(d_out);
  }
}

void test_argmax_all()
{
  std::cout << "test_argmax_all()" << std::endl;
  test_cuda_simple_argmax_tiny_rowmajor();
  test_cuda_simple_argmax_rowmajor();
  test_cuda_simple_argmin_rowmajor();
  test_cuda_simple_argmax_colmajor();
  test_cuda_simple_argmin_colmajor();

  test_cuda_argmax_dim<RowMajor>();
  test_cuda_argmax_dim<ColMajor>();
  test_cuda_argmin_dim<RowMajor>();
  test_cuda_argmin_dim<ColMajor>();
}
