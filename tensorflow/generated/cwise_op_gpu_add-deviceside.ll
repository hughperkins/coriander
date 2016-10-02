; ModuleID = 'tensorflow/core/kernels/cwise_op_gpu_add.cu.cc'
target datalayout = "e-i64:64-v16:16-v32:32-n16:32:64"
target triple = "nvptx64-nvidia-cuda"

%"union.Eigen::half_impl::FP32" = type { i32 }
%"struct.Eigen::TensorEvaluator" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.1" }
%"struct.Eigen::TensorEvaluator.0" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::half" = type { %"struct.Eigen::half_impl::half_base" }
%"struct.Eigen::half_impl::half_base" = type { %"struct.Eigen::half_impl::__half" }
%"struct.Eigen::half_impl::__half" = type { i16 }
%"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
%"class.Eigen::array" = type { [1 x i32] }
%"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
%"class.Eigen::StreamInterface" = type { i32 (...)** }
%"struct.Eigen::TensorEvaluator.1" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::TensorEvaluator.3" }
%"struct.Eigen::internal::scalar_sum_op" = type { i8 }
%"struct.Eigen::TensorEvaluator.2" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.3" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes.4", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes.4" = type { %"class.Eigen::array.5" }
%"class.Eigen::array.5" = type { [1 x i64] }
%"struct.Eigen::TensorEvaluator.6" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.7" }
%"struct.Eigen::TensorEvaluator.7" = type { %"struct.Eigen::internal::scalar_left", %"struct.Eigen::TensorEvaluator.2" }
%"struct.Eigen::internal::scalar_left" = type { %"struct.Eigen::half"* }
%"struct.Eigen::TensorEvaluator.8" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.9" }
%"struct.Eigen::TensorEvaluator.9" = type { %"struct.Eigen::internal::scalar_right", %"struct.Eigen::TensorEvaluator.2" }
%"struct.Eigen::internal::scalar_right" = type { %"struct.Eigen::half"* }
%"struct.Eigen::TensorEvaluator.10" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.11" }
%"struct.Eigen::TensorEvaluator.11" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.2", %"struct.Eigen::TensorEvaluator.12" }
%"struct.Eigen::TensorEvaluator.12" = type { %"struct.Eigen::DSizes", %"class.Eigen::array", %"class.Eigen::array", %"struct.Eigen::TensorEvaluator.2" }
%"struct.Eigen::TensorEvaluator.13" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.14" }
%"struct.Eigen::TensorEvaluator.14" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.12", %"struct.Eigen::TensorEvaluator.2" }
%"struct.Eigen::TensorEvaluator.15" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.16" }
%"struct.Eigen::TensorEvaluator.16" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.12", %"struct.Eigen::TensorEvaluator.12" }
%"struct.Eigen::TensorEvaluator.17" = type { %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.21" }
%"struct.Eigen::TensorEvaluator.18" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes.19", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes.19" = type { %"class.Eigen::array.20" }
%"class.Eigen::array.20" = type { [2 x i32] }
%"struct.Eigen::TensorEvaluator.21" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.22", %"struct.Eigen::TensorEvaluator.23" }
%"struct.Eigen::TensorEvaluator.22" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes.19", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.23" = type { %"struct.Eigen::DSizes.19", %"class.Eigen::array.20", %"class.Eigen::array.20", %"struct.Eigen::TensorEvaluator.22" }
%"struct.Eigen::TensorEvaluator.24" = type { %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.25" }
%"struct.Eigen::TensorEvaluator.25" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.23", %"struct.Eigen::TensorEvaluator.22" }
%"struct.Eigen::TensorEvaluator.26" = type { %"struct.Eigen::TensorEvaluator.18", %"struct.Eigen::TensorEvaluator.27" }
%"struct.Eigen::TensorEvaluator.27" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.23", %"struct.Eigen::TensorEvaluator.23" }
%"struct.Eigen::TensorEvaluator.28" = type { %"struct.Eigen::TensorEvaluator.29", %"struct.Eigen::TensorEvaluator.32" }
%"struct.Eigen::TensorEvaluator.29" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes.30", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes.30" = type { %"class.Eigen::array.31" }
%"class.Eigen::array.31" = type { [3 x i32] }
%"struct.Eigen::TensorEvaluator.32" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.33", %"struct.Eigen::TensorEvaluator.34" }
%"struct.Eigen::TensorEvaluator.33" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes.30", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.34" = type { %"struct.Eigen::DSizes.30", %"class.Eigen::array.31", %"class.Eigen::array.31", %"struct.Eigen::TensorEvaluator.33" }
%"struct.Eigen::TensorEvaluator.35" = type { %"struct.Eigen::TensorEvaluator.29", %"struct.Eigen::TensorEvaluator.36" }
%"struct.Eigen::TensorEvaluator.36" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.33" }
%"struct.Eigen::TensorEvaluator.37" = type { %"struct.Eigen::TensorEvaluator.29", %"struct.Eigen::TensorEvaluator.38" }
%"struct.Eigen::TensorEvaluator.38" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.34", %"struct.Eigen::TensorEvaluator.34" }
%"struct.Eigen::TensorEvaluator.39" = type { %"struct.Eigen::TensorEvaluator.40", %"struct.Eigen::TensorEvaluator.43" }
%"struct.Eigen::TensorEvaluator.40" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes.41", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes.41" = type { %"class.Eigen::array.42" }
%"class.Eigen::array.42" = type { [4 x i32] }
%"struct.Eigen::TensorEvaluator.43" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.44", %"struct.Eigen::TensorEvaluator.45" }
%"struct.Eigen::TensorEvaluator.44" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes.41", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.45" = type { %"struct.Eigen::DSizes.41", %"class.Eigen::array.42", %"class.Eigen::array.42", %"struct.Eigen::TensorEvaluator.44" }
%"struct.Eigen::TensorEvaluator.46" = type { %"struct.Eigen::TensorEvaluator.40", %"struct.Eigen::TensorEvaluator.47" }
%"struct.Eigen::TensorEvaluator.47" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.45", %"struct.Eigen::TensorEvaluator.44" }
%"struct.Eigen::TensorEvaluator.48" = type { %"struct.Eigen::TensorEvaluator.40", %"struct.Eigen::TensorEvaluator.49" }
%"struct.Eigen::TensorEvaluator.49" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.45", %"struct.Eigen::TensorEvaluator.45" }
%"struct.Eigen::TensorEvaluator.50" = type { %"struct.Eigen::TensorEvaluator.51", %"struct.Eigen::TensorEvaluator.54" }
%"struct.Eigen::TensorEvaluator.51" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes.52", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::DSizes.52" = type { %"class.Eigen::array.53" }
%"class.Eigen::array.53" = type { [5 x i32] }
%"struct.Eigen::TensorEvaluator.54" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.55", %"struct.Eigen::TensorEvaluator.56" }
%"struct.Eigen::TensorEvaluator.55" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes.52", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.56" = type { %"struct.Eigen::DSizes.52", %"class.Eigen::array.53", %"class.Eigen::array.53", %"struct.Eigen::TensorEvaluator.55" }
%"struct.Eigen::TensorEvaluator.57" = type { %"struct.Eigen::TensorEvaluator.51", %"struct.Eigen::TensorEvaluator.58" }
%"struct.Eigen::TensorEvaluator.58" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.56", %"struct.Eigen::TensorEvaluator.55" }
%"struct.Eigen::TensorEvaluator.59" = type { %"struct.Eigen::TensorEvaluator.51", %"struct.Eigen::TensorEvaluator.60" }
%"struct.Eigen::TensorEvaluator.60" = type { %"struct.Eigen::internal::scalar_sum_op", %"struct.Eigen::TensorEvaluator.56", %"struct.Eigen::TensorEvaluator.56" }
%"struct.Eigen::TensorEvaluator.61" = type { %"struct.Eigen::TensorEvaluator.62", %"struct.Eigen::TensorEvaluator.63" }
%"struct.Eigen::TensorEvaluator.62" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.63" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.66", %"struct.Eigen::TensorEvaluator.67" }
%"struct.Eigen::internal::scalar_sum_op.64" = type { i8 }
%"struct.Eigen::TensorEvaluator.66" = type { float*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.67" = type { float*, %"struct.Eigen::DSizes.4", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.68" = type { %"struct.Eigen::TensorEvaluator.62", %"struct.Eigen::TensorEvaluator.69" }
%"struct.Eigen::TensorEvaluator.69" = type { %"struct.Eigen::internal::scalar_left.70", %"struct.Eigen::TensorEvaluator.66" }
%"struct.Eigen::internal::scalar_left.70" = type { float* }
%"struct.Eigen::TensorEvaluator.71" = type { %"struct.Eigen::TensorEvaluator.62", %"struct.Eigen::TensorEvaluator.72" }
%"struct.Eigen::TensorEvaluator.72" = type { %"struct.Eigen::internal::scalar_right.73", %"struct.Eigen::TensorEvaluator.66" }
%"struct.Eigen::internal::scalar_right.73" = type { float* }
%"struct.Eigen::TensorEvaluator.74" = type { %"struct.Eigen::TensorEvaluator.62", %"struct.Eigen::TensorEvaluator.75" }
%"struct.Eigen::TensorEvaluator.75" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.66", %"struct.Eigen::TensorEvaluator.76" }
%"struct.Eigen::TensorEvaluator.76" = type { %"struct.Eigen::DSizes", %"class.Eigen::array", %"class.Eigen::array", %"struct.Eigen::TensorEvaluator.66" }
%"struct.Eigen::TensorEvaluator.77" = type { %"struct.Eigen::TensorEvaluator.62", %"struct.Eigen::TensorEvaluator.78" }
%"struct.Eigen::TensorEvaluator.78" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.76", %"struct.Eigen::TensorEvaluator.66" }
%"struct.Eigen::TensorEvaluator.79" = type { %"struct.Eigen::TensorEvaluator.62", %"struct.Eigen::TensorEvaluator.80" }
%"struct.Eigen::TensorEvaluator.80" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.76", %"struct.Eigen::TensorEvaluator.76" }
%"struct.Eigen::TensorEvaluator.81" = type { %"struct.Eigen::TensorEvaluator.82", %"struct.Eigen::TensorEvaluator.83" }
%"struct.Eigen::TensorEvaluator.82" = type { float*, %"struct.Eigen::DSizes.19", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.83" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.84", %"struct.Eigen::TensorEvaluator.85" }
%"struct.Eigen::TensorEvaluator.84" = type { float*, %"struct.Eigen::DSizes.19", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.85" = type { %"struct.Eigen::DSizes.19", %"class.Eigen::array.20", %"class.Eigen::array.20", %"struct.Eigen::TensorEvaluator.84" }
%"struct.Eigen::TensorEvaluator.86" = type { %"struct.Eigen::TensorEvaluator.82", %"struct.Eigen::TensorEvaluator.87" }
%"struct.Eigen::TensorEvaluator.87" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.85", %"struct.Eigen::TensorEvaluator.84" }
%"struct.Eigen::TensorEvaluator.88" = type { %"struct.Eigen::TensorEvaluator.82", %"struct.Eigen::TensorEvaluator.89" }
%"struct.Eigen::TensorEvaluator.89" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.85", %"struct.Eigen::TensorEvaluator.85" }
%struct.float4 = type { float, float, float, float }
%"struct.Eigen::TensorEvaluator.90" = type { %"struct.Eigen::TensorEvaluator.91", %"struct.Eigen::TensorEvaluator.92" }
%"struct.Eigen::TensorEvaluator.91" = type { float*, %"struct.Eigen::DSizes.30", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.92" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.93", %"struct.Eigen::TensorEvaluator.94" }
%"struct.Eigen::TensorEvaluator.93" = type { float*, %"struct.Eigen::DSizes.30", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.94" = type { %"struct.Eigen::DSizes.30", %"class.Eigen::array.31", %"class.Eigen::array.31", %"struct.Eigen::TensorEvaluator.93" }
%"struct.Eigen::TensorEvaluator.95" = type { %"struct.Eigen::TensorEvaluator.91", %"struct.Eigen::TensorEvaluator.96" }
%"struct.Eigen::TensorEvaluator.96" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.94", %"struct.Eigen::TensorEvaluator.93" }
%"struct.Eigen::TensorEvaluator.97" = type { %"struct.Eigen::TensorEvaluator.91", %"struct.Eigen::TensorEvaluator.98" }
%"struct.Eigen::TensorEvaluator.98" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.94", %"struct.Eigen::TensorEvaluator.94" }
%"struct.Eigen::TensorEvaluator.99" = type { %"struct.Eigen::TensorEvaluator.100", %"struct.Eigen::TensorEvaluator.101" }
%"struct.Eigen::TensorEvaluator.100" = type { float*, %"struct.Eigen::DSizes.41", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.101" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.102", %"struct.Eigen::TensorEvaluator.103" }
%"struct.Eigen::TensorEvaluator.102" = type { float*, %"struct.Eigen::DSizes.41", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.103" = type { %"struct.Eigen::DSizes.41", %"class.Eigen::array.42", %"class.Eigen::array.42", %"struct.Eigen::TensorEvaluator.102" }
%"struct.Eigen::TensorEvaluator.104" = type { %"struct.Eigen::TensorEvaluator.100", %"struct.Eigen::TensorEvaluator.105" }
%"struct.Eigen::TensorEvaluator.105" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.102" }
%"struct.Eigen::TensorEvaluator.106" = type { %"struct.Eigen::TensorEvaluator.100", %"struct.Eigen::TensorEvaluator.107" }
%"struct.Eigen::TensorEvaluator.107" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103" }
%"struct.Eigen::TensorEvaluator.108" = type { %"struct.Eigen::TensorEvaluator.109", %"struct.Eigen::TensorEvaluator.110" }
%"struct.Eigen::TensorEvaluator.109" = type { float*, %"struct.Eigen::DSizes.52", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.110" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.111", %"struct.Eigen::TensorEvaluator.112" }
%"struct.Eigen::TensorEvaluator.111" = type { float*, %"struct.Eigen::DSizes.52", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.112" = type { %"struct.Eigen::DSizes.52", %"class.Eigen::array.53", %"class.Eigen::array.53", %"struct.Eigen::TensorEvaluator.111" }
%"struct.Eigen::TensorEvaluator.113" = type { %"struct.Eigen::TensorEvaluator.109", %"struct.Eigen::TensorEvaluator.114" }
%"struct.Eigen::TensorEvaluator.114" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.111" }
%"struct.Eigen::TensorEvaluator.115" = type { %"struct.Eigen::TensorEvaluator.109", %"struct.Eigen::TensorEvaluator.116" }
%"struct.Eigen::TensorEvaluator.116" = type { %"struct.Eigen::internal::scalar_sum_op.64", %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112" }
%"struct.Eigen::TensorEvaluator.117" = type { %"struct.Eigen::TensorEvaluator.118", %"struct.Eigen::TensorEvaluator.119" }
%"struct.Eigen::TensorEvaluator.118" = type { double*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.119" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.122", %"struct.Eigen::TensorEvaluator.123" }
%"struct.Eigen::internal::scalar_sum_op.120" = type { i8 }
%"struct.Eigen::TensorEvaluator.122" = type { double*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.123" = type { double*, %"struct.Eigen::DSizes.4", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.125" = type { %"struct.Eigen::TensorEvaluator.118", %"struct.Eigen::TensorEvaluator.126" }
%"struct.Eigen::TensorEvaluator.126" = type { %"struct.Eigen::internal::scalar_left.127", %"struct.Eigen::TensorEvaluator.122" }
%"struct.Eigen::internal::scalar_left.127" = type { double* }
%"struct.Eigen::TensorEvaluator.128" = type { %"struct.Eigen::TensorEvaluator.118", %"struct.Eigen::TensorEvaluator.129" }
%"struct.Eigen::TensorEvaluator.129" = type { %"struct.Eigen::internal::scalar_right.130", %"struct.Eigen::TensorEvaluator.122" }
%"struct.Eigen::internal::scalar_right.130" = type { double* }
%"struct.Eigen::TensorEvaluator.131" = type { %"struct.Eigen::TensorEvaluator.118", %"struct.Eigen::TensorEvaluator.132" }
%"struct.Eigen::TensorEvaluator.132" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.122", %"struct.Eigen::TensorEvaluator.133" }
%"struct.Eigen::TensorEvaluator.133" = type { %"struct.Eigen::DSizes", %"class.Eigen::array", %"class.Eigen::array", %"struct.Eigen::TensorEvaluator.122" }
%"struct.Eigen::TensorEvaluator.134" = type { %"struct.Eigen::TensorEvaluator.118", %"struct.Eigen::TensorEvaluator.135" }
%"struct.Eigen::TensorEvaluator.135" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.133", %"struct.Eigen::TensorEvaluator.122" }
%"struct.Eigen::TensorEvaluator.136" = type { %"struct.Eigen::TensorEvaluator.118", %"struct.Eigen::TensorEvaluator.137" }
%"struct.Eigen::TensorEvaluator.137" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.133", %"struct.Eigen::TensorEvaluator.133" }
%"struct.Eigen::TensorEvaluator.138" = type { %"struct.Eigen::TensorEvaluator.139", %"struct.Eigen::TensorEvaluator.140" }
%"struct.Eigen::TensorEvaluator.139" = type { double*, %"struct.Eigen::DSizes.19", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.140" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.141", %"struct.Eigen::TensorEvaluator.142" }
%"struct.Eigen::TensorEvaluator.141" = type { double*, %"struct.Eigen::DSizes.19", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.142" = type { %"struct.Eigen::DSizes.19", %"class.Eigen::array.20", %"class.Eigen::array.20", %"struct.Eigen::TensorEvaluator.141" }
%"struct.Eigen::TensorEvaluator.143" = type { %"struct.Eigen::TensorEvaluator.139", %"struct.Eigen::TensorEvaluator.144" }
%"struct.Eigen::TensorEvaluator.144" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.142", %"struct.Eigen::TensorEvaluator.141" }
%"struct.Eigen::TensorEvaluator.145" = type { %"struct.Eigen::TensorEvaluator.139", %"struct.Eigen::TensorEvaluator.146" }
%"struct.Eigen::TensorEvaluator.146" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.142", %"struct.Eigen::TensorEvaluator.142" }
%"struct.Eigen::TensorEvaluator.147" = type { %"struct.Eigen::TensorEvaluator.148", %"struct.Eigen::TensorEvaluator.149" }
%"struct.Eigen::TensorEvaluator.148" = type { double*, %"struct.Eigen::DSizes.30", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.149" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.150", %"struct.Eigen::TensorEvaluator.151" }
%"struct.Eigen::TensorEvaluator.150" = type { double*, %"struct.Eigen::DSizes.30", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.151" = type { %"struct.Eigen::DSizes.30", %"class.Eigen::array.31", %"class.Eigen::array.31", %"struct.Eigen::TensorEvaluator.150" }
%"struct.Eigen::TensorEvaluator.152" = type { %"struct.Eigen::TensorEvaluator.148", %"struct.Eigen::TensorEvaluator.153" }
%"struct.Eigen::TensorEvaluator.153" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.151", %"struct.Eigen::TensorEvaluator.150" }
%"struct.Eigen::TensorEvaluator.154" = type { %"struct.Eigen::TensorEvaluator.148", %"struct.Eigen::TensorEvaluator.155" }
%"struct.Eigen::TensorEvaluator.155" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.151", %"struct.Eigen::TensorEvaluator.151" }
%struct.double2.124 = type { double, double }
%"struct.Eigen::TensorEvaluator.156" = type { %"struct.Eigen::TensorEvaluator.157", %"struct.Eigen::TensorEvaluator.158" }
%"struct.Eigen::TensorEvaluator.157" = type { double*, %"struct.Eigen::DSizes.41", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.158" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.159", %"struct.Eigen::TensorEvaluator.160" }
%"struct.Eigen::TensorEvaluator.159" = type { double*, %"struct.Eigen::DSizes.41", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.160" = type { %"struct.Eigen::DSizes.41", %"class.Eigen::array.42", %"class.Eigen::array.42", %"struct.Eigen::TensorEvaluator.159" }
%"struct.Eigen::TensorEvaluator.161" = type { %"struct.Eigen::TensorEvaluator.157", %"struct.Eigen::TensorEvaluator.162" }
%"struct.Eigen::TensorEvaluator.162" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.160", %"struct.Eigen::TensorEvaluator.159" }
%"struct.Eigen::TensorEvaluator.163" = type { %"struct.Eigen::TensorEvaluator.157", %"struct.Eigen::TensorEvaluator.164" }
%"struct.Eigen::TensorEvaluator.164" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.160", %"struct.Eigen::TensorEvaluator.160" }
%"struct.Eigen::TensorEvaluator.165" = type { %"struct.Eigen::TensorEvaluator.166", %"struct.Eigen::TensorEvaluator.167" }
%"struct.Eigen::TensorEvaluator.166" = type { double*, %"struct.Eigen::DSizes.52", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.167" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.168", %"struct.Eigen::TensorEvaluator.169" }
%"struct.Eigen::TensorEvaluator.168" = type { double*, %"struct.Eigen::DSizes.52", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.169" = type { %"struct.Eigen::DSizes.52", %"class.Eigen::array.53", %"class.Eigen::array.53", %"struct.Eigen::TensorEvaluator.168" }
%"struct.Eigen::TensorEvaluator.170" = type { %"struct.Eigen::TensorEvaluator.166", %"struct.Eigen::TensorEvaluator.171" }
%"struct.Eigen::TensorEvaluator.171" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.169", %"struct.Eigen::TensorEvaluator.168" }
%"struct.Eigen::TensorEvaluator.172" = type { %"struct.Eigen::TensorEvaluator.166", %"struct.Eigen::TensorEvaluator.173" }
%"struct.Eigen::TensorEvaluator.173" = type { %"struct.Eigen::internal::scalar_sum_op.120", %"struct.Eigen::TensorEvaluator.169", %"struct.Eigen::TensorEvaluator.169" }
%"struct.Eigen::TensorEvaluator.174" = type { %"struct.Eigen::TensorEvaluator.175", %"struct.Eigen::TensorEvaluator.176" }
%"struct.Eigen::TensorEvaluator.175" = type { i64*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.176" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.179", %"struct.Eigen::TensorEvaluator.180" }
%"struct.Eigen::internal::scalar_sum_op.177" = type { i8 }
%"struct.Eigen::TensorEvaluator.179" = type { i64*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.180" = type { i64*, %"struct.Eigen::DSizes.4", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.181" = type { %"struct.Eigen::TensorEvaluator.175", %"struct.Eigen::TensorEvaluator.182" }
%"struct.Eigen::TensorEvaluator.182" = type { %"struct.Eigen::internal::scalar_left.183", %"struct.Eigen::TensorEvaluator.179" }
%"struct.Eigen::internal::scalar_left.183" = type { i64* }
%"struct.Eigen::TensorEvaluator.184" = type { %"struct.Eigen::TensorEvaluator.175", %"struct.Eigen::TensorEvaluator.185" }
%"struct.Eigen::TensorEvaluator.185" = type { %"struct.Eigen::internal::scalar_right.186", %"struct.Eigen::TensorEvaluator.179" }
%"struct.Eigen::internal::scalar_right.186" = type { i64* }
%"struct.Eigen::TensorEvaluator.187" = type { %"struct.Eigen::TensorEvaluator.175", %"struct.Eigen::TensorEvaluator.188" }
%"struct.Eigen::TensorEvaluator.188" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.179", %"struct.Eigen::TensorEvaluator.189" }
%"struct.Eigen::TensorEvaluator.189" = type { %"struct.Eigen::DSizes", %"class.Eigen::array", %"class.Eigen::array", %"struct.Eigen::TensorEvaluator.179" }
%"struct.Eigen::TensorEvaluator.190" = type { %"struct.Eigen::TensorEvaluator.175", %"struct.Eigen::TensorEvaluator.191" }
%"struct.Eigen::TensorEvaluator.191" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.189", %"struct.Eigen::TensorEvaluator.179" }
%"struct.Eigen::TensorEvaluator.192" = type { %"struct.Eigen::TensorEvaluator.175", %"struct.Eigen::TensorEvaluator.193" }
%"struct.Eigen::TensorEvaluator.193" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.189", %"struct.Eigen::TensorEvaluator.189" }
%"struct.Eigen::TensorEvaluator.194" = type { %"struct.Eigen::TensorEvaluator.195", %"struct.Eigen::TensorEvaluator.196" }
%"struct.Eigen::TensorEvaluator.195" = type { i64*, %"struct.Eigen::DSizes.19", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.196" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.197", %"struct.Eigen::TensorEvaluator.198" }
%"struct.Eigen::TensorEvaluator.197" = type { i64*, %"struct.Eigen::DSizes.19", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.198" = type { %"struct.Eigen::DSizes.19", %"class.Eigen::array.20", %"class.Eigen::array.20", %"struct.Eigen::TensorEvaluator.197" }
%"struct.Eigen::TensorEvaluator.199" = type { %"struct.Eigen::TensorEvaluator.195", %"struct.Eigen::TensorEvaluator.200" }
%"struct.Eigen::TensorEvaluator.200" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.198", %"struct.Eigen::TensorEvaluator.197" }
%"struct.Eigen::TensorEvaluator.201" = type { %"struct.Eigen::TensorEvaluator.195", %"struct.Eigen::TensorEvaluator.202" }
%"struct.Eigen::TensorEvaluator.202" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.198", %"struct.Eigen::TensorEvaluator.198" }
%"struct.Eigen::TensorEvaluator.203" = type { %"struct.Eigen::TensorEvaluator.204", %"struct.Eigen::TensorEvaluator.205" }
%"struct.Eigen::TensorEvaluator.204" = type { i64*, %"struct.Eigen::DSizes.30", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.205" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.206", %"struct.Eigen::TensorEvaluator.207" }
%"struct.Eigen::TensorEvaluator.206" = type { i64*, %"struct.Eigen::DSizes.30", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.207" = type { %"struct.Eigen::DSizes.30", %"class.Eigen::array.31", %"class.Eigen::array.31", %"struct.Eigen::TensorEvaluator.206" }
%"struct.Eigen::TensorEvaluator.208" = type { %"struct.Eigen::TensorEvaluator.204", %"struct.Eigen::TensorEvaluator.209" }
%"struct.Eigen::TensorEvaluator.209" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.207", %"struct.Eigen::TensorEvaluator.206" }
%"struct.Eigen::TensorEvaluator.210" = type { %"struct.Eigen::TensorEvaluator.204", %"struct.Eigen::TensorEvaluator.211" }
%"struct.Eigen::TensorEvaluator.211" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.207", %"struct.Eigen::TensorEvaluator.207" }
%"struct.Eigen::TensorEvaluator.212" = type { %"struct.Eigen::TensorEvaluator.213", %"struct.Eigen::TensorEvaluator.214" }
%"struct.Eigen::TensorEvaluator.213" = type { i64*, %"struct.Eigen::DSizes.41", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.214" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.215", %"struct.Eigen::TensorEvaluator.216" }
%"struct.Eigen::TensorEvaluator.215" = type { i64*, %"struct.Eigen::DSizes.41", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.216" = type { %"struct.Eigen::DSizes.41", %"class.Eigen::array.42", %"class.Eigen::array.42", %"struct.Eigen::TensorEvaluator.215" }
%"struct.Eigen::TensorEvaluator.217" = type { %"struct.Eigen::TensorEvaluator.213", %"struct.Eigen::TensorEvaluator.218" }
%"struct.Eigen::TensorEvaluator.218" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.216", %"struct.Eigen::TensorEvaluator.215" }
%"struct.Eigen::TensorEvaluator.219" = type { %"struct.Eigen::TensorEvaluator.213", %"struct.Eigen::TensorEvaluator.220" }
%"struct.Eigen::TensorEvaluator.220" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.216", %"struct.Eigen::TensorEvaluator.216" }
%"struct.Eigen::TensorEvaluator.221" = type { %"struct.Eigen::TensorEvaluator.222", %"struct.Eigen::TensorEvaluator.223" }
%"struct.Eigen::TensorEvaluator.222" = type { i64*, %"struct.Eigen::DSizes.52", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.223" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.224", %"struct.Eigen::TensorEvaluator.225" }
%"struct.Eigen::TensorEvaluator.224" = type { i64*, %"struct.Eigen::DSizes.52", %"struct.Eigen::GpuDevice"* }
%"struct.Eigen::TensorEvaluator.225" = type { %"struct.Eigen::DSizes.52", %"class.Eigen::array.53", %"class.Eigen::array.53", %"struct.Eigen::TensorEvaluator.224" }
%"struct.Eigen::TensorEvaluator.226" = type { %"struct.Eigen::TensorEvaluator.222", %"struct.Eigen::TensorEvaluator.227" }
%"struct.Eigen::TensorEvaluator.227" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.225", %"struct.Eigen::TensorEvaluator.224" }
%"struct.Eigen::TensorEvaluator.228" = type { %"struct.Eigen::TensorEvaluator.222", %"struct.Eigen::TensorEvaluator.229" }
%"struct.Eigen::TensorEvaluator.229" = type { %"struct.Eigen::internal::scalar_sum_op.177", %"struct.Eigen::TensorEvaluator.225", %"struct.Eigen::TensorEvaluator.225" }

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEKNS6_INS7_IS8_Li1ELi1ElEELi16EEEEENS_9GpuDeviceEE5coeffEl = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESB_EEEENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESB_EEEENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESB_EEEENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIS4_S4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKS4_Li3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEE10evalScalarEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESB_EEEENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESB_EEEENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE6float4i = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE7double2i = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE7double2i = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

$_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_ = comdat any

@.str = private unnamed_addr constant [5 x i8] c"NONE\00", align 1
@_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic = internal unnamed_addr addrspace(1) constant %"union.Eigen::half_impl::FP32" { i32 947912704 }, align 4
@_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty = internal unnamed_addr addrspace(1) constant %"union.Eigen::half_impl::FP32" { i32 2139095040 }, align 4
@_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max = internal unnamed_addr addrspace(1) constant %"union.Eigen::half_impl::FP32" { i32 1199570944 }, align 4
@_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic = internal unnamed_addr addrspace(1) constant %"union.Eigen::half_impl::FP32" { i32 1056964608 }, align 4
@llvm.used = appending global [1 x i8*] [i8* bitcast (i32 ()* @_ZL21__nvvm_reflect_anchorv to i8*)], section "llvm.metadata"

; Function Attrs: nounwind readnone
define internal i32 @_ZL21__nvvm_reflect_anchorv() #0 {
  %1 = tail call i32 @__nvvm_reflect(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)) #3
  ret i32 %1
}

; Function Attrs: nounwind readnone
declare i32 @__nvvm_reflect(i8*) #0

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator"* byval nocapture readonly align 8 %memcopied_eval, i64 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = zext i32 %6 to i64
  %8 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %9 = mul i32 %8, %3
  %10 = zext i32 %9 to i64
  %11 = bitcast %"struct.Eigen::TensorEvaluator"* %eval to i8*
  call void @llvm.lifetime.start(i64 80, i8* %11) #6
  %12 = bitcast %"struct.Eigen::TensorEvaluator"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 24, i32 8, i1 false) #6
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1, i32 1
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %memcopied_eval, i64 0, i32 1, i32 1
  %15 = bitcast %"struct.Eigen::TensorEvaluator.2"* %13 to i8*
  %16 = bitcast %"struct.Eigen::TensorEvaluator.2"* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %16, i64 48, i32 8, i1 false) #6
  %17 = icmp slt i64 %7, %size
  br i1 %17, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSO_lll.exit

.lr.ph.i:                                         ; preds = %0
  %18 = bitcast %"struct.Eigen::half"* %1 to i8*
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 0, i32 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator", %"struct.Eigen::TensorEvaluator"* %eval, i64 0, i32 1
  %21 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %19, align 8, !tbaa !150
  br label %22

; <label>:22                                      ; preds = %22, %.lr.ph.i
  %i.01.i = phi i64 [ %7, %.lr.ph.i ], [ %26, %22 ]
  call void @llvm.lifetime.start(i64 2, i8* %18) #6
  %sext.i.i = shl i64 %i.01.i, 32
  %23 = ashr exact i64 %sext.i.i, 32
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEKNS6_INS7_IS8_Li1ELi1ElEELi16EEEEENS_9GpuDeviceEE5coeffEl(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.1"* %20, i64 %i.01.i) #6
  %24 = load i16, i16* %21, align 2, !tbaa !156
  %25 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %23, i32 0, i32 0, i32 0
  store i16 %24, i16* %25, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %18) #6
  %26 = add nuw nsw i64 %i.01.i, %10
  %27 = icmp slt i64 %26, %size
  br i1 %27, label %22, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSO_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSO_lll.exit.loopexit: ; preds = %22
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSO_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSO_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSO_lll.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 80, i8* %11) #6
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ctaid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.ntid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.tid.x() #3

; Function Attrs: nounwind readnone
declare i32 @llvm.ptx.read.nctaid.x() #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEKNS6_INS7_IS8_Li1ELi1ElEELi16EEEEENS_9GpuDeviceEE5coeffEl(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.1"* nocapture readonly %this, i64 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.1", %"struct.Eigen::TensorEvaluator.1"* %this, i64 0, i32 1, i32 0
  %2 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %1, align 8, !tbaa !159, !noalias !161
  %sext = shl i64 %index, 32
  %3 = ashr exact i64 %sext, 32
  %.idx.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %2, i64 %3, i32 0, i32 0, i32 0
  %.idx.val.i = load i16, i16* %.idx.i, align 2, !tbaa !164, !noalias !161
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.1", %"struct.Eigen::TensorEvaluator.1"* %this, i64 0, i32 2, i32 0
  %5 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %4, align 8, !tbaa !165, !noalias !168
  %.idx.i1 = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %5, i64 %index, i32 0, i32 0, i32 0
  %.idx.val.i2 = load i16, i16* %.idx.i1, align 2, !tbaa !164, !noalias !168
  %6 = zext i16 %.idx.val.i to i32
  %7 = shl nuw nsw i32 %6, 13
  %8 = and i32 %7, 268427264
  %9 = and i32 %7, 260046848
  %10 = icmp eq i32 %9, 260046848
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %0
  %12 = or i32 %7, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:13                                      ; preds = %0
  %14 = add nuw nsw i32 %8, 939524096
  %15 = icmp eq i32 %9, 0
  br i1 %15, label %16, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:16                                      ; preds = %13
  %17 = add nuw nsw i32 %8, 947912704
  %18 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !173
  %19 = bitcast i32 %17 to float
  %20 = fsub float %19, %18
  %21 = bitcast float %20 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %16, %13, %11
  %o.sroa.0.0.i.i.i.i = phi i32 [ %12, %11 ], [ %21, %16 ], [ %14, %13 ]
  %22 = shl nuw i32 %6, 16
  %23 = and i32 %22, -2147483648
  %24 = or i32 %o.sroa.0.0.i.i.i.i, %23
  %25 = bitcast i32 %24 to float
  %26 = zext i16 %.idx.val.i2 to i32
  %27 = shl nuw nsw i32 %26, 13
  %28 = and i32 %27, 268427264
  %29 = and i32 %27, 260046848
  %30 = icmp eq i32 %29, 260046848
  br i1 %30, label %31, label %33

; <label>:31                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %32 = or i32 %27, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:33                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %34 = add nuw nsw i32 %28, 939524096
  %35 = icmp eq i32 %29, 0
  br i1 %35, label %36, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:36                                      ; preds = %33
  %37 = add nuw nsw i32 %28, 947912704
  %38 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !173
  %39 = bitcast i32 %37 to float
  %40 = fsub float %39, %38
  %41 = bitcast float %40 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %36, %33, %31
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %32, %31 ], [ %41, %36 ], [ %34, %33 ]
  %42 = shl nuw i32 %26, 16
  %43 = and i32 %42, -2147483648
  %44 = or i32 %o.sroa.0.0.i.i1.i.i, %43
  %45 = bitcast i32 %44 to float
  %46 = fadd float %25, %45
  %47 = bitcast float %46 to i32
  %48 = and i32 %47, -2147483648
  %49 = xor i32 %48, %47
  %50 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !173
  %51 = icmp ult i32 %49, %50
  br i1 %51, label %56, label %52

; <label>:52                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %53 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !173
  %54 = icmp ugt i32 %49, %53
  %55 = select i1 %54, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:56                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %57 = icmp ult i32 %49, 947912704
  br i1 %57, label %58, label %64

; <label>:58                                      ; preds = %56
  %59 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !173
  %60 = bitcast i32 %49 to float
  %61 = fadd float %60, %59
  %62 = bitcast float %61 to i32
  %.cast.i.i.i.i = bitcast float %59 to i32
  %63 = sub i32 %62, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:64                                      ; preds = %56
  %65 = lshr i32 %47, 13
  %66 = and i32 %65, 1
  %67 = add i32 %47, 134221823
  %68 = add i32 %67, %66
  %69 = lshr i32 %68, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %52, %58, %64
  %.sroa.0.0.i.i.i.i = phi i32 [ %63, %58 ], [ %69, %64 ], [ %55, %52 ]
  %70 = lshr exact i32 %48, 16
  %71 = or i32 %.sroa.0.0.i.i.i.i, %70
  %72 = trunc i32 %71 to i16
  %73 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %72, i16* %73, align 2, !tbaa !164, !alias.scope !173
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.6"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.6", %"struct.Eigen::TensorEvaluator.6"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.6", %"struct.Eigen::TensorEvaluator.6"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %10, align 8
  %12 = icmp slt i32 %5, %size
  br i1 %12, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.6", %"struct.Eigen::TensorEvaluator.6"* %memcopied_eval, i64 0, i32 1, i32 0, i32 0
  %14 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %13, align 8, !tbaa !181
  %15 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %14, i64 0, i32 0, i32 0, i32 0
  %16 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal11scalar_leftINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit
  %i.01.i = phi i32 [ %86, %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal11scalar_leftINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit ], [ %5, %.lr.ph.i.preheader ]
  %17 = sext i32 %i.01.i to i64
  %.idx.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %11, i64 %17, i32 0, i32 0, i32 0
  %.idx.val.i.i = load i16, i16* %.idx.i.i, align 2, !tbaa !164, !noalias !183
  %18 = load i16, i16* %15, align 2, !tbaa !164, !noalias !188
  %19 = zext i16 %18 to i32
  %20 = shl nuw nsw i32 %19, 13
  %21 = and i32 %20, 268427264
  %22 = and i32 %20, 260046848
  %23 = icmp eq i32 %22, 260046848
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %.lr.ph.i
  %25 = or i32 %20, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i.i.i

; <label>:26                                      ; preds = %.lr.ph.i
  %27 = add nuw nsw i32 %21, 939524096
  %28 = icmp eq i32 %22, 0
  br i1 %28, label %29, label %_ZNK5Eigen4halfcvfEv.exit.i.i.i.i

; <label>:29                                      ; preds = %26
  %30 = add nuw nsw i32 %21, 947912704
  %31 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !188
  %32 = bitcast i32 %30 to float
  %33 = fsub float %32, %31
  %34 = bitcast float %33 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i.i.i:                ; preds = %29, %26, %24
  %o.sroa.0.0.i.i.i.i.i.i = phi i32 [ %25, %24 ], [ %34, %29 ], [ %27, %26 ]
  %35 = shl nuw i32 %19, 16
  %36 = and i32 %35, -2147483648
  %37 = or i32 %o.sroa.0.0.i.i.i.i.i.i, %36
  %38 = bitcast i32 %37 to float
  %39 = zext i16 %.idx.val.i.i to i32
  %40 = shl nuw nsw i32 %39, 13
  %41 = and i32 %40, 268427264
  %42 = and i32 %40, 260046848
  %43 = icmp eq i32 %42, 260046848
  br i1 %43, label %44, label %46

; <label>:44                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i.i.i
  %45 = or i32 %40, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i

; <label>:46                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i.i.i
  %47 = add nuw nsw i32 %41, 939524096
  %48 = icmp eq i32 %42, 0
  br i1 %48, label %49, label %_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i

; <label>:49                                      ; preds = %46
  %50 = add nuw nsw i32 %41, 947912704
  %51 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !188
  %52 = bitcast i32 %50 to float
  %53 = fsub float %52, %51
  %54 = bitcast float %53 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i:               ; preds = %49, %46, %44
  %o.sroa.0.0.i.i1.i.i.i.i = phi i32 [ %45, %44 ], [ %54, %49 ], [ %47, %46 ]
  %55 = shl nuw i32 %39, 16
  %56 = and i32 %55, -2147483648
  %57 = or i32 %o.sroa.0.0.i.i1.i.i.i.i, %56
  %58 = bitcast i32 %57 to float
  %59 = fadd float %38, %58
  %60 = bitcast float %59 to i32
  %61 = and i32 %60, -2147483648
  %62 = xor i32 %61, %60
  %63 = icmp ult i32 %62, %16
  br i1 %63, label %68, label %64

; <label>:64                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i
  %65 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !188
  %66 = icmp ugt i32 %62, %65
  %67 = select i1 %66, i32 32256, i32 31744
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal11scalar_leftINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit

; <label>:68                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i
  %69 = icmp ult i32 %62, 947912704
  br i1 %69, label %70, label %76

; <label>:70                                      ; preds = %68
  %71 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !188
  %72 = bitcast i32 %62 to float
  %73 = fadd float %72, %71
  %74 = bitcast float %73 to i32
  %.cast.i.i.i.i.i.i = bitcast float %71 to i32
  %75 = sub i32 %74, %.cast.i.i.i.i.i.i
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal11scalar_leftINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit

; <label>:76                                      ; preds = %68
  %77 = lshr i32 %60, 13
  %78 = and i32 %77, 1
  %79 = add i32 %60, 134221823
  %80 = add i32 %79, %78
  %81 = lshr i32 %80, 13
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal11scalar_leftINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit

_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal11scalar_leftINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit: ; preds = %64, %70, %76
  %.sroa.0.0.i.i.i.i.i.i = phi i32 [ %75, %70 ], [ %81, %76 ], [ %67, %64 ]
  %82 = lshr exact i32 %61, 16
  %83 = or i32 %.sroa.0.0.i.i.i.i.i.i, %82
  %84 = trunc i32 %83 to i16
  %85 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %9, i64 %17, i32 0, i32 0, i32 0
  store i16 %84, i16* %85, align 2, !tbaa !156
  %86 = add nsw i32 %i.01.i, %7
  %87 = icmp slt i32 %86, %size
  br i1 %87, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit.loopexit: ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal11scalar_leftINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.8"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %10, align 8
  %12 = icmp slt i32 %5, %size
  br i1 %12, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.8", %"struct.Eigen::TensorEvaluator.8"* %memcopied_eval, i64 0, i32 1, i32 0, i32 0
  %14 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %13, align 8, !tbaa !195
  %15 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %14, i64 0, i32 0, i32 0, i32 0
  %16 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal12scalar_rightINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit
  %i.01.i = phi i32 [ %86, %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal12scalar_rightINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit ], [ %5, %.lr.ph.i.preheader ]
  %17 = sext i32 %i.01.i to i64
  %.idx.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %11, i64 %17, i32 0, i32 0, i32 0
  %.idx.val.i.i = load i16, i16* %.idx.i.i, align 2, !tbaa !164, !noalias !197
  %18 = zext i16 %.idx.val.i.i to i32
  %19 = shl nuw nsw i32 %18, 13
  %20 = and i32 %19, 268427264
  %21 = and i32 %19, 260046848
  %22 = icmp eq i32 %21, 260046848
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %.lr.ph.i
  %24 = or i32 %19, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i.i.i

; <label>:25                                      ; preds = %.lr.ph.i
  %26 = add nuw nsw i32 %20, 939524096
  %27 = icmp eq i32 %21, 0
  br i1 %27, label %28, label %_ZNK5Eigen4halfcvfEv.exit.i.i.i.i

; <label>:28                                      ; preds = %25
  %29 = add nuw nsw i32 %20, 947912704
  %30 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !202
  %31 = bitcast i32 %29 to float
  %32 = fsub float %31, %30
  %33 = bitcast float %32 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i.i.i:                ; preds = %28, %25, %23
  %o.sroa.0.0.i.i.i.i.i.i = phi i32 [ %24, %23 ], [ %33, %28 ], [ %26, %25 ]
  %34 = shl nuw i32 %18, 16
  %35 = and i32 %34, -2147483648
  %36 = or i32 %o.sroa.0.0.i.i.i.i.i.i, %35
  %37 = bitcast i32 %36 to float
  %38 = load i16, i16* %15, align 2, !tbaa !164, !noalias !202
  %39 = zext i16 %38 to i32
  %40 = shl nuw nsw i32 %39, 13
  %41 = and i32 %40, 268427264
  %42 = and i32 %40, 260046848
  %43 = icmp eq i32 %42, 260046848
  br i1 %43, label %44, label %46

; <label>:44                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i.i.i
  %45 = or i32 %40, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i

; <label>:46                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i.i.i
  %47 = add nuw nsw i32 %41, 939524096
  %48 = icmp eq i32 %42, 0
  br i1 %48, label %49, label %_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i

; <label>:49                                      ; preds = %46
  %50 = add nuw nsw i32 %41, 947912704
  %51 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !202
  %52 = bitcast i32 %50 to float
  %53 = fsub float %52, %51
  %54 = bitcast float %53 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i:               ; preds = %49, %46, %44
  %o.sroa.0.0.i.i1.i.i.i.i = phi i32 [ %45, %44 ], [ %54, %49 ], [ %47, %46 ]
  %55 = shl nuw i32 %39, 16
  %56 = and i32 %55, -2147483648
  %57 = or i32 %o.sroa.0.0.i.i1.i.i.i.i, %56
  %58 = bitcast i32 %57 to float
  %59 = fadd float %37, %58
  %60 = bitcast float %59 to i32
  %61 = and i32 %60, -2147483648
  %62 = xor i32 %61, %60
  %63 = icmp ult i32 %62, %16
  br i1 %63, label %68, label %64

; <label>:64                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i
  %65 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !202
  %66 = icmp ugt i32 %62, %65
  %67 = select i1 %66, i32 32256, i32 31744
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal12scalar_rightINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit

; <label>:68                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i.i.i
  %69 = icmp ult i32 %62, 947912704
  br i1 %69, label %70, label %76

; <label>:70                                      ; preds = %68
  %71 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !202
  %72 = bitcast i32 %62 to float
  %73 = fadd float %72, %71
  %74 = bitcast float %73 to i32
  %.cast.i.i.i.i.i.i = bitcast float %71 to i32
  %75 = sub i32 %74, %.cast.i.i.i.i.i.i
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal12scalar_rightINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit

; <label>:76                                      ; preds = %68
  %77 = lshr i32 %60, 13
  %78 = and i32 %77, 1
  %79 = add i32 %60, 134221823
  %80 = add i32 %79, %78
  %81 = lshr i32 %80, 13
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal12scalar_rightINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit

_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal12scalar_rightINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit: ; preds = %64, %70, %76
  %.sroa.0.0.i.i.i.i.i.i = phi i32 [ %75, %70 ], [ %81, %76 ], [ %67, %64 ]
  %82 = lshr exact i32 %61, 16
  %83 = or i32 %.sroa.0.0.i.i.i.i.i.i, %82
  %84 = trunc i32 %83 to i16
  %85 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %9, i64 %17, i32 0, i32 0, i32 0
  store i16 %84, i16* %85, align 2, !tbaa !156
  %86 = add nsw i32 %i.01.i, %7
  %87 = icmp slt i32 %86, %size
  br i1 %87, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit.loopexit: ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal12scalar_rightINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi.exit
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSN_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.10"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.10", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.10"* %eval to i8*
  call void @llvm.lifetime.start(i64 96, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.10"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 24, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.10", %"struct.Eigen::TensorEvaluator.10"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.10", %"struct.Eigen::TensorEvaluator.10"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.2"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.2"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 64, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.10", %"struct.Eigen::TensorEvaluator.10"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.10", %"struct.Eigen::TensorEvaluator.10"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !150
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESB_EEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.11"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 96, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESB_EEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.11"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.11", %"struct.Eigen::TensorEvaluator.11"* %this, i64 0, i32 1, i32 0
  %2 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %1, align 8, !tbaa !159, !noalias !209
  %3 = sext i32 %index to i64
  %.idx.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %2, i64 %3, i32 0, i32 0, i32 0
  %.idx.val.i = load i16, i16* %.idx.i, align 2, !tbaa !164, !noalias !209
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.11", %"struct.Eigen::TensorEvaluator.11"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !212
  %6 = srem i32 %index, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.11", %"struct.Eigen::TensorEvaluator.11"* %this, i64 0, i32 2, i32 3, i32 0
  %8 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %7, align 8, !tbaa !159, !noalias !217
  %9 = sext i32 %6 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %8, i64 %9, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !217
  %10 = zext i16 %.idx.val.i to i32
  %11 = shl nuw nsw i32 %10, 13
  %12 = and i32 %11, 268427264
  %13 = and i32 %11, 260046848
  %14 = icmp eq i32 %13, 260046848
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %0
  %16 = or i32 %11, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:17                                      ; preds = %0
  %18 = add nuw nsw i32 %12, 939524096
  %19 = icmp eq i32 %13, 0
  br i1 %19, label %20, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:20                                      ; preds = %17
  %21 = add nuw nsw i32 %12, 947912704
  %22 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !220
  %23 = bitcast i32 %21 to float
  %24 = fsub float %23, %22
  %25 = bitcast float %24 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %20, %17, %15
  %o.sroa.0.0.i.i.i.i = phi i32 [ %16, %15 ], [ %25, %20 ], [ %18, %17 ]
  %26 = shl nuw i32 %10, 16
  %27 = and i32 %26, -2147483648
  %28 = or i32 %o.sroa.0.0.i.i.i.i, %27
  %29 = bitcast i32 %28 to float
  %30 = zext i16 %.idx.val.i.i.i to i32
  %31 = shl nuw nsw i32 %30, 13
  %32 = and i32 %31, 268427264
  %33 = and i32 %31, 260046848
  %34 = icmp eq i32 %33, 260046848
  br i1 %34, label %35, label %37

; <label>:35                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %36 = or i32 %31, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:37                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %38 = add nuw nsw i32 %32, 939524096
  %39 = icmp eq i32 %33, 0
  br i1 %39, label %40, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:40                                      ; preds = %37
  %41 = add nuw nsw i32 %32, 947912704
  %42 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !220
  %43 = bitcast i32 %41 to float
  %44 = fsub float %43, %42
  %45 = bitcast float %44 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %40, %37, %35
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %36, %35 ], [ %45, %40 ], [ %38, %37 ]
  %46 = shl nuw i32 %30, 16
  %47 = and i32 %46, -2147483648
  %48 = or i32 %o.sroa.0.0.i.i1.i.i, %47
  %49 = bitcast i32 %48 to float
  %50 = fadd float %29, %49
  %51 = bitcast float %50 to i32
  %52 = and i32 %51, -2147483648
  %53 = xor i32 %52, %51
  %54 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !220
  %55 = icmp ult i32 %53, %54
  br i1 %55, label %60, label %56

; <label>:56                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %57 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !220
  %58 = icmp ugt i32 %53, %57
  %59 = select i1 %58, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:60                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %61 = icmp ult i32 %53, 947912704
  br i1 %61, label %62, label %68

; <label>:62                                      ; preds = %60
  %63 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !220
  %64 = bitcast i32 %53 to float
  %65 = fadd float %64, %63
  %66 = bitcast float %65 to i32
  %.cast.i.i.i.i = bitcast float %63 to i32
  %67 = sub i32 %66, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:68                                      ; preds = %60
  %69 = lshr i32 %51, 13
  %70 = and i32 %69, 1
  %71 = add i32 %51, 134221823
  %72 = add i32 %71, %70
  %73 = lshr i32 %72, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %56, %62, %68
  %.sroa.0.0.i.i.i.i = phi i32 [ %67, %62 ], [ %73, %68 ], [ %59, %56 ]
  %74 = lshr exact i32 %52, 16
  %75 = or i32 %.sroa.0.0.i.i.i.i, %74
  %76 = trunc i32 %75 to i16
  %77 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %76, i16* %77, align 2, !tbaa !164, !alias.scope !220
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.13"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.13", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.13"* %eval to i8*
  call void @llvm.lifetime.start(i64 96, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.13"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 24, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.13", %"struct.Eigen::TensorEvaluator.13"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.13", %"struct.Eigen::TensorEvaluator.13"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.12"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.12"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 64, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.13", %"struct.Eigen::TensorEvaluator.13"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.13", %"struct.Eigen::TensorEvaluator.13"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !150
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.14"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 96, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.14"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.14", %"struct.Eigen::TensorEvaluator.14"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178, !noalias !225
  %3 = srem i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.14", %"struct.Eigen::TensorEvaluator.14"* %this, i64 0, i32 1, i32 3, i32 0
  %5 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %4, align 8, !tbaa !159, !noalias !230
  %6 = sext i32 %3 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %5, i64 %6, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !230
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.14", %"struct.Eigen::TensorEvaluator.14"* %this, i64 0, i32 2, i32 0
  %8 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %7, align 8, !tbaa !159, !noalias !233
  %9 = sext i32 %index to i64
  %.idx.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %8, i64 %9, i32 0, i32 0, i32 0
  %.idx.val.i = load i16, i16* %.idx.i, align 2, !tbaa !164, !noalias !233
  %10 = zext i16 %.idx.val.i.i.i to i32
  %11 = shl nuw nsw i32 %10, 13
  %12 = and i32 %11, 268427264
  %13 = and i32 %11, 260046848
  %14 = icmp eq i32 %13, 260046848
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %0
  %16 = or i32 %11, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:17                                      ; preds = %0
  %18 = add nuw nsw i32 %12, 939524096
  %19 = icmp eq i32 %13, 0
  br i1 %19, label %20, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:20                                      ; preds = %17
  %21 = add nuw nsw i32 %12, 947912704
  %22 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !236
  %23 = bitcast i32 %21 to float
  %24 = fsub float %23, %22
  %25 = bitcast float %24 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %20, %17, %15
  %o.sroa.0.0.i.i.i.i = phi i32 [ %16, %15 ], [ %25, %20 ], [ %18, %17 ]
  %26 = shl nuw i32 %10, 16
  %27 = and i32 %26, -2147483648
  %28 = or i32 %o.sroa.0.0.i.i.i.i, %27
  %29 = bitcast i32 %28 to float
  %30 = zext i16 %.idx.val.i to i32
  %31 = shl nuw nsw i32 %30, 13
  %32 = and i32 %31, 268427264
  %33 = and i32 %31, 260046848
  %34 = icmp eq i32 %33, 260046848
  br i1 %34, label %35, label %37

; <label>:35                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %36 = or i32 %31, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:37                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %38 = add nuw nsw i32 %32, 939524096
  %39 = icmp eq i32 %33, 0
  br i1 %39, label %40, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:40                                      ; preds = %37
  %41 = add nuw nsw i32 %32, 947912704
  %42 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !236
  %43 = bitcast i32 %41 to float
  %44 = fsub float %43, %42
  %45 = bitcast float %44 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %40, %37, %35
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %36, %35 ], [ %45, %40 ], [ %38, %37 ]
  %46 = shl nuw i32 %30, 16
  %47 = and i32 %46, -2147483648
  %48 = or i32 %o.sroa.0.0.i.i1.i.i, %47
  %49 = bitcast i32 %48 to float
  %50 = fadd float %29, %49
  %51 = bitcast float %50 to i32
  %52 = and i32 %51, -2147483648
  %53 = xor i32 %52, %51
  %54 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !236
  %55 = icmp ult i32 %53, %54
  br i1 %55, label %60, label %56

; <label>:56                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %57 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !236
  %58 = icmp ugt i32 %53, %57
  %59 = select i1 %58, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:60                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %61 = icmp ult i32 %53, 947912704
  br i1 %61, label %62, label %68

; <label>:62                                      ; preds = %60
  %63 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !236
  %64 = bitcast i32 %53 to float
  %65 = fadd float %64, %63
  %66 = bitcast float %65 to i32
  %.cast.i.i.i.i = bitcast float %63 to i32
  %67 = sub i32 %66, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:68                                      ; preds = %60
  %69 = lshr i32 %51, 13
  %70 = and i32 %69, 1
  %71 = add i32 %51, 134221823
  %72 = add i32 %71, %70
  %73 = lshr i32 %72, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %56, %62, %68
  %.sroa.0.0.i.i.i.i = phi i32 [ %67, %62 ], [ %73, %68 ], [ %59, %56 ]
  %74 = lshr exact i32 %52, 16
  %75 = or i32 %.sroa.0.0.i.i.i.i, %74
  %76 = trunc i32 %75 to i16
  %77 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %76, i16* %77, align 2, !tbaa !164, !alias.scope !236
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.15"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.15", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.15"* %eval to i8*
  call void @llvm.lifetime.start(i64 112, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.15"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 24, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.15", %"struct.Eigen::TensorEvaluator.15"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.15", %"struct.Eigen::TensorEvaluator.15"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.12"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.12"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 80, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.15", %"struct.Eigen::TensorEvaluator.15"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.15", %"struct.Eigen::TensorEvaluator.15"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !150
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.16"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 112, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.16"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.16", %"struct.Eigen::TensorEvaluator.16"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178, !noalias !241
  %3 = srem i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.16", %"struct.Eigen::TensorEvaluator.16"* %this, i64 0, i32 1, i32 3, i32 0
  %5 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %4, align 8, !tbaa !159, !noalias !246
  %6 = sext i32 %3 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %5, i64 %6, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !246
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.16", %"struct.Eigen::TensorEvaluator.16"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !249
  %9 = srem i32 %index, %8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.16", %"struct.Eigen::TensorEvaluator.16"* %this, i64 0, i32 2, i32 3, i32 0
  %11 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %10, align 8, !tbaa !159, !noalias !254
  %12 = sext i32 %9 to i64
  %.idx.i.i.i1 = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %11, i64 %12, i32 0, i32 0, i32 0
  %.idx.val.i.i.i2 = load i16, i16* %.idx.i.i.i1, align 2, !tbaa !164, !noalias !254
  %13 = zext i16 %.idx.val.i.i.i to i32
  %14 = shl nuw nsw i32 %13, 13
  %15 = and i32 %14, 268427264
  %16 = and i32 %14, 260046848
  %17 = icmp eq i32 %16, 260046848
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %0
  %19 = or i32 %14, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:20                                      ; preds = %0
  %21 = add nuw nsw i32 %15, 939524096
  %22 = icmp eq i32 %16, 0
  br i1 %22, label %23, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:23                                      ; preds = %20
  %24 = add nuw nsw i32 %15, 947912704
  %25 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !257
  %26 = bitcast i32 %24 to float
  %27 = fsub float %26, %25
  %28 = bitcast float %27 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %23, %20, %18
  %o.sroa.0.0.i.i.i.i = phi i32 [ %19, %18 ], [ %28, %23 ], [ %21, %20 ]
  %29 = shl nuw i32 %13, 16
  %30 = and i32 %29, -2147483648
  %31 = or i32 %o.sroa.0.0.i.i.i.i, %30
  %32 = bitcast i32 %31 to float
  %33 = zext i16 %.idx.val.i.i.i2 to i32
  %34 = shl nuw nsw i32 %33, 13
  %35 = and i32 %34, 268427264
  %36 = and i32 %34, 260046848
  %37 = icmp eq i32 %36, 260046848
  br i1 %37, label %38, label %40

; <label>:38                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %39 = or i32 %34, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:40                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %41 = add nuw nsw i32 %35, 939524096
  %42 = icmp eq i32 %36, 0
  br i1 %42, label %43, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:43                                      ; preds = %40
  %44 = add nuw nsw i32 %35, 947912704
  %45 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !257
  %46 = bitcast i32 %44 to float
  %47 = fsub float %46, %45
  %48 = bitcast float %47 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %43, %40, %38
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %39, %38 ], [ %48, %43 ], [ %41, %40 ]
  %49 = shl nuw i32 %33, 16
  %50 = and i32 %49, -2147483648
  %51 = or i32 %o.sroa.0.0.i.i1.i.i, %50
  %52 = bitcast i32 %51 to float
  %53 = fadd float %32, %52
  %54 = bitcast float %53 to i32
  %55 = and i32 %54, -2147483648
  %56 = xor i32 %55, %54
  %57 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !257
  %58 = icmp ult i32 %56, %57
  br i1 %58, label %63, label %59

; <label>:59                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %60 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !257
  %61 = icmp ugt i32 %56, %60
  %62 = select i1 %61, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:63                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %64 = icmp ult i32 %56, 947912704
  br i1 %64, label %65, label %71

; <label>:65                                      ; preds = %63
  %66 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !257
  %67 = bitcast i32 %56 to float
  %68 = fadd float %67, %66
  %69 = bitcast float %68 to i32
  %.cast.i.i.i.i = bitcast float %66 to i32
  %70 = sub i32 %69, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:71                                      ; preds = %63
  %72 = lshr i32 %54, 13
  %73 = and i32 %72, 1
  %74 = add i32 %54, 134221823
  %75 = add i32 %74, %73
  %76 = lshr i32 %75, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %59, %65, %71
  %.sroa.0.0.i.i.i.i = phi i32 [ %70, %65 ], [ %76, %71 ], [ %62, %59 ]
  %77 = lshr exact i32 %55, 16
  %78 = or i32 %.sroa.0.0.i.i.i.i, %77
  %79 = trunc i32 %78 to i16
  %80 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %79, i16* %80, align 2, !tbaa !164, !alias.scope !257
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.17"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.17", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.17"* %eval to i8*
  call void @llvm.lifetime.start(i64 104, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.17"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 24, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.22"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.22"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 72, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.17", %"struct.Eigen::TensorEvaluator.17"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !262
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESB_EEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.21"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 104, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESB_EEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.21"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %this, i64 0, i32 1, i32 0
  %2 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %1, align 8, !tbaa !265, !noalias !267
  %3 = sext i32 %index to i64
  %.idx.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %2, i64 %3, i32 0, i32 0, i32 0
  %.idx.val.i = load i16, i16* %.idx.i, align 2, !tbaa !164, !noalias !267
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !270
  %6 = sdiv i32 %index, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !270
  %9 = srem i32 %6, %8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %11 = load i32, i32* %10, align 4, !tbaa !178, !noalias !270
  %12 = mul nsw i32 %11, %9
  %13 = mul nsw i32 %6, %5
  %14 = sub nsw i32 %index, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178, !noalias !270
  %17 = srem i32 %14, %16
  %18 = add nsw i32 %17, %12
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.21", %"struct.Eigen::TensorEvaluator.21"* %this, i64 0, i32 2, i32 3, i32 0
  %20 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %19, align 8, !tbaa !265, !noalias !275
  %21 = sext i32 %18 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %20, i64 %21, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !275
  %22 = zext i16 %.idx.val.i to i32
  %23 = shl nuw nsw i32 %22, 13
  %24 = and i32 %23, 268427264
  %25 = and i32 %23, 260046848
  %26 = icmp eq i32 %25, 260046848
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %0
  %28 = or i32 %23, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:29                                      ; preds = %0
  %30 = add nuw nsw i32 %24, 939524096
  %31 = icmp eq i32 %25, 0
  br i1 %31, label %32, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:32                                      ; preds = %29
  %33 = add nuw nsw i32 %24, 947912704
  %34 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !278
  %35 = bitcast i32 %33 to float
  %36 = fsub float %35, %34
  %37 = bitcast float %36 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %32, %29, %27
  %o.sroa.0.0.i.i.i.i = phi i32 [ %28, %27 ], [ %37, %32 ], [ %30, %29 ]
  %38 = shl nuw i32 %22, 16
  %39 = and i32 %38, -2147483648
  %40 = or i32 %o.sroa.0.0.i.i.i.i, %39
  %41 = bitcast i32 %40 to float
  %42 = zext i16 %.idx.val.i.i.i to i32
  %43 = shl nuw nsw i32 %42, 13
  %44 = and i32 %43, 268427264
  %45 = and i32 %43, 260046848
  %46 = icmp eq i32 %45, 260046848
  br i1 %46, label %47, label %49

; <label>:47                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %48 = or i32 %43, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:49                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %50 = add nuw nsw i32 %44, 939524096
  %51 = icmp eq i32 %45, 0
  br i1 %51, label %52, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:52                                      ; preds = %49
  %53 = add nuw nsw i32 %44, 947912704
  %54 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !278
  %55 = bitcast i32 %53 to float
  %56 = fsub float %55, %54
  %57 = bitcast float %56 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %52, %49, %47
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %48, %47 ], [ %57, %52 ], [ %50, %49 ]
  %58 = shl nuw i32 %42, 16
  %59 = and i32 %58, -2147483648
  %60 = or i32 %o.sroa.0.0.i.i1.i.i, %59
  %61 = bitcast i32 %60 to float
  %62 = fadd float %41, %61
  %63 = bitcast float %62 to i32
  %64 = and i32 %63, -2147483648
  %65 = xor i32 %64, %63
  %66 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !278
  %67 = icmp ult i32 %65, %66
  br i1 %67, label %72, label %68

; <label>:68                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %69 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !278
  %70 = icmp ugt i32 %65, %69
  %71 = select i1 %70, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:72                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %73 = icmp ult i32 %65, 947912704
  br i1 %73, label %74, label %80

; <label>:74                                      ; preds = %72
  %75 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !278
  %76 = bitcast i32 %65 to float
  %77 = fadd float %76, %75
  %78 = bitcast float %77 to i32
  %.cast.i.i.i.i = bitcast float %75 to i32
  %79 = sub i32 %78, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:80                                      ; preds = %72
  %81 = lshr i32 %63, 13
  %82 = and i32 %81, 1
  %83 = add i32 %63, 134221823
  %84 = add i32 %83, %82
  %85 = lshr i32 %84, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %68, %74, %80
  %.sroa.0.0.i.i.i.i = phi i32 [ %79, %74 ], [ %85, %80 ], [ %71, %68 ]
  %86 = lshr exact i32 %64, 16
  %87 = or i32 %.sroa.0.0.i.i.i.i, %86
  %88 = trunc i32 %87 to i16
  %89 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %88, i16* %89, align 2, !tbaa !164, !alias.scope !278
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.24"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.24", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.24"* %eval to i8*
  call void @llvm.lifetime.start(i64 104, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.24"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 24, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.24", %"struct.Eigen::TensorEvaluator.24"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.24", %"struct.Eigen::TensorEvaluator.24"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.23"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.23"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 72, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.24", %"struct.Eigen::TensorEvaluator.24"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.24", %"struct.Eigen::TensorEvaluator.24"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !262
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.25"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 104, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.25"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %this, i64 0, i32 1, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178, !noalias !283
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !283
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %this, i64 0, i32 1, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !283
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178, !noalias !283
  %14 = srem i32 %11, %13
  %15 = add nsw i32 %14, %9
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %this, i64 0, i32 1, i32 3, i32 0
  %17 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %16, align 8, !tbaa !265, !noalias !288
  %18 = sext i32 %15 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %17, i64 %18, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !288
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.25", %"struct.Eigen::TensorEvaluator.25"* %this, i64 0, i32 2, i32 0
  %20 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %19, align 8, !tbaa !265, !noalias !291
  %21 = sext i32 %index to i64
  %.idx.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %20, i64 %21, i32 0, i32 0, i32 0
  %.idx.val.i = load i16, i16* %.idx.i, align 2, !tbaa !164, !noalias !291
  %22 = zext i16 %.idx.val.i.i.i to i32
  %23 = shl nuw nsw i32 %22, 13
  %24 = and i32 %23, 268427264
  %25 = and i32 %23, 260046848
  %26 = icmp eq i32 %25, 260046848
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %0
  %28 = or i32 %23, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:29                                      ; preds = %0
  %30 = add nuw nsw i32 %24, 939524096
  %31 = icmp eq i32 %25, 0
  br i1 %31, label %32, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:32                                      ; preds = %29
  %33 = add nuw nsw i32 %24, 947912704
  %34 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !294
  %35 = bitcast i32 %33 to float
  %36 = fsub float %35, %34
  %37 = bitcast float %36 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %32, %29, %27
  %o.sroa.0.0.i.i.i.i = phi i32 [ %28, %27 ], [ %37, %32 ], [ %30, %29 ]
  %38 = shl nuw i32 %22, 16
  %39 = and i32 %38, -2147483648
  %40 = or i32 %o.sroa.0.0.i.i.i.i, %39
  %41 = bitcast i32 %40 to float
  %42 = zext i16 %.idx.val.i to i32
  %43 = shl nuw nsw i32 %42, 13
  %44 = and i32 %43, 268427264
  %45 = and i32 %43, 260046848
  %46 = icmp eq i32 %45, 260046848
  br i1 %46, label %47, label %49

; <label>:47                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %48 = or i32 %43, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:49                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %50 = add nuw nsw i32 %44, 939524096
  %51 = icmp eq i32 %45, 0
  br i1 %51, label %52, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:52                                      ; preds = %49
  %53 = add nuw nsw i32 %44, 947912704
  %54 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !294
  %55 = bitcast i32 %53 to float
  %56 = fsub float %55, %54
  %57 = bitcast float %56 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %52, %49, %47
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %48, %47 ], [ %57, %52 ], [ %50, %49 ]
  %58 = shl nuw i32 %42, 16
  %59 = and i32 %58, -2147483648
  %60 = or i32 %o.sroa.0.0.i.i1.i.i, %59
  %61 = bitcast i32 %60 to float
  %62 = fadd float %41, %61
  %63 = bitcast float %62 to i32
  %64 = and i32 %63, -2147483648
  %65 = xor i32 %64, %63
  %66 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !294
  %67 = icmp ult i32 %65, %66
  br i1 %67, label %72, label %68

; <label>:68                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %69 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !294
  %70 = icmp ugt i32 %65, %69
  %71 = select i1 %70, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:72                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %73 = icmp ult i32 %65, 947912704
  br i1 %73, label %74, label %80

; <label>:74                                      ; preds = %72
  %75 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !294
  %76 = bitcast i32 %65 to float
  %77 = fadd float %76, %75
  %78 = bitcast float %77 to i32
  %.cast.i.i.i.i = bitcast float %75 to i32
  %79 = sub i32 %78, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:80                                      ; preds = %72
  %81 = lshr i32 %63, 13
  %82 = and i32 %81, 1
  %83 = add i32 %63, 134221823
  %84 = add i32 %83, %82
  %85 = lshr i32 %84, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %68, %74, %80
  %.sroa.0.0.i.i.i.i = phi i32 [ %79, %74 ], [ %85, %80 ], [ %71, %68 ]
  %86 = lshr exact i32 %64, 16
  %87 = or i32 %.sroa.0.0.i.i.i.i, %86
  %88 = trunc i32 %87 to i16
  %89 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %88, i16* %89, align 2, !tbaa !164, !alias.scope !294
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.26"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.26", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.26"* %eval to i8*
  call void @llvm.lifetime.start(i64 128, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.26"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 24, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.26", %"struct.Eigen::TensorEvaluator.26"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.26", %"struct.Eigen::TensorEvaluator.26"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.23"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.23"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 96, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.26", %"struct.Eigen::TensorEvaluator.26"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.26", %"struct.Eigen::TensorEvaluator.26"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !262
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.27"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 128, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKS4_Li2ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.27"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %this, i64 0, i32 1, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178, !noalias !299
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !299
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %this, i64 0, i32 1, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !299
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178, !noalias !299
  %14 = srem i32 %11, %13
  %15 = add nsw i32 %14, %9
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %this, i64 0, i32 1, i32 3, i32 0
  %17 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %16, align 8, !tbaa !265, !noalias !304
  %18 = sext i32 %15 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %17, i64 %18, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !304
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %20 = load i32, i32* %19, align 4, !tbaa !178, !noalias !307
  %21 = sdiv i32 %index, %20
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %23 = load i32, i32* %22, align 4, !tbaa !178, !noalias !307
  %24 = srem i32 %21, %23
  %25 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %26 = load i32, i32* %25, align 4, !tbaa !178, !noalias !307
  %27 = mul nsw i32 %26, %24
  %28 = mul nsw i32 %21, %20
  %29 = sub nsw i32 %index, %28
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %31 = load i32, i32* %30, align 4, !tbaa !178, !noalias !307
  %32 = srem i32 %29, %31
  %33 = add nsw i32 %32, %27
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.27", %"struct.Eigen::TensorEvaluator.27"* %this, i64 0, i32 2, i32 3, i32 0
  %35 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %34, align 8, !tbaa !265, !noalias !312
  %36 = sext i32 %33 to i64
  %.idx.i.i.i1 = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %35, i64 %36, i32 0, i32 0, i32 0
  %.idx.val.i.i.i2 = load i16, i16* %.idx.i.i.i1, align 2, !tbaa !164, !noalias !312
  %37 = zext i16 %.idx.val.i.i.i to i32
  %38 = shl nuw nsw i32 %37, 13
  %39 = and i32 %38, 268427264
  %40 = and i32 %38, 260046848
  %41 = icmp eq i32 %40, 260046848
  br i1 %41, label %42, label %44

; <label>:42                                      ; preds = %0
  %43 = or i32 %38, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:44                                      ; preds = %0
  %45 = add nuw nsw i32 %39, 939524096
  %46 = icmp eq i32 %40, 0
  br i1 %46, label %47, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:47                                      ; preds = %44
  %48 = add nuw nsw i32 %39, 947912704
  %49 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !315
  %50 = bitcast i32 %48 to float
  %51 = fsub float %50, %49
  %52 = bitcast float %51 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %47, %44, %42
  %o.sroa.0.0.i.i.i.i = phi i32 [ %43, %42 ], [ %52, %47 ], [ %45, %44 ]
  %53 = shl nuw i32 %37, 16
  %54 = and i32 %53, -2147483648
  %55 = or i32 %o.sroa.0.0.i.i.i.i, %54
  %56 = bitcast i32 %55 to float
  %57 = zext i16 %.idx.val.i.i.i2 to i32
  %58 = shl nuw nsw i32 %57, 13
  %59 = and i32 %58, 268427264
  %60 = and i32 %58, 260046848
  %61 = icmp eq i32 %60, 260046848
  br i1 %61, label %62, label %64

; <label>:62                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %63 = or i32 %58, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:64                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %65 = add nuw nsw i32 %59, 939524096
  %66 = icmp eq i32 %60, 0
  br i1 %66, label %67, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:67                                      ; preds = %64
  %68 = add nuw nsw i32 %59, 947912704
  %69 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !315
  %70 = bitcast i32 %68 to float
  %71 = fsub float %70, %69
  %72 = bitcast float %71 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %67, %64, %62
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %63, %62 ], [ %72, %67 ], [ %65, %64 ]
  %73 = shl nuw i32 %57, 16
  %74 = and i32 %73, -2147483648
  %75 = or i32 %o.sroa.0.0.i.i1.i.i, %74
  %76 = bitcast i32 %75 to float
  %77 = fadd float %56, %76
  %78 = bitcast float %77 to i32
  %79 = and i32 %78, -2147483648
  %80 = xor i32 %79, %78
  %81 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !315
  %82 = icmp ult i32 %80, %81
  br i1 %82, label %87, label %83

; <label>:83                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %84 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !315
  %85 = icmp ugt i32 %80, %84
  %86 = select i1 %85, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:87                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %88 = icmp ult i32 %80, 947912704
  br i1 %88, label %89, label %95

; <label>:89                                      ; preds = %87
  %90 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !315
  %91 = bitcast i32 %80 to float
  %92 = fadd float %91, %90
  %93 = bitcast float %92 to i32
  %.cast.i.i.i.i = bitcast float %90 to i32
  %94 = sub i32 %93, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:95                                      ; preds = %87
  %96 = lshr i32 %78, 13
  %97 = and i32 %96, 1
  %98 = add i32 %78, 134221823
  %99 = add i32 %98, %97
  %100 = lshr i32 %99, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %83, %89, %95
  %.sroa.0.0.i.i.i.i = phi i32 [ %94, %89 ], [ %100, %95 ], [ %86, %83 ]
  %101 = lshr exact i32 %79, 16
  %102 = or i32 %.sroa.0.0.i.i.i.i, %101
  %103 = trunc i32 %102 to i16
  %104 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %103, i16* %104, align 2, !tbaa !164, !alias.scope !315
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.28"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.28", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.28"* %eval to i8*
  call void @llvm.lifetime.start(i64 144, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.28"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 32, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.28", %"struct.Eigen::TensorEvaluator.28"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.28", %"struct.Eigen::TensorEvaluator.28"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.33"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.33"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 104, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.28", %"struct.Eigen::TensorEvaluator.28"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.28", %"struct.Eigen::TensorEvaluator.28"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !320
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESB_EEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.32"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 144, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESB_EEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.32"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %this, i64 0, i32 1, i32 0
  %2 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %1, align 8, !tbaa !323, !noalias !325
  %3 = sext i32 %index to i64
  %.idx.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %2, i64 %3, i32 0, i32 0, i32 0
  %.idx.val.i = load i16, i16* %.idx.i, align 2, !tbaa !164, !noalias !325
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !328
  %6 = sdiv i32 %index, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !328
  %9 = srem i32 %6, %8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %11 = load i32, i32* %10, align 4, !tbaa !178, !noalias !328
  %12 = mul nsw i32 %11, %9
  %13 = mul nsw i32 %6, %5
  %14 = sub nsw i32 %index, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %this, i64 0, i32 2, i32 1, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178, !noalias !328
  %17 = sdiv i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178, !noalias !328
  %20 = srem i32 %17, %19
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %this, i64 0, i32 2, i32 2, i32 0, i64 1
  %22 = load i32, i32* %21, align 4, !tbaa !178, !noalias !328
  %23 = mul nsw i32 %22, %20
  %24 = add nsw i32 %23, %12
  %25 = mul nsw i32 %17, %16
  %26 = sub nsw i32 %14, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178, !noalias !328
  %29 = srem i32 %26, %28
  %30 = add nsw i32 %24, %29
  %31 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.32", %"struct.Eigen::TensorEvaluator.32"* %this, i64 0, i32 2, i32 3, i32 0
  %32 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %31, align 8, !tbaa !323, !noalias !333
  %33 = sext i32 %30 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %32, i64 %33, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !333
  %34 = zext i16 %.idx.val.i to i32
  %35 = shl nuw nsw i32 %34, 13
  %36 = and i32 %35, 268427264
  %37 = and i32 %35, 260046848
  %38 = icmp eq i32 %37, 260046848
  br i1 %38, label %39, label %41

; <label>:39                                      ; preds = %0
  %40 = or i32 %35, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:41                                      ; preds = %0
  %42 = add nuw nsw i32 %36, 939524096
  %43 = icmp eq i32 %37, 0
  br i1 %43, label %44, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:44                                      ; preds = %41
  %45 = add nuw nsw i32 %36, 947912704
  %46 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !336
  %47 = bitcast i32 %45 to float
  %48 = fsub float %47, %46
  %49 = bitcast float %48 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %44, %41, %39
  %o.sroa.0.0.i.i.i.i = phi i32 [ %40, %39 ], [ %49, %44 ], [ %42, %41 ]
  %50 = shl nuw i32 %34, 16
  %51 = and i32 %50, -2147483648
  %52 = or i32 %o.sroa.0.0.i.i.i.i, %51
  %53 = bitcast i32 %52 to float
  %54 = zext i16 %.idx.val.i.i.i to i32
  %55 = shl nuw nsw i32 %54, 13
  %56 = and i32 %55, 268427264
  %57 = and i32 %55, 260046848
  %58 = icmp eq i32 %57, 260046848
  br i1 %58, label %59, label %61

; <label>:59                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %60 = or i32 %55, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:61                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %62 = add nuw nsw i32 %56, 939524096
  %63 = icmp eq i32 %57, 0
  br i1 %63, label %64, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:64                                      ; preds = %61
  %65 = add nuw nsw i32 %56, 947912704
  %66 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !336
  %67 = bitcast i32 %65 to float
  %68 = fsub float %67, %66
  %69 = bitcast float %68 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %64, %61, %59
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %60, %59 ], [ %69, %64 ], [ %62, %61 ]
  %70 = shl nuw i32 %54, 16
  %71 = and i32 %70, -2147483648
  %72 = or i32 %o.sroa.0.0.i.i1.i.i, %71
  %73 = bitcast i32 %72 to float
  %74 = fadd float %53, %73
  %75 = bitcast float %74 to i32
  %76 = and i32 %75, -2147483648
  %77 = xor i32 %76, %75
  %78 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !336
  %79 = icmp ult i32 %77, %78
  br i1 %79, label %84, label %80

; <label>:80                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %81 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !336
  %82 = icmp ugt i32 %77, %81
  %83 = select i1 %82, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:84                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %85 = icmp ult i32 %77, 947912704
  br i1 %85, label %86, label %92

; <label>:86                                      ; preds = %84
  %87 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !336
  %88 = bitcast i32 %77 to float
  %89 = fadd float %88, %87
  %90 = bitcast float %89 to i32
  %.cast.i.i.i.i = bitcast float %87 to i32
  %91 = sub i32 %90, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:92                                      ; preds = %84
  %93 = lshr i32 %75, 13
  %94 = and i32 %93, 1
  %95 = add i32 %75, 134221823
  %96 = add i32 %95, %94
  %97 = lshr i32 %96, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %80, %86, %92
  %.sroa.0.0.i.i.i.i = phi i32 [ %91, %86 ], [ %97, %92 ], [ %83, %80 ]
  %98 = lshr exact i32 %76, 16
  %99 = or i32 %.sroa.0.0.i.i.i.i, %98
  %100 = trunc i32 %99 to i16
  %101 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %100, i16* %101, align 2, !tbaa !164, !alias.scope !336
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.35"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.35", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.35"* %eval to i8*
  call void @llvm.lifetime.start(i64 144, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.35"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 32, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.34"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.34"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 104, i32 8, i1 false) #6
  %14 = icmp slt i32 %5, %size
  br i1 %14, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %15, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  call void @_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIS4_S4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKS4_Li3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEE10evalScalarEi(%"struct.Eigen::TensorEvaluator.35"* nonnull %eval, i32 %i.01.i) #6
  %15 = add nsw i32 %i.01.i, %7
  %16 = icmp slt i32 %15, %size
  br i1 %16, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 144, i8* %8) #6
  ret void
}

; Function Attrs: inlinehint norecurse nounwind
define linkonce_odr void @_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIS4_S4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKS4_Li3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEE10evalScalarEi(%"struct.Eigen::TensorEvaluator.35"* nocapture readonly %this, i32 %i) #4 comdat align 2 {
  %1 = sext i32 %i to i64
  %2 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %this, i64 0, i32 0, i32 0
  %3 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %2, align 8, !tbaa !320
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %this, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !341
  %6 = sdiv i32 %i, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %this, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !341
  %9 = srem i32 %6, %8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %this, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %11 = load i32, i32* %10, align 4, !tbaa !178, !noalias !341
  %12 = mul nsw i32 %11, %9
  %13 = mul nsw i32 %6, %5
  %14 = sub nsw i32 %i, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %this, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178, !noalias !341
  %17 = sdiv i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %this, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178, !noalias !341
  %20 = srem i32 %17, %19
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %this, i64 0, i32 1, i32 1, i32 2, i32 0, i64 1
  %22 = load i32, i32* %21, align 4, !tbaa !178, !noalias !341
  %23 = mul nsw i32 %22, %20
  %24 = add nsw i32 %23, %12
  %25 = mul nsw i32 %17, %16
  %26 = sub nsw i32 %14, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %this, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178, !noalias !341
  %29 = srem i32 %26, %28
  %30 = add nsw i32 %24, %29
  %31 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %this, i64 0, i32 1, i32 1, i32 3, i32 0
  %32 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %31, align 8, !tbaa !323, !noalias !348
  %33 = sext i32 %30 to i64
  %.idx.i.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %32, i64 %33, i32 0, i32 0, i32 0
  %.idx.val.i.i.i.i = load i16, i16* %.idx.i.i.i.i, align 2, !tbaa !164, !noalias !348
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.35", %"struct.Eigen::TensorEvaluator.35"* %this, i64 0, i32 1, i32 2, i32 0
  %35 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %34, align 8, !tbaa !323, !noalias !351
  %.idx.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %35, i64 %1, i32 0, i32 0, i32 0
  %.idx.val.i.i = load i16, i16* %.idx.i.i, align 2, !tbaa !164, !noalias !351
  %36 = zext i16 %.idx.val.i.i.i.i to i32
  %37 = shl nuw nsw i32 %36, 13
  %38 = and i32 %37, 268427264
  %39 = and i32 %37, 260046848
  %40 = icmp eq i32 %39, 260046848
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %0
  %42 = or i32 %37, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:43                                      ; preds = %0
  %44 = add nuw nsw i32 %38, 939524096
  %45 = icmp eq i32 %39, 0
  br i1 %45, label %46, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:46                                      ; preds = %43
  %47 = add nuw nsw i32 %38, 947912704
  %48 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !354
  %49 = bitcast i32 %47 to float
  %50 = fsub float %49, %48
  %51 = bitcast float %50 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %46, %43, %41
  %o.sroa.0.0.i.i.i.i = phi i32 [ %42, %41 ], [ %51, %46 ], [ %44, %43 ]
  %52 = shl nuw i32 %36, 16
  %53 = and i32 %52, -2147483648
  %54 = or i32 %o.sroa.0.0.i.i.i.i, %53
  %55 = bitcast i32 %54 to float
  %56 = zext i16 %.idx.val.i.i to i32
  %57 = shl nuw nsw i32 %56, 13
  %58 = and i32 %57, 268427264
  %59 = and i32 %57, 260046848
  %60 = icmp eq i32 %59, 260046848
  br i1 %60, label %61, label %63

; <label>:61                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %62 = or i32 %57, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:63                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %64 = add nuw nsw i32 %58, 939524096
  %65 = icmp eq i32 %59, 0
  br i1 %65, label %66, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:66                                      ; preds = %63
  %67 = add nuw nsw i32 %58, 947912704
  %68 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !354
  %69 = bitcast i32 %67 to float
  %70 = fsub float %69, %68
  %71 = bitcast float %70 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %66, %63, %61
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %62, %61 ], [ %71, %66 ], [ %64, %63 ]
  %72 = shl nuw i32 %56, 16
  %73 = and i32 %72, -2147483648
  %74 = or i32 %o.sroa.0.0.i.i1.i.i, %73
  %75 = bitcast i32 %74 to float
  %76 = fadd float %55, %75
  %77 = bitcast float %76 to i32
  %78 = and i32 %77, -2147483648
  %79 = xor i32 %78, %77
  %80 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !354
  %81 = icmp ult i32 %79, %80
  br i1 %81, label %86, label %82

; <label>:82                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %83 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !354
  %84 = icmp ugt i32 %79, %83
  %85 = select i1 %84, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:86                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %87 = icmp ult i32 %79, 947912704
  br i1 %87, label %88, label %94

; <label>:88                                      ; preds = %86
  %89 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !354
  %90 = bitcast i32 %79 to float
  %91 = fadd float %90, %89
  %92 = bitcast float %91 to i32
  %.cast.i.i.i.i = bitcast float %89 to i32
  %93 = sub i32 %92, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:94                                      ; preds = %86
  %95 = lshr i32 %77, 13
  %96 = and i32 %95, 1
  %97 = add i32 %77, 134221823
  %98 = add i32 %97, %96
  %99 = lshr i32 %98, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %82, %88, %94
  %.sroa.0.0.i.i.i.i = phi i32 [ %93, %88 ], [ %99, %94 ], [ %85, %82 ]
  %100 = lshr exact i32 %78, 16
  %101 = or i32 %.sroa.0.0.i.i.i.i, %100
  %102 = trunc i32 %101 to i16
  %103 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %3, i64 %1, i32 0, i32 0, i32 0
  store i16 %102, i16* %103, align 2, !tbaa !156
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.37"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.37", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.37"* %eval to i8*
  call void @llvm.lifetime.start(i64 184, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.37"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 32, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::TensorEvaluator.37"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::TensorEvaluator.37"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.34"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.34"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 144, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::TensorEvaluator.37"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.37", %"struct.Eigen::TensorEvaluator.37"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !320
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.38"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 184, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.38"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 1, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178, !noalias !359
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !359
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 1, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !359
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 1, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178, !noalias !359
  %14 = sdiv i32 %11, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178, !noalias !359
  %17 = srem i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 1, i32 2, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178, !noalias !359
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %9
  %22 = mul nsw i32 %14, %13
  %23 = sub nsw i32 %11, %22
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !178, !noalias !359
  %26 = srem i32 %23, %25
  %27 = add nsw i32 %21, %26
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 1, i32 3, i32 0
  %29 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %28, align 8, !tbaa !323, !noalias !364
  %30 = sext i32 %27 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %29, i64 %30, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !364
  %31 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %32 = load i32, i32* %31, align 4, !tbaa !178, !noalias !367
  %33 = sdiv i32 %index, %32
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %35 = load i32, i32* %34, align 4, !tbaa !178, !noalias !367
  %36 = srem i32 %33, %35
  %37 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %38 = load i32, i32* %37, align 4, !tbaa !178, !noalias !367
  %39 = mul nsw i32 %38, %36
  %40 = mul nsw i32 %33, %32
  %41 = sub nsw i32 %index, %40
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 2, i32 1, i32 0, i64 1
  %43 = load i32, i32* %42, align 4, !tbaa !178, !noalias !367
  %44 = sdiv i32 %41, %43
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %46 = load i32, i32* %45, align 4, !tbaa !178, !noalias !367
  %47 = srem i32 %44, %46
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 2, i32 2, i32 0, i64 1
  %49 = load i32, i32* %48, align 4, !tbaa !178, !noalias !367
  %50 = mul nsw i32 %49, %47
  %51 = add nsw i32 %50, %39
  %52 = mul nsw i32 %44, %43
  %53 = sub nsw i32 %41, %52
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %55 = load i32, i32* %54, align 4, !tbaa !178, !noalias !367
  %56 = srem i32 %53, %55
  %57 = add nsw i32 %51, %56
  %58 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.38", %"struct.Eigen::TensorEvaluator.38"* %this, i64 0, i32 2, i32 3, i32 0
  %59 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %58, align 8, !tbaa !323, !noalias !372
  %60 = sext i32 %57 to i64
  %.idx.i.i.i1 = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %59, i64 %60, i32 0, i32 0, i32 0
  %.idx.val.i.i.i2 = load i16, i16* %.idx.i.i.i1, align 2, !tbaa !164, !noalias !372
  %61 = zext i16 %.idx.val.i.i.i to i32
  %62 = shl nuw nsw i32 %61, 13
  %63 = and i32 %62, 268427264
  %64 = and i32 %62, 260046848
  %65 = icmp eq i32 %64, 260046848
  br i1 %65, label %66, label %68

; <label>:66                                      ; preds = %0
  %67 = or i32 %62, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:68                                      ; preds = %0
  %69 = add nuw nsw i32 %63, 939524096
  %70 = icmp eq i32 %64, 0
  br i1 %70, label %71, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:71                                      ; preds = %68
  %72 = add nuw nsw i32 %63, 947912704
  %73 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !375
  %74 = bitcast i32 %72 to float
  %75 = fsub float %74, %73
  %76 = bitcast float %75 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %71, %68, %66
  %o.sroa.0.0.i.i.i.i = phi i32 [ %67, %66 ], [ %76, %71 ], [ %69, %68 ]
  %77 = shl nuw i32 %61, 16
  %78 = and i32 %77, -2147483648
  %79 = or i32 %o.sroa.0.0.i.i.i.i, %78
  %80 = bitcast i32 %79 to float
  %81 = zext i16 %.idx.val.i.i.i2 to i32
  %82 = shl nuw nsw i32 %81, 13
  %83 = and i32 %82, 268427264
  %84 = and i32 %82, 260046848
  %85 = icmp eq i32 %84, 260046848
  br i1 %85, label %86, label %88

; <label>:86                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %87 = or i32 %82, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:88                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %89 = add nuw nsw i32 %83, 939524096
  %90 = icmp eq i32 %84, 0
  br i1 %90, label %91, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:91                                      ; preds = %88
  %92 = add nuw nsw i32 %83, 947912704
  %93 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !375
  %94 = bitcast i32 %92 to float
  %95 = fsub float %94, %93
  %96 = bitcast float %95 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %91, %88, %86
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %87, %86 ], [ %96, %91 ], [ %89, %88 ]
  %97 = shl nuw i32 %81, 16
  %98 = and i32 %97, -2147483648
  %99 = or i32 %o.sroa.0.0.i.i1.i.i, %98
  %100 = bitcast i32 %99 to float
  %101 = fadd float %80, %100
  %102 = bitcast float %101 to i32
  %103 = and i32 %102, -2147483648
  %104 = xor i32 %103, %102
  %105 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !375
  %106 = icmp ult i32 %104, %105
  br i1 %106, label %111, label %107

; <label>:107                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %108 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !375
  %109 = icmp ugt i32 %104, %108
  %110 = select i1 %109, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:111                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %112 = icmp ult i32 %104, 947912704
  br i1 %112, label %113, label %119

; <label>:113                                     ; preds = %111
  %114 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !375
  %115 = bitcast i32 %104 to float
  %116 = fadd float %115, %114
  %117 = bitcast float %116 to i32
  %.cast.i.i.i.i = bitcast float %114 to i32
  %118 = sub i32 %117, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:119                                     ; preds = %111
  %120 = lshr i32 %102, 13
  %121 = and i32 %120, 1
  %122 = add i32 %102, 134221823
  %123 = add i32 %122, %121
  %124 = lshr i32 %123, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %107, %113, %119
  %.sroa.0.0.i.i.i.i = phi i32 [ %118, %113 ], [ %124, %119 ], [ %110, %107 ]
  %125 = lshr exact i32 %103, 16
  %126 = or i32 %.sroa.0.0.i.i.i.i, %125
  %127 = trunc i32 %126 to i16
  %128 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %127, i16* %128, align 2, !tbaa !164, !alias.scope !375
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.39"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.39", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.39"* %eval to i8*
  call void @llvm.lifetime.start(i64 152, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.39"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 32, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.39", %"struct.Eigen::TensorEvaluator.39"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.39", %"struct.Eigen::TensorEvaluator.39"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.44"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.44"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 112, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.39", %"struct.Eigen::TensorEvaluator.39"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.39", %"struct.Eigen::TensorEvaluator.39"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !380
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESB_EEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.43"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 152, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESB_EEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.43"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 1, i32 0
  %2 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %1, align 8, !tbaa !383, !noalias !385
  %3 = sext i32 %index to i64
  %.idx.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %2, i64 %3, i32 0, i32 0, i32 0
  %.idx.val.i = load i16, i16* %.idx.i, align 2, !tbaa !164, !noalias !385
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !388
  %6 = sdiv i32 %index, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !388
  %9 = srem i32 %6, %8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %11 = load i32, i32* %10, align 4, !tbaa !178, !noalias !388
  %12 = mul nsw i32 %11, %9
  %13 = mul nsw i32 %6, %5
  %14 = sub nsw i32 %index, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 1, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178, !noalias !388
  %17 = sdiv i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178, !noalias !388
  %20 = srem i32 %17, %19
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 2, i32 0, i64 1
  %22 = load i32, i32* %21, align 4, !tbaa !178, !noalias !388
  %23 = mul nsw i32 %22, %20
  %24 = add nsw i32 %23, %12
  %25 = mul nsw i32 %17, %16
  %26 = sub nsw i32 %14, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 1, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178, !noalias !388
  %29 = sdiv i32 %26, %28
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %31 = load i32, i32* %30, align 4, !tbaa !178, !noalias !388
  %32 = srem i32 %29, %31
  %33 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 2, i32 0, i64 2
  %34 = load i32, i32* %33, align 4, !tbaa !178, !noalias !388
  %35 = mul nsw i32 %34, %32
  %36 = add nsw i32 %24, %35
  %37 = mul nsw i32 %29, %28
  %38 = sub nsw i32 %26, %37
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 3
  %40 = load i32, i32* %39, align 4, !tbaa !178, !noalias !388
  %41 = srem i32 %38, %40
  %42 = add nsw i32 %36, %41
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.43", %"struct.Eigen::TensorEvaluator.43"* %this, i64 0, i32 2, i32 3, i32 0
  %44 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %43, align 8, !tbaa !383, !noalias !393
  %45 = sext i32 %42 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %44, i64 %45, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !393
  %46 = zext i16 %.idx.val.i to i32
  %47 = shl nuw nsw i32 %46, 13
  %48 = and i32 %47, 268427264
  %49 = and i32 %47, 260046848
  %50 = icmp eq i32 %49, 260046848
  br i1 %50, label %51, label %53

; <label>:51                                      ; preds = %0
  %52 = or i32 %47, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:53                                      ; preds = %0
  %54 = add nuw nsw i32 %48, 939524096
  %55 = icmp eq i32 %49, 0
  br i1 %55, label %56, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:56                                      ; preds = %53
  %57 = add nuw nsw i32 %48, 947912704
  %58 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !396
  %59 = bitcast i32 %57 to float
  %60 = fsub float %59, %58
  %61 = bitcast float %60 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %56, %53, %51
  %o.sroa.0.0.i.i.i.i = phi i32 [ %52, %51 ], [ %61, %56 ], [ %54, %53 ]
  %62 = shl nuw i32 %46, 16
  %63 = and i32 %62, -2147483648
  %64 = or i32 %o.sroa.0.0.i.i.i.i, %63
  %65 = bitcast i32 %64 to float
  %66 = zext i16 %.idx.val.i.i.i to i32
  %67 = shl nuw nsw i32 %66, 13
  %68 = and i32 %67, 268427264
  %69 = and i32 %67, 260046848
  %70 = icmp eq i32 %69, 260046848
  br i1 %70, label %71, label %73

; <label>:71                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %72 = or i32 %67, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:73                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %74 = add nuw nsw i32 %68, 939524096
  %75 = icmp eq i32 %69, 0
  br i1 %75, label %76, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:76                                      ; preds = %73
  %77 = add nuw nsw i32 %68, 947912704
  %78 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !396
  %79 = bitcast i32 %77 to float
  %80 = fsub float %79, %78
  %81 = bitcast float %80 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %76, %73, %71
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %72, %71 ], [ %81, %76 ], [ %74, %73 ]
  %82 = shl nuw i32 %66, 16
  %83 = and i32 %82, -2147483648
  %84 = or i32 %o.sroa.0.0.i.i1.i.i, %83
  %85 = bitcast i32 %84 to float
  %86 = fadd float %65, %85
  %87 = bitcast float %86 to i32
  %88 = and i32 %87, -2147483648
  %89 = xor i32 %88, %87
  %90 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !396
  %91 = icmp ult i32 %89, %90
  br i1 %91, label %96, label %92

; <label>:92                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %93 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !396
  %94 = icmp ugt i32 %89, %93
  %95 = select i1 %94, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:96                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %97 = icmp ult i32 %89, 947912704
  br i1 %97, label %98, label %104

; <label>:98                                      ; preds = %96
  %99 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !396
  %100 = bitcast i32 %89 to float
  %101 = fadd float %100, %99
  %102 = bitcast float %101 to i32
  %.cast.i.i.i.i = bitcast float %99 to i32
  %103 = sub i32 %102, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:104                                     ; preds = %96
  %105 = lshr i32 %87, 13
  %106 = and i32 %105, 1
  %107 = add i32 %87, 134221823
  %108 = add i32 %107, %106
  %109 = lshr i32 %108, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %92, %98, %104
  %.sroa.0.0.i.i.i.i = phi i32 [ %103, %98 ], [ %109, %104 ], [ %95, %92 ]
  %110 = lshr exact i32 %88, 16
  %111 = or i32 %.sroa.0.0.i.i.i.i, %110
  %112 = trunc i32 %111 to i16
  %113 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %112, i16* %113, align 2, !tbaa !164, !alias.scope !396
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.46"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.46", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.46"* %eval to i8*
  call void @llvm.lifetime.start(i64 152, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.46"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 32, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.46", %"struct.Eigen::TensorEvaluator.46"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.46", %"struct.Eigen::TensorEvaluator.46"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.45"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.45"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 112, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.46", %"struct.Eigen::TensorEvaluator.46"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.46", %"struct.Eigen::TensorEvaluator.46"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !380
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.47"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 152, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.47"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178, !noalias !401
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !401
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !401
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178, !noalias !401
  %14 = sdiv i32 %11, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178, !noalias !401
  %17 = srem i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 2, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178, !noalias !401
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %9
  %22 = mul nsw i32 %14, %13
  %23 = sub nsw i32 %11, %22
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 1, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !178, !noalias !401
  %26 = sdiv i32 %23, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178, !noalias !401
  %29 = srem i32 %26, %28
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 2, i32 0, i64 2
  %31 = load i32, i32* %30, align 4, !tbaa !178, !noalias !401
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %21, %32
  %34 = mul nsw i32 %26, %25
  %35 = sub nsw i32 %23, %34
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 3
  %37 = load i32, i32* %36, align 4, !tbaa !178, !noalias !401
  %38 = srem i32 %35, %37
  %39 = add nsw i32 %33, %38
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 1, i32 3, i32 0
  %41 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %40, align 8, !tbaa !383, !noalias !406
  %42 = sext i32 %39 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %41, i64 %42, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !406
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.47", %"struct.Eigen::TensorEvaluator.47"* %this, i64 0, i32 2, i32 0
  %44 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %43, align 8, !tbaa !383, !noalias !409
  %45 = sext i32 %index to i64
  %.idx.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %44, i64 %45, i32 0, i32 0, i32 0
  %.idx.val.i = load i16, i16* %.idx.i, align 2, !tbaa !164, !noalias !409
  %46 = zext i16 %.idx.val.i.i.i to i32
  %47 = shl nuw nsw i32 %46, 13
  %48 = and i32 %47, 268427264
  %49 = and i32 %47, 260046848
  %50 = icmp eq i32 %49, 260046848
  br i1 %50, label %51, label %53

; <label>:51                                      ; preds = %0
  %52 = or i32 %47, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:53                                      ; preds = %0
  %54 = add nuw nsw i32 %48, 939524096
  %55 = icmp eq i32 %49, 0
  br i1 %55, label %56, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:56                                      ; preds = %53
  %57 = add nuw nsw i32 %48, 947912704
  %58 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !412
  %59 = bitcast i32 %57 to float
  %60 = fsub float %59, %58
  %61 = bitcast float %60 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %56, %53, %51
  %o.sroa.0.0.i.i.i.i = phi i32 [ %52, %51 ], [ %61, %56 ], [ %54, %53 ]
  %62 = shl nuw i32 %46, 16
  %63 = and i32 %62, -2147483648
  %64 = or i32 %o.sroa.0.0.i.i.i.i, %63
  %65 = bitcast i32 %64 to float
  %66 = zext i16 %.idx.val.i to i32
  %67 = shl nuw nsw i32 %66, 13
  %68 = and i32 %67, 268427264
  %69 = and i32 %67, 260046848
  %70 = icmp eq i32 %69, 260046848
  br i1 %70, label %71, label %73

; <label>:71                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %72 = or i32 %67, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:73                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %74 = add nuw nsw i32 %68, 939524096
  %75 = icmp eq i32 %69, 0
  br i1 %75, label %76, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:76                                      ; preds = %73
  %77 = add nuw nsw i32 %68, 947912704
  %78 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !412
  %79 = bitcast i32 %77 to float
  %80 = fsub float %79, %78
  %81 = bitcast float %80 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %76, %73, %71
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %72, %71 ], [ %81, %76 ], [ %74, %73 ]
  %82 = shl nuw i32 %66, 16
  %83 = and i32 %82, -2147483648
  %84 = or i32 %o.sroa.0.0.i.i1.i.i, %83
  %85 = bitcast i32 %84 to float
  %86 = fadd float %65, %85
  %87 = bitcast float %86 to i32
  %88 = and i32 %87, -2147483648
  %89 = xor i32 %88, %87
  %90 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !412
  %91 = icmp ult i32 %89, %90
  br i1 %91, label %96, label %92

; <label>:92                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %93 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !412
  %94 = icmp ugt i32 %89, %93
  %95 = select i1 %94, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:96                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %97 = icmp ult i32 %89, 947912704
  br i1 %97, label %98, label %104

; <label>:98                                      ; preds = %96
  %99 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !412
  %100 = bitcast i32 %89 to float
  %101 = fadd float %100, %99
  %102 = bitcast float %101 to i32
  %.cast.i.i.i.i = bitcast float %99 to i32
  %103 = sub i32 %102, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:104                                     ; preds = %96
  %105 = lshr i32 %87, 13
  %106 = and i32 %105, 1
  %107 = add i32 %87, 134221823
  %108 = add i32 %107, %106
  %109 = lshr i32 %108, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %92, %98, %104
  %.sroa.0.0.i.i.i.i = phi i32 [ %103, %98 ], [ %109, %104 ], [ %95, %92 ]
  %110 = lshr exact i32 %88, 16
  %111 = or i32 %.sroa.0.0.i.i.i.i, %110
  %112 = trunc i32 %111 to i16
  %113 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %112, i16* %113, align 2, !tbaa !164, !alias.scope !412
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.48"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.48", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.48"* %eval to i8*
  call void @llvm.lifetime.start(i64 200, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.48"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 32, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.48", %"struct.Eigen::TensorEvaluator.48"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.48", %"struct.Eigen::TensorEvaluator.48"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.45"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.45"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 160, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.48", %"struct.Eigen::TensorEvaluator.48"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.48", %"struct.Eigen::TensorEvaluator.48"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !380
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.49"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 200, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKS4_Li4ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.49"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178, !noalias !417
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !417
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !417
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178, !noalias !417
  %14 = sdiv i32 %11, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178, !noalias !417
  %17 = srem i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 2, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178, !noalias !417
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %9
  %22 = mul nsw i32 %14, %13
  %23 = sub nsw i32 %11, %22
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 1, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !178, !noalias !417
  %26 = sdiv i32 %23, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178, !noalias !417
  %29 = srem i32 %26, %28
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 2, i32 0, i64 2
  %31 = load i32, i32* %30, align 4, !tbaa !178, !noalias !417
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %21, %32
  %34 = mul nsw i32 %26, %25
  %35 = sub nsw i32 %23, %34
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 3
  %37 = load i32, i32* %36, align 4, !tbaa !178, !noalias !417
  %38 = srem i32 %35, %37
  %39 = add nsw i32 %33, %38
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 1, i32 3, i32 0
  %41 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %40, align 8, !tbaa !383, !noalias !422
  %42 = sext i32 %39 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %41, i64 %42, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !422
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %44 = load i32, i32* %43, align 4, !tbaa !178, !noalias !425
  %45 = sdiv i32 %index, %44
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %47 = load i32, i32* %46, align 4, !tbaa !178, !noalias !425
  %48 = srem i32 %45, %47
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %50 = load i32, i32* %49, align 4, !tbaa !178, !noalias !425
  %51 = mul nsw i32 %50, %48
  %52 = mul nsw i32 %45, %44
  %53 = sub nsw i32 %index, %52
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 1, i32 0, i64 1
  %55 = load i32, i32* %54, align 4, !tbaa !178, !noalias !425
  %56 = sdiv i32 %53, %55
  %57 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %58 = load i32, i32* %57, align 4, !tbaa !178, !noalias !425
  %59 = srem i32 %56, %58
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 2, i32 0, i64 1
  %61 = load i32, i32* %60, align 4, !tbaa !178, !noalias !425
  %62 = mul nsw i32 %61, %59
  %63 = add nsw i32 %62, %51
  %64 = mul nsw i32 %56, %55
  %65 = sub nsw i32 %53, %64
  %66 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 1, i32 0, i64 2
  %67 = load i32, i32* %66, align 4, !tbaa !178, !noalias !425
  %68 = sdiv i32 %65, %67
  %69 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %70 = load i32, i32* %69, align 4, !tbaa !178, !noalias !425
  %71 = srem i32 %68, %70
  %72 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 2, i32 0, i64 2
  %73 = load i32, i32* %72, align 4, !tbaa !178, !noalias !425
  %74 = mul nsw i32 %73, %71
  %75 = add nsw i32 %63, %74
  %76 = mul nsw i32 %68, %67
  %77 = sub nsw i32 %65, %76
  %78 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 3
  %79 = load i32, i32* %78, align 4, !tbaa !178, !noalias !425
  %80 = srem i32 %77, %79
  %81 = add nsw i32 %75, %80
  %82 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.49", %"struct.Eigen::TensorEvaluator.49"* %this, i64 0, i32 2, i32 3, i32 0
  %83 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %82, align 8, !tbaa !383, !noalias !430
  %84 = sext i32 %81 to i64
  %.idx.i.i.i1 = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %83, i64 %84, i32 0, i32 0, i32 0
  %.idx.val.i.i.i2 = load i16, i16* %.idx.i.i.i1, align 2, !tbaa !164, !noalias !430
  %85 = zext i16 %.idx.val.i.i.i to i32
  %86 = shl nuw nsw i32 %85, 13
  %87 = and i32 %86, 268427264
  %88 = and i32 %86, 260046848
  %89 = icmp eq i32 %88, 260046848
  br i1 %89, label %90, label %92

; <label>:90                                      ; preds = %0
  %91 = or i32 %86, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:92                                      ; preds = %0
  %93 = add nuw nsw i32 %87, 939524096
  %94 = icmp eq i32 %88, 0
  br i1 %94, label %95, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:95                                      ; preds = %92
  %96 = add nuw nsw i32 %87, 947912704
  %97 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !433
  %98 = bitcast i32 %96 to float
  %99 = fsub float %98, %97
  %100 = bitcast float %99 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %95, %92, %90
  %o.sroa.0.0.i.i.i.i = phi i32 [ %91, %90 ], [ %100, %95 ], [ %93, %92 ]
  %101 = shl nuw i32 %85, 16
  %102 = and i32 %101, -2147483648
  %103 = or i32 %o.sroa.0.0.i.i.i.i, %102
  %104 = bitcast i32 %103 to float
  %105 = zext i16 %.idx.val.i.i.i2 to i32
  %106 = shl nuw nsw i32 %105, 13
  %107 = and i32 %106, 268427264
  %108 = and i32 %106, 260046848
  %109 = icmp eq i32 %108, 260046848
  br i1 %109, label %110, label %112

; <label>:110                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %111 = or i32 %106, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:112                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %113 = add nuw nsw i32 %107, 939524096
  %114 = icmp eq i32 %108, 0
  br i1 %114, label %115, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:115                                     ; preds = %112
  %116 = add nuw nsw i32 %107, 947912704
  %117 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !433
  %118 = bitcast i32 %116 to float
  %119 = fsub float %118, %117
  %120 = bitcast float %119 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %115, %112, %110
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %111, %110 ], [ %120, %115 ], [ %113, %112 ]
  %121 = shl nuw i32 %105, 16
  %122 = and i32 %121, -2147483648
  %123 = or i32 %o.sroa.0.0.i.i1.i.i, %122
  %124 = bitcast i32 %123 to float
  %125 = fadd float %104, %124
  %126 = bitcast float %125 to i32
  %127 = and i32 %126, -2147483648
  %128 = xor i32 %127, %126
  %129 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !433
  %130 = icmp ult i32 %128, %129
  br i1 %130, label %135, label %131

; <label>:131                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %132 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !433
  %133 = icmp ugt i32 %128, %132
  %134 = select i1 %133, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:135                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %136 = icmp ult i32 %128, 947912704
  br i1 %136, label %137, label %143

; <label>:137                                     ; preds = %135
  %138 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !433
  %139 = bitcast i32 %128 to float
  %140 = fadd float %139, %138
  %141 = bitcast float %140 to i32
  %.cast.i.i.i.i = bitcast float %138 to i32
  %142 = sub i32 %141, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:143                                     ; preds = %135
  %144 = lshr i32 %126, 13
  %145 = and i32 %144, 1
  %146 = add i32 %126, 134221823
  %147 = add i32 %146, %145
  %148 = lshr i32 %147, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %131, %137, %143
  %.sroa.0.0.i.i.i.i = phi i32 [ %142, %137 ], [ %148, %143 ], [ %134, %131 ]
  %149 = lshr exact i32 %127, 16
  %150 = or i32 %.sroa.0.0.i.i.i.i, %149
  %151 = trunc i32 %150 to i16
  %152 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %151, i16* %152, align 2, !tbaa !164, !alias.scope !433
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.50"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.50", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.50"* %eval to i8*
  call void @llvm.lifetime.start(i64 192, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.50"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 40, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.50", %"struct.Eigen::TensorEvaluator.50"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.50", %"struct.Eigen::TensorEvaluator.50"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.55"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.55"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 144, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.50", %"struct.Eigen::TensorEvaluator.50"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.50", %"struct.Eigen::TensorEvaluator.50"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !438
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESB_EEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.54"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 192, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESB_EEEENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.54"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 1, i32 0
  %2 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %1, align 8, !tbaa !441, !noalias !443
  %3 = sext i32 %index to i64
  %.idx.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %2, i64 %3, i32 0, i32 0, i32 0
  %.idx.val.i = load i16, i16* %.idx.i, align 2, !tbaa !164, !noalias !443
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !446
  %6 = sdiv i32 %index, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !446
  %9 = srem i32 %6, %8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %11 = load i32, i32* %10, align 4, !tbaa !178, !noalias !446
  %12 = mul nsw i32 %11, %9
  %13 = mul nsw i32 %6, %5
  %14 = sub nsw i32 %index, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 1, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178, !noalias !446
  %17 = sdiv i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178, !noalias !446
  %20 = srem i32 %17, %19
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 2, i32 0, i64 1
  %22 = load i32, i32* %21, align 4, !tbaa !178, !noalias !446
  %23 = mul nsw i32 %22, %20
  %24 = add nsw i32 %23, %12
  %25 = mul nsw i32 %17, %16
  %26 = sub nsw i32 %14, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 1, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178, !noalias !446
  %29 = sdiv i32 %26, %28
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %31 = load i32, i32* %30, align 4, !tbaa !178, !noalias !446
  %32 = srem i32 %29, %31
  %33 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 2, i32 0, i64 2
  %34 = load i32, i32* %33, align 4, !tbaa !178, !noalias !446
  %35 = mul nsw i32 %34, %32
  %36 = add nsw i32 %24, %35
  %37 = mul nsw i32 %29, %28
  %38 = sub nsw i32 %26, %37
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 1, i32 0, i64 3
  %40 = load i32, i32* %39, align 4, !tbaa !178, !noalias !446
  %41 = sdiv i32 %38, %40
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 3
  %43 = load i32, i32* %42, align 4, !tbaa !178, !noalias !446
  %44 = srem i32 %41, %43
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 2, i32 0, i64 3
  %46 = load i32, i32* %45, align 4, !tbaa !178, !noalias !446
  %47 = mul nsw i32 %46, %44
  %48 = add nsw i32 %36, %47
  %49 = mul nsw i32 %41, %40
  %50 = sub nsw i32 %38, %49
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 4
  %52 = load i32, i32* %51, align 4, !tbaa !178, !noalias !446
  %53 = srem i32 %50, %52
  %54 = add nsw i32 %48, %53
  %55 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.54", %"struct.Eigen::TensorEvaluator.54"* %this, i64 0, i32 2, i32 3, i32 0
  %56 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %55, align 8, !tbaa !441, !noalias !451
  %57 = sext i32 %54 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %56, i64 %57, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !451
  %58 = zext i16 %.idx.val.i to i32
  %59 = shl nuw nsw i32 %58, 13
  %60 = and i32 %59, 268427264
  %61 = and i32 %59, 260046848
  %62 = icmp eq i32 %61, 260046848
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %0
  %64 = or i32 %59, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:65                                      ; preds = %0
  %66 = add nuw nsw i32 %60, 939524096
  %67 = icmp eq i32 %61, 0
  br i1 %67, label %68, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:68                                      ; preds = %65
  %69 = add nuw nsw i32 %60, 947912704
  %70 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !454
  %71 = bitcast i32 %69 to float
  %72 = fsub float %71, %70
  %73 = bitcast float %72 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %68, %65, %63
  %o.sroa.0.0.i.i.i.i = phi i32 [ %64, %63 ], [ %73, %68 ], [ %66, %65 ]
  %74 = shl nuw i32 %58, 16
  %75 = and i32 %74, -2147483648
  %76 = or i32 %o.sroa.0.0.i.i.i.i, %75
  %77 = bitcast i32 %76 to float
  %78 = zext i16 %.idx.val.i.i.i to i32
  %79 = shl nuw nsw i32 %78, 13
  %80 = and i32 %79, 268427264
  %81 = and i32 %79, 260046848
  %82 = icmp eq i32 %81, 260046848
  br i1 %82, label %83, label %85

; <label>:83                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %84 = or i32 %79, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:85                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %86 = add nuw nsw i32 %80, 939524096
  %87 = icmp eq i32 %81, 0
  br i1 %87, label %88, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:88                                      ; preds = %85
  %89 = add nuw nsw i32 %80, 947912704
  %90 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !454
  %91 = bitcast i32 %89 to float
  %92 = fsub float %91, %90
  %93 = bitcast float %92 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %88, %85, %83
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %84, %83 ], [ %93, %88 ], [ %86, %85 ]
  %94 = shl nuw i32 %78, 16
  %95 = and i32 %94, -2147483648
  %96 = or i32 %o.sroa.0.0.i.i1.i.i, %95
  %97 = bitcast i32 %96 to float
  %98 = fadd float %77, %97
  %99 = bitcast float %98 to i32
  %100 = and i32 %99, -2147483648
  %101 = xor i32 %100, %99
  %102 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !454
  %103 = icmp ult i32 %101, %102
  br i1 %103, label %108, label %104

; <label>:104                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %105 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !454
  %106 = icmp ugt i32 %101, %105
  %107 = select i1 %106, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:108                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %109 = icmp ult i32 %101, 947912704
  br i1 %109, label %110, label %116

; <label>:110                                     ; preds = %108
  %111 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !454
  %112 = bitcast i32 %101 to float
  %113 = fadd float %112, %111
  %114 = bitcast float %113 to i32
  %.cast.i.i.i.i = bitcast float %111 to i32
  %115 = sub i32 %114, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:116                                     ; preds = %108
  %117 = lshr i32 %99, 13
  %118 = and i32 %117, 1
  %119 = add i32 %99, 134221823
  %120 = add i32 %119, %118
  %121 = lshr i32 %120, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %104, %110, %116
  %.sroa.0.0.i.i.i.i = phi i32 [ %115, %110 ], [ %121, %116 ], [ %107, %104 ]
  %122 = lshr exact i32 %100, 16
  %123 = or i32 %.sroa.0.0.i.i.i.i, %122
  %124 = trunc i32 %123 to i16
  %125 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %124, i16* %125, align 2, !tbaa !164, !alias.scope !454
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.57"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.57", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.57"* %eval to i8*
  call void @llvm.lifetime.start(i64 192, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.57"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 40, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.57", %"struct.Eigen::TensorEvaluator.57"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.57", %"struct.Eigen::TensorEvaluator.57"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.56"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.56"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 144, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.57", %"struct.Eigen::TensorEvaluator.57"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.57", %"struct.Eigen::TensorEvaluator.57"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !438
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.58"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 192, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.58"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178, !noalias !459
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !459
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !459
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178, !noalias !459
  %14 = sdiv i32 %11, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178, !noalias !459
  %17 = srem i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 2, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178, !noalias !459
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %9
  %22 = mul nsw i32 %14, %13
  %23 = sub nsw i32 %11, %22
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 1, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !178, !noalias !459
  %26 = sdiv i32 %23, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178, !noalias !459
  %29 = srem i32 %26, %28
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 2, i32 0, i64 2
  %31 = load i32, i32* %30, align 4, !tbaa !178, !noalias !459
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %21, %32
  %34 = mul nsw i32 %26, %25
  %35 = sub nsw i32 %23, %34
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 1, i32 0, i64 3
  %37 = load i32, i32* %36, align 4, !tbaa !178, !noalias !459
  %38 = sdiv i32 %35, %37
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 3
  %40 = load i32, i32* %39, align 4, !tbaa !178, !noalias !459
  %41 = srem i32 %38, %40
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 2, i32 0, i64 3
  %43 = load i32, i32* %42, align 4, !tbaa !178, !noalias !459
  %44 = mul nsw i32 %43, %41
  %45 = add nsw i32 %33, %44
  %46 = mul nsw i32 %38, %37
  %47 = sub nsw i32 %35, %46
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 4
  %49 = load i32, i32* %48, align 4, !tbaa !178, !noalias !459
  %50 = srem i32 %47, %49
  %51 = add nsw i32 %45, %50
  %52 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 1, i32 3, i32 0
  %53 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %52, align 8, !tbaa !441, !noalias !464
  %54 = sext i32 %51 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %53, i64 %54, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !464
  %55 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.58", %"struct.Eigen::TensorEvaluator.58"* %this, i64 0, i32 2, i32 0
  %56 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %55, align 8, !tbaa !441, !noalias !467
  %57 = sext i32 %index to i64
  %.idx.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %56, i64 %57, i32 0, i32 0, i32 0
  %.idx.val.i = load i16, i16* %.idx.i, align 2, !tbaa !164, !noalias !467
  %58 = zext i16 %.idx.val.i.i.i to i32
  %59 = shl nuw nsw i32 %58, 13
  %60 = and i32 %59, 268427264
  %61 = and i32 %59, 260046848
  %62 = icmp eq i32 %61, 260046848
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %0
  %64 = or i32 %59, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:65                                      ; preds = %0
  %66 = add nuw nsw i32 %60, 939524096
  %67 = icmp eq i32 %61, 0
  br i1 %67, label %68, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:68                                      ; preds = %65
  %69 = add nuw nsw i32 %60, 947912704
  %70 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !470
  %71 = bitcast i32 %69 to float
  %72 = fsub float %71, %70
  %73 = bitcast float %72 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %68, %65, %63
  %o.sroa.0.0.i.i.i.i = phi i32 [ %64, %63 ], [ %73, %68 ], [ %66, %65 ]
  %74 = shl nuw i32 %58, 16
  %75 = and i32 %74, -2147483648
  %76 = or i32 %o.sroa.0.0.i.i.i.i, %75
  %77 = bitcast i32 %76 to float
  %78 = zext i16 %.idx.val.i to i32
  %79 = shl nuw nsw i32 %78, 13
  %80 = and i32 %79, 268427264
  %81 = and i32 %79, 260046848
  %82 = icmp eq i32 %81, 260046848
  br i1 %82, label %83, label %85

; <label>:83                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %84 = or i32 %79, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:85                                      ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %86 = add nuw nsw i32 %80, 939524096
  %87 = icmp eq i32 %81, 0
  br i1 %87, label %88, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:88                                      ; preds = %85
  %89 = add nuw nsw i32 %80, 947912704
  %90 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !470
  %91 = bitcast i32 %89 to float
  %92 = fsub float %91, %90
  %93 = bitcast float %92 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %88, %85, %83
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %84, %83 ], [ %93, %88 ], [ %86, %85 ]
  %94 = shl nuw i32 %78, 16
  %95 = and i32 %94, -2147483648
  %96 = or i32 %o.sroa.0.0.i.i1.i.i, %95
  %97 = bitcast i32 %96 to float
  %98 = fadd float %77, %97
  %99 = bitcast float %98 to i32
  %100 = and i32 %99, -2147483648
  %101 = xor i32 %100, %99
  %102 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !470
  %103 = icmp ult i32 %101, %102
  br i1 %103, label %108, label %104

; <label>:104                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %105 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !470
  %106 = icmp ugt i32 %101, %105
  %107 = select i1 %106, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:108                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %109 = icmp ult i32 %101, 947912704
  br i1 %109, label %110, label %116

; <label>:110                                     ; preds = %108
  %111 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !470
  %112 = bitcast i32 %101 to float
  %113 = fadd float %112, %111
  %114 = bitcast float %113 to i32
  %.cast.i.i.i.i = bitcast float %111 to i32
  %115 = sub i32 %114, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:116                                     ; preds = %108
  %117 = lshr i32 %99, 13
  %118 = and i32 %117, 1
  %119 = add i32 %99, 134221823
  %120 = add i32 %119, %118
  %121 = lshr i32 %120, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %104, %110, %116
  %.sroa.0.0.i.i.i.i = phi i32 [ %115, %110 ], [ %121, %116 ], [ %107, %104 ]
  %122 = lshr exact i32 %100, 16
  %123 = or i32 %.sroa.0.0.i.i.i.i, %122
  %124 = trunc i32 %123 to i16
  %125 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %124, i16* %125, align 2, !tbaa !164, !alias.scope !470
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.59"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = alloca %"struct.Eigen::half", align 2
  %eval = alloca %"struct.Eigen::TensorEvaluator.59", align 8
  %2 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %3 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %4 = mul i32 %3, %2
  %5 = tail call i32 @llvm.ptx.read.tid.x() #6
  %6 = add i32 %4, %5
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %3
  %9 = bitcast %"struct.Eigen::TensorEvaluator.59"* %eval to i8*
  call void @llvm.lifetime.start(i64 256, i8* %9) #6
  %10 = bitcast %"struct.Eigen::TensorEvaluator.59"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 40, i32 8, i1 false) #6
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.59", %"struct.Eigen::TensorEvaluator.59"* %eval, i64 0, i32 1, i32 1
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.59", %"struct.Eigen::TensorEvaluator.59"* %memcopied_eval, i64 0, i32 1, i32 1
  %13 = bitcast %"struct.Eigen::TensorEvaluator.56"* %11 to i8*
  %14 = bitcast %"struct.Eigen::TensorEvaluator.56"* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 208, i32 8, i1 false) #6
  %15 = icmp slt i32 %6, %size
  br i1 %15, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

.lr.ph.i:                                         ; preds = %0
  %16 = bitcast %"struct.Eigen::half"* %1 to i8*
  %17 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.59", %"struct.Eigen::TensorEvaluator.59"* %eval, i64 0, i32 0, i32 0
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.59", %"struct.Eigen::TensorEvaluator.59"* %eval, i64 0, i32 1
  %19 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %1, i64 0, i32 0, i32 0, i32 0
  %.pre = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %17, align 8, !tbaa !438
  br label %20

; <label>:20                                      ; preds = %20, %.lr.ph.i
  %i.01.i = phi i32 [ %6, %.lr.ph.i ], [ %24, %20 ]
  call void @llvm.lifetime.start(i64 2, i8* %16) #6
  %21 = sext i32 %i.01.i to i64
  call void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* nonnull sret %1, %"struct.Eigen::TensorEvaluator.60"* %18, i32 %i.01.i) #6
  %22 = load i16, i16* %19, align 2, !tbaa !156
  %23 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %.pre, i64 %21, i32 0, i32 0, i32 0
  store i16 %22, i16* %23, align 2, !tbaa !156
  call void @llvm.lifetime.end(i64 2, i8* %16) #6
  %24 = add nsw i32 %i.01.i, %8
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %20, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit: ; preds = %20
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiLb0EE3runERSR_iii.exit.loopexit, %0
  call void @llvm.lifetime.end(i64 256, i8* %9) #6
  ret void
}

; Function Attrs: norecurse nounwind
define linkonce_odr void @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKS4_Li5ELi1EiEELi16EEEEESH_EENS_9GpuDeviceEE5coeffEi(%"struct.Eigen::half"* noalias nocapture sret %agg.result, %"struct.Eigen::TensorEvaluator.60"* nocapture readonly %this, i32 %index) #1 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178, !noalias !475
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178, !noalias !475
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178, !noalias !475
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178, !noalias !475
  %14 = sdiv i32 %11, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178, !noalias !475
  %17 = srem i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 2, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178, !noalias !475
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %9
  %22 = mul nsw i32 %14, %13
  %23 = sub nsw i32 %11, %22
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 1, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !178, !noalias !475
  %26 = sdiv i32 %23, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178, !noalias !475
  %29 = srem i32 %26, %28
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 2, i32 0, i64 2
  %31 = load i32, i32* %30, align 4, !tbaa !178, !noalias !475
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %21, %32
  %34 = mul nsw i32 %26, %25
  %35 = sub nsw i32 %23, %34
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 1, i32 0, i64 3
  %37 = load i32, i32* %36, align 4, !tbaa !178, !noalias !475
  %38 = sdiv i32 %35, %37
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 3
  %40 = load i32, i32* %39, align 4, !tbaa !178, !noalias !475
  %41 = srem i32 %38, %40
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 2, i32 0, i64 3
  %43 = load i32, i32* %42, align 4, !tbaa !178, !noalias !475
  %44 = mul nsw i32 %43, %41
  %45 = add nsw i32 %33, %44
  %46 = mul nsw i32 %38, %37
  %47 = sub nsw i32 %35, %46
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 4
  %49 = load i32, i32* %48, align 4, !tbaa !178, !noalias !475
  %50 = srem i32 %47, %49
  %51 = add nsw i32 %45, %50
  %52 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 1, i32 3, i32 0
  %53 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %52, align 8, !tbaa !441, !noalias !480
  %54 = sext i32 %51 to i64
  %.idx.i.i.i = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %53, i64 %54, i32 0, i32 0, i32 0
  %.idx.val.i.i.i = load i16, i16* %.idx.i.i.i, align 2, !tbaa !164, !noalias !480
  %55 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %56 = load i32, i32* %55, align 4, !tbaa !178, !noalias !483
  %57 = sdiv i32 %index, %56
  %58 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %59 = load i32, i32* %58, align 4, !tbaa !178, !noalias !483
  %60 = srem i32 %57, %59
  %61 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %62 = load i32, i32* %61, align 4, !tbaa !178, !noalias !483
  %63 = mul nsw i32 %62, %60
  %64 = mul nsw i32 %57, %56
  %65 = sub nsw i32 %index, %64
  %66 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 1, i32 0, i64 1
  %67 = load i32, i32* %66, align 4, !tbaa !178, !noalias !483
  %68 = sdiv i32 %65, %67
  %69 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %70 = load i32, i32* %69, align 4, !tbaa !178, !noalias !483
  %71 = srem i32 %68, %70
  %72 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 2, i32 0, i64 1
  %73 = load i32, i32* %72, align 4, !tbaa !178, !noalias !483
  %74 = mul nsw i32 %73, %71
  %75 = add nsw i32 %74, %63
  %76 = mul nsw i32 %68, %67
  %77 = sub nsw i32 %65, %76
  %78 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 1, i32 0, i64 2
  %79 = load i32, i32* %78, align 4, !tbaa !178, !noalias !483
  %80 = sdiv i32 %77, %79
  %81 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %82 = load i32, i32* %81, align 4, !tbaa !178, !noalias !483
  %83 = srem i32 %80, %82
  %84 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 2, i32 0, i64 2
  %85 = load i32, i32* %84, align 4, !tbaa !178, !noalias !483
  %86 = mul nsw i32 %85, %83
  %87 = add nsw i32 %75, %86
  %88 = mul nsw i32 %80, %79
  %89 = sub nsw i32 %77, %88
  %90 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 1, i32 0, i64 3
  %91 = load i32, i32* %90, align 4, !tbaa !178, !noalias !483
  %92 = sdiv i32 %89, %91
  %93 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 3
  %94 = load i32, i32* %93, align 4, !tbaa !178, !noalias !483
  %95 = srem i32 %92, %94
  %96 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 2, i32 0, i64 3
  %97 = load i32, i32* %96, align 4, !tbaa !178, !noalias !483
  %98 = mul nsw i32 %97, %95
  %99 = add nsw i32 %87, %98
  %100 = mul nsw i32 %92, %91
  %101 = sub nsw i32 %89, %100
  %102 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 4
  %103 = load i32, i32* %102, align 4, !tbaa !178, !noalias !483
  %104 = srem i32 %101, %103
  %105 = add nsw i32 %99, %104
  %106 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.60", %"struct.Eigen::TensorEvaluator.60"* %this, i64 0, i32 2, i32 3, i32 0
  %107 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %106, align 8, !tbaa !441, !noalias !488
  %108 = sext i32 %105 to i64
  %.idx.i.i.i1 = getelementptr %"struct.Eigen::half", %"struct.Eigen::half"* %107, i64 %108, i32 0, i32 0, i32 0
  %.idx.val.i.i.i2 = load i16, i16* %.idx.i.i.i1, align 2, !tbaa !164, !noalias !488
  %109 = zext i16 %.idx.val.i.i.i to i32
  %110 = shl nuw nsw i32 %109, 13
  %111 = and i32 %110, 268427264
  %112 = and i32 %110, 260046848
  %113 = icmp eq i32 %112, 260046848
  br i1 %113, label %114, label %116

; <label>:114                                     ; preds = %0
  %115 = or i32 %110, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:116                                     ; preds = %0
  %117 = add nuw nsw i32 %111, 939524096
  %118 = icmp eq i32 %112, 0
  br i1 %118, label %119, label %_ZNK5Eigen4halfcvfEv.exit.i.i

; <label>:119                                     ; preds = %116
  %120 = add nuw nsw i32 %111, 947912704
  %121 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !491
  %122 = bitcast i32 %120 to float
  %123 = fsub float %122, %121
  %124 = bitcast float %123 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit.i.i

_ZNK5Eigen4halfcvfEv.exit.i.i:                    ; preds = %119, %116, %114
  %o.sroa.0.0.i.i.i.i = phi i32 [ %115, %114 ], [ %124, %119 ], [ %117, %116 ]
  %125 = shl nuw i32 %109, 16
  %126 = and i32 %125, -2147483648
  %127 = or i32 %o.sroa.0.0.i.i.i.i, %126
  %128 = bitcast i32 %127 to float
  %129 = zext i16 %.idx.val.i.i.i2 to i32
  %130 = shl nuw nsw i32 %129, 13
  %131 = and i32 %130, 268427264
  %132 = and i32 %130, 260046848
  %133 = icmp eq i32 %132, 260046848
  br i1 %133, label %134, label %136

; <label>:134                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %135 = or i32 %130, 1879048192
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:136                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit.i.i
  %137 = add nuw nsw i32 %131, 939524096
  %138 = icmp eq i32 %132, 0
  br i1 %138, label %139, label %_ZNK5Eigen4halfcvfEv.exit2.i.i

; <label>:139                                     ; preds = %136
  %140 = add nuw nsw i32 %131, 947912704
  %141 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*), align 4, !tbaa !171, !noalias !491
  %142 = bitcast i32 %140 to float
  %143 = fsub float %142, %141
  %144 = bitcast float %143 to i32
  br label %_ZNK5Eigen4halfcvfEv.exit2.i.i

_ZNK5Eigen4halfcvfEv.exit2.i.i:                   ; preds = %139, %136, %134
  %o.sroa.0.0.i.i1.i.i = phi i32 [ %135, %134 ], [ %144, %139 ], [ %137, %136 ]
  %145 = shl nuw i32 %129, 16
  %146 = and i32 %145, -2147483648
  %147 = or i32 %o.sroa.0.0.i.i1.i.i, %146
  %148 = bitcast i32 %147 to float
  %149 = fadd float %128, %148
  %150 = bitcast float %149 to i32
  %151 = and i32 %150, -2147483648
  %152 = xor i32 %151, %150
  %153 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE6f16max, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !491
  %154 = icmp ult i32 %152, %153
  br i1 %154, label %159, label %155

; <label>:155                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %156 = load i32, i32* addrspacecast (i32 addrspace(1)* getelementptr inbounds (%"union.Eigen::half_impl::FP32", %"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE8f32infty, i64 0, i32 0) to i32*), align 4, !tbaa !178, !noalias !491
  %157 = icmp ugt i32 %152, %156
  %158 = select i1 %157, i32 32256, i32 31744
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:159                                     ; preds = %_ZNK5Eigen4halfcvfEv.exit2.i.i
  %160 = icmp ult i32 %152, 947912704
  br i1 %160, label %161, label %167

; <label>:161                                     ; preds = %159
  %162 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl18float_to_half_rtneEfE12denorm_magic to float addrspace(1)*) to float*), align 4, !tbaa !180, !noalias !491
  %163 = bitcast i32 %152 to float
  %164 = fadd float %163, %162
  %165 = bitcast float %164 to i32
  %.cast.i.i.i.i = bitcast float %162 to i32
  %166 = sub i32 %165, %.cast.i.i.i.i
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

; <label>:167                                     ; preds = %159
  %168 = lshr i32 %150, 13
  %169 = and i32 %168, 1
  %170 = add i32 %150, 134221823
  %171 = add i32 %170, %169
  %172 = lshr i32 %171, 13
  br label %_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit

_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_.exit: ; preds = %155, %161, %167
  %.sroa.0.0.i.i.i.i = phi i32 [ %166, %161 ], [ %172, %167 ], [ %158, %155 ]
  %173 = lshr exact i32 %151, 16
  %174 = or i32 %.sroa.0.0.i.i.i.i, %173
  %175 = trunc i32 %174 to i16
  %176 = getelementptr inbounds %"struct.Eigen::half", %"struct.Eigen::half"* %agg.result, i64 0, i32 0, i32 0, i32 0
  store i16 %175, i16* %176, align 2, !tbaa !164, !alias.scope !491
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.61"* byval nocapture readonly align 8 %memcopied_eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.61", %"struct.Eigen::TensorEvaluator.61"* %memcopied_eval, i64 0, i32 0, i32 0
  %11 = load float*, float** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.61", %"struct.Eigen::TensorEvaluator.61"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %13 = load float*, float** %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.61", %"struct.Eigen::TensorEvaluator.61"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %15 = load float*, float** %14, align 8
  %16 = sdiv i64 %size, 4
  %17 = shl nsw i64 %16, 2
  %18 = shl nuw nsw i64 %9, 2
  %19 = shl nuw nsw i64 %6, 2
  %20 = icmp slt i64 %19, %17
  br i1 %20, label %.lr.ph6.i.preheader, label %._crit_edge7.i

.lr.ph6.i.preheader:                              ; preds = %0
  br label %.lr.ph6.i

._crit_edge7.i.loopexit:                          ; preds = %.lr.ph6.i
  br label %._crit_edge7.i

._crit_edge7.i:                                   ; preds = %._crit_edge7.i.loopexit, %0
  %21 = add nsw i64 %6, %17
  %22 = icmp slt i64 %21, %size
  br i1 %22, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge7.i
  br label %.lr.ph.i

.lr.ph6.i:                                        ; preds = %.lr.ph6.i.preheader, %.lr.ph6.i
  %i.04.i = phi i64 [ %48, %.lr.ph6.i ], [ %19, %.lr.ph6.i.preheader ]
  %sext.i.i.i = shl i64 %i.04.i, 32
  %23 = ashr exact i64 %sext.i.i.i, 32
  %24 = getelementptr inbounds float, float* %13, i64 %23
  %25 = load float, float* %24, align 4, !tbaa !171
  %26 = getelementptr inbounds float, float* %24, i64 1
  %27 = load float, float* %26, align 4, !tbaa !171
  %28 = getelementptr inbounds float, float* %24, i64 2
  %29 = load float, float* %28, align 4, !tbaa !171
  %30 = getelementptr inbounds float, float* %24, i64 3
  %31 = load float, float* %30, align 4, !tbaa !171
  %32 = getelementptr inbounds float, float* %15, i64 %i.04.i
  %33 = load float, float* %32, align 4, !tbaa !171
  %34 = getelementptr inbounds float, float* %32, i64 1
  %35 = load float, float* %34, align 4, !tbaa !171
  %36 = getelementptr inbounds float, float* %32, i64 2
  %37 = load float, float* %36, align 4, !tbaa !171
  %38 = getelementptr inbounds float, float* %32, i64 3
  %39 = load float, float* %38, align 4, !tbaa !171
  %40 = fadd float %25, %33
  %41 = fadd float %27, %35
  %42 = fadd float %29, %37
  %43 = fadd float %31, %39
  %44 = getelementptr inbounds float, float* %11, i64 %23
  store float %40, float* %44, align 16
  %45 = getelementptr inbounds float, float* %44, i64 1
  store float %41, float* %45, align 4
  %46 = getelementptr inbounds float, float* %44, i64 2
  store float %42, float* %46, align 8
  %47 = getelementptr inbounds float, float* %44, i64 3
  store float %43, float* %47, align 4
  %48 = add nuw nsw i64 %i.04.i, %18
  %49 = icmp slt i64 %48, %17
  br i1 %49, label %.lr.ph6.i, label %._crit_edge7.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.03.i = phi i64 [ %55, %.lr.ph.i ], [ %21, %.lr.ph.i.preheader ]
  %sext.i.i2.i = shl i64 %i1.03.i, 32
  %50 = ashr exact i64 %sext.i.i2.i, 32
  %51 = getelementptr inbounds float, float* %13, i64 %50
  %.val.i.i.i.i = load float, float* %51, align 4, !tbaa !171
  %52 = getelementptr inbounds float, float* %15, i64 %i1.03.i
  %.val.i1.i.i.i = load float, float* %52, align 4, !tbaa !171
  %53 = fadd float %.val.i.i.i.i, %.val.i1.i.i.i
  %54 = getelementptr inbounds float, float* %11, i64 %50
  store float %53, float* %54, align 4, !tbaa !171
  %55 = add nsw i64 %i1.03.i, %9
  %56 = icmp slt i64 %55, %size
  br i1 %56, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit.loopexit, %._crit_edge7.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.68"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.68", %"struct.Eigen::TensorEvaluator.68"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load float*, float** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.68", %"struct.Eigen::TensorEvaluator.68"* %memcopied_eval, i64 0, i32 1
  %11 = bitcast %"struct.Eigen::TensorEvaluator.69"* %10 to i64*
  %12 = load i64, i64* %11, align 8, !tbaa !496
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.68", %"struct.Eigen::TensorEvaluator.68"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %14 = load float*, float** %13, align 8
  %15 = sdiv i32 %size, 4
  %16 = shl nsw i32 %15, 2
  %17 = shl i32 %7, 2
  %18 = shl nsw i32 %5, 2
  %19 = icmp slt i32 %18, %16
  br i1 %19, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  %20 = inttoptr i64 %12 to float*
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %.lr.ph5.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %16
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = inttoptr i64 %12 to float*
  br label %44

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %.lr.ph5.i
  %i.03.i = phi i32 [ %42, %.lr.ph5.i ], [ %18, %.lr.ph5.i.preheader ]
  %24 = sext i32 %i.03.i to i64
  %25 = getelementptr inbounds float, float* %14, i64 %24
  %26 = load float, float* %25, align 4, !tbaa !171
  %27 = getelementptr inbounds float, float* %25, i64 1
  %28 = load float, float* %27, align 4, !tbaa !171
  %29 = getelementptr inbounds float, float* %25, i64 2
  %30 = load float, float* %29, align 4, !tbaa !171
  %31 = getelementptr inbounds float, float* %25, i64 3
  %32 = load float, float* %31, align 4, !tbaa !171
  %33 = load float, float* %20, align 4, !tbaa !171
  %34 = fadd float %26, %33
  %35 = fadd float %28, %33
  %36 = fadd float %30, %33
  %37 = fadd float %32, %33
  %38 = getelementptr inbounds float, float* %9, i64 %24
  store float %34, float* %38, align 16
  %39 = getelementptr inbounds float, float* %38, i64 1
  store float %35, float* %39, align 4
  %40 = getelementptr inbounds float, float* %38, i64 2
  store float %36, float* %40, align 8
  %41 = getelementptr inbounds float, float* %38, i64 3
  store float %37, float* %41, align 4
  %42 = add nsw i32 %i.03.i, %17
  %43 = icmp slt i32 %42, %16
  br i1 %43, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

; <label>:44                                      ; preds = %44, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %50, %44 ]
  %45 = sext i32 %i1.02.i to i64
  %46 = getelementptr inbounds float, float* %14, i64 %45
  %.val.i.i.i.i = load float, float* %46, align 4, !tbaa !171
  %47 = load float, float* %23, align 4, !tbaa !171
  %48 = fadd float %.val.i.i.i.i, %47
  %49 = getelementptr inbounds float, float* %9, i64 %45
  store float %48, float* %49, align 4, !tbaa !171
  %50 = add nsw i32 %i1.02.i, %7
  %51 = icmp slt i32 %50, %size
  br i1 %51, label %44, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit: ; preds = %44
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.71"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.71", %"struct.Eigen::TensorEvaluator.71"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load float*, float** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.71", %"struct.Eigen::TensorEvaluator.71"* %memcopied_eval, i64 0, i32 1
  %11 = bitcast %"struct.Eigen::TensorEvaluator.72"* %10 to i64*
  %12 = load i64, i64* %11, align 8, !tbaa !498
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.71", %"struct.Eigen::TensorEvaluator.71"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %14 = load float*, float** %13, align 8
  %15 = sdiv i32 %size, 4
  %16 = shl nsw i32 %15, 2
  %17 = shl i32 %7, 2
  %18 = shl nsw i32 %5, 2
  %19 = icmp slt i32 %18, %16
  br i1 %19, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  %20 = inttoptr i64 %12 to float*
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %.lr.ph5.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %16
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = inttoptr i64 %12 to float*
  br label %44

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %.lr.ph5.i
  %i.03.i = phi i32 [ %42, %.lr.ph5.i ], [ %18, %.lr.ph5.i.preheader ]
  %24 = sext i32 %i.03.i to i64
  %25 = getelementptr inbounds float, float* %14, i64 %24
  %26 = load float, float* %25, align 4, !tbaa !171
  %27 = getelementptr inbounds float, float* %25, i64 1
  %28 = load float, float* %27, align 4, !tbaa !171
  %29 = getelementptr inbounds float, float* %25, i64 2
  %30 = load float, float* %29, align 4, !tbaa !171
  %31 = getelementptr inbounds float, float* %25, i64 3
  %32 = load float, float* %31, align 4, !tbaa !171
  %33 = load float, float* %20, align 4, !tbaa !171
  %34 = fadd float %26, %33
  %35 = fadd float %28, %33
  %36 = fadd float %30, %33
  %37 = fadd float %32, %33
  %38 = getelementptr inbounds float, float* %9, i64 %24
  store float %34, float* %38, align 16
  %39 = getelementptr inbounds float, float* %38, i64 1
  store float %35, float* %39, align 4
  %40 = getelementptr inbounds float, float* %38, i64 2
  store float %36, float* %40, align 8
  %41 = getelementptr inbounds float, float* %38, i64 3
  store float %37, float* %41, align 4
  %42 = add nsw i32 %i.03.i, %17
  %43 = icmp slt i32 %42, %16
  br i1 %43, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

; <label>:44                                      ; preds = %44, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %50, %44 ]
  %45 = sext i32 %i1.02.i to i64
  %46 = getelementptr inbounds float, float* %14, i64 %45
  %.val.i.i.i.i = load float, float* %46, align 4, !tbaa !171
  %47 = load float, float* %23, align 4, !tbaa !171
  %48 = fadd float %.val.i.i.i.i, %47
  %49 = getelementptr inbounds float, float* %9, i64 %45
  store float %48, float* %49, align 4, !tbaa !171
  %50 = add nsw i32 %i1.02.i, %7
  %51 = icmp slt i32 %50, %size
  br i1 %51, label %44, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit: ; preds = %44
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.74"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load float*, float** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load float*, float** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %13 = load float*, float** %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.74", %"struct.Eigen::TensorEvaluator.74"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %15 = load i32, i32* %14, align 8
  %16 = sdiv i32 %size, 4
  %17 = shl nsw i32 %16, 2
  %18 = shl i32 %7, 2
  %19 = shl nsw i32 %5, 2
  %20 = icmp slt i32 %19, %17
  br i1 %20, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %17
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %62, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %19, %.lr.ph5.i.preheader ]
  %23 = sext i32 %i.03.i to i64
  %24 = getelementptr inbounds float, float* %11, i64 %23
  %25 = load float, float* %24, align 4, !tbaa !171
  %26 = getelementptr inbounds float, float* %24, i64 1
  %27 = load float, float* %26, align 4, !tbaa !171
  %28 = getelementptr inbounds float, float* %24, i64 2
  %29 = load float, float* %28, align 4, !tbaa !171
  %30 = getelementptr inbounds float, float* %24, i64 3
  %31 = load float, float* %30, align 4, !tbaa !171
  %32 = srem i32 %i.03.i, %15
  %33 = add nsw i32 %32, 4
  %34 = icmp sgt i32 %33, %15
  %35 = sext i32 %32 to i64
  %36 = getelementptr inbounds float, float* %13, i64 %35
  br i1 %34, label %41, label %37

; <label>:37                                      ; preds = %.lr.ph5.i
  %38 = getelementptr inbounds float, float* %36, i64 1
  %39 = getelementptr inbounds float, float* %36, i64 2
  %40 = getelementptr inbounds float, float* %36, i64 3
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:41                                      ; preds = %.lr.ph5.i
  %42 = or i32 %i.03.i, 1
  %43 = srem i32 %42, %15
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float* %13, i64 %44
  %46 = or i32 %i.03.i, 2
  %47 = srem i32 %46, %15
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float* %13, i64 %48
  %50 = or i32 %i.03.i, 3
  %51 = srem i32 %50, %15
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float* %13, i64 %52
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %41, %37
  %.sroa.3.0.in.i.i.i.i.i = phi float* [ %38, %37 ], [ %45, %41 ]
  %.sroa.6.0.in.i.i.i.i.i = phi float* [ %39, %37 ], [ %49, %41 ]
  %.sroa.9.0.in.i.i.i.i.i = phi float* [ %40, %37 ], [ %53, %41 ]
  %.sroa.9.0.i.i.i.i.i = load float, float* %.sroa.9.0.in.i.i.i.i.i, align 4, !tbaa !171
  %.sroa.6.0.i.i.i.i.i = load float, float* %.sroa.6.0.in.i.i.i.i.i, align 4, !tbaa !171
  %.sroa.3.0.i.i.i.i.i = load float, float* %.sroa.3.0.in.i.i.i.i.i, align 4, !tbaa !171
  %.sroa.0.0.i.i.i.i.i = load float, float* %36, align 4, !tbaa !171
  %54 = fadd float %25, %.sroa.0.0.i.i.i.i.i
  %55 = fadd float %27, %.sroa.3.0.i.i.i.i.i
  %56 = fadd float %29, %.sroa.6.0.i.i.i.i.i
  %57 = fadd float %31, %.sroa.9.0.i.i.i.i.i
  %58 = getelementptr inbounds float, float* %9, i64 %23
  store float %54, float* %58, align 16
  %59 = getelementptr inbounds float, float* %58, i64 1
  store float %55, float* %59, align 4
  %60 = getelementptr inbounds float, float* %58, i64 2
  store float %56, float* %60, align 8
  %61 = getelementptr inbounds float, float* %58, i64 3
  store float %57, float* %61, align 4
  %62 = add nsw i32 %i.03.i, %18
  %63 = icmp slt i32 %62, %17
  br i1 %63, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %71, %.lr.ph.i ], [ %21, %.lr.ph.i.preheader ]
  %64 = sext i32 %i1.02.i to i64
  %65 = getelementptr inbounds float, float* %11, i64 %64
  %.val.i.i.i.i = load float, float* %65, align 4, !tbaa !171
  %66 = srem i32 %i1.02.i, %15
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float* %13, i64 %67
  %.val.i.i.i.i.i.i = load float, float* %68, align 4, !tbaa !171
  %69 = fadd float %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %70 = getelementptr inbounds float, float* %9, i64 %64
  store float %69, float* %70, align 4, !tbaa !171
  %71 = add nsw i32 %i1.02.i, %7
  %72 = icmp slt i32 %71, %size
  br i1 %72, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.77"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load float*, float** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %11 = load float*, float** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.77", %"struct.Eigen::TensorEvaluator.77"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %15 = load float*, float** %14, align 8
  %16 = sdiv i32 %size, 4
  %17 = shl nsw i32 %16, 2
  %18 = shl i32 %7, 2
  %19 = shl nsw i32 %5, 2
  %20 = icmp slt i32 %19, %17
  br i1 %20, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %17
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %62, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %19, %.lr.ph5.i.preheader ]
  %23 = srem i32 %i.03.i, %13
  %24 = add nsw i32 %23, 4
  %25 = icmp sgt i32 %24, %13
  %26 = sext i32 %23 to i64
  %27 = getelementptr inbounds float, float* %11, i64 %26
  br i1 %25, label %32, label %28

; <label>:28                                      ; preds = %.lr.ph5.i
  %29 = getelementptr inbounds float, float* %27, i64 1
  %30 = getelementptr inbounds float, float* %27, i64 2
  %31 = getelementptr inbounds float, float* %27, i64 3
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:32                                      ; preds = %.lr.ph5.i
  %33 = or i32 %i.03.i, 1
  %34 = srem i32 %33, %13
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float* %11, i64 %35
  %37 = or i32 %i.03.i, 2
  %38 = srem i32 %37, %13
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float* %11, i64 %39
  %41 = or i32 %i.03.i, 3
  %42 = srem i32 %41, %13
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float* %11, i64 %43
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %32, %28
  %.sroa.3.0.in.i.i.i.i.i = phi float* [ %29, %28 ], [ %36, %32 ]
  %.sroa.6.0.in.i.i.i.i.i = phi float* [ %30, %28 ], [ %40, %32 ]
  %.sroa.9.0.in.i.i.i.i.i = phi float* [ %31, %28 ], [ %44, %32 ]
  %.sroa.9.0.i.i.i.i.i = load float, float* %.sroa.9.0.in.i.i.i.i.i, align 4, !tbaa !171
  %.sroa.6.0.i.i.i.i.i = load float, float* %.sroa.6.0.in.i.i.i.i.i, align 4, !tbaa !171
  %.sroa.3.0.i.i.i.i.i = load float, float* %.sroa.3.0.in.i.i.i.i.i, align 4, !tbaa !171
  %.sroa.0.0.i.i.i.i.i = load float, float* %27, align 4, !tbaa !171
  %45 = sext i32 %i.03.i to i64
  %46 = getelementptr inbounds float, float* %15, i64 %45
  %47 = load float, float* %46, align 4, !tbaa !171
  %48 = getelementptr inbounds float, float* %46, i64 1
  %49 = load float, float* %48, align 4, !tbaa !171
  %50 = getelementptr inbounds float, float* %46, i64 2
  %51 = load float, float* %50, align 4, !tbaa !171
  %52 = getelementptr inbounds float, float* %46, i64 3
  %53 = load float, float* %52, align 4, !tbaa !171
  %54 = fadd float %.sroa.0.0.i.i.i.i.i, %47
  %55 = fadd float %.sroa.3.0.i.i.i.i.i, %49
  %56 = fadd float %.sroa.6.0.i.i.i.i.i, %51
  %57 = fadd float %.sroa.9.0.i.i.i.i.i, %53
  %58 = getelementptr inbounds float, float* %9, i64 %45
  store float %54, float* %58, align 16
  %59 = getelementptr inbounds float, float* %58, i64 1
  store float %55, float* %59, align 4
  %60 = getelementptr inbounds float, float* %58, i64 2
  store float %56, float* %60, align 8
  %61 = getelementptr inbounds float, float* %58, i64 3
  store float %57, float* %61, align 4
  %62 = add nsw i32 %i.03.i, %18
  %63 = icmp slt i32 %62, %17
  br i1 %63, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %71, %.lr.ph.i ], [ %21, %.lr.ph.i.preheader ]
  %64 = srem i32 %i1.02.i, %13
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float* %11, i64 %65
  %.val.i.i.i.i.i.i = load float, float* %66, align 4, !tbaa !171
  %67 = sext i32 %i1.02.i to i64
  %68 = getelementptr inbounds float, float* %15, i64 %67
  %.val.i.i.i.i = load float, float* %68, align 4, !tbaa !171
  %69 = fadd float %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %70 = getelementptr inbounds float, float* %9, i64 %67
  store float %69, float* %70, align 4, !tbaa !171
  %71 = add nsw i32 %i1.02.i, %7
  %72 = icmp slt i32 %71, %size
  br i1 %72, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.79"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.79", %"struct.Eigen::TensorEvaluator.79"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load float*, float** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.79", %"struct.Eigen::TensorEvaluator.79"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %11 = load float*, float** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.79", %"struct.Eigen::TensorEvaluator.79"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.79", %"struct.Eigen::TensorEvaluator.79"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %15 = load float*, float** %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.79", %"struct.Eigen::TensorEvaluator.79"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %17 = load i32, i32* %16, align 8
  %18 = sdiv i32 %size, 4
  %19 = shl nsw i32 %18, 2
  %20 = shl i32 %7, 2
  %21 = shl nsw i32 %5, 2
  %22 = icmp slt i32 %21, %19
  br i1 %22, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %23 = add nsw i32 %5, %19
  %24 = icmp slt i32 %23, %size
  br i1 %24, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %78, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %21, %.lr.ph5.i.preheader ]
  %25 = srem i32 %i.03.i, %13
  %26 = add nsw i32 %25, 4
  %27 = icmp sgt i32 %26, %13
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds float, float* %11, i64 %28
  br i1 %27, label %34, label %30

; <label>:30                                      ; preds = %.lr.ph5.i
  %31 = getelementptr inbounds float, float* %29, i64 1
  %32 = getelementptr inbounds float, float* %29, i64 2
  %33 = getelementptr inbounds float, float* %29, i64 3
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit.i.i.i

; <label>:34                                      ; preds = %.lr.ph5.i
  %35 = or i32 %i.03.i, 1
  %36 = srem i32 %35, %13
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float* %11, i64 %37
  %39 = or i32 %i.03.i, 2
  %40 = srem i32 %39, %13
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float* %11, i64 %41
  %43 = or i32 %i.03.i, 3
  %44 = srem i32 %43, %13
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float* %11, i64 %45
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit.i.i.i

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit.i.i.i: ; preds = %34, %30
  %.sroa.3.0.in.i.i.i.i.i = phi float* [ %31, %30 ], [ %38, %34 ]
  %.sroa.6.0.in.i.i.i.i.i = phi float* [ %32, %30 ], [ %42, %34 ]
  %.sroa.9.0.in.i.i.i.i.i = phi float* [ %33, %30 ], [ %46, %34 ]
  %.sroa.9.0.i.i.i.i.i = load float, float* %.sroa.9.0.in.i.i.i.i.i, align 4, !tbaa !171
  %.sroa.6.0.i.i.i.i.i = load float, float* %.sroa.6.0.in.i.i.i.i.i, align 4, !tbaa !171
  %.sroa.3.0.i.i.i.i.i = load float, float* %.sroa.3.0.in.i.i.i.i.i, align 4, !tbaa !171
  %.sroa.0.0.i.i.i.i.i = load float, float* %29, align 4, !tbaa !171
  %47 = srem i32 %i.03.i, %17
  %48 = add nsw i32 %47, 4
  %49 = icmp sgt i32 %48, %17
  %50 = sext i32 %47 to i64
  %51 = getelementptr inbounds float, float* %15, i64 %50
  br i1 %49, label %56, label %52

; <label>:52                                      ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit.i.i.i
  %53 = getelementptr inbounds float, float* %51, i64 1
  %54 = getelementptr inbounds float, float* %51, i64 2
  %55 = getelementptr inbounds float, float* %51, i64 3
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:56                                      ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKfLi1ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit.i.i.i
  %57 = or i32 %i.03.i, 1
  %58 = srem i32 %57, %17
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float* %15, i64 %59
  %61 = or i32 %i.03.i, 2
  %62 = srem i32 %61, %17
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float* %15, i64 %63
  %65 = or i32 %i.03.i, 3
  %66 = srem i32 %65, %17
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds float, float* %15, i64 %67
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKfLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %56, %52
  %.sroa.3.0.in.i.i1.i.i.i = phi float* [ %53, %52 ], [ %60, %56 ]
  %.sroa.6.0.in.i.i2.i.i.i = phi float* [ %54, %52 ], [ %64, %56 ]
  %.sroa.9.0.in.i.i3.i.i.i = phi float* [ %55, %52 ], [ %68, %56 ]
  %.sroa.9.0.i.i4.i.i.i = load float, float* %.sroa.9.0.in.i.i3.i.i.i, align 4, !tbaa !171
  %.sroa.6.0.i.i5.i.i.i = load float, float* %.sroa.6.0.in.i.i2.i.i.i, align 4, !tbaa !171
  %.sroa.3.0.i.i6.i.i.i = load float, float* %.sroa.3.0.in.i.i1.i.i.i, align 4, !tbaa !171
  %.sroa.0.0.i.i7.i.i.i = load float, float* %51, align 4, !tbaa !171
  %69 = fadd float %.sroa.0.0.i.i.i.i.i, %.sroa.0.0.i.i7.i.i.i
  %70 = fadd float %.sroa.3.0.i.i.i.i.i, %.sroa.3.0.i.i6.i.i.i
  %71 = fadd float %.sroa.6.0.i.i.i.i.i, %.sroa.6.0.i.i5.i.i.i
  %72 = fadd float %.sroa.9.0.i.i.i.i.i, %.sroa.9.0.i.i4.i.i.i
  %73 = sext i32 %i.03.i to i64
  %74 = getelementptr inbounds float, float* %9, i64 %73
  store float %69, float* %74, align 16
  %75 = getelementptr inbounds float, float* %74, i64 1
  store float %70, float* %75, align 4
  %76 = getelementptr inbounds float, float* %74, i64 2
  store float %71, float* %76, align 8
  %77 = getelementptr inbounds float, float* %74, i64 3
  store float %72, float* %77, align 4
  %78 = add nsw i32 %i.03.i, %20
  %79 = icmp slt i32 %78, %19
  br i1 %79, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %89, %.lr.ph.i ], [ %23, %.lr.ph.i.preheader ]
  %80 = srem i32 %i1.02.i, %13
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float* %11, i64 %81
  %.val.i.i.i.i.i.i = load float, float* %82, align 4, !tbaa !171
  %83 = srem i32 %i1.02.i, %17
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float* %15, i64 %84
  %.val.i.i.i1.i.i.i = load float, float* %85, align 4, !tbaa !171
  %86 = fadd float %.val.i.i.i.i.i.i, %.val.i.i.i1.i.i.i
  %87 = sext i32 %i1.02.i to i64
  %88 = getelementptr inbounds float, float* %9, i64 %87
  store float %86, float* %88, align 4, !tbaa !171
  %89 = add nsw i32 %i1.02.i, %7
  %90 = icmp slt i32 %89, %size
  br i1 %90, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.81"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load float*, float** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load float*, float** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %15 = load i32, i32* %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %17 = load float*, float** %16, align 8
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.81", %"struct.Eigen::TensorEvaluator.81"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %19 = bitcast i32* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = trunc i64 %20 to i32
  %22 = lshr i64 %20, 32
  %23 = trunc i64 %22 to i32
  %24 = sdiv i32 %size, 4
  %25 = shl nsw i32 %24, 2
  %26 = shl i32 %7, 2
  %27 = shl nsw i32 %5, 2
  %28 = icmp slt i32 %27, %25
  br i1 %28, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %29 = add nsw i32 %5, %25
  %30 = icmp slt i32 %29, %size
  br i1 %30, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit
  %i.03.i = phi i32 [ %94, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit ], [ %27, %.lr.ph5.i.preheader ]
  %31 = sext i32 %i.03.i to i64
  %32 = getelementptr inbounds float, float* %11, i64 %31
  %33 = load float, float* %32, align 4, !tbaa !171
  %34 = getelementptr inbounds float, float* %32, i64 1
  %35 = load float, float* %34, align 4, !tbaa !171
  %36 = getelementptr inbounds float, float* %32, i64 2
  %37 = load float, float* %36, align 4, !tbaa !171
  %38 = getelementptr inbounds float, float* %32, i64 3
  %39 = load float, float* %38, align 4, !tbaa !171
  %40 = sdiv i32 %i.03.i, %13
  %41 = srem i32 %40, %21
  %42 = mul nsw i32 %41, %15
  %43 = mul nsw i32 %40, %13
  %44 = sub nsw i32 %i.03.i, %43
  %45 = srem i32 %44, %23
  %46 = add nsw i32 %45, %42
  %47 = add nsw i32 %45, 4
  %48 = icmp sgt i32 %47, %23
  %49 = sext i32 %46 to i64
  %50 = getelementptr inbounds float, float* %17, i64 %49
  br i1 %48, label %55, label %51

; <label>:51                                      ; preds = %.lr.ph5.i
  %52 = getelementptr inbounds float, float* %50, i64 1
  %53 = getelementptr inbounds float, float* %50, i64 2
  %54 = getelementptr inbounds float, float* %50, i64 3
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit

; <label>:55                                      ; preds = %.lr.ph5.i
  %56 = or i32 %i.03.i, 1
  %57 = sdiv i32 %56, %13
  %58 = srem i32 %57, %21
  %59 = mul nsw i32 %58, %15
  %60 = mul nsw i32 %57, %13
  %61 = sub nsw i32 %56, %60
  %62 = srem i32 %61, %23
  %63 = add nsw i32 %62, %59
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float* %17, i64 %64
  %66 = or i32 %i.03.i, 2
  %67 = sdiv i32 %66, %13
  %68 = srem i32 %67, %21
  %69 = mul nsw i32 %68, %15
  %70 = mul nsw i32 %67, %13
  %71 = sub nsw i32 %66, %70
  %72 = srem i32 %71, %23
  %73 = add nsw i32 %72, %69
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds float, float* %17, i64 %74
  %76 = or i32 %i.03.i, 3
  %77 = sdiv i32 %76, %13
  %78 = srem i32 %77, %21
  %79 = mul nsw i32 %78, %15
  %80 = mul nsw i32 %77, %13
  %81 = sub nsw i32 %76, %80
  %82 = srem i32 %81, %23
  %83 = add nsw i32 %82, %79
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float* %17, i64 %84
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit: ; preds = %51, %55
  %.sroa.3.0.in.i.i.i.i = phi float* [ %52, %51 ], [ %65, %55 ]
  %.sroa.6.0.in.i.i.i.i = phi float* [ %53, %51 ], [ %75, %55 ]
  %.sroa.9.0.in.i.i.i.i = phi float* [ %54, %51 ], [ %85, %55 ]
  %.sroa.9.0.i.i.i.i = load float, float* %.sroa.9.0.in.i.i.i.i, align 4, !tbaa !171
  %.sroa.6.0.i.i.i.i = load float, float* %.sroa.6.0.in.i.i.i.i, align 4, !tbaa !171
  %.sroa.3.0.i.i.i.i = load float, float* %.sroa.3.0.in.i.i.i.i, align 4, !tbaa !171
  %.sroa.0.0.i.i.i.i = load float, float* %50, align 4, !tbaa !171
  %86 = fadd float %33, %.sroa.0.0.i.i.i.i
  %87 = fadd float %35, %.sroa.3.0.i.i.i.i
  %88 = fadd float %37, %.sroa.6.0.i.i.i.i
  %89 = fadd float %39, %.sroa.9.0.i.i.i.i
  %90 = getelementptr inbounds float, float* %9, i64 %31
  store float %86, float* %90, align 16
  %91 = getelementptr inbounds float, float* %90, i64 1
  store float %87, float* %91, align 4
  %92 = getelementptr inbounds float, float* %90, i64 2
  store float %88, float* %92, align 8
  %93 = getelementptr inbounds float, float* %90, i64 3
  store float %89, float* %93, align 4
  %94 = add nsw i32 %i.03.i, %26
  %95 = icmp slt i32 %94, %25
  br i1 %95, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %109, %.lr.ph.i ], [ %29, %.lr.ph.i.preheader ]
  %96 = sext i32 %i1.02.i to i64
  %97 = getelementptr inbounds float, float* %11, i64 %96
  %.val.i.i.i.i = load float, float* %97, align 4, !tbaa !171
  %98 = sdiv i32 %i1.02.i, %13
  %99 = srem i32 %98, %21
  %100 = mul nsw i32 %99, %15
  %101 = mul nsw i32 %98, %13
  %102 = sub nsw i32 %i1.02.i, %101
  %103 = srem i32 %102, %23
  %104 = add nsw i32 %103, %100
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float* %17, i64 %105
  %.val.i.i.i.i.i.i = load float, float* %106, align 4, !tbaa !171
  %107 = fadd float %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %108 = getelementptr inbounds float, float* %9, i64 %96
  store float %107, float* %108, align 4, !tbaa !171
  %109 = add nsw i32 %i1.02.i, %7
  %110 = icmp slt i32 %109, %size
  br i1 %110, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.86"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.86", %"struct.Eigen::TensorEvaluator.86"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load float*, float** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.86", %"struct.Eigen::TensorEvaluator.86"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.86", %"struct.Eigen::TensorEvaluator.86"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.86", %"struct.Eigen::TensorEvaluator.86"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %15 = load float*, float** %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.86", %"struct.Eigen::TensorEvaluator.86"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %17 = bitcast i32* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = trunc i64 %18 to i32
  %20 = lshr i64 %18, 32
  %21 = trunc i64 %20 to i32
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.86", %"struct.Eigen::TensorEvaluator.86"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %23 = load float*, float** %22, align 8
  %24 = sdiv i32 %size, 4
  %25 = shl nsw i32 %24, 2
  %26 = shl i32 %7, 2
  %27 = shl nsw i32 %5, 2
  %28 = icmp slt i32 %27, %25
  br i1 %28, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %29 = add nsw i32 %5, %25
  %30 = icmp slt i32 %29, %size
  br i1 %30, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit
  %i.03.i = phi i32 [ %94, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit ], [ %27, %.lr.ph5.i.preheader ]
  %31 = sdiv i32 %i.03.i, %11
  %32 = srem i32 %31, %19
  %33 = mul nsw i32 %32, %13
  %34 = mul nsw i32 %31, %11
  %35 = sub nsw i32 %i.03.i, %34
  %36 = srem i32 %35, %21
  %37 = add nsw i32 %36, %33
  %38 = add nsw i32 %36, 4
  %39 = icmp sgt i32 %38, %21
  %40 = sext i32 %37 to i64
  %41 = getelementptr inbounds float, float* %15, i64 %40
  br i1 %39, label %46, label %42

; <label>:42                                      ; preds = %.lr.ph5.i
  %43 = getelementptr inbounds float, float* %41, i64 1
  %44 = getelementptr inbounds float, float* %41, i64 2
  %45 = getelementptr inbounds float, float* %41, i64 3
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit

; <label>:46                                      ; preds = %.lr.ph5.i
  %47 = or i32 %i.03.i, 1
  %48 = sdiv i32 %47, %11
  %49 = srem i32 %48, %19
  %50 = mul nsw i32 %49, %13
  %51 = mul nsw i32 %48, %11
  %52 = sub nsw i32 %47, %51
  %53 = srem i32 %52, %21
  %54 = add nsw i32 %53, %50
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float* %15, i64 %55
  %57 = or i32 %i.03.i, 2
  %58 = sdiv i32 %57, %11
  %59 = srem i32 %58, %19
  %60 = mul nsw i32 %59, %13
  %61 = mul nsw i32 %58, %11
  %62 = sub nsw i32 %57, %61
  %63 = srem i32 %62, %21
  %64 = add nsw i32 %63, %60
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float* %15, i64 %65
  %67 = or i32 %i.03.i, 3
  %68 = sdiv i32 %67, %11
  %69 = srem i32 %68, %19
  %70 = mul nsw i32 %69, %13
  %71 = mul nsw i32 %68, %11
  %72 = sub nsw i32 %67, %71
  %73 = srem i32 %72, %21
  %74 = add nsw i32 %73, %70
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds float, float* %15, i64 %75
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKfLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit: ; preds = %42, %46
  %.sroa.3.0.in.i.i.i.i = phi float* [ %43, %42 ], [ %56, %46 ]
  %.sroa.6.0.in.i.i.i.i = phi float* [ %44, %42 ], [ %66, %46 ]
  %.sroa.9.0.in.i.i.i.i = phi float* [ %45, %42 ], [ %76, %46 ]
  %.sroa.9.0.i.i.i.i = load float, float* %.sroa.9.0.in.i.i.i.i, align 4, !tbaa !171
  %.sroa.6.0.i.i.i.i = load float, float* %.sroa.6.0.in.i.i.i.i, align 4, !tbaa !171
  %.sroa.3.0.i.i.i.i = load float, float* %.sroa.3.0.in.i.i.i.i, align 4, !tbaa !171
  %.sroa.0.0.i.i.i.i = load float, float* %41, align 4, !tbaa !171
  %77 = sext i32 %i.03.i to i64
  %78 = getelementptr inbounds float, float* %23, i64 %77
  %79 = load float, float* %78, align 4, !tbaa !171
  %80 = getelementptr inbounds float, float* %78, i64 1
  %81 = load float, float* %80, align 4, !tbaa !171
  %82 = getelementptr inbounds float, float* %78, i64 2
  %83 = load float, float* %82, align 4, !tbaa !171
  %84 = getelementptr inbounds float, float* %78, i64 3
  %85 = load float, float* %84, align 4, !tbaa !171
  %86 = fadd float %.sroa.0.0.i.i.i.i, %79
  %87 = fadd float %.sroa.3.0.i.i.i.i, %81
  %88 = fadd float %.sroa.6.0.i.i.i.i, %83
  %89 = fadd float %.sroa.9.0.i.i.i.i, %85
  %90 = getelementptr inbounds float, float* %9, i64 %77
  store float %86, float* %90, align 16
  %91 = getelementptr inbounds float, float* %90, i64 1
  store float %87, float* %91, align 4
  %92 = getelementptr inbounds float, float* %90, i64 2
  store float %88, float* %92, align 8
  %93 = getelementptr inbounds float, float* %90, i64 3
  store float %89, float* %93, align 4
  %94 = add nsw i32 %i.03.i, %26
  %95 = icmp slt i32 %94, %25
  br i1 %95, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %109, %.lr.ph.i ], [ %29, %.lr.ph.i.preheader ]
  %96 = sdiv i32 %i1.02.i, %11
  %97 = srem i32 %96, %19
  %98 = mul nsw i32 %97, %13
  %99 = mul nsw i32 %96, %11
  %100 = sub nsw i32 %i1.02.i, %99
  %101 = srem i32 %100, %21
  %102 = add nsw i32 %101, %98
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float* %15, i64 %103
  %.val.i.i.i.i.i.i = load float, float* %104, align 4, !tbaa !171
  %105 = sext i32 %i1.02.i to i64
  %106 = getelementptr inbounds float, float* %23, i64 %105
  %.val.i.i.i.i = load float, float* %106, align 4, !tbaa !171
  %107 = fadd float %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %108 = getelementptr inbounds float, float* %9, i64 %105
  store float %107, float* %108, align 4, !tbaa !171
  %109 = add nsw i32 %i1.02.i, %7
  %110 = icmp slt i32 %109, %size
  br i1 %110, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.88"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.88", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.88"* %eval to i8*
  call void @llvm.lifetime.start(i64 128, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.88"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 24, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.85"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.85"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 96, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 4
  %15 = shl nsw i32 %14, 2
  %16 = shl i32 %7, 2
  %17 = shl nsw i32 %5, 2
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 1
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 0, i32 0
  %.pre = load float*, float** %20, align 8, !tbaa !500
  br label %49

._crit_edge6.i.loopexit:                          ; preds = %49
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %15
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %24 = load i32, i32* %23, align 8
  %25 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %26 = bitcast i32* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = trunc i64 %27 to i32
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %30 = load i32, i32* %29, align 8
  %31 = lshr i64 %27, 32
  %32 = trunc i64 %31 to i32
  %33 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %34 = load float*, float** %33, align 8
  %35 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %36 = load i32, i32* %35, align 8
  %37 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %38 = bitcast i32* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = trunc i64 %39 to i32
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %42 = load i32, i32* %41, align 8
  %43 = lshr i64 %39, 32
  %44 = trunc i64 %43 to i32
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %46 = load float*, float** %45, align 8
  %47 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.88", %"struct.Eigen::TensorEvaluator.88"* %eval, i64 0, i32 0, i32 0
  %48 = load float*, float** %47, align 8
  br label %62

; <label>:49                                      ; preds = %49, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %60, %49 ]
  %50 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.89"* %19, i32 %i.03.i) #6
  %51 = extractvalue %struct.float4 %50, 0
  %52 = extractvalue %struct.float4 %50, 1
  %53 = extractvalue %struct.float4 %50, 2
  %54 = extractvalue %struct.float4 %50, 3
  %55 = sext i32 %i.03.i to i64
  %56 = getelementptr inbounds float, float* %.pre, i64 %55
  store float %51, float* %56, align 16
  %57 = getelementptr inbounds float, float* %56, i64 1
  store float %52, float* %57, align 4
  %58 = getelementptr inbounds float, float* %56, i64 2
  store float %53, float* %58, align 8
  %59 = getelementptr inbounds float, float* %56, i64 3
  store float %54, float* %59, align 4
  %60 = add nsw i32 %i.03.i, %16
  %61 = icmp slt i32 %60, %15
  br i1 %61, label %49, label %._crit_edge6.i.loopexit

; <label>:62                                      ; preds = %62, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %84, %62 ]
  %63 = sdiv i32 %i1.02.i, %24
  %64 = srem i32 %63, %28
  %65 = mul nsw i32 %64, %30
  %66 = mul nsw i32 %63, %24
  %67 = sub nsw i32 %i1.02.i, %66
  %68 = srem i32 %67, %32
  %69 = add nsw i32 %68, %65
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float* %34, i64 %70
  %.val.i.i.i.i.i.i = load float, float* %71, align 4, !tbaa !171
  %72 = sdiv i32 %i1.02.i, %36
  %73 = srem i32 %72, %40
  %74 = mul nsw i32 %73, %42
  %75 = mul nsw i32 %72, %36
  %76 = sub nsw i32 %i1.02.i, %75
  %77 = srem i32 %76, %44
  %78 = add nsw i32 %77, %74
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float* %46, i64 %79
  %.val.i.i.i1.i.i.i = load float, float* %80, align 4, !tbaa !171
  %81 = fadd float %.val.i.i.i.i.i.i, %.val.i.i.i1.i.i.i
  %82 = sext i32 %i1.02.i to i64
  %83 = getelementptr inbounds float, float* %48, i64 %82
  store float %81, float* %83, align 4, !tbaa !171
  %84 = add nsw i32 %i1.02.i, %7
  %85 = icmp slt i32 %84, %size
  br i1 %85, label %62, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %62
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 128, i8* %8) #6
  ret void
}

; Function Attrs: inlinehint norecurse nounwind readonly
define linkonce_odr %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.89"* nocapture readonly %this, i32 %index) #5 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.89", %"struct.Eigen::TensorEvaluator.89"* %this, i64 0, i32 1, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.89", %"struct.Eigen::TensorEvaluator.89"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.89", %"struct.Eigen::TensorEvaluator.89"* %this, i64 0, i32 1, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.89", %"struct.Eigen::TensorEvaluator.89"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178
  %14 = srem i32 %11, %13
  %15 = add nsw i32 %14, %9
  %16 = add nsw i32 %14, 4
  %17 = icmp sgt i32 %16, %13
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.89", %"struct.Eigen::TensorEvaluator.89"* %this, i64 0, i32 1, i32 3, i32 0
  %19 = load float*, float** %18, align 8
  %20 = sext i32 %15 to i64
  %21 = getelementptr inbounds float, float* %19, i64 %20
  br i1 %17, label %26, label %22

; <label>:22                                      ; preds = %0
  %23 = getelementptr inbounds float, float* %21, i64 1
  %24 = getelementptr inbounds float, float* %21, i64 2
  %25 = getelementptr inbounds float, float* %21, i64 3
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit

; <label>:26                                      ; preds = %0
  %27 = add nsw i32 %index, 1
  %28 = sdiv i32 %27, %2
  %29 = srem i32 %28, %5
  %30 = mul nsw i32 %29, %8
  %31 = mul nsw i32 %28, %2
  %32 = sub nsw i32 %27, %31
  %33 = srem i32 %32, %13
  %34 = add nsw i32 %33, %30
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float* %19, i64 %35
  %37 = add nsw i32 %index, 2
  %38 = sdiv i32 %37, %2
  %39 = srem i32 %38, %5
  %40 = mul nsw i32 %39, %8
  %41 = mul nsw i32 %38, %2
  %42 = sub nsw i32 %37, %41
  %43 = srem i32 %42, %13
  %44 = add nsw i32 %43, %40
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float* %19, i64 %45
  %47 = add nsw i32 %index, 3
  %48 = sdiv i32 %47, %2
  %49 = srem i32 %48, %5
  %50 = mul nsw i32 %49, %8
  %51 = mul nsw i32 %48, %2
  %52 = sub nsw i32 %47, %51
  %53 = srem i32 %52, %13
  %54 = add nsw i32 %53, %50
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds float, float* %19, i64 %55
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit: ; preds = %22, %26
  %.sroa.3.0.in.i.i = phi float* [ %23, %22 ], [ %36, %26 ]
  %.sroa.6.0.in.i.i = phi float* [ %24, %22 ], [ %46, %26 ]
  %.sroa.9.0.in.i.i = phi float* [ %25, %22 ], [ %56, %26 ]
  %.sroa.9.0.i.i = load float, float* %.sroa.9.0.in.i.i, align 4, !tbaa !171
  %.sroa.6.0.i.i = load float, float* %.sroa.6.0.in.i.i, align 4, !tbaa !171
  %.sroa.3.0.i.i = load float, float* %.sroa.3.0.in.i.i, align 4, !tbaa !171
  %.sroa.0.0.i.i = load float, float* %21, align 4, !tbaa !171
  %57 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.89", %"struct.Eigen::TensorEvaluator.89"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %58 = load i32, i32* %57, align 4, !tbaa !178
  %59 = sdiv i32 %index, %58
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.89", %"struct.Eigen::TensorEvaluator.89"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %61 = load i32, i32* %60, align 4, !tbaa !178
  %62 = srem i32 %59, %61
  %63 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.89", %"struct.Eigen::TensorEvaluator.89"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %64 = load i32, i32* %63, align 4, !tbaa !178
  %65 = mul nsw i32 %64, %62
  %66 = mul nsw i32 %59, %58
  %67 = sub nsw i32 %index, %66
  %68 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.89", %"struct.Eigen::TensorEvaluator.89"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %69 = load i32, i32* %68, align 4, !tbaa !178
  %70 = srem i32 %67, %69
  %71 = add nsw i32 %70, %65
  %72 = add nsw i32 %70, 4
  %73 = icmp sgt i32 %72, %69
  %74 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.89", %"struct.Eigen::TensorEvaluator.89"* %this, i64 0, i32 2, i32 3, i32 0
  %75 = load float*, float** %74, align 8
  %76 = sext i32 %71 to i64
  %77 = getelementptr inbounds float, float* %75, i64 %76
  br i1 %73, label %82, label %78

; <label>:78                                      ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit
  %79 = getelementptr inbounds float, float* %77, i64 1
  %80 = getelementptr inbounds float, float* %77, i64 2
  %81 = getelementptr inbounds float, float* %77, i64 3
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit8

; <label>:82                                      ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit
  %83 = add nsw i32 %index, 1
  %84 = sdiv i32 %83, %58
  %85 = srem i32 %84, %61
  %86 = mul nsw i32 %85, %64
  %87 = mul nsw i32 %84, %58
  %88 = sub nsw i32 %83, %87
  %89 = srem i32 %88, %69
  %90 = add nsw i32 %89, %86
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float* %75, i64 %91
  %93 = add nsw i32 %index, 2
  %94 = sdiv i32 %93, %58
  %95 = srem i32 %94, %61
  %96 = mul nsw i32 %95, %64
  %97 = mul nsw i32 %94, %58
  %98 = sub nsw i32 %93, %97
  %99 = srem i32 %98, %69
  %100 = add nsw i32 %99, %96
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds float, float* %75, i64 %101
  %103 = add nsw i32 %index, 3
  %104 = sdiv i32 %103, %58
  %105 = srem i32 %104, %61
  %106 = mul nsw i32 %105, %64
  %107 = mul nsw i32 %104, %58
  %108 = sub nsw i32 %103, %107
  %109 = srem i32 %108, %69
  %110 = add nsw i32 %109, %106
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float* %75, i64 %111
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit8

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKfLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE6float4i.exit8: ; preds = %78, %82
  %.sroa.3.0.in.i.i1 = phi float* [ %79, %78 ], [ %92, %82 ]
  %.sroa.6.0.in.i.i2 = phi float* [ %80, %78 ], [ %102, %82 ]
  %.sroa.9.0.in.i.i3 = phi float* [ %81, %78 ], [ %112, %82 ]
  %.sroa.9.0.i.i4 = load float, float* %.sroa.9.0.in.i.i3, align 4, !tbaa !171
  %.sroa.6.0.i.i5 = load float, float* %.sroa.6.0.in.i.i2, align 4, !tbaa !171
  %.sroa.3.0.i.i6 = load float, float* %.sroa.3.0.in.i.i1, align 4, !tbaa !171
  %.sroa.0.0.i.i7 = load float, float* %77, align 4, !tbaa !171
  %113 = fadd float %.sroa.0.0.i.i, %.sroa.0.0.i.i7
  %114 = fadd float %.sroa.3.0.i.i, %.sroa.3.0.i.i6
  %115 = fadd float %.sroa.6.0.i.i, %.sroa.6.0.i.i5
  %116 = fadd float %.sroa.9.0.i.i, %.sroa.9.0.i.i4
  %oldret.i.i = insertvalue %struct.float4 undef, float %113, 0
  %oldret2.i.i = insertvalue %struct.float4 %oldret.i.i, float %114, 1
  %oldret4.i.i = insertvalue %struct.float4 %oldret2.i.i, float %115, 2
  %oldret6.i.i = insertvalue %struct.float4 %oldret4.i.i, float %116, 3
  ret %struct.float4 %oldret6.i.i
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.90"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.90", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.90"* %eval to i8*
  call void @llvm.lifetime.start(i64 144, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.90"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 32, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.93"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.93"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 104, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 4
  %15 = shl nsw i32 %14, 2
  %16 = shl i32 %7, 2
  %17 = shl nsw i32 %5, 2
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 1, i32 1, i32 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 1, i32 2
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 0, i32 0
  %.pre = load float*, float** %19, align 8, !tbaa !502
  %.pre1 = load float*, float** %21, align 8, !tbaa !504
  br label %48

._crit_edge6.i.loopexit:                          ; preds = %48
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %22 = add nsw i32 %5, %15
  %23 = icmp slt i32 %22, %size
  br i1 %23, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 1, i32 1, i32 0
  %25 = load float*, float** %24, align 8
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %27 = load i32, i32* %26, align 4
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %29 = bitcast i32* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = trunc i64 %30 to i32
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %33 = bitcast i32* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = trunc i64 %34 to i32
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %37 = load i32, i32* %36, align 4
  %38 = lshr i64 %30, 32
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %34, 32
  %41 = trunc i64 %40 to i32
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %43 = load i32, i32* %42, align 8
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %45 = load float*, float** %44, align 8
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.90", %"struct.Eigen::TensorEvaluator.90"* %eval, i64 0, i32 0, i32 0
  %47 = load float*, float** %46, align 8
  br label %73

; <label>:48                                      ; preds = %48, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %71, %48 ]
  %49 = sext i32 %i.03.i to i64
  %50 = getelementptr inbounds float, float* %.pre, i64 %49
  %51 = load float, float* %50, align 4, !tbaa !171
  %52 = getelementptr inbounds float, float* %50, i64 1
  %53 = load float, float* %52, align 4, !tbaa !171
  %54 = getelementptr inbounds float, float* %50, i64 2
  %55 = load float, float* %54, align 4, !tbaa !171
  %56 = getelementptr inbounds float, float* %50, i64 3
  %57 = load float, float* %56, align 4, !tbaa !171
  %58 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.94"* %20, i32 %i.03.i) #6
  %59 = extractvalue %struct.float4 %58, 0
  %60 = extractvalue %struct.float4 %58, 1
  %61 = extractvalue %struct.float4 %58, 2
  %62 = extractvalue %struct.float4 %58, 3
  %63 = fadd float %51, %59
  %64 = fadd float %53, %60
  %65 = fadd float %55, %61
  %66 = fadd float %57, %62
  %67 = getelementptr inbounds float, float* %.pre1, i64 %49
  store float %63, float* %67, align 16
  %68 = getelementptr inbounds float, float* %67, i64 1
  store float %64, float* %68, align 4
  %69 = getelementptr inbounds float, float* %67, i64 2
  store float %65, float* %69, align 8
  %70 = getelementptr inbounds float, float* %67, i64 3
  store float %66, float* %70, align 4
  %71 = add nsw i32 %i.03.i, %16
  %72 = icmp slt i32 %71, %15
  br i1 %72, label %48, label %._crit_edge6.i.loopexit

; <label>:73                                      ; preds = %73, %.lr.ph.i
  %i1.02.i = phi i32 [ %22, %.lr.ph.i ], [ %93, %73 ]
  %74 = sext i32 %i1.02.i to i64
  %75 = getelementptr inbounds float, float* %25, i64 %74
  %.val.i.i.i.i = load float, float* %75, align 4, !tbaa !171
  %76 = sdiv i32 %i1.02.i, %27
  %77 = srem i32 %76, %31
  %78 = mul nsw i32 %77, %35
  %79 = mul nsw i32 %76, %27
  %80 = sub nsw i32 %i1.02.i, %79
  %81 = sdiv i32 %80, %37
  %82 = srem i32 %81, %39
  %83 = mul nsw i32 %82, %41
  %84 = add nsw i32 %83, %78
  %85 = mul nsw i32 %81, %37
  %86 = sub nsw i32 %80, %85
  %87 = srem i32 %86, %43
  %88 = add nsw i32 %84, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds float, float* %45, i64 %89
  %.val.i.i.i.i.i.i = load float, float* %90, align 4, !tbaa !171
  %91 = fadd float %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %92 = getelementptr inbounds float, float* %47, i64 %74
  store float %91, float* %92, align 4, !tbaa !171
  %93 = add nsw i32 %i1.02.i, %7
  %94 = icmp slt i32 %93, %size
  br i1 %94, label %73, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %73
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 144, i8* %8) #6
  ret void
}

; Function Attrs: inlinehint norecurse nounwind readonly
define linkonce_odr %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.94"* nocapture readonly %this, i32 %index) #5 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.94", %"struct.Eigen::TensorEvaluator.94"* %this, i64 0, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.94", %"struct.Eigen::TensorEvaluator.94"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.94", %"struct.Eigen::TensorEvaluator.94"* %this, i64 0, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.94", %"struct.Eigen::TensorEvaluator.94"* %this, i64 0, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178
  %14 = sdiv i32 %11, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.94", %"struct.Eigen::TensorEvaluator.94"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178
  %17 = srem i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.94", %"struct.Eigen::TensorEvaluator.94"* %this, i64 0, i32 2, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %9
  %22 = mul nsw i32 %14, %13
  %23 = sub nsw i32 %11, %22
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.94", %"struct.Eigen::TensorEvaluator.94"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !178
  %26 = srem i32 %23, %25
  %27 = add nsw i32 %26, %21
  %28 = add nsw i32 %26, 4
  %29 = icmp sgt i32 %28, %25
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.94", %"struct.Eigen::TensorEvaluator.94"* %this, i64 0, i32 3, i32 0
  %31 = load float*, float** %30, align 8
  %32 = sext i32 %27 to i64
  %33 = getelementptr inbounds float, float* %31, i64 %32
  br i1 %29, label %38, label %34

; <label>:34                                      ; preds = %0
  %35 = getelementptr inbounds float, float* %33, i64 1
  %36 = getelementptr inbounds float, float* %33, i64 2
  %37 = getelementptr inbounds float, float* %33, i64 3
  br label %87

; <label>:38                                      ; preds = %0
  %39 = add nsw i32 %index, 1
  %40 = sdiv i32 %39, %2
  %41 = srem i32 %40, %5
  %42 = mul nsw i32 %8, %41
  %43 = mul nsw i32 %40, %2
  %44 = sub nsw i32 %39, %43
  %45 = sdiv i32 %44, %13
  %46 = srem i32 %45, %16
  %47 = mul nsw i32 %19, %46
  %48 = add nsw i32 %47, %42
  %49 = mul nsw i32 %45, %13
  %50 = sub nsw i32 %44, %49
  %51 = srem i32 %50, %25
  %52 = add nsw i32 %48, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float* %31, i64 %53
  %55 = add nsw i32 %index, 2
  %56 = sdiv i32 %55, %2
  %57 = srem i32 %56, %5
  %58 = mul nsw i32 %8, %57
  %59 = mul nsw i32 %56, %2
  %60 = sub nsw i32 %55, %59
  %61 = sdiv i32 %60, %13
  %62 = srem i32 %61, %16
  %63 = mul nsw i32 %19, %62
  %64 = add nsw i32 %63, %58
  %65 = mul nsw i32 %61, %13
  %66 = sub nsw i32 %60, %65
  %67 = srem i32 %66, %25
  %68 = add nsw i32 %64, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float* %31, i64 %69
  %71 = add nsw i32 %index, 3
  %72 = sdiv i32 %71, %2
  %73 = srem i32 %72, %5
  %74 = mul nsw i32 %8, %73
  %75 = mul nsw i32 %72, %2
  %76 = sub nsw i32 %71, %75
  %77 = sdiv i32 %76, %13
  %78 = srem i32 %77, %16
  %79 = mul nsw i32 %19, %78
  %80 = add nsw i32 %79, %74
  %81 = mul nsw i32 %77, %13
  %82 = sub nsw i32 %76, %81
  %83 = srem i32 %82, %25
  %84 = add nsw i32 %80, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float* %31, i64 %85
  br label %87

; <label>:87                                      ; preds = %38, %34
  %.sroa.3.0.in = phi float* [ %35, %34 ], [ %54, %38 ]
  %.sroa.6.0.in = phi float* [ %36, %34 ], [ %70, %38 ]
  %.sroa.9.0.in = phi float* [ %37, %34 ], [ %86, %38 ]
  %.sroa.9.0 = load float, float* %.sroa.9.0.in, align 4, !tbaa !171
  %.sroa.6.0 = load float, float* %.sroa.6.0.in, align 4, !tbaa !171
  %.sroa.3.0 = load float, float* %.sroa.3.0.in, align 4, !tbaa !171
  %.sroa.0.0 = load float, float* %33, align 4, !tbaa !171
  %88 = insertvalue %struct.float4 undef, float %.sroa.0.0, 0
  %89 = insertvalue %struct.float4 %88, float %.sroa.3.0, 1
  %90 = insertvalue %struct.float4 %89, float %.sroa.6.0, 2
  %91 = insertvalue %struct.float4 %90, float %.sroa.9.0, 3
  ret %struct.float4 %91
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.95"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.95", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.95"* %eval to i8*
  call void @llvm.lifetime.start(i64 144, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.95"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 32, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.94"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.94"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 104, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 4
  %15 = shl nsw i32 %14, 2
  %16 = shl i32 %7, 2
  %17 = shl nsw i32 %5, 2
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 1, i32 2, i32 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 0, i32 0
  %.pre = load float*, float** %19, align 8, !tbaa !502
  %.pre1 = load float*, float** %20, align 8, !tbaa !504
  br label %47

._crit_edge6.i.loopexit:                          ; preds = %47
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %15
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %24 = load i32, i32* %23, align 4
  %25 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %26 = bitcast i32* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = trunc i64 %27 to i32
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %30 = bitcast i32* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = trunc i64 %31 to i32
  %33 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %34 = load i32, i32* %33, align 4
  %35 = lshr i64 %27, 32
  %36 = trunc i64 %35 to i32
  %37 = lshr i64 %31, 32
  %38 = trunc i64 %37 to i32
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %40 = load i32, i32* %39, align 8
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %42 = load float*, float** %41, align 8
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 1, i32 2, i32 0
  %44 = load float*, float** %43, align 8
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.95", %"struct.Eigen::TensorEvaluator.95"* %eval, i64 0, i32 0, i32 0
  %46 = load float*, float** %45, align 8
  br label %72

; <label>:47                                      ; preds = %47, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %70, %47 ]
  %48 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.94"* %10, i32 %i.03.i) #6
  %49 = extractvalue %struct.float4 %48, 0
  %50 = extractvalue %struct.float4 %48, 1
  %51 = extractvalue %struct.float4 %48, 2
  %52 = extractvalue %struct.float4 %48, 3
  %53 = sext i32 %i.03.i to i64
  %54 = getelementptr inbounds float, float* %.pre, i64 %53
  %55 = load float, float* %54, align 4, !tbaa !171
  %56 = getelementptr inbounds float, float* %54, i64 1
  %57 = load float, float* %56, align 4, !tbaa !171
  %58 = getelementptr inbounds float, float* %54, i64 2
  %59 = load float, float* %58, align 4, !tbaa !171
  %60 = getelementptr inbounds float, float* %54, i64 3
  %61 = load float, float* %60, align 4, !tbaa !171
  %62 = fadd float %49, %55
  %63 = fadd float %50, %57
  %64 = fadd float %51, %59
  %65 = fadd float %52, %61
  %66 = getelementptr inbounds float, float* %.pre1, i64 %53
  store float %62, float* %66, align 16
  %67 = getelementptr inbounds float, float* %66, i64 1
  store float %63, float* %67, align 4
  %68 = getelementptr inbounds float, float* %66, i64 2
  store float %64, float* %68, align 8
  %69 = getelementptr inbounds float, float* %66, i64 3
  store float %65, float* %69, align 4
  %70 = add nsw i32 %i.03.i, %16
  %71 = icmp slt i32 %70, %15
  br i1 %71, label %47, label %._crit_edge6.i.loopexit

; <label>:72                                      ; preds = %72, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %92, %72 ]
  %73 = sdiv i32 %i1.02.i, %24
  %74 = srem i32 %73, %28
  %75 = mul nsw i32 %74, %32
  %76 = mul nsw i32 %73, %24
  %77 = sub nsw i32 %i1.02.i, %76
  %78 = sdiv i32 %77, %34
  %79 = srem i32 %78, %36
  %80 = mul nsw i32 %79, %38
  %81 = add nsw i32 %80, %75
  %82 = mul nsw i32 %78, %34
  %83 = sub nsw i32 %77, %82
  %84 = srem i32 %83, %40
  %85 = add nsw i32 %81, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float* %42, i64 %86
  %.val.i.i.i.i.i.i = load float, float* %87, align 4, !tbaa !171
  %88 = sext i32 %i1.02.i to i64
  %89 = getelementptr inbounds float, float* %44, i64 %88
  %.val.i.i.i.i = load float, float* %89, align 4, !tbaa !171
  %90 = fadd float %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %91 = getelementptr inbounds float, float* %46, i64 %88
  store float %90, float* %91, align 4, !tbaa !171
  %92 = add nsw i32 %i1.02.i, %7
  %93 = icmp slt i32 %92, %size
  br i1 %93, label %72, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %72
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 144, i8* %8) #6
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.97"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.97", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.97"* %eval to i8*
  call void @llvm.lifetime.start(i64 184, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.97"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 32, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.94"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.94"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 144, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 4
  %15 = shl nsw i32 %14, 2
  %16 = shl i32 %7, 2
  %17 = shl nsw i32 %5, 2
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 2
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 0, i32 0
  br label %65

._crit_edge6.i.loopexit:                          ; preds = %65
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %15
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %24 = load i32, i32* %23, align 4
  %25 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %26 = bitcast i32* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = trunc i64 %27 to i32
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %30 = bitcast i32* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = trunc i64 %31 to i32
  %33 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %34 = load i32, i32* %33, align 4
  %35 = lshr i64 %27, 32
  %36 = trunc i64 %35 to i32
  %37 = lshr i64 %31, 32
  %38 = trunc i64 %37 to i32
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %40 = load i32, i32* %39, align 8
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %42 = load float*, float** %41, align 8
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %44 = load i32, i32* %43, align 4
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %46 = bitcast i32* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = trunc i64 %47 to i32
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %50 = bitcast i32* %49 to i64*
  %51 = load i64, i64* %50, align 8
  %52 = trunc i64 %51 to i32
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %54 = load i32, i32* %53, align 4
  %55 = lshr i64 %47, 32
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %51, 32
  %58 = trunc i64 %57 to i32
  %59 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %60 = load i32, i32* %59, align 8
  %61 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %62 = load float*, float** %61, align 8
  %63 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.97", %"struct.Eigen::TensorEvaluator.97"* %eval, i64 0, i32 0, i32 0
  %64 = load float*, float** %63, align 8
  br label %88

; <label>:65                                      ; preds = %65, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %86, %65 ]
  %66 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.94"* %10, i32 %i.03.i) #6
  %67 = extractvalue %struct.float4 %66, 0
  %68 = extractvalue %struct.float4 %66, 1
  %69 = extractvalue %struct.float4 %66, 2
  %70 = extractvalue %struct.float4 %66, 3
  %71 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.94"* %19, i32 %i.03.i) #6
  %72 = extractvalue %struct.float4 %71, 0
  %73 = extractvalue %struct.float4 %71, 1
  %74 = extractvalue %struct.float4 %71, 2
  %75 = extractvalue %struct.float4 %71, 3
  %76 = fadd float %67, %72
  %77 = fadd float %68, %73
  %78 = fadd float %69, %74
  %79 = fadd float %70, %75
  %80 = load float*, float** %20, align 8, !tbaa !504
  %81 = sext i32 %i.03.i to i64
  %82 = getelementptr inbounds float, float* %80, i64 %81
  store float %76, float* %82, align 16
  %83 = getelementptr inbounds float, float* %82, i64 1
  store float %77, float* %83, align 4
  %84 = getelementptr inbounds float, float* %82, i64 2
  store float %78, float* %84, align 8
  %85 = getelementptr inbounds float, float* %82, i64 3
  store float %79, float* %85, align 4
  %86 = add nsw i32 %i.03.i, %16
  %87 = icmp slt i32 %86, %15
  br i1 %87, label %65, label %._crit_edge6.i.loopexit

; <label>:88                                      ; preds = %88, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %122, %88 ]
  %89 = sdiv i32 %i1.02.i, %24
  %90 = srem i32 %89, %28
  %91 = mul nsw i32 %90, %32
  %92 = mul nsw i32 %89, %24
  %93 = sub nsw i32 %i1.02.i, %92
  %94 = sdiv i32 %93, %34
  %95 = srem i32 %94, %36
  %96 = mul nsw i32 %95, %38
  %97 = add nsw i32 %96, %91
  %98 = mul nsw i32 %94, %34
  %99 = sub nsw i32 %93, %98
  %100 = srem i32 %99, %40
  %101 = add nsw i32 %97, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float* %42, i64 %102
  %.val.i.i.i.i.i.i = load float, float* %103, align 4, !tbaa !171
  %104 = sdiv i32 %i1.02.i, %44
  %105 = srem i32 %104, %48
  %106 = mul nsw i32 %105, %52
  %107 = mul nsw i32 %104, %44
  %108 = sub nsw i32 %i1.02.i, %107
  %109 = sdiv i32 %108, %54
  %110 = srem i32 %109, %56
  %111 = mul nsw i32 %110, %58
  %112 = add nsw i32 %111, %106
  %113 = mul nsw i32 %109, %54
  %114 = sub nsw i32 %108, %113
  %115 = srem i32 %114, %60
  %116 = add nsw i32 %112, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float* %62, i64 %117
  %.val.i.i.i1.i.i.i = load float, float* %118, align 4, !tbaa !171
  %119 = fadd float %.val.i.i.i.i.i.i, %.val.i.i.i1.i.i.i
  %120 = sext i32 %i1.02.i to i64
  %121 = getelementptr inbounds float, float* %64, i64 %120
  store float %119, float* %121, align 4, !tbaa !171
  %122 = add nsw i32 %i1.02.i, %7
  %123 = icmp slt i32 %122, %size
  br i1 %123, label %88, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %88
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 184, i8* %8) #6
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.99"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.99", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.99"* %eval to i8*
  call void @llvm.lifetime.start(i64 152, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.99"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 32, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.102"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.102"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 112, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 4
  %15 = shl nsw i32 %14, 2
  %16 = shl i32 %7, 2
  %17 = shl nsw i32 %5, 2
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 1, i32 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 2
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 0, i32 0
  %.pre = load float*, float** %19, align 8, !tbaa !506
  %.pre1 = load float*, float** %21, align 8, !tbaa !508
  br label %58

._crit_edge6.i.loopexit:                          ; preds = %58
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %22 = add nsw i32 %5, %15
  %23 = icmp slt i32 %22, %size
  br i1 %23, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 1, i32 0
  %25 = load float*, float** %24, align 8
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %27 = bitcast i32* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = trunc i64 %28 to i32
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %31 = bitcast i32* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = trunc i64 %32 to i32
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %35 = bitcast i32* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = trunc i64 %36 to i32
  %38 = lshr i64 %28, 32
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %32, 32
  %41 = trunc i64 %40 to i32
  %42 = lshr i64 %36, 32
  %43 = trunc i64 %42 to i32
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 2
  %45 = load i32, i32* %44, align 8
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %47 = bitcast i32* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = trunc i64 %48 to i32
  %50 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %51 = load i32, i32* %50, align 8
  %52 = lshr i64 %48, 32
  %53 = trunc i64 %52 to i32
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %55 = load float*, float** %54, align 8
  %56 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.99", %"struct.Eigen::TensorEvaluator.99"* %eval, i64 0, i32 0, i32 0
  %57 = load float*, float** %56, align 8
  br label %83

; <label>:58                                      ; preds = %58, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %81, %58 ]
  %59 = sext i32 %i.03.i to i64
  %60 = getelementptr inbounds float, float* %.pre, i64 %59
  %61 = load float, float* %60, align 4, !tbaa !171
  %62 = getelementptr inbounds float, float* %60, i64 1
  %63 = load float, float* %62, align 4, !tbaa !171
  %64 = getelementptr inbounds float, float* %60, i64 2
  %65 = load float, float* %64, align 4, !tbaa !171
  %66 = getelementptr inbounds float, float* %60, i64 3
  %67 = load float, float* %66, align 4, !tbaa !171
  %68 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.103"* %20, i32 %i.03.i) #6
  %69 = extractvalue %struct.float4 %68, 0
  %70 = extractvalue %struct.float4 %68, 1
  %71 = extractvalue %struct.float4 %68, 2
  %72 = extractvalue %struct.float4 %68, 3
  %73 = fadd float %61, %69
  %74 = fadd float %63, %70
  %75 = fadd float %65, %71
  %76 = fadd float %67, %72
  %77 = getelementptr inbounds float, float* %.pre1, i64 %59
  store float %73, float* %77, align 16
  %78 = getelementptr inbounds float, float* %77, i64 1
  store float %74, float* %78, align 4
  %79 = getelementptr inbounds float, float* %77, i64 2
  store float %75, float* %79, align 8
  %80 = getelementptr inbounds float, float* %77, i64 3
  store float %76, float* %80, align 4
  %81 = add nsw i32 %i.03.i, %16
  %82 = icmp slt i32 %81, %15
  br i1 %82, label %58, label %._crit_edge6.i.loopexit

; <label>:83                                      ; preds = %83, %.lr.ph.i
  %i1.02.i = phi i32 [ %22, %.lr.ph.i ], [ %109, %83 ]
  %84 = sext i32 %i1.02.i to i64
  %85 = getelementptr inbounds float, float* %25, i64 %84
  %.val.i.i.i.i = load float, float* %85, align 4, !tbaa !171
  %86 = sdiv i32 %i1.02.i, %29
  %87 = srem i32 %86, %33
  %88 = mul nsw i32 %87, %37
  %89 = mul nsw i32 %86, %29
  %90 = sub nsw i32 %i1.02.i, %89
  %91 = sdiv i32 %90, %39
  %92 = srem i32 %91, %41
  %93 = mul nsw i32 %92, %43
  %94 = add nsw i32 %93, %88
  %95 = mul nsw i32 %91, %39
  %96 = sub nsw i32 %90, %95
  %97 = sdiv i32 %96, %45
  %98 = srem i32 %97, %49
  %99 = mul nsw i32 %98, %51
  %100 = add nsw i32 %94, %99
  %101 = mul nsw i32 %97, %45
  %102 = sub nsw i32 %96, %101
  %103 = srem i32 %102, %53
  %104 = add nsw i32 %100, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float* %55, i64 %105
  %.val.i.i.i.i.i.i = load float, float* %106, align 4, !tbaa !171
  %107 = fadd float %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %108 = getelementptr inbounds float, float* %57, i64 %84
  store float %107, float* %108, align 4, !tbaa !171
  %109 = add nsw i32 %i1.02.i, %7
  %110 = icmp slt i32 %109, %size
  br i1 %110, label %83, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %83
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 152, i8* %8) #6
  ret void
}

; Function Attrs: inlinehint norecurse nounwind readonly
define linkonce_odr %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.103"* nocapture readonly %this, i32 %index) #5 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178
  %14 = sdiv i32 %11, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178
  %17 = srem i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 2, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %9
  %22 = mul nsw i32 %14, %13
  %23 = sub nsw i32 %11, %22
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 1, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !178
  %26 = sdiv i32 %23, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178
  %29 = srem i32 %26, %28
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 2, i32 0, i64 2
  %31 = load i32, i32* %30, align 4, !tbaa !178
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %32, %21
  %34 = mul nsw i32 %26, %25
  %35 = sub nsw i32 %23, %34
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 3
  %37 = load i32, i32* %36, align 4, !tbaa !178
  %38 = srem i32 %35, %37
  %39 = add nsw i32 %38, %33
  %40 = add nsw i32 %38, 4
  %41 = icmp sgt i32 %40, %37
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.103", %"struct.Eigen::TensorEvaluator.103"* %this, i64 0, i32 3, i32 0
  %43 = load float*, float** %42, align 8
  %44 = sext i32 %39 to i64
  %45 = getelementptr inbounds float, float* %43, i64 %44
  br i1 %41, label %50, label %46

; <label>:46                                      ; preds = %0
  %47 = getelementptr inbounds float, float* %45, i64 1
  %48 = getelementptr inbounds float, float* %45, i64 2
  %49 = getelementptr inbounds float, float* %45, i64 3
  br label %117

; <label>:50                                      ; preds = %0
  %51 = add nsw i32 %index, 1
  %52 = sdiv i32 %51, %2
  %53 = srem i32 %52, %5
  %54 = mul nsw i32 %8, %53
  %55 = mul nsw i32 %52, %2
  %56 = sub nsw i32 %51, %55
  %57 = sdiv i32 %56, %13
  %58 = srem i32 %57, %16
  %59 = mul nsw i32 %19, %58
  %60 = add nsw i32 %59, %54
  %61 = mul nsw i32 %57, %13
  %62 = sub nsw i32 %56, %61
  %63 = sdiv i32 %62, %25
  %64 = srem i32 %63, %28
  %65 = mul nsw i32 %31, %64
  %66 = add nsw i32 %60, %65
  %67 = mul nsw i32 %63, %25
  %68 = sub nsw i32 %62, %67
  %69 = srem i32 %68, %37
  %70 = add nsw i32 %66, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float* %43, i64 %71
  %73 = add nsw i32 %index, 2
  %74 = sdiv i32 %73, %2
  %75 = srem i32 %74, %5
  %76 = mul nsw i32 %8, %75
  %77 = mul nsw i32 %74, %2
  %78 = sub nsw i32 %73, %77
  %79 = sdiv i32 %78, %13
  %80 = srem i32 %79, %16
  %81 = mul nsw i32 %19, %80
  %82 = add nsw i32 %81, %76
  %83 = mul nsw i32 %79, %13
  %84 = sub nsw i32 %78, %83
  %85 = sdiv i32 %84, %25
  %86 = srem i32 %85, %28
  %87 = mul nsw i32 %31, %86
  %88 = add nsw i32 %82, %87
  %89 = mul nsw i32 %85, %25
  %90 = sub nsw i32 %84, %89
  %91 = srem i32 %90, %37
  %92 = add nsw i32 %88, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float* %43, i64 %93
  %95 = add nsw i32 %index, 3
  %96 = sdiv i32 %95, %2
  %97 = srem i32 %96, %5
  %98 = mul nsw i32 %8, %97
  %99 = mul nsw i32 %96, %2
  %100 = sub nsw i32 %95, %99
  %101 = sdiv i32 %100, %13
  %102 = srem i32 %101, %16
  %103 = mul nsw i32 %19, %102
  %104 = add nsw i32 %103, %98
  %105 = mul nsw i32 %101, %13
  %106 = sub nsw i32 %100, %105
  %107 = sdiv i32 %106, %25
  %108 = srem i32 %107, %28
  %109 = mul nsw i32 %31, %108
  %110 = add nsw i32 %104, %109
  %111 = mul nsw i32 %107, %25
  %112 = sub nsw i32 %106, %111
  %113 = srem i32 %112, %37
  %114 = add nsw i32 %110, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float* %43, i64 %115
  br label %117

; <label>:117                                     ; preds = %50, %46
  %.sroa.3.0.in = phi float* [ %47, %46 ], [ %72, %50 ]
  %.sroa.6.0.in = phi float* [ %48, %46 ], [ %94, %50 ]
  %.sroa.9.0.in = phi float* [ %49, %46 ], [ %116, %50 ]
  %.sroa.9.0 = load float, float* %.sroa.9.0.in, align 4, !tbaa !171
  %.sroa.6.0 = load float, float* %.sroa.6.0.in, align 4, !tbaa !171
  %.sroa.3.0 = load float, float* %.sroa.3.0.in, align 4, !tbaa !171
  %.sroa.0.0 = load float, float* %45, align 4, !tbaa !171
  %118 = insertvalue %struct.float4 undef, float %.sroa.0.0, 0
  %119 = insertvalue %struct.float4 %118, float %.sroa.3.0, 1
  %120 = insertvalue %struct.float4 %119, float %.sroa.6.0, 2
  %121 = insertvalue %struct.float4 %120, float %.sroa.9.0, 3
  ret %struct.float4 %121
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.104"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.104", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.104"* %eval to i8*
  call void @llvm.lifetime.start(i64 152, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.104"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 32, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.103"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.103"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 112, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 4
  %15 = shl nsw i32 %14, 2
  %16 = shl i32 %7, 2
  %17 = shl nsw i32 %5, 2
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 1, i32 2, i32 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 0, i32 0
  %.pre = load float*, float** %19, align 8, !tbaa !506
  %.pre1 = load float*, float** %20, align 8, !tbaa !508
  br label %57

._crit_edge6.i.loopexit:                          ; preds = %57
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %15
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %24 = bitcast i32* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = trunc i64 %25 to i32
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %28 = bitcast i32* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = trunc i64 %29 to i32
  %31 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %32 = bitcast i32* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = trunc i64 %33 to i32
  %35 = lshr i64 %25, 32
  %36 = trunc i64 %35 to i32
  %37 = lshr i64 %29, 32
  %38 = trunc i64 %37 to i32
  %39 = lshr i64 %33, 32
  %40 = trunc i64 %39 to i32
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 2
  %42 = load i32, i32* %41, align 8
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %44 = bitcast i32* %43 to i64*
  %45 = load i64, i64* %44, align 8
  %46 = trunc i64 %45 to i32
  %47 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %48 = load i32, i32* %47, align 8
  %49 = lshr i64 %45, 32
  %50 = trunc i64 %49 to i32
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %52 = load float*, float** %51, align 8
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 1, i32 2, i32 0
  %54 = load float*, float** %53, align 8
  %55 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.104", %"struct.Eigen::TensorEvaluator.104"* %eval, i64 0, i32 0, i32 0
  %56 = load float*, float** %55, align 8
  br label %82

; <label>:57                                      ; preds = %57, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %80, %57 ]
  %58 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.103"* %10, i32 %i.03.i) #6
  %59 = extractvalue %struct.float4 %58, 0
  %60 = extractvalue %struct.float4 %58, 1
  %61 = extractvalue %struct.float4 %58, 2
  %62 = extractvalue %struct.float4 %58, 3
  %63 = sext i32 %i.03.i to i64
  %64 = getelementptr inbounds float, float* %.pre, i64 %63
  %65 = load float, float* %64, align 4, !tbaa !171
  %66 = getelementptr inbounds float, float* %64, i64 1
  %67 = load float, float* %66, align 4, !tbaa !171
  %68 = getelementptr inbounds float, float* %64, i64 2
  %69 = load float, float* %68, align 4, !tbaa !171
  %70 = getelementptr inbounds float, float* %64, i64 3
  %71 = load float, float* %70, align 4, !tbaa !171
  %72 = fadd float %59, %65
  %73 = fadd float %60, %67
  %74 = fadd float %61, %69
  %75 = fadd float %62, %71
  %76 = getelementptr inbounds float, float* %.pre1, i64 %63
  store float %72, float* %76, align 16
  %77 = getelementptr inbounds float, float* %76, i64 1
  store float %73, float* %77, align 4
  %78 = getelementptr inbounds float, float* %76, i64 2
  store float %74, float* %78, align 8
  %79 = getelementptr inbounds float, float* %76, i64 3
  store float %75, float* %79, align 4
  %80 = add nsw i32 %i.03.i, %16
  %81 = icmp slt i32 %80, %15
  br i1 %81, label %57, label %._crit_edge6.i.loopexit

; <label>:82                                      ; preds = %82, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %108, %82 ]
  %83 = sdiv i32 %i1.02.i, %26
  %84 = srem i32 %83, %30
  %85 = mul nsw i32 %84, %34
  %86 = mul nsw i32 %83, %26
  %87 = sub nsw i32 %i1.02.i, %86
  %88 = sdiv i32 %87, %36
  %89 = srem i32 %88, %38
  %90 = mul nsw i32 %89, %40
  %91 = add nsw i32 %90, %85
  %92 = mul nsw i32 %88, %36
  %93 = sub nsw i32 %87, %92
  %94 = sdiv i32 %93, %42
  %95 = srem i32 %94, %46
  %96 = mul nsw i32 %95, %48
  %97 = add nsw i32 %91, %96
  %98 = mul nsw i32 %94, %42
  %99 = sub nsw i32 %93, %98
  %100 = srem i32 %99, %50
  %101 = add nsw i32 %97, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float* %52, i64 %102
  %.val.i.i.i.i.i.i = load float, float* %103, align 4, !tbaa !171
  %104 = sext i32 %i1.02.i to i64
  %105 = getelementptr inbounds float, float* %54, i64 %104
  %.val.i.i.i.i = load float, float* %105, align 4, !tbaa !171
  %106 = fadd float %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %107 = getelementptr inbounds float, float* %56, i64 %104
  store float %106, float* %107, align 4, !tbaa !171
  %108 = add nsw i32 %i1.02.i, %7
  %109 = icmp slt i32 %108, %size
  br i1 %109, label %82, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %82
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 152, i8* %8) #6
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.106"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.106", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.106"* %eval to i8*
  call void @llvm.lifetime.start(i64 200, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.106"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 32, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.103"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.103"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 160, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 4
  %15 = shl nsw i32 %14, 2
  %16 = shl i32 %7, 2
  %17 = shl nsw i32 %5, 2
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 2
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 0, i32 0
  br label %85

._crit_edge6.i.loopexit:                          ; preds = %85
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %15
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %24 = bitcast i32* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = trunc i64 %25 to i32
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %28 = bitcast i32* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = trunc i64 %29 to i32
  %31 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %32 = bitcast i32* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = trunc i64 %33 to i32
  %35 = lshr i64 %25, 32
  %36 = trunc i64 %35 to i32
  %37 = lshr i64 %29, 32
  %38 = trunc i64 %37 to i32
  %39 = lshr i64 %33, 32
  %40 = trunc i64 %39 to i32
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 2
  %42 = load i32, i32* %41, align 8
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %44 = bitcast i32* %43 to i64*
  %45 = load i64, i64* %44, align 8
  %46 = trunc i64 %45 to i32
  %47 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %48 = load i32, i32* %47, align 8
  %49 = lshr i64 %45, 32
  %50 = trunc i64 %49 to i32
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %52 = load float*, float** %51, align 8
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %54 = bitcast i32* %53 to i64*
  %55 = load i64, i64* %54, align 8
  %56 = trunc i64 %55 to i32
  %57 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %58 = bitcast i32* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = trunc i64 %59 to i32
  %61 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %62 = bitcast i32* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %55, 32
  %66 = trunc i64 %65 to i32
  %67 = lshr i64 %59, 32
  %68 = trunc i64 %67 to i32
  %69 = lshr i64 %63, 32
  %70 = trunc i64 %69 to i32
  %71 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 2
  %72 = load i32, i32* %71, align 8
  %73 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %74 = bitcast i32* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = trunc i64 %75 to i32
  %77 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %78 = load i32, i32* %77, align 8
  %79 = lshr i64 %75, 32
  %80 = trunc i64 %79 to i32
  %81 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %82 = load float*, float** %81, align 8
  %83 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.106", %"struct.Eigen::TensorEvaluator.106"* %eval, i64 0, i32 0, i32 0
  %84 = load float*, float** %83, align 8
  br label %108

; <label>:85                                      ; preds = %85, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %106, %85 ]
  %86 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.103"* %10, i32 %i.03.i) #6
  %87 = extractvalue %struct.float4 %86, 0
  %88 = extractvalue %struct.float4 %86, 1
  %89 = extractvalue %struct.float4 %86, 2
  %90 = extractvalue %struct.float4 %86, 3
  %91 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.103"* %19, i32 %i.03.i) #6
  %92 = extractvalue %struct.float4 %91, 0
  %93 = extractvalue %struct.float4 %91, 1
  %94 = extractvalue %struct.float4 %91, 2
  %95 = extractvalue %struct.float4 %91, 3
  %96 = fadd float %87, %92
  %97 = fadd float %88, %93
  %98 = fadd float %89, %94
  %99 = fadd float %90, %95
  %100 = load float*, float** %20, align 8, !tbaa !508
  %101 = sext i32 %i.03.i to i64
  %102 = getelementptr inbounds float, float* %100, i64 %101
  store float %96, float* %102, align 16
  %103 = getelementptr inbounds float, float* %102, i64 1
  store float %97, float* %103, align 4
  %104 = getelementptr inbounds float, float* %102, i64 2
  store float %98, float* %104, align 8
  %105 = getelementptr inbounds float, float* %102, i64 3
  store float %99, float* %105, align 4
  %106 = add nsw i32 %i.03.i, %16
  %107 = icmp slt i32 %106, %15
  br i1 %107, label %85, label %._crit_edge6.i.loopexit

; <label>:108                                     ; preds = %108, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %154, %108 ]
  %109 = sdiv i32 %i1.02.i, %26
  %110 = srem i32 %109, %30
  %111 = mul nsw i32 %110, %34
  %112 = mul nsw i32 %109, %26
  %113 = sub nsw i32 %i1.02.i, %112
  %114 = sdiv i32 %113, %36
  %115 = srem i32 %114, %38
  %116 = mul nsw i32 %115, %40
  %117 = add nsw i32 %116, %111
  %118 = mul nsw i32 %114, %36
  %119 = sub nsw i32 %113, %118
  %120 = sdiv i32 %119, %42
  %121 = srem i32 %120, %46
  %122 = mul nsw i32 %121, %48
  %123 = add nsw i32 %117, %122
  %124 = mul nsw i32 %120, %42
  %125 = sub nsw i32 %119, %124
  %126 = srem i32 %125, %50
  %127 = add nsw i32 %123, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float* %52, i64 %128
  %.val.i.i.i.i.i.i = load float, float* %129, align 4, !tbaa !171
  %130 = sdiv i32 %i1.02.i, %56
  %131 = srem i32 %130, %60
  %132 = mul nsw i32 %131, %64
  %133 = mul nsw i32 %130, %56
  %134 = sub nsw i32 %i1.02.i, %133
  %135 = sdiv i32 %134, %66
  %136 = srem i32 %135, %68
  %137 = mul nsw i32 %136, %70
  %138 = add nsw i32 %137, %132
  %139 = mul nsw i32 %135, %66
  %140 = sub nsw i32 %134, %139
  %141 = sdiv i32 %140, %72
  %142 = srem i32 %141, %76
  %143 = mul nsw i32 %142, %78
  %144 = add nsw i32 %138, %143
  %145 = mul nsw i32 %141, %72
  %146 = sub nsw i32 %140, %145
  %147 = srem i32 %146, %80
  %148 = add nsw i32 %144, %147
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float* %82, i64 %149
  %.val.i.i.i1.i.i.i = load float, float* %150, align 4, !tbaa !171
  %151 = fadd float %.val.i.i.i.i.i.i, %.val.i.i.i1.i.i.i
  %152 = sext i32 %i1.02.i to i64
  %153 = getelementptr inbounds float, float* %84, i64 %152
  store float %151, float* %153, align 4, !tbaa !171
  %154 = add nsw i32 %i1.02.i, %7
  %155 = icmp slt i32 %154, %size
  br i1 %155, label %108, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %108
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 200, i8* %8) #6
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.108"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.108", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.108"* %eval to i8*
  call void @llvm.lifetime.start(i64 192, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.108"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 40, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.111"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.111"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 144, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 4
  %15 = shl nsw i32 %14, 2
  %16 = shl i32 %7, 2
  %17 = shl nsw i32 %5, 2
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 1, i32 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2
  %21 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 0, i32 0
  br label %64

._crit_edge6.i.loopexit:                          ; preds = %64
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %22 = add nsw i32 %5, %15
  %23 = icmp slt i32 %22, %size
  br i1 %23, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 1, i32 0
  %25 = load float*, float** %24, align 8
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %27 = load i32, i32* %26, align 4
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %29 = bitcast i32* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = trunc i64 %30 to i32
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %33 = bitcast i32* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = trunc i64 %34 to i32
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %37 = load i32, i32* %36, align 4
  %38 = lshr i64 %30, 32
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %34, 32
  %41 = trunc i64 %40 to i32
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 2
  %43 = load i32, i32* %42, align 4
  %44 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %45 = bitcast i32* %44 to i64*
  %46 = load i64, i64* %45, align 8
  %47 = trunc i64 %46 to i32
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %49 = bitcast i32* %48 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = trunc i64 %50 to i32
  %52 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 3
  %53 = load i32, i32* %52, align 4
  %54 = lshr i64 %46, 32
  %55 = trunc i64 %54 to i32
  %56 = lshr i64 %50, 32
  %57 = trunc i64 %56 to i32
  %58 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 4
  %59 = load i32, i32* %58, align 8
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %61 = load float*, float** %60, align 8
  %62 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.108", %"struct.Eigen::TensorEvaluator.108"* %eval, i64 0, i32 0, i32 0
  %63 = load float*, float** %62, align 8
  br label %91

; <label>:64                                      ; preds = %64, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %89, %64 ]
  %65 = load float*, float** %19, align 8, !tbaa !510
  %66 = sext i32 %i.03.i to i64
  %67 = getelementptr inbounds float, float* %65, i64 %66
  %68 = load float, float* %67, align 4, !tbaa !171
  %69 = getelementptr inbounds float, float* %67, i64 1
  %70 = load float, float* %69, align 4, !tbaa !171
  %71 = getelementptr inbounds float, float* %67, i64 2
  %72 = load float, float* %71, align 4, !tbaa !171
  %73 = getelementptr inbounds float, float* %67, i64 3
  %74 = load float, float* %73, align 4, !tbaa !171
  %75 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.112"* %20, i32 %i.03.i) #6
  %76 = extractvalue %struct.float4 %75, 0
  %77 = extractvalue %struct.float4 %75, 1
  %78 = extractvalue %struct.float4 %75, 2
  %79 = extractvalue %struct.float4 %75, 3
  %80 = fadd float %68, %76
  %81 = fadd float %70, %77
  %82 = fadd float %72, %78
  %83 = fadd float %74, %79
  %84 = load float*, float** %21, align 8, !tbaa !512
  %85 = getelementptr inbounds float, float* %84, i64 %66
  store float %80, float* %85, align 16
  %86 = getelementptr inbounds float, float* %85, i64 1
  store float %81, float* %86, align 4
  %87 = getelementptr inbounds float, float* %85, i64 2
  store float %82, float* %87, align 8
  %88 = getelementptr inbounds float, float* %85, i64 3
  store float %83, float* %88, align 4
  %89 = add nsw i32 %i.03.i, %16
  %90 = icmp slt i32 %89, %15
  br i1 %90, label %64, label %._crit_edge6.i.loopexit

; <label>:91                                      ; preds = %91, %.lr.ph.i
  %i1.02.i = phi i32 [ %22, %.lr.ph.i ], [ %123, %91 ]
  %92 = sext i32 %i1.02.i to i64
  %93 = getelementptr inbounds float, float* %25, i64 %92
  %.val.i.i.i.i = load float, float* %93, align 4, !tbaa !171
  %94 = sdiv i32 %i1.02.i, %27
  %95 = srem i32 %94, %31
  %96 = mul nsw i32 %95, %35
  %97 = mul nsw i32 %94, %27
  %98 = sub nsw i32 %i1.02.i, %97
  %99 = sdiv i32 %98, %37
  %100 = srem i32 %99, %39
  %101 = mul nsw i32 %100, %41
  %102 = add nsw i32 %101, %96
  %103 = mul nsw i32 %99, %37
  %104 = sub nsw i32 %98, %103
  %105 = sdiv i32 %104, %43
  %106 = srem i32 %105, %47
  %107 = mul nsw i32 %106, %51
  %108 = add nsw i32 %102, %107
  %109 = mul nsw i32 %105, %43
  %110 = sub nsw i32 %104, %109
  %111 = sdiv i32 %110, %53
  %112 = srem i32 %111, %55
  %113 = mul nsw i32 %112, %57
  %114 = add nsw i32 %108, %113
  %115 = mul nsw i32 %111, %53
  %116 = sub nsw i32 %110, %115
  %117 = srem i32 %116, %59
  %118 = add nsw i32 %114, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float* %61, i64 %119
  %.val.i.i.i.i.i.i = load float, float* %120, align 4, !tbaa !171
  %121 = fadd float %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %122 = getelementptr inbounds float, float* %63, i64 %92
  store float %121, float* %122, align 4, !tbaa !171
  %123 = add nsw i32 %i1.02.i, %7
  %124 = icmp slt i32 %123, %size
  br i1 %124, label %91, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %91
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 192, i8* %8) #6
  ret void
}

; Function Attrs: inlinehint norecurse nounwind readonly
define linkonce_odr %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.112"* nocapture readonly %this, i32 %index) #5 comdat align 2 {
  %values = alloca [4 x float], align 4
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178
  %14 = sdiv i32 %11, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178
  %17 = srem i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 2, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %9
  %22 = mul nsw i32 %14, %13
  %23 = sub nsw i32 %11, %22
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 1, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !178
  %26 = sdiv i32 %23, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178
  %29 = srem i32 %26, %28
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 2, i32 0, i64 2
  %31 = load i32, i32* %30, align 4, !tbaa !178
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %32, %21
  %34 = mul nsw i32 %26, %25
  %35 = sub nsw i32 %23, %34
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 1, i32 0, i64 3
  %37 = load i32, i32* %36, align 4, !tbaa !178
  %38 = sdiv i32 %35, %37
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 3
  %40 = load i32, i32* %39, align 4, !tbaa !178
  %41 = srem i32 %38, %40
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 2, i32 0, i64 3
  %43 = load i32, i32* %42, align 4, !tbaa !178
  %44 = mul nsw i32 %43, %41
  %45 = add nsw i32 %44, %33
  %46 = mul nsw i32 %38, %37
  %47 = sub nsw i32 %35, %46
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 3
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.112", %"struct.Eigen::TensorEvaluator.112"* %this, i64 0, i32 3, i32 1, i32 0, i32 0, i64 4
  %50 = load i32, i32* %49, align 4, !tbaa !178
  %51 = srem i32 %47, %50
  %52 = add nsw i32 %51, %45
  %53 = add nsw i32 %51, 4
  %54 = icmp sgt i32 %53, %50
  br i1 %54, label %67, label %55

; <label>:55                                      ; preds = %0
  %56 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.111", %"struct.Eigen::TensorEvaluator.111"* %48, i64 0, i32 0
  %57 = load float*, float** %56, align 8, !tbaa !510
  %58 = sext i32 %52 to i64
  %59 = getelementptr inbounds float, float* %57, i64 %58
  %60 = load float, float* %59, align 4, !tbaa !171
  %61 = getelementptr inbounds float, float* %59, i64 1
  %62 = load float, float* %61, align 4, !tbaa !171
  %63 = getelementptr inbounds float, float* %59, i64 2
  %64 = load float, float* %63, align 4, !tbaa !171
  %65 = getelementptr inbounds float, float* %59, i64 3
  %66 = load float, float* %65, align 4, !tbaa !171
  br label %118

; <label>:67                                      ; preds = %0
  %68 = bitcast [4 x float]* %values to i8*
  call void @llvm.lifetime.start(i64 16, i8* %68) #6
  %69 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.111", %"struct.Eigen::TensorEvaluator.111"* %48, i64 0, i32 0
  %70 = load float*, float** %69, align 8
  %71 = sext i32 %52 to i64
  %72 = getelementptr inbounds float, float* %70, i64 %71
  %73 = bitcast float* %72 to i32*
  %.val.i2 = load i32, i32* %73, align 4, !tbaa !171
  %74 = bitcast [4 x float]* %values to i32*
  store i32 %.val.i2, i32* %74, align 4, !tbaa !171
  br label %84

; <label>:75                                      ; preds = %84
  %76 = getelementptr inbounds [4 x float], [4 x float]* %values, i64 0, i64 0
  %77 = load float, float* %76, align 16
  %78 = getelementptr inbounds [4 x float], [4 x float]* %values, i64 0, i64 1
  %79 = load float, float* %78, align 4
  %80 = getelementptr inbounds [4 x float], [4 x float]* %values, i64 0, i64 2
  %81 = load float, float* %80, align 8
  %82 = getelementptr inbounds [4 x float], [4 x float]* %values, i64 0, i64 3
  %83 = load float, float* %82, align 4
  call void @llvm.lifetime.end(i64 16, i8* nonnull %68) #6
  br label %118

; <label>:84                                      ; preds = %84, %67
  %i1.04 = phi i32 [ 1, %67 ], [ %117, %84 ]
  %85 = add nsw i32 %i1.04, %index
  %86 = sdiv i32 %85, %2
  %87 = srem i32 %86, %5
  %88 = mul nsw i32 %8, %87
  %89 = mul nsw i32 %86, %2
  %90 = sub nsw i32 %85, %89
  %91 = sdiv i32 %90, %13
  %92 = srem i32 %91, %16
  %93 = mul nsw i32 %19, %92
  %94 = add nsw i32 %93, %88
  %95 = mul nsw i32 %91, %13
  %96 = sub nsw i32 %90, %95
  %97 = sdiv i32 %96, %25
  %98 = srem i32 %97, %28
  %99 = mul nsw i32 %31, %98
  %100 = add nsw i32 %94, %99
  %101 = mul nsw i32 %97, %25
  %102 = sub nsw i32 %96, %101
  %103 = sdiv i32 %102, %37
  %104 = srem i32 %103, %40
  %105 = mul nsw i32 %43, %104
  %106 = add nsw i32 %100, %105
  %107 = mul nsw i32 %103, %37
  %108 = sub nsw i32 %102, %107
  %109 = srem i32 %108, %50
  %110 = add nsw i32 %106, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds float, float* %70, i64 %111
  %113 = bitcast float* %112 to i32*
  %.val.i.i3 = load i32, i32* %113, align 4, !tbaa !171
  %114 = sext i32 %i1.04 to i64
  %115 = getelementptr inbounds [4 x float], [4 x float]* %values, i64 0, i64 %114
  %116 = bitcast float* %115 to i32*
  store i32 %.val.i.i3, i32* %116, align 4, !tbaa !171
  %117 = add nuw nsw i32 %i1.04, 1
  %exitcond = icmp eq i32 %117, 4
  br i1 %exitcond, label %75, label %84

; <label>:118                                     ; preds = %75, %55
  %.sroa.0.0 = phi float [ %60, %55 ], [ %77, %75 ]
  %.sroa.3.0 = phi float [ %62, %55 ], [ %79, %75 ]
  %.sroa.6.0 = phi float [ %64, %55 ], [ %81, %75 ]
  %.sroa.9.0 = phi float [ %66, %55 ], [ %83, %75 ]
  %119 = insertvalue %struct.float4 undef, float %.sroa.0.0, 0
  %120 = insertvalue %struct.float4 %119, float %.sroa.3.0, 1
  %121 = insertvalue %struct.float4 %120, float %.sroa.6.0, 2
  %122 = insertvalue %struct.float4 %121, float %.sroa.9.0, 3
  ret %struct.float4 %122
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.113"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.113", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.113"* %eval to i8*
  call void @llvm.lifetime.start(i64 192, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.113"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 40, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.112"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.112"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 144, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 4
  %15 = shl nsw i32 %14, 2
  %16 = shl i32 %7, 2
  %17 = shl nsw i32 %5, 2
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 2, i32 0
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 0, i32 0
  %.pre = load float*, float** %19, align 8, !tbaa !510
  %.pre1 = load float*, float** %20, align 8, !tbaa !512
  br label %63

._crit_edge6.i.loopexit:                          ; preds = %63
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %15
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %24 = load i32, i32* %23, align 4
  %25 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %26 = bitcast i32* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = trunc i64 %27 to i32
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %30 = bitcast i32* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = trunc i64 %31 to i32
  %33 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %34 = load i32, i32* %33, align 4
  %35 = lshr i64 %27, 32
  %36 = trunc i64 %35 to i32
  %37 = lshr i64 %31, 32
  %38 = trunc i64 %37 to i32
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 2
  %40 = load i32, i32* %39, align 4
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %42 = bitcast i32* %41 to i64*
  %43 = load i64, i64* %42, align 8
  %44 = trunc i64 %43 to i32
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %46 = bitcast i32* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = trunc i64 %47 to i32
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 3
  %50 = load i32, i32* %49, align 4
  %51 = lshr i64 %43, 32
  %52 = trunc i64 %51 to i32
  %53 = lshr i64 %47, 32
  %54 = trunc i64 %53 to i32
  %55 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 4
  %56 = load i32, i32* %55, align 8
  %57 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %58 = load float*, float** %57, align 8
  %59 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 1, i32 2, i32 0
  %60 = load float*, float** %59, align 8
  %61 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.113", %"struct.Eigen::TensorEvaluator.113"* %eval, i64 0, i32 0, i32 0
  %62 = load float*, float** %61, align 8
  br label %88

; <label>:63                                      ; preds = %63, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %86, %63 ]
  %64 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.112"* %10, i32 %i.03.i) #6
  %65 = extractvalue %struct.float4 %64, 0
  %66 = extractvalue %struct.float4 %64, 1
  %67 = extractvalue %struct.float4 %64, 2
  %68 = extractvalue %struct.float4 %64, 3
  %69 = sext i32 %i.03.i to i64
  %70 = getelementptr inbounds float, float* %.pre, i64 %69
  %71 = load float, float* %70, align 4, !tbaa !171
  %72 = getelementptr inbounds float, float* %70, i64 1
  %73 = load float, float* %72, align 4, !tbaa !171
  %74 = getelementptr inbounds float, float* %70, i64 2
  %75 = load float, float* %74, align 4, !tbaa !171
  %76 = getelementptr inbounds float, float* %70, i64 3
  %77 = load float, float* %76, align 4, !tbaa !171
  %78 = fadd float %65, %71
  %79 = fadd float %66, %73
  %80 = fadd float %67, %75
  %81 = fadd float %68, %77
  %82 = getelementptr inbounds float, float* %.pre1, i64 %69
  store float %78, float* %82, align 16
  %83 = getelementptr inbounds float, float* %82, i64 1
  store float %79, float* %83, align 4
  %84 = getelementptr inbounds float, float* %82, i64 2
  store float %80, float* %84, align 8
  %85 = getelementptr inbounds float, float* %82, i64 3
  store float %81, float* %85, align 4
  %86 = add nsw i32 %i.03.i, %16
  %87 = icmp slt i32 %86, %15
  br i1 %87, label %63, label %._crit_edge6.i.loopexit

; <label>:88                                      ; preds = %88, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %120, %88 ]
  %89 = sdiv i32 %i1.02.i, %24
  %90 = srem i32 %89, %28
  %91 = mul nsw i32 %90, %32
  %92 = mul nsw i32 %89, %24
  %93 = sub nsw i32 %i1.02.i, %92
  %94 = sdiv i32 %93, %34
  %95 = srem i32 %94, %36
  %96 = mul nsw i32 %95, %38
  %97 = add nsw i32 %96, %91
  %98 = mul nsw i32 %94, %34
  %99 = sub nsw i32 %93, %98
  %100 = sdiv i32 %99, %40
  %101 = srem i32 %100, %44
  %102 = mul nsw i32 %101, %48
  %103 = add nsw i32 %97, %102
  %104 = mul nsw i32 %100, %40
  %105 = sub nsw i32 %99, %104
  %106 = sdiv i32 %105, %50
  %107 = srem i32 %106, %52
  %108 = mul nsw i32 %107, %54
  %109 = add nsw i32 %103, %108
  %110 = mul nsw i32 %106, %50
  %111 = sub nsw i32 %105, %110
  %112 = srem i32 %111, %56
  %113 = add nsw i32 %109, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds float, float* %58, i64 %114
  %.val.i.i.i.i.i.i = load float, float* %115, align 4, !tbaa !171
  %116 = sext i32 %i1.02.i to i64
  %117 = getelementptr inbounds float, float* %60, i64 %116
  %.val.i.i.i.i = load float, float* %117, align 4, !tbaa !171
  %118 = fadd float %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %119 = getelementptr inbounds float, float* %62, i64 %116
  store float %118, float* %119, align 4, !tbaa !171
  %120 = add nsw i32 %i1.02.i, %7
  %121 = icmp slt i32 %120, %size
  br i1 %121, label %88, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %88
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 192, i8* %8) #6
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.115"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.115", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.115"* %eval to i8*
  call void @llvm.lifetime.start(i64 256, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.115"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 40, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.112"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.112"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 208, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 4
  %15 = shl nsw i32 %14, 2
  %16 = shl i32 %7, 2
  %17 = shl nsw i32 %5, 2
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 0, i32 0
  br label %96

._crit_edge6.i.loopexit:                          ; preds = %96
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %15
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 0, i32 0
  %.pre.i = load float*, float** %23, align 8, !tbaa !512
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %25 = load i32, i32* %24, align 4
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %27 = bitcast i32* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = trunc i64 %28 to i32
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %31 = bitcast i32* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = trunc i64 %32 to i32
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %35 = load i32, i32* %34, align 4
  %36 = lshr i64 %28, 32
  %37 = trunc i64 %36 to i32
  %38 = lshr i64 %32, 32
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 2
  %41 = load i32, i32* %40, align 4
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %43 = bitcast i32* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = trunc i64 %44 to i32
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %47 = bitcast i32* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = trunc i64 %48 to i32
  %50 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 3
  %51 = load i32, i32* %50, align 4
  %52 = lshr i64 %44, 32
  %53 = trunc i64 %52 to i32
  %54 = lshr i64 %48, 32
  %55 = trunc i64 %54 to i32
  %56 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 4
  %57 = load i32, i32* %56, align 8
  %58 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %59 = load float*, float** %58, align 8
  %60 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %61 = load i32, i32* %60, align 4
  %62 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %63 = bitcast i32* %62 to i64*
  %64 = load i64, i64* %63, align 8
  %65 = trunc i64 %64 to i32
  %66 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %67 = bitcast i32* %66 to i64*
  %68 = load i64, i64* %67, align 8
  %69 = trunc i64 %68 to i32
  %70 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %71 = load i32, i32* %70, align 4
  %72 = lshr i64 %64, 32
  %73 = trunc i64 %72 to i32
  %74 = lshr i64 %68, 32
  %75 = trunc i64 %74 to i32
  %76 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 2
  %77 = load i32, i32* %76, align 4
  %78 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %79 = bitcast i32* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = trunc i64 %80 to i32
  %82 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %83 = bitcast i32* %82 to i64*
  %84 = load i64, i64* %83, align 8
  %85 = trunc i64 %84 to i32
  %86 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 3
  %87 = load i32, i32* %86, align 4
  %88 = lshr i64 %80, 32
  %89 = trunc i64 %88 to i32
  %90 = lshr i64 %84, 32
  %91 = trunc i64 %90 to i32
  %92 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 4
  %93 = load i32, i32* %92, align 8
  %94 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.115", %"struct.Eigen::TensorEvaluator.115"* %eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %95 = load float*, float** %94, align 8
  br label %119

; <label>:96                                      ; preds = %96, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %117, %96 ]
  %97 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.112"* %10, i32 %i.03.i) #6
  %98 = extractvalue %struct.float4 %97, 0
  %99 = extractvalue %struct.float4 %97, 1
  %100 = extractvalue %struct.float4 %97, 2
  %101 = extractvalue %struct.float4 %97, 3
  %102 = call %struct.float4 @_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE6float4i(%"struct.Eigen::TensorEvaluator.112"* %19, i32 %i.03.i) #6
  %103 = extractvalue %struct.float4 %102, 0
  %104 = extractvalue %struct.float4 %102, 1
  %105 = extractvalue %struct.float4 %102, 2
  %106 = extractvalue %struct.float4 %102, 3
  %107 = fadd float %98, %103
  %108 = fadd float %99, %104
  %109 = fadd float %100, %105
  %110 = fadd float %101, %106
  %111 = load float*, float** %20, align 8, !tbaa !512
  %112 = sext i32 %i.03.i to i64
  %113 = getelementptr inbounds float, float* %111, i64 %112
  store float %107, float* %113, align 16
  %114 = getelementptr inbounds float, float* %113, i64 1
  store float %108, float* %114, align 4
  %115 = getelementptr inbounds float, float* %113, i64 2
  store float %109, float* %115, align 8
  %116 = getelementptr inbounds float, float* %113, i64 3
  store float %110, float* %116, align 4
  %117 = add nsw i32 %i.03.i, %16
  %118 = icmp slt i32 %117, %15
  br i1 %118, label %96, label %._crit_edge6.i.loopexit

; <label>:119                                     ; preds = %119, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %177, %119 ]
  %120 = sdiv i32 %i1.02.i, %25
  %121 = srem i32 %120, %29
  %122 = mul nsw i32 %33, %121
  %123 = mul nsw i32 %120, %25
  %124 = sub nsw i32 %i1.02.i, %123
  %125 = sdiv i32 %124, %35
  %126 = srem i32 %125, %37
  %127 = mul nsw i32 %39, %126
  %128 = add nsw i32 %127, %122
  %129 = mul nsw i32 %125, %35
  %130 = sub nsw i32 %124, %129
  %131 = sdiv i32 %130, %41
  %132 = srem i32 %131, %45
  %133 = mul nsw i32 %49, %132
  %134 = add nsw i32 %128, %133
  %135 = mul nsw i32 %131, %41
  %136 = sub nsw i32 %130, %135
  %137 = sdiv i32 %136, %51
  %138 = srem i32 %137, %53
  %139 = mul nsw i32 %55, %138
  %140 = add nsw i32 %134, %139
  %141 = mul nsw i32 %137, %51
  %142 = sub nsw i32 %136, %141
  %143 = srem i32 %142, %57
  %144 = add nsw i32 %140, %143
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float* %59, i64 %145
  %.val.i.i.i.i = load float, float* %146, align 4, !tbaa !171
  %147 = sdiv i32 %i1.02.i, %61
  %148 = srem i32 %147, %65
  %149 = mul nsw i32 %69, %148
  %150 = mul nsw i32 %147, %61
  %151 = sub nsw i32 %i1.02.i, %150
  %152 = sdiv i32 %151, %71
  %153 = srem i32 %152, %73
  %154 = mul nsw i32 %75, %153
  %155 = add nsw i32 %154, %149
  %156 = mul nsw i32 %152, %71
  %157 = sub nsw i32 %151, %156
  %158 = sdiv i32 %157, %77
  %159 = srem i32 %158, %81
  %160 = mul nsw i32 %85, %159
  %161 = add nsw i32 %155, %160
  %162 = mul nsw i32 %158, %77
  %163 = sub nsw i32 %157, %162
  %164 = sdiv i32 %163, %87
  %165 = srem i32 %164, %89
  %166 = mul nsw i32 %91, %165
  %167 = add nsw i32 %161, %166
  %168 = mul nsw i32 %164, %87
  %169 = sub nsw i32 %163, %168
  %170 = srem i32 %169, %93
  %171 = add nsw i32 %167, %170
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds float, float* %95, i64 %172
  %.val.i.i.i1.i = load float, float* %173, align 4, !tbaa !171
  %174 = fadd float %.val.i.i.i.i, %.val.i.i.i1.i
  %175 = sext i32 %i1.02.i to i64
  %176 = getelementptr inbounds float, float* %.pre.i, i64 %175
  store float %174, float* %176, align 4, !tbaa !171
  %177 = add nsw i32 %i1.02.i, %7
  %178 = icmp slt i32 %177, %size
  br i1 %178, label %119, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %119
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 256, i8* %8) #6
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.117"* byval nocapture readonly align 8 %memcopied_eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.117", %"struct.Eigen::TensorEvaluator.117"* %memcopied_eval, i64 0, i32 0, i32 0
  %11 = load double*, double** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.117", %"struct.Eigen::TensorEvaluator.117"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %13 = load double*, double** %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.117", %"struct.Eigen::TensorEvaluator.117"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %15 = load double*, double** %14, align 8
  %16 = sdiv i64 %size, 2
  %17 = shl nsw i64 %16, 1
  %18 = shl nuw nsw i64 %9, 1
  %19 = shl nuw nsw i64 %6, 1
  %20 = icmp slt i64 %19, %17
  br i1 %20, label %.lr.ph6.i.preheader, label %._crit_edge7.i

.lr.ph6.i.preheader:                              ; preds = %0
  br label %.lr.ph6.i

._crit_edge7.i.loopexit:                          ; preds = %.lr.ph6.i
  br label %._crit_edge7.i

._crit_edge7.i:                                   ; preds = %._crit_edge7.i.loopexit, %0
  %21 = add nsw i64 %6, %17
  %22 = icmp slt i64 %21, %size
  br i1 %22, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge7.i
  br label %.lr.ph.i

.lr.ph6.i:                                        ; preds = %.lr.ph6.i.preheader, %.lr.ph6.i
  %i.04.i = phi i64 [ %36, %.lr.ph6.i ], [ %19, %.lr.ph6.i.preheader ]
  %sext.i.i.i = shl i64 %i.04.i, 32
  %23 = ashr exact i64 %sext.i.i.i, 32
  %24 = getelementptr inbounds double, double* %13, i64 %23
  %25 = load double, double* %24, align 8, !tbaa !514
  %26 = getelementptr inbounds double, double* %24, i64 1
  %27 = load double, double* %26, align 8, !tbaa !514
  %28 = getelementptr inbounds double, double* %15, i64 %i.04.i
  %29 = load double, double* %28, align 8, !tbaa !514
  %30 = getelementptr inbounds double, double* %28, i64 1
  %31 = load double, double* %30, align 8, !tbaa !514
  %32 = fadd double %25, %29
  %33 = fadd double %27, %31
  %34 = getelementptr inbounds double, double* %11, i64 %23
  store double %32, double* %34, align 16
  %35 = getelementptr inbounds double, double* %34, i64 1
  store double %33, double* %35, align 8
  %36 = add nuw nsw i64 %i.04.i, %18
  %37 = icmp slt i64 %36, %17
  br i1 %37, label %.lr.ph6.i, label %._crit_edge7.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.03.i = phi i64 [ %43, %.lr.ph.i ], [ %21, %.lr.ph.i.preheader ]
  %sext.i.i2.i = shl i64 %i1.03.i, 32
  %38 = ashr exact i64 %sext.i.i2.i, 32
  %39 = getelementptr inbounds double, double* %13, i64 %38
  %.val.i.i.i.i = load double, double* %39, align 8, !tbaa !514
  %40 = getelementptr inbounds double, double* %15, i64 %i1.03.i
  %.val.i1.i.i.i = load double, double* %40, align 8, !tbaa !514
  %41 = fadd double %.val.i.i.i.i, %.val.i1.i.i.i
  %42 = getelementptr inbounds double, double* %11, i64 %38
  store double %41, double* %42, align 8, !tbaa !514
  %43 = add nsw i64 %i1.03.i, %9
  %44 = icmp slt i64 %43, %size
  br i1 %44, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb1EE3runERSN_lll.exit.loopexit, %._crit_edge7.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.125"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.125", %"struct.Eigen::TensorEvaluator.125"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.125", %"struct.Eigen::TensorEvaluator.125"* %memcopied_eval, i64 0, i32 1
  %11 = bitcast %"struct.Eigen::TensorEvaluator.126"* %10 to i64*
  %12 = load i64, i64* %11, align 8, !tbaa !516
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.125", %"struct.Eigen::TensorEvaluator.125"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %14 = load double*, double** %13, align 8
  %15 = sdiv i32 %size, 2
  %16 = shl nsw i32 %15, 1
  %17 = shl i32 %7, 1
  %18 = shl nsw i32 %5, 1
  %19 = icmp slt i32 %18, %16
  br i1 %19, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  %20 = inttoptr i64 %12 to double*
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %.lr.ph5.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %16
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = inttoptr i64 %12 to double*
  br label %36

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %.lr.ph5.i
  %i.03.i = phi i32 [ %34, %.lr.ph5.i ], [ %18, %.lr.ph5.i.preheader ]
  %24 = sext i32 %i.03.i to i64
  %25 = getelementptr inbounds double, double* %14, i64 %24
  %26 = load double, double* %25, align 8, !tbaa !514
  %27 = getelementptr inbounds double, double* %25, i64 1
  %28 = load double, double* %27, align 8, !tbaa !514
  %29 = load double, double* %20, align 8, !tbaa !514
  %30 = fadd double %26, %29
  %31 = fadd double %28, %29
  %32 = getelementptr inbounds double, double* %9, i64 %24
  store double %30, double* %32, align 16
  %33 = getelementptr inbounds double, double* %32, i64 1
  store double %31, double* %33, align 8
  %34 = add nsw i32 %i.03.i, %17
  %35 = icmp slt i32 %34, %16
  br i1 %35, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

; <label>:36                                      ; preds = %36, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %42, %36 ]
  %37 = sext i32 %i1.02.i to i64
  %38 = getelementptr inbounds double, double* %14, i64 %37
  %.val.i.i.i.i = load double, double* %38, align 8, !tbaa !514
  %39 = load double, double* %23, align 8, !tbaa !514
  %40 = fadd double %.val.i.i.i.i, %39
  %41 = getelementptr inbounds double, double* %9, i64 %37
  store double %40, double* %41, align 8, !tbaa !514
  %42 = add nsw i32 %i1.02.i, %7
  %43 = icmp slt i32 %42, %size
  br i1 %43, label %36, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit: ; preds = %36
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.128"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.128", %"struct.Eigen::TensorEvaluator.128"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.128", %"struct.Eigen::TensorEvaluator.128"* %memcopied_eval, i64 0, i32 1
  %11 = bitcast %"struct.Eigen::TensorEvaluator.129"* %10 to i64*
  %12 = load i64, i64* %11, align 8, !tbaa !518
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.128", %"struct.Eigen::TensorEvaluator.128"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %14 = load double*, double** %13, align 8
  %15 = sdiv i32 %size, 2
  %16 = shl nsw i32 %15, 1
  %17 = shl i32 %7, 1
  %18 = shl nsw i32 %5, 1
  %19 = icmp slt i32 %18, %16
  br i1 %19, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  %20 = inttoptr i64 %12 to double*
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %.lr.ph5.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %16
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = inttoptr i64 %12 to double*
  br label %36

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %.lr.ph5.i
  %i.03.i = phi i32 [ %34, %.lr.ph5.i ], [ %18, %.lr.ph5.i.preheader ]
  %24 = sext i32 %i.03.i to i64
  %25 = getelementptr inbounds double, double* %14, i64 %24
  %26 = load double, double* %25, align 8, !tbaa !514
  %27 = getelementptr inbounds double, double* %25, i64 1
  %28 = load double, double* %27, align 8, !tbaa !514
  %29 = load double, double* %20, align 8, !tbaa !514
  %30 = fadd double %26, %29
  %31 = fadd double %28, %29
  %32 = getelementptr inbounds double, double* %9, i64 %24
  store double %30, double* %32, align 16
  %33 = getelementptr inbounds double, double* %32, i64 1
  store double %31, double* %33, align 8
  %34 = add nsw i32 %i.03.i, %17
  %35 = icmp slt i32 %34, %16
  br i1 %35, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

; <label>:36                                      ; preds = %36, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %42, %36 ]
  %37 = sext i32 %i1.02.i to i64
  %38 = getelementptr inbounds double, double* %14, i64 %37
  %.val.i.i.i.i = load double, double* %38, align 8, !tbaa !514
  %39 = load double, double* %23, align 8, !tbaa !514
  %40 = fadd double %.val.i.i.i.i, %39
  %41 = getelementptr inbounds double, double* %9, i64 %37
  store double %40, double* %41, align 8, !tbaa !514
  %42 = add nsw i32 %i1.02.i, %7
  %43 = icmp slt i32 %42, %size
  br i1 %43, label %36, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit: ; preds = %36
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb1EE3runERSM_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.131"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.131", %"struct.Eigen::TensorEvaluator.131"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.131", %"struct.Eigen::TensorEvaluator.131"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load double*, double** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.131", %"struct.Eigen::TensorEvaluator.131"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %13 = load double*, double** %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.131", %"struct.Eigen::TensorEvaluator.131"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %15 = load i32, i32* %14, align 8
  %16 = sdiv i32 %size, 2
  %17 = shl nsw i32 %16, 1
  %18 = shl i32 %7, 1
  %19 = shl nsw i32 %5, 1
  %20 = icmp slt i32 %19, %17
  br i1 %20, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %17
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %44, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %19, %.lr.ph5.i.preheader ]
  %23 = sext i32 %i.03.i to i64
  %24 = getelementptr inbounds double, double* %11, i64 %23
  %25 = load double, double* %24, align 8, !tbaa !514
  %26 = getelementptr inbounds double, double* %24, i64 1
  %27 = load double, double* %26, align 8, !tbaa !514
  %28 = srem i32 %i.03.i, %15
  %29 = add nsw i32 %28, 2
  %30 = icmp sgt i32 %29, %15
  %31 = sext i32 %28 to i64
  %32 = getelementptr inbounds double, double* %13, i64 %31
  br i1 %30, label %35, label %33

; <label>:33                                      ; preds = %.lr.ph5.i
  %34 = getelementptr inbounds double, double* %32, i64 1
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:35                                      ; preds = %.lr.ph5.i
  %36 = or i32 %i.03.i, 1
  %37 = srem i32 %36, %15
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double* %13, i64 %38
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %35, %33
  %.sroa.3.0.in.i.i.i.i.i = phi double* [ %34, %33 ], [ %39, %35 ]
  %.sroa.3.0.i.i.i.i.i = load double, double* %.sroa.3.0.in.i.i.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i.i.i.i = load double, double* %32, align 8, !tbaa !514
  %40 = fadd double %25, %.sroa.0.0.i.i.i.i.i
  %41 = fadd double %27, %.sroa.3.0.i.i.i.i.i
  %42 = getelementptr inbounds double, double* %9, i64 %23
  store double %40, double* %42, align 16
  %43 = getelementptr inbounds double, double* %42, i64 1
  store double %41, double* %43, align 8
  %44 = add nsw i32 %i.03.i, %18
  %45 = icmp slt i32 %44, %17
  br i1 %45, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %53, %.lr.ph.i ], [ %21, %.lr.ph.i.preheader ]
  %46 = sext i32 %i1.02.i to i64
  %47 = getelementptr inbounds double, double* %11, i64 %46
  %.val.i.i.i.i = load double, double* %47, align 8, !tbaa !514
  %48 = srem i32 %i1.02.i, %15
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds double, double* %13, i64 %49
  %.val.i.i.i.i.i.i = load double, double* %50, align 8, !tbaa !514
  %51 = fadd double %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %52 = getelementptr inbounds double, double* %9, i64 %46
  store double %51, double* %52, align 8, !tbaa !514
  %53 = add nsw i32 %i1.02.i, %7
  %54 = icmp slt i32 %53, %size
  br i1 %54, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.134"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.134", %"struct.Eigen::TensorEvaluator.134"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.134", %"struct.Eigen::TensorEvaluator.134"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %11 = load double*, double** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.134", %"struct.Eigen::TensorEvaluator.134"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.134", %"struct.Eigen::TensorEvaluator.134"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %15 = load double*, double** %14, align 8
  %16 = sdiv i32 %size, 2
  %17 = shl nsw i32 %16, 1
  %18 = shl i32 %7, 1
  %19 = shl nsw i32 %5, 1
  %20 = icmp slt i32 %19, %17
  br i1 %20, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %17
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %44, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %19, %.lr.ph5.i.preheader ]
  %23 = srem i32 %i.03.i, %13
  %24 = add nsw i32 %23, 2
  %25 = icmp sgt i32 %24, %13
  %26 = sext i32 %23 to i64
  %27 = getelementptr inbounds double, double* %11, i64 %26
  br i1 %25, label %30, label %28

; <label>:28                                      ; preds = %.lr.ph5.i
  %29 = getelementptr inbounds double, double* %27, i64 1
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:30                                      ; preds = %.lr.ph5.i
  %31 = or i32 %i.03.i, 1
  %32 = srem i32 %31, %13
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double* %11, i64 %33
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %30, %28
  %.sroa.3.0.in.i.i.i.i.i = phi double* [ %29, %28 ], [ %34, %30 ]
  %.sroa.3.0.i.i.i.i.i = load double, double* %.sroa.3.0.in.i.i.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i.i.i.i = load double, double* %27, align 8, !tbaa !514
  %35 = sext i32 %i.03.i to i64
  %36 = getelementptr inbounds double, double* %15, i64 %35
  %37 = load double, double* %36, align 8, !tbaa !514
  %38 = getelementptr inbounds double, double* %36, i64 1
  %39 = load double, double* %38, align 8, !tbaa !514
  %40 = fadd double %.sroa.0.0.i.i.i.i.i, %37
  %41 = fadd double %.sroa.3.0.i.i.i.i.i, %39
  %42 = getelementptr inbounds double, double* %9, i64 %35
  store double %40, double* %42, align 16
  %43 = getelementptr inbounds double, double* %42, i64 1
  store double %41, double* %43, align 8
  %44 = add nsw i32 %i.03.i, %18
  %45 = icmp slt i32 %44, %17
  br i1 %45, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %53, %.lr.ph.i ], [ %21, %.lr.ph.i.preheader ]
  %46 = srem i32 %i1.02.i, %13
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double* %11, i64 %47
  %.val.i.i.i.i.i.i = load double, double* %48, align 8, !tbaa !514
  %49 = sext i32 %i1.02.i to i64
  %50 = getelementptr inbounds double, double* %15, i64 %49
  %.val.i.i.i.i = load double, double* %50, align 8, !tbaa !514
  %51 = fadd double %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %52 = getelementptr inbounds double, double* %9, i64 %49
  store double %51, double* %52, align 8, !tbaa !514
  %53 = add nsw i32 %i1.02.i, %7
  %54 = icmp slt i32 %53, %size
  br i1 %54, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.136"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.136", %"struct.Eigen::TensorEvaluator.136"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.136", %"struct.Eigen::TensorEvaluator.136"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %11 = load double*, double** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.136", %"struct.Eigen::TensorEvaluator.136"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.136", %"struct.Eigen::TensorEvaluator.136"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %15 = load double*, double** %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.136", %"struct.Eigen::TensorEvaluator.136"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %17 = load i32, i32* %16, align 8
  %18 = sdiv i32 %size, 2
  %19 = shl nsw i32 %18, 1
  %20 = shl i32 %7, 1
  %21 = shl nsw i32 %5, 1
  %22 = icmp slt i32 %21, %19
  br i1 %22, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %23 = add nsw i32 %5, %19
  %24 = icmp slt i32 %23, %size
  br i1 %24, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %54, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %21, %.lr.ph5.i.preheader ]
  %25 = srem i32 %i.03.i, %13
  %26 = add nsw i32 %25, 2
  %27 = icmp sgt i32 %26, %13
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds double, double* %11, i64 %28
  br i1 %27, label %32, label %30

; <label>:30                                      ; preds = %.lr.ph5.i
  %31 = getelementptr inbounds double, double* %29, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKdLi1ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit.i.i.i

; <label>:32                                      ; preds = %.lr.ph5.i
  %33 = or i32 %i.03.i, 1
  %34 = srem i32 %33, %13
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double* %11, i64 %35
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKdLi1ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit.i.i.i

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKdLi1ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit.i.i.i: ; preds = %32, %30
  %.sroa.3.0.in.i.i.i.i.i = phi double* [ %31, %30 ], [ %36, %32 ]
  %.sroa.3.0.i.i.i.i.i = load double, double* %.sroa.3.0.in.i.i.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i.i.i.i = load double, double* %29, align 8, !tbaa !514
  %37 = srem i32 %i.03.i, %17
  %38 = add nsw i32 %37, 2
  %39 = icmp sgt i32 %38, %17
  %40 = sext i32 %37 to i64
  %41 = getelementptr inbounds double, double* %15, i64 %40
  br i1 %39, label %44, label %42

; <label>:42                                      ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKdLi1ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit.i.i.i
  %43 = getelementptr inbounds double, double* %41, i64 1
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:44                                      ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKdLi1ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit.i.i.i
  %45 = or i32 %i.03.i, 1
  %46 = srem i32 %45, %17
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds double, double* %15, i64 %47
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS2_INS3_IKdLi1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %44, %42
  %.sroa.3.0.in.i.i1.i.i.i = phi double* [ %43, %42 ], [ %48, %44 ]
  %.sroa.3.0.i.i2.i.i.i = load double, double* %.sroa.3.0.in.i.i1.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i3.i.i.i = load double, double* %41, align 8, !tbaa !514
  %49 = fadd double %.sroa.0.0.i.i.i.i.i, %.sroa.0.0.i.i3.i.i.i
  %50 = fadd double %.sroa.3.0.i.i.i.i.i, %.sroa.3.0.i.i2.i.i.i
  %51 = sext i32 %i.03.i to i64
  %52 = getelementptr inbounds double, double* %9, i64 %51
  store double %49, double* %52, align 16
  %53 = getelementptr inbounds double, double* %52, i64 1
  store double %50, double* %53, align 8
  %54 = add nsw i32 %i.03.i, %20
  %55 = icmp slt i32 %54, %19
  br i1 %55, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %65, %.lr.ph.i ], [ %23, %.lr.ph.i.preheader ]
  %56 = srem i32 %i1.02.i, %13
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double* %11, i64 %57
  %.val.i.i.i.i.i.i = load double, double* %58, align 8, !tbaa !514
  %59 = srem i32 %i1.02.i, %17
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double* %15, i64 %60
  %.val.i.i.i1.i.i.i = load double, double* %61, align 8, !tbaa !514
  %62 = fadd double %.val.i.i.i.i.i.i, %.val.i.i.i1.i.i.i
  %63 = sext i32 %i1.02.i to i64
  %64 = getelementptr inbounds double, double* %9, i64 %63
  store double %62, double* %64, align 8, !tbaa !514
  %65 = add nsw i32 %i1.02.i, %7
  %66 = icmp slt i32 %65, %size
  br i1 %66, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.138"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.138", %"struct.Eigen::TensorEvaluator.138"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.138", %"struct.Eigen::TensorEvaluator.138"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load double*, double** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.138", %"struct.Eigen::TensorEvaluator.138"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.138", %"struct.Eigen::TensorEvaluator.138"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %15 = load i32, i32* %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.138", %"struct.Eigen::TensorEvaluator.138"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %17 = load double*, double** %16, align 8
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.138", %"struct.Eigen::TensorEvaluator.138"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %19 = bitcast i32* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = trunc i64 %20 to i32
  %22 = lshr i64 %20, 32
  %23 = trunc i64 %22 to i32
  %24 = sdiv i32 %size, 2
  %25 = shl nsw i32 %24, 1
  %26 = shl i32 %7, 1
  %27 = shl nsw i32 %5, 1
  %28 = icmp slt i32 %27, %25
  br i1 %28, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %29 = add nsw i32 %5, %25
  %30 = icmp slt i32 %29, %size
  br i1 %30, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %64, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %27, %.lr.ph5.i.preheader ]
  %31 = sext i32 %i.03.i to i64
  %32 = getelementptr inbounds double, double* %11, i64 %31
  %33 = load double, double* %32, align 8, !tbaa !514
  %34 = getelementptr inbounds double, double* %32, i64 1
  %35 = load double, double* %34, align 8, !tbaa !514
  %36 = sdiv i32 %i.03.i, %13
  %37 = srem i32 %36, %21
  %38 = mul nsw i32 %37, %15
  %39 = mul nsw i32 %36, %13
  %40 = sub nsw i32 %i.03.i, %39
  %41 = srem i32 %40, %23
  %42 = add nsw i32 %41, %38
  %43 = add nsw i32 %41, 2
  %44 = icmp sgt i32 %43, %23
  %45 = sext i32 %42 to i64
  %46 = getelementptr inbounds double, double* %17, i64 %45
  br i1 %44, label %49, label %47

; <label>:47                                      ; preds = %.lr.ph5.i
  %48 = getelementptr inbounds double, double* %46, i64 1
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:49                                      ; preds = %.lr.ph5.i
  %50 = or i32 %i.03.i, 1
  %51 = sdiv i32 %50, %13
  %52 = srem i32 %51, %21
  %53 = mul nsw i32 %52, %15
  %54 = mul nsw i32 %51, %13
  %55 = sub nsw i32 %50, %54
  %56 = srem i32 %55, %23
  %57 = add nsw i32 %56, %53
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double* %17, i64 %58
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %49, %47
  %.sroa.3.0.in.i.i.i.i.i = phi double* [ %48, %47 ], [ %59, %49 ]
  %.sroa.3.0.i.i.i.i.i = load double, double* %.sroa.3.0.in.i.i.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i.i.i.i = load double, double* %46, align 8, !tbaa !514
  %60 = fadd double %33, %.sroa.0.0.i.i.i.i.i
  %61 = fadd double %35, %.sroa.3.0.i.i.i.i.i
  %62 = getelementptr inbounds double, double* %9, i64 %31
  store double %60, double* %62, align 16
  %63 = getelementptr inbounds double, double* %62, i64 1
  store double %61, double* %63, align 8
  %64 = add nsw i32 %i.03.i, %26
  %65 = icmp slt i32 %64, %25
  br i1 %65, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %79, %.lr.ph.i ], [ %29, %.lr.ph.i.preheader ]
  %66 = sext i32 %i1.02.i to i64
  %67 = getelementptr inbounds double, double* %11, i64 %66
  %.val.i.i.i.i = load double, double* %67, align 8, !tbaa !514
  %68 = sdiv i32 %i1.02.i, %13
  %69 = srem i32 %68, %21
  %70 = mul nsw i32 %69, %15
  %71 = mul nsw i32 %68, %13
  %72 = sub nsw i32 %i1.02.i, %71
  %73 = srem i32 %72, %23
  %74 = add nsw i32 %73, %70
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double* %17, i64 %75
  %.val.i.i.i.i.i.i = load double, double* %76, align 8, !tbaa !514
  %77 = fadd double %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %78 = getelementptr inbounds double, double* %9, i64 %66
  store double %77, double* %78, align 8, !tbaa !514
  %79 = add nsw i32 %i1.02.i, %7
  %80 = icmp slt i32 %79, %size
  br i1 %80, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.143"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.143", %"struct.Eigen::TensorEvaluator.143"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.143", %"struct.Eigen::TensorEvaluator.143"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.143", %"struct.Eigen::TensorEvaluator.143"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.143", %"struct.Eigen::TensorEvaluator.143"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %15 = load double*, double** %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.143", %"struct.Eigen::TensorEvaluator.143"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %17 = bitcast i32* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = trunc i64 %18 to i32
  %20 = lshr i64 %18, 32
  %21 = trunc i64 %20 to i32
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.143", %"struct.Eigen::TensorEvaluator.143"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %23 = load double*, double** %22, align 8
  %24 = sdiv i32 %size, 2
  %25 = shl nsw i32 %24, 1
  %26 = shl i32 %7, 1
  %27 = shl nsw i32 %5, 1
  %28 = icmp slt i32 %27, %25
  br i1 %28, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %29 = add nsw i32 %5, %25
  %30 = icmp slt i32 %29, %size
  br i1 %30, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %64, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %27, %.lr.ph5.i.preheader ]
  %31 = sdiv i32 %i.03.i, %11
  %32 = srem i32 %31, %19
  %33 = mul nsw i32 %32, %13
  %34 = mul nsw i32 %31, %11
  %35 = sub nsw i32 %i.03.i, %34
  %36 = srem i32 %35, %21
  %37 = add nsw i32 %36, %33
  %38 = add nsw i32 %36, 2
  %39 = icmp sgt i32 %38, %21
  %40 = sext i32 %37 to i64
  %41 = getelementptr inbounds double, double* %15, i64 %40
  br i1 %39, label %44, label %42

; <label>:42                                      ; preds = %.lr.ph5.i
  %43 = getelementptr inbounds double, double* %41, i64 1
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:44                                      ; preds = %.lr.ph5.i
  %45 = or i32 %i.03.i, 1
  %46 = sdiv i32 %45, %11
  %47 = srem i32 %46, %19
  %48 = mul nsw i32 %47, %13
  %49 = mul nsw i32 %46, %11
  %50 = sub nsw i32 %45, %49
  %51 = srem i32 %50, %21
  %52 = add nsw i32 %51, %48
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double* %15, i64 %53
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %44, %42
  %.sroa.3.0.in.i.i.i.i.i = phi double* [ %43, %42 ], [ %54, %44 ]
  %.sroa.3.0.i.i.i.i.i = load double, double* %.sroa.3.0.in.i.i.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i.i.i.i = load double, double* %41, align 8, !tbaa !514
  %55 = sext i32 %i.03.i to i64
  %56 = getelementptr inbounds double, double* %23, i64 %55
  %57 = load double, double* %56, align 8, !tbaa !514
  %58 = getelementptr inbounds double, double* %56, i64 1
  %59 = load double, double* %58, align 8, !tbaa !514
  %60 = fadd double %.sroa.0.0.i.i.i.i.i, %57
  %61 = fadd double %.sroa.3.0.i.i.i.i.i, %59
  %62 = getelementptr inbounds double, double* %9, i64 %55
  store double %60, double* %62, align 16
  %63 = getelementptr inbounds double, double* %62, i64 1
  store double %61, double* %63, align 8
  %64 = add nsw i32 %i.03.i, %26
  %65 = icmp slt i32 %64, %25
  br i1 %65, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %79, %.lr.ph.i ], [ %29, %.lr.ph.i.preheader ]
  %66 = sdiv i32 %i1.02.i, %11
  %67 = srem i32 %66, %19
  %68 = mul nsw i32 %67, %13
  %69 = mul nsw i32 %66, %11
  %70 = sub nsw i32 %i1.02.i, %69
  %71 = srem i32 %70, %21
  %72 = add nsw i32 %71, %68
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double* %15, i64 %73
  %.val.i.i.i.i.i.i = load double, double* %74, align 8, !tbaa !514
  %75 = sext i32 %i1.02.i to i64
  %76 = getelementptr inbounds double, double* %23, i64 %75
  %.val.i.i.i.i = load double, double* %76, align 8, !tbaa !514
  %77 = fadd double %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %78 = getelementptr inbounds double, double* %9, i64 %75
  store double %77, double* %78, align 8, !tbaa !514
  %79 = add nsw i32 %i1.02.i, %7
  %80 = icmp slt i32 %79, %size
  br i1 %80, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.145"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.145", %"struct.Eigen::TensorEvaluator.145"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.145", %"struct.Eigen::TensorEvaluator.145"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.145", %"struct.Eigen::TensorEvaluator.145"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.145", %"struct.Eigen::TensorEvaluator.145"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %15 = load double*, double** %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.145", %"struct.Eigen::TensorEvaluator.145"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %17 = bitcast i32* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = trunc i64 %18 to i32
  %20 = lshr i64 %18, 32
  %21 = trunc i64 %20 to i32
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.145", %"struct.Eigen::TensorEvaluator.145"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %23 = load i32, i32* %22, align 8
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.145", %"struct.Eigen::TensorEvaluator.145"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %25 = load i32, i32* %24, align 8
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.145", %"struct.Eigen::TensorEvaluator.145"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %27 = load double*, double** %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.145", %"struct.Eigen::TensorEvaluator.145"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %29 = bitcast i32* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = trunc i64 %30 to i32
  %32 = lshr i64 %30, 32
  %33 = trunc i64 %32 to i32
  %34 = sdiv i32 %size, 2
  %35 = shl nsw i32 %34, 1
  %36 = shl i32 %7, 1
  %37 = shl nsw i32 %5, 1
  %38 = icmp slt i32 %37, %35
  br i1 %38, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %39 = add nsw i32 %5, %35
  %40 = icmp slt i32 %39, %size
  br i1 %40, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %94, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %37, %.lr.ph5.i.preheader ]
  %41 = sdiv i32 %i.03.i, %11
  %42 = srem i32 %41, %19
  %43 = mul nsw i32 %42, %13
  %44 = mul nsw i32 %41, %11
  %45 = sub nsw i32 %i.03.i, %44
  %46 = srem i32 %45, %21
  %47 = add nsw i32 %46, %43
  %48 = add nsw i32 %46, 2
  %49 = icmp sgt i32 %48, %21
  %50 = sext i32 %47 to i64
  %51 = getelementptr inbounds double, double* %15, i64 %50
  br i1 %49, label %54, label %52

; <label>:52                                      ; preds = %.lr.ph5.i
  %53 = getelementptr inbounds double, double* %51, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKdLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit.i.i.i

; <label>:54                                      ; preds = %.lr.ph5.i
  %55 = or i32 %i.03.i, 1
  %56 = sdiv i32 %55, %11
  %57 = srem i32 %56, %19
  %58 = mul nsw i32 %57, %13
  %59 = mul nsw i32 %56, %11
  %60 = sub nsw i32 %55, %59
  %61 = srem i32 %60, %21
  %62 = add nsw i32 %61, %58
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds double, double* %15, i64 %63
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKdLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit.i.i.i

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKdLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit.i.i.i: ; preds = %54, %52
  %.sroa.3.0.in.i.i.i.i.i = phi double* [ %53, %52 ], [ %64, %54 ]
  %.sroa.3.0.i.i.i.i.i = load double, double* %.sroa.3.0.in.i.i.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i.i.i.i = load double, double* %51, align 8, !tbaa !514
  %65 = sdiv i32 %i.03.i, %23
  %66 = srem i32 %65, %31
  %67 = mul nsw i32 %66, %25
  %68 = mul nsw i32 %65, %23
  %69 = sub nsw i32 %i.03.i, %68
  %70 = srem i32 %69, %33
  %71 = add nsw i32 %70, %67
  %72 = add nsw i32 %70, 2
  %73 = icmp sgt i32 %72, %33
  %74 = sext i32 %71 to i64
  %75 = getelementptr inbounds double, double* %27, i64 %74
  br i1 %73, label %78, label %76

; <label>:76                                      ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKdLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit.i.i.i
  %77 = getelementptr inbounds double, double* %75, i64 1
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:78                                      ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKdLi2ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit.i.i.i
  %79 = or i32 %i.03.i, 1
  %80 = sdiv i32 %79, %23
  %81 = srem i32 %80, %31
  %82 = mul nsw i32 %81, %25
  %83 = mul nsw i32 %80, %23
  %84 = sub nsw i32 %79, %83
  %85 = srem i32 %84, %33
  %86 = add nsw i32 %85, %82
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double* %27, i64 %87
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS2_INS3_IKdLi2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %78, %76
  %.sroa.3.0.in.i.i1.i.i.i = phi double* [ %77, %76 ], [ %88, %78 ]
  %.sroa.3.0.i.i2.i.i.i = load double, double* %.sroa.3.0.in.i.i1.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i3.i.i.i = load double, double* %75, align 8, !tbaa !514
  %89 = fadd double %.sroa.0.0.i.i.i.i.i, %.sroa.0.0.i.i3.i.i.i
  %90 = fadd double %.sroa.3.0.i.i.i.i.i, %.sroa.3.0.i.i2.i.i.i
  %91 = sext i32 %i.03.i to i64
  %92 = getelementptr inbounds double, double* %9, i64 %91
  store double %89, double* %92, align 16
  %93 = getelementptr inbounds double, double* %92, i64 1
  store double %90, double* %93, align 8
  %94 = add nsw i32 %i.03.i, %36
  %95 = icmp slt i32 %94, %35
  br i1 %95, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %117, %.lr.ph.i ], [ %39, %.lr.ph.i.preheader ]
  %96 = sdiv i32 %i1.02.i, %11
  %97 = srem i32 %96, %19
  %98 = mul nsw i32 %97, %13
  %99 = mul nsw i32 %96, %11
  %100 = sub nsw i32 %i1.02.i, %99
  %101 = srem i32 %100, %21
  %102 = add nsw i32 %101, %98
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, double* %15, i64 %103
  %.val.i.i.i.i.i.i = load double, double* %104, align 8, !tbaa !514
  %105 = sdiv i32 %i1.02.i, %23
  %106 = srem i32 %105, %31
  %107 = mul nsw i32 %106, %25
  %108 = mul nsw i32 %105, %23
  %109 = sub nsw i32 %i1.02.i, %108
  %110 = srem i32 %109, %33
  %111 = add nsw i32 %110, %107
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, double* %27, i64 %112
  %.val.i.i.i1.i.i.i = load double, double* %113, align 8, !tbaa !514
  %114 = fadd double %.val.i.i.i.i.i.i, %.val.i.i.i1.i.i.i
  %115 = sext i32 %i1.02.i to i64
  %116 = getelementptr inbounds double, double* %9, i64 %115
  store double %114, double* %116, align 8, !tbaa !514
  %117 = add nsw i32 %i1.02.i, %7
  %118 = icmp slt i32 %117, %size
  br i1 %118, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.147"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.147", %"struct.Eigen::TensorEvaluator.147"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.147", %"struct.Eigen::TensorEvaluator.147"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load double*, double** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.147", %"struct.Eigen::TensorEvaluator.147"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.147", %"struct.Eigen::TensorEvaluator.147"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %15 = load i32, i32* %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.147", %"struct.Eigen::TensorEvaluator.147"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %17 = bitcast i32* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = trunc i64 %18 to i32
  %20 = lshr i64 %18, 32
  %21 = trunc i64 %20 to i32
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.147", %"struct.Eigen::TensorEvaluator.147"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %23 = load double*, double** %22, align 8
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.147", %"struct.Eigen::TensorEvaluator.147"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %25 = bitcast i32* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = trunc i64 %26 to i32
  %28 = lshr i64 %26, 32
  %29 = trunc i64 %28 to i32
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.147", %"struct.Eigen::TensorEvaluator.147"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %31 = load i32, i32* %30, align 8
  %32 = sdiv i32 %size, 2
  %33 = shl nsw i32 %32, 1
  %34 = shl i32 %7, 1
  %35 = shl nsw i32 %5, 1
  %36 = icmp slt i32 %35, %33
  br i1 %36, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %37 = add nsw i32 %5, %33
  %38 = icmp slt i32 %37, %size
  br i1 %38, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %84, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %35, %.lr.ph5.i.preheader ]
  %39 = sext i32 %i.03.i to i64
  %40 = getelementptr inbounds double, double* %11, i64 %39
  %41 = load double, double* %40, align 8, !tbaa !514
  %42 = getelementptr inbounds double, double* %40, i64 1
  %43 = load double, double* %42, align 8, !tbaa !514
  %44 = sdiv i32 %i.03.i, %13
  %45 = srem i32 %44, %27
  %46 = mul nsw i32 %45, %19
  %47 = mul nsw i32 %44, %13
  %48 = sub nsw i32 %i.03.i, %47
  %49 = sdiv i32 %48, %15
  %50 = srem i32 %49, %29
  %51 = mul nsw i32 %50, %21
  %52 = add nsw i32 %51, %46
  %53 = mul nsw i32 %49, %15
  %54 = sub nsw i32 %48, %53
  %55 = srem i32 %54, %31
  %56 = add nsw i32 %52, %55
  %57 = add nsw i32 %55, 2
  %58 = icmp sgt i32 %57, %31
  %59 = sext i32 %56 to i64
  %60 = getelementptr inbounds double, double* %23, i64 %59
  br i1 %58, label %63, label %61

; <label>:61                                      ; preds = %.lr.ph5.i
  %62 = getelementptr inbounds double, double* %60, i64 1
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:63                                      ; preds = %.lr.ph5.i
  %64 = or i32 %i.03.i, 1
  %65 = sdiv i32 %64, %13
  %66 = srem i32 %65, %27
  %67 = mul nsw i32 %66, %19
  %68 = mul nsw i32 %65, %13
  %69 = sub nsw i32 %64, %68
  %70 = sdiv i32 %69, %15
  %71 = srem i32 %70, %29
  %72 = mul nsw i32 %71, %21
  %73 = add nsw i32 %72, %67
  %74 = mul nsw i32 %70, %15
  %75 = sub nsw i32 %69, %74
  %76 = srem i32 %75, %31
  %77 = add nsw i32 %73, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double* %23, i64 %78
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESD_EEEEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %63, %61
  %.sroa.3.0.in.i.i.i.i.i = phi double* [ %62, %61 ], [ %79, %63 ]
  %.sroa.3.0.i.i.i.i.i = load double, double* %.sroa.3.0.in.i.i.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i.i.i.i = load double, double* %60, align 8, !tbaa !514
  %80 = fadd double %41, %.sroa.0.0.i.i.i.i.i
  %81 = fadd double %43, %.sroa.3.0.i.i.i.i.i
  %82 = getelementptr inbounds double, double* %9, i64 %39
  store double %80, double* %82, align 16
  %83 = getelementptr inbounds double, double* %82, i64 1
  store double %81, double* %83, align 8
  %84 = add nsw i32 %i.03.i, %34
  %85 = icmp slt i32 %84, %33
  br i1 %85, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %105, %.lr.ph.i ], [ %37, %.lr.ph.i.preheader ]
  %86 = sext i32 %i1.02.i to i64
  %87 = getelementptr inbounds double, double* %11, i64 %86
  %.val.i.i.i.i = load double, double* %87, align 8, !tbaa !514
  %88 = sdiv i32 %i1.02.i, %13
  %89 = srem i32 %88, %27
  %90 = mul nsw i32 %89, %19
  %91 = mul nsw i32 %88, %13
  %92 = sub nsw i32 %i1.02.i, %91
  %93 = sdiv i32 %92, %15
  %94 = srem i32 %93, %29
  %95 = mul nsw i32 %94, %21
  %96 = add nsw i32 %95, %90
  %97 = mul nsw i32 %93, %15
  %98 = sub nsw i32 %92, %97
  %99 = srem i32 %98, %31
  %100 = add nsw i32 %96, %99
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds double, double* %23, i64 %101
  %.val.i.i.i.i.i.i = load double, double* %102, align 8, !tbaa !514
  %103 = fadd double %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %104 = getelementptr inbounds double, double* %9, i64 %86
  store double %103, double* %104, align 8, !tbaa !514
  %105 = add nsw i32 %i1.02.i, %7
  %106 = icmp slt i32 %105, %size
  br i1 %106, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.152"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.152", %"struct.Eigen::TensorEvaluator.152"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.152", %"struct.Eigen::TensorEvaluator.152"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.152", %"struct.Eigen::TensorEvaluator.152"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.152", %"struct.Eigen::TensorEvaluator.152"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %15 = bitcast i32* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = trunc i64 %16 to i32
  %18 = lshr i64 %16, 32
  %19 = trunc i64 %18 to i32
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.152", %"struct.Eigen::TensorEvaluator.152"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %21 = load double*, double** %20, align 8
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.152", %"struct.Eigen::TensorEvaluator.152"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %23 = bitcast i32* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = trunc i64 %24 to i32
  %26 = lshr i64 %24, 32
  %27 = trunc i64 %26 to i32
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.152", %"struct.Eigen::TensorEvaluator.152"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %29 = load i32, i32* %28, align 8
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.152", %"struct.Eigen::TensorEvaluator.152"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %31 = load double*, double** %30, align 8
  %32 = sdiv i32 %size, 2
  %33 = shl nsw i32 %32, 1
  %34 = shl i32 %7, 1
  %35 = shl nsw i32 %5, 1
  %36 = icmp slt i32 %35, %33
  br i1 %36, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %37 = add nsw i32 %5, %33
  %38 = icmp slt i32 %37, %size
  br i1 %38, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i
  %i.03.i = phi i32 [ %84, %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i ], [ %35, %.lr.ph5.i.preheader ]
  %39 = sdiv i32 %i.03.i, %11
  %40 = srem i32 %39, %25
  %41 = mul nsw i32 %40, %17
  %42 = mul nsw i32 %39, %11
  %43 = sub nsw i32 %i.03.i, %42
  %44 = sdiv i32 %43, %13
  %45 = srem i32 %44, %27
  %46 = mul nsw i32 %45, %19
  %47 = add nsw i32 %46, %41
  %48 = mul nsw i32 %44, %13
  %49 = sub nsw i32 %43, %48
  %50 = srem i32 %49, %29
  %51 = add nsw i32 %47, %50
  %52 = add nsw i32 %50, 2
  %53 = icmp sgt i32 %52, %29
  %54 = sext i32 %51 to i64
  %55 = getelementptr inbounds double, double* %21, i64 %54
  br i1 %53, label %58, label %56

; <label>:56                                      ; preds = %.lr.ph5.i
  %57 = getelementptr inbounds double, double* %55, i64 1
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

; <label>:58                                      ; preds = %.lr.ph5.i
  %59 = or i32 %i.03.i, 1
  %60 = sdiv i32 %59, %11
  %61 = srem i32 %60, %25
  %62 = mul nsw i32 %61, %17
  %63 = mul nsw i32 %60, %11
  %64 = sub nsw i32 %59, %63
  %65 = sdiv i32 %64, %13
  %66 = srem i32 %65, %27
  %67 = mul nsw i32 %66, %19
  %68 = add nsw i32 %67, %62
  %69 = mul nsw i32 %65, %13
  %70 = sub nsw i32 %64, %69
  %71 = srem i32 %70, %29
  %72 = add nsw i32 %68, %71
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double* %21, i64 %73
  br label %_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i

_ZN5Eigen15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS2_INS3_IKdLi3ELi1EiEELi16EEEEESH_EEEENS_9GpuDeviceEE10evalPacketEi.exit.i: ; preds = %58, %56
  %.sroa.3.0.in.i.i.i.i.i = phi double* [ %57, %56 ], [ %74, %58 ]
  %.sroa.3.0.i.i.i.i.i = load double, double* %.sroa.3.0.in.i.i.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i.i.i.i = load double, double* %55, align 8, !tbaa !514
  %75 = sext i32 %i.03.i to i64
  %76 = getelementptr inbounds double, double* %31, i64 %75
  %77 = load double, double* %76, align 8, !tbaa !514
  %78 = getelementptr inbounds double, double* %76, i64 1
  %79 = load double, double* %78, align 8, !tbaa !514
  %80 = fadd double %.sroa.0.0.i.i.i.i.i, %77
  %81 = fadd double %.sroa.3.0.i.i.i.i.i, %79
  %82 = getelementptr inbounds double, double* %9, i64 %75
  store double %80, double* %82, align 16
  %83 = getelementptr inbounds double, double* %82, i64 1
  store double %81, double* %83, align 8
  %84 = add nsw i32 %i.03.i, %34
  %85 = icmp slt i32 %84, %33
  br i1 %85, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %105, %.lr.ph.i ], [ %37, %.lr.ph.i.preheader ]
  %86 = sdiv i32 %i1.02.i, %11
  %87 = srem i32 %86, %25
  %88 = mul nsw i32 %87, %17
  %89 = mul nsw i32 %86, %11
  %90 = sub nsw i32 %i1.02.i, %89
  %91 = sdiv i32 %90, %13
  %92 = srem i32 %91, %27
  %93 = mul nsw i32 %92, %19
  %94 = add nsw i32 %93, %88
  %95 = mul nsw i32 %91, %13
  %96 = sub nsw i32 %90, %95
  %97 = srem i32 %96, %29
  %98 = add nsw i32 %94, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double* %21, i64 %99
  %.val.i.i.i.i.i.i = load double, double* %100, align 8, !tbaa !514
  %101 = sext i32 %i1.02.i to i64
  %102 = getelementptr inbounds double, double* %31, i64 %101
  %.val.i.i.i.i = load double, double* %102, align 8, !tbaa !514
  %103 = fadd double %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %104 = getelementptr inbounds double, double* %9, i64 %101
  store double %103, double* %104, align 8, !tbaa !514
  %105 = add nsw i32 %i1.02.i, %7
  %106 = icmp slt i32 %105, %size
  br i1 %106, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.154"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.154", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.154"* %eval to i8*
  call void @llvm.lifetime.start(i64 184, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.154"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 32, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.151"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.151"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 144, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 2
  %15 = shl nsw i32 %14, 1
  %16 = shl i32 %7, 1
  %17 = shl nsw i32 %5, 1
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 0, i32 0
  br label %65

._crit_edge6.i.loopexit:                          ; preds = %65
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %15
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %24 = load i32, i32* %23, align 4
  %25 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %26 = bitcast i32* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = trunc i64 %27 to i32
  %29 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %30 = bitcast i32* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = trunc i64 %31 to i32
  %33 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %34 = load i32, i32* %33, align 4
  %35 = lshr i64 %27, 32
  %36 = trunc i64 %35 to i32
  %37 = lshr i64 %31, 32
  %38 = trunc i64 %37 to i32
  %39 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %40 = load i32, i32* %39, align 8
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %42 = load double*, double** %41, align 8
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %44 = load i32, i32* %43, align 4
  %45 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %46 = bitcast i32* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = trunc i64 %47 to i32
  %49 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %50 = bitcast i32* %49 to i64*
  %51 = load i64, i64* %50, align 8
  %52 = trunc i64 %51 to i32
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %54 = load i32, i32* %53, align 4
  %55 = lshr i64 %47, 32
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %51, 32
  %58 = trunc i64 %57 to i32
  %59 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %60 = load i32, i32* %59, align 8
  %61 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %62 = load double*, double** %61, align 8
  %63 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.154", %"struct.Eigen::TensorEvaluator.154"* %eval, i64 0, i32 0, i32 0
  %64 = load double*, double** %63, align 8
  br label %75

; <label>:65                                      ; preds = %65, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %73, %65 ]
  %66 = call %struct.double2.124 @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE7double2i(%"struct.Eigen::TensorEvaluator.155"* %19, i32 %i.03.i) #6
  %67 = extractvalue %struct.double2.124 %66, 0
  %68 = extractvalue %struct.double2.124 %66, 1
  %69 = load double*, double** %20, align 8, !tbaa !520
  %70 = sext i32 %i.03.i to i64
  %71 = getelementptr inbounds double, double* %69, i64 %70
  store double %67, double* %71, align 16
  %72 = getelementptr inbounds double, double* %71, i64 1
  store double %68, double* %72, align 8
  %73 = add nsw i32 %i.03.i, %16
  %74 = icmp slt i32 %73, %15
  br i1 %74, label %65, label %._crit_edge6.i.loopexit

; <label>:75                                      ; preds = %75, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %109, %75 ]
  %76 = sdiv i32 %i1.02.i, %24
  %77 = srem i32 %76, %28
  %78 = mul nsw i32 %77, %32
  %79 = mul nsw i32 %76, %24
  %80 = sub nsw i32 %i1.02.i, %79
  %81 = sdiv i32 %80, %34
  %82 = srem i32 %81, %36
  %83 = mul nsw i32 %82, %38
  %84 = add nsw i32 %83, %78
  %85 = mul nsw i32 %81, %34
  %86 = sub nsw i32 %80, %85
  %87 = srem i32 %86, %40
  %88 = add nsw i32 %84, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds double, double* %42, i64 %89
  %.val.i.i.i.i.i.i = load double, double* %90, align 8, !tbaa !514
  %91 = sdiv i32 %i1.02.i, %44
  %92 = srem i32 %91, %48
  %93 = mul nsw i32 %92, %52
  %94 = mul nsw i32 %91, %44
  %95 = sub nsw i32 %i1.02.i, %94
  %96 = sdiv i32 %95, %54
  %97 = srem i32 %96, %56
  %98 = mul nsw i32 %97, %58
  %99 = add nsw i32 %98, %93
  %100 = mul nsw i32 %96, %54
  %101 = sub nsw i32 %95, %100
  %102 = srem i32 %101, %60
  %103 = add nsw i32 %99, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double* %62, i64 %104
  %.val.i.i.i1.i.i.i = load double, double* %105, align 8, !tbaa !514
  %106 = fadd double %.val.i.i.i.i.i.i, %.val.i.i.i1.i.i.i
  %107 = sext i32 %i1.02.i to i64
  %108 = getelementptr inbounds double, double* %64, i64 %107
  store double %106, double* %108, align 8, !tbaa !514
  %109 = add nsw i32 %i1.02.i, %7
  %110 = icmp slt i32 %109, %size
  br i1 %110, label %75, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %75
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 184, i8* %8) #6
  ret void
}

; Function Attrs: inlinehint norecurse nounwind readonly
define linkonce_odr %struct.double2.124 @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE7double2i(%"struct.Eigen::TensorEvaluator.155"* nocapture readonly %this, i32 %index) #5 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 1, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 1, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 1, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178
  %14 = sdiv i32 %11, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178
  %17 = srem i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 1, i32 2, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %9
  %22 = mul nsw i32 %14, %13
  %23 = sub nsw i32 %11, %22
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !178
  %26 = srem i32 %23, %25
  %27 = add nsw i32 %21, %26
  %28 = add nsw i32 %26, 2
  %29 = icmp sgt i32 %28, %25
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 1, i32 3, i32 0
  %31 = load double*, double** %30, align 8
  %32 = sext i32 %27 to i64
  %33 = getelementptr inbounds double, double* %31, i64 %32
  br i1 %29, label %36, label %34

; <label>:34                                      ; preds = %0
  %35 = getelementptr inbounds double, double* %33, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit

; <label>:36                                      ; preds = %0
  %37 = add nsw i32 %index, 1
  %38 = sdiv i32 %37, %2
  %39 = srem i32 %38, %5
  %40 = mul nsw i32 %39, %8
  %41 = mul nsw i32 %38, %2
  %42 = sub nsw i32 %37, %41
  %43 = sdiv i32 %42, %13
  %44 = srem i32 %43, %16
  %45 = mul nsw i32 %44, %19
  %46 = add nsw i32 %45, %40
  %47 = mul nsw i32 %43, %13
  %48 = sub nsw i32 %42, %47
  %49 = srem i32 %48, %25
  %50 = add nsw i32 %46, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double* %31, i64 %51
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit: ; preds = %34, %36
  %.sroa.3.0.in.i.i = phi double* [ %35, %34 ], [ %52, %36 ]
  %.sroa.3.0.i.i = load double, double* %.sroa.3.0.in.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i = load double, double* %33, align 8, !tbaa !514
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %54 = load i32, i32* %53, align 4, !tbaa !178
  %55 = sdiv i32 %index, %54
  %56 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %57 = load i32, i32* %56, align 4, !tbaa !178
  %58 = srem i32 %55, %57
  %59 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %60 = load i32, i32* %59, align 4, !tbaa !178
  %61 = mul nsw i32 %60, %58
  %62 = mul nsw i32 %55, %54
  %63 = sub nsw i32 %index, %62
  %64 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 2, i32 1, i32 0, i64 1
  %65 = load i32, i32* %64, align 4, !tbaa !178
  %66 = sdiv i32 %63, %65
  %67 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %68 = load i32, i32* %67, align 4, !tbaa !178
  %69 = srem i32 %66, %68
  %70 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 2, i32 2, i32 0, i64 1
  %71 = load i32, i32* %70, align 4, !tbaa !178
  %72 = mul nsw i32 %71, %69
  %73 = add nsw i32 %72, %61
  %74 = mul nsw i32 %66, %65
  %75 = sub nsw i32 %63, %74
  %76 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %77 = load i32, i32* %76, align 4, !tbaa !178
  %78 = srem i32 %75, %77
  %79 = add nsw i32 %73, %78
  %80 = add nsw i32 %78, 2
  %81 = icmp sgt i32 %80, %77
  %82 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.155", %"struct.Eigen::TensorEvaluator.155"* %this, i64 0, i32 2, i32 3, i32 0
  %83 = load double*, double** %82, align 8
  %84 = sext i32 %79 to i64
  %85 = getelementptr inbounds double, double* %83, i64 %84
  br i1 %81, label %88, label %86

; <label>:86                                      ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit
  %87 = getelementptr inbounds double, double* %85, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit4

; <label>:88                                      ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit
  %89 = add nsw i32 %index, 1
  %90 = sdiv i32 %89, %54
  %91 = srem i32 %90, %57
  %92 = mul nsw i32 %91, %60
  %93 = mul nsw i32 %90, %54
  %94 = sub nsw i32 %89, %93
  %95 = sdiv i32 %94, %65
  %96 = srem i32 %95, %68
  %97 = mul nsw i32 %96, %71
  %98 = add nsw i32 %97, %92
  %99 = mul nsw i32 %95, %65
  %100 = sub nsw i32 %94, %99
  %101 = srem i32 %100, %77
  %102 = add nsw i32 %98, %101
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, double* %83, i64 %103
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit4

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKdLi3ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit4: ; preds = %86, %88
  %.sroa.3.0.in.i.i1 = phi double* [ %87, %86 ], [ %104, %88 ]
  %.sroa.3.0.i.i2 = load double, double* %.sroa.3.0.in.i.i1, align 8, !tbaa !514
  %.sroa.0.0.i.i3 = load double, double* %85, align 8, !tbaa !514
  %105 = fadd double %.sroa.0.0.i.i, %.sroa.0.0.i.i3
  %106 = fadd double %.sroa.3.0.i.i, %.sroa.3.0.i.i2
  %oldret.i.i = insertvalue %struct.double2.124 undef, double %105, 0
  %oldret2.i.i = insertvalue %struct.double2.124 %oldret.i.i, double %106, 1
  ret %struct.double2.124 %oldret2.i.i
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.156"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.156", %"struct.Eigen::TensorEvaluator.156"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.156", %"struct.Eigen::TensorEvaluator.156"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load double*, double** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.156", %"struct.Eigen::TensorEvaluator.156"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %13 = bitcast i32* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = trunc i64 %14 to i32
  %16 = lshr i64 %14, 32
  %17 = trunc i64 %16 to i32
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.156", %"struct.Eigen::TensorEvaluator.156"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 2
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.156", %"struct.Eigen::TensorEvaluator.156"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %21 = bitcast i32* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = trunc i64 %22 to i32
  %24 = lshr i64 %22, 32
  %25 = trunc i64 %24 to i32
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.156", %"struct.Eigen::TensorEvaluator.156"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %27 = load i32, i32* %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.156", %"struct.Eigen::TensorEvaluator.156"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %29 = load double*, double** %28, align 8
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.156", %"struct.Eigen::TensorEvaluator.156"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %31 = bitcast i32* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = trunc i64 %32 to i32
  %34 = lshr i64 %32, 32
  %35 = trunc i64 %34 to i32
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.156", %"struct.Eigen::TensorEvaluator.156"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %37 = bitcast i32* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %38, 32
  %41 = trunc i64 %40 to i32
  %42 = sdiv i32 %size, 2
  %43 = shl nsw i32 %42, 1
  %44 = shl i32 %7, 1
  %45 = shl nsw i32 %5, 1
  %46 = icmp slt i32 %45, %43
  br i1 %46, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESA_EEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %47 = add nsw i32 %5, %43
  %48 = icmp slt i32 %47, %size
  br i1 %48, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESA_EEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit
  %i.03.i = phi i32 [ %106, %_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESA_EEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit ], [ %45, %.lr.ph5.i.preheader ]
  %49 = sext i32 %i.03.i to i64
  %50 = getelementptr inbounds double, double* %11, i64 %49
  %51 = load double, double* %50, align 8, !tbaa !514
  %52 = getelementptr inbounds double, double* %50, i64 1
  %53 = load double, double* %52, align 8, !tbaa !514
  %54 = sdiv i32 %i.03.i, %15
  %55 = srem i32 %54, %33
  %56 = mul nsw i32 %55, %23
  %57 = mul nsw i32 %54, %15
  %58 = sub nsw i32 %i.03.i, %57
  %59 = sdiv i32 %58, %17
  %60 = srem i32 %59, %35
  %61 = mul nsw i32 %60, %25
  %62 = add nsw i32 %61, %56
  %63 = mul nsw i32 %59, %17
  %64 = sub nsw i32 %58, %63
  %65 = sdiv i32 %64, %19
  %66 = srem i32 %65, %39
  %67 = mul nsw i32 %66, %27
  %68 = add nsw i32 %62, %67
  %69 = mul nsw i32 %65, %19
  %70 = sub nsw i32 %64, %69
  %71 = srem i32 %70, %41
  %72 = add nsw i32 %68, %71
  %73 = add nsw i32 %71, 2
  %74 = icmp sgt i32 %73, %41
  %75 = sext i32 %72 to i64
  %76 = getelementptr inbounds double, double* %29, i64 %75
  br i1 %74, label %79, label %77

; <label>:77                                      ; preds = %.lr.ph5.i
  %78 = getelementptr inbounds double, double* %76, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESA_EEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit

; <label>:79                                      ; preds = %.lr.ph5.i
  %80 = or i32 %i.03.i, 1
  %81 = sdiv i32 %80, %15
  %82 = srem i32 %81, %33
  %83 = mul nsw i32 %82, %23
  %84 = mul nsw i32 %81, %15
  %85 = sub nsw i32 %80, %84
  %86 = sdiv i32 %85, %17
  %87 = srem i32 %86, %35
  %88 = mul nsw i32 %87, %25
  %89 = add nsw i32 %88, %83
  %90 = mul nsw i32 %86, %17
  %91 = sub nsw i32 %85, %90
  %92 = sdiv i32 %91, %19
  %93 = srem i32 %92, %39
  %94 = mul nsw i32 %93, %27
  %95 = add nsw i32 %89, %94
  %96 = mul nsw i32 %92, %19
  %97 = sub nsw i32 %91, %96
  %98 = srem i32 %97, %41
  %99 = add nsw i32 %95, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double* %29, i64 %100
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESA_EEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit

_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESA_EEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit: ; preds = %77, %79
  %.sroa.3.0.in.i.i.i = phi double* [ %78, %77 ], [ %101, %79 ]
  %.sroa.3.0.i.i.i = load double, double* %.sroa.3.0.in.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i.i = load double, double* %76, align 8, !tbaa !514
  %102 = fadd double %51, %.sroa.0.0.i.i.i
  %103 = fadd double %53, %.sroa.3.0.i.i.i
  %104 = getelementptr inbounds double, double* %9, i64 %49
  store double %102, double* %104, align 16
  %105 = getelementptr inbounds double, double* %104, i64 1
  store double %103, double* %105, align 8
  %106 = add nsw i32 %i.03.i, %44
  %107 = icmp slt i32 %106, %43
  br i1 %107, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %133, %.lr.ph.i ], [ %47, %.lr.ph.i.preheader ]
  %108 = sext i32 %i1.02.i to i64
  %109 = getelementptr inbounds double, double* %11, i64 %108
  %.val.i.i.i.i = load double, double* %109, align 8, !tbaa !514
  %110 = sdiv i32 %i1.02.i, %15
  %111 = srem i32 %110, %33
  %112 = mul nsw i32 %111, %23
  %113 = mul nsw i32 %110, %15
  %114 = sub nsw i32 %i1.02.i, %113
  %115 = sdiv i32 %114, %17
  %116 = srem i32 %115, %35
  %117 = mul nsw i32 %116, %25
  %118 = add nsw i32 %117, %112
  %119 = mul nsw i32 %115, %17
  %120 = sub nsw i32 %114, %119
  %121 = sdiv i32 %120, %19
  %122 = srem i32 %121, %39
  %123 = mul nsw i32 %122, %27
  %124 = add nsw i32 %118, %123
  %125 = mul nsw i32 %121, %19
  %126 = sub nsw i32 %120, %125
  %127 = srem i32 %126, %41
  %128 = add nsw i32 %124, %127
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds double, double* %29, i64 %129
  %.val.i.i.i.i.i.i = load double, double* %130, align 8, !tbaa !514
  %131 = fadd double %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %132 = getelementptr inbounds double, double* %9, i64 %108
  store double %131, double* %132, align 8, !tbaa !514
  %133 = add nsw i32 %i1.02.i, %7
  %134 = icmp slt i32 %133, %size
  br i1 %134, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.161"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.161", %"struct.Eigen::TensorEvaluator.161"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.161", %"struct.Eigen::TensorEvaluator.161"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = bitcast i32* %10 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = trunc i64 %12 to i32
  %14 = lshr i64 %12, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.161", %"struct.Eigen::TensorEvaluator.161"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 2
  %17 = load i32, i32* %16, align 8
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.161", %"struct.Eigen::TensorEvaluator.161"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %19 = bitcast i32* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = trunc i64 %20 to i32
  %22 = lshr i64 %20, 32
  %23 = trunc i64 %22 to i32
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.161", %"struct.Eigen::TensorEvaluator.161"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %25 = load i32, i32* %24, align 8
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.161", %"struct.Eigen::TensorEvaluator.161"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %27 = load double*, double** %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.161", %"struct.Eigen::TensorEvaluator.161"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %29 = bitcast i32* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = trunc i64 %30 to i32
  %32 = lshr i64 %30, 32
  %33 = trunc i64 %32 to i32
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.161", %"struct.Eigen::TensorEvaluator.161"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %35 = bitcast i32* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = trunc i64 %36 to i32
  %38 = lshr i64 %36, 32
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.161", %"struct.Eigen::TensorEvaluator.161"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %41 = load double*, double** %40, align 8
  %42 = sdiv i32 %size, 2
  %43 = shl nsw i32 %42, 1
  %44 = shl i32 %7, 1
  %45 = shl nsw i32 %5, 1
  %46 = icmp slt i32 %45, %43
  br i1 %46, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESE_EENS_9GpuDeviceEE6packetILi16EEE7double2i.exit
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %47 = add nsw i32 %5, %43
  %48 = icmp slt i32 %47, %size
  br i1 %48, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESE_EENS_9GpuDeviceEE6packetILi16EEE7double2i.exit
  %i.03.i = phi i32 [ %106, %_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESE_EENS_9GpuDeviceEE6packetILi16EEE7double2i.exit ], [ %45, %.lr.ph5.i.preheader ]
  %49 = sdiv i32 %i.03.i, %13
  %50 = srem i32 %49, %31
  %51 = mul nsw i32 %50, %21
  %52 = mul nsw i32 %49, %13
  %53 = sub nsw i32 %i.03.i, %52
  %54 = sdiv i32 %53, %15
  %55 = srem i32 %54, %33
  %56 = mul nsw i32 %55, %23
  %57 = add nsw i32 %56, %51
  %58 = mul nsw i32 %54, %15
  %59 = sub nsw i32 %53, %58
  %60 = sdiv i32 %59, %17
  %61 = srem i32 %60, %37
  %62 = mul nsw i32 %61, %25
  %63 = add nsw i32 %57, %62
  %64 = mul nsw i32 %60, %17
  %65 = sub nsw i32 %59, %64
  %66 = srem i32 %65, %39
  %67 = add nsw i32 %63, %66
  %68 = add nsw i32 %66, 2
  %69 = icmp sgt i32 %68, %39
  %70 = sext i32 %67 to i64
  %71 = getelementptr inbounds double, double* %27, i64 %70
  br i1 %69, label %74, label %72

; <label>:72                                      ; preds = %.lr.ph5.i
  %73 = getelementptr inbounds double, double* %71, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESE_EENS_9GpuDeviceEE6packetILi16EEE7double2i.exit

; <label>:74                                      ; preds = %.lr.ph5.i
  %75 = or i32 %i.03.i, 1
  %76 = sdiv i32 %75, %13
  %77 = srem i32 %76, %31
  %78 = mul nsw i32 %77, %21
  %79 = mul nsw i32 %76, %13
  %80 = sub nsw i32 %75, %79
  %81 = sdiv i32 %80, %15
  %82 = srem i32 %81, %33
  %83 = mul nsw i32 %82, %23
  %84 = add nsw i32 %83, %78
  %85 = mul nsw i32 %81, %15
  %86 = sub nsw i32 %80, %85
  %87 = sdiv i32 %86, %17
  %88 = srem i32 %87, %37
  %89 = mul nsw i32 %88, %25
  %90 = add nsw i32 %84, %89
  %91 = mul nsw i32 %87, %17
  %92 = sub nsw i32 %86, %91
  %93 = srem i32 %92, %39
  %94 = add nsw i32 %90, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double* %27, i64 %95
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESE_EENS_9GpuDeviceEE6packetILi16EEE7double2i.exit

_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESE_EENS_9GpuDeviceEE6packetILi16EEE7double2i.exit: ; preds = %72, %74
  %.sroa.3.0.in.i.i.i = phi double* [ %73, %72 ], [ %96, %74 ]
  %.sroa.3.0.i.i.i = load double, double* %.sroa.3.0.in.i.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i.i = load double, double* %71, align 8, !tbaa !514
  %97 = sext i32 %i.03.i to i64
  %98 = getelementptr inbounds double, double* %41, i64 %97
  %99 = load double, double* %98, align 8, !tbaa !514
  %100 = getelementptr inbounds double, double* %98, i64 1
  %101 = load double, double* %100, align 8, !tbaa !514
  %102 = fadd double %.sroa.0.0.i.i.i, %99
  %103 = fadd double %.sroa.3.0.i.i.i, %101
  %104 = getelementptr inbounds double, double* %9, i64 %97
  store double %102, double* %104, align 16
  %105 = getelementptr inbounds double, double* %104, i64 1
  store double %103, double* %105, align 8
  %106 = add nsw i32 %i.03.i, %44
  %107 = icmp slt i32 %106, %43
  br i1 %107, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %133, %.lr.ph.i ], [ %47, %.lr.ph.i.preheader ]
  %108 = sdiv i32 %i1.02.i, %13
  %109 = srem i32 %108, %31
  %110 = mul nsw i32 %109, %21
  %111 = mul nsw i32 %108, %13
  %112 = sub nsw i32 %i1.02.i, %111
  %113 = sdiv i32 %112, %15
  %114 = srem i32 %113, %33
  %115 = mul nsw i32 %114, %23
  %116 = add nsw i32 %115, %110
  %117 = mul nsw i32 %113, %15
  %118 = sub nsw i32 %112, %117
  %119 = sdiv i32 %118, %17
  %120 = srem i32 %119, %37
  %121 = mul nsw i32 %120, %25
  %122 = add nsw i32 %116, %121
  %123 = mul nsw i32 %119, %17
  %124 = sub nsw i32 %118, %123
  %125 = srem i32 %124, %39
  %126 = add nsw i32 %122, %125
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds double, double* %27, i64 %127
  %.val.i.i.i.i.i.i = load double, double* %128, align 8, !tbaa !514
  %129 = sext i32 %i1.02.i to i64
  %130 = getelementptr inbounds double, double* %41, i64 %129
  %.val.i.i.i.i = load double, double* %130, align 8, !tbaa !514
  %131 = fadd double %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %132 = getelementptr inbounds double, double* %9, i64 %129
  store double %131, double* %132, align 8, !tbaa !514
  %133 = add nsw i32 %i1.02.i, %7
  %134 = icmp slt i32 %133, %size
  br i1 %134, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.163"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %eval = alloca %"struct.Eigen::TensorEvaluator.163", align 8
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = bitcast %"struct.Eigen::TensorEvaluator.163"* %eval to i8*
  call void @llvm.lifetime.start(i64 200, i8* %8) #6
  %9 = bitcast %"struct.Eigen::TensorEvaluator.163"* %memcopied_eval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 32, i32 8, i1 false) #6
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 1
  %11 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %memcopied_eval, i64 0, i32 1, i32 1
  %12 = bitcast %"struct.Eigen::TensorEvaluator.160"* %10 to i8*
  %13 = bitcast %"struct.Eigen::TensorEvaluator.160"* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 160, i32 8, i1 false) #6
  %14 = sdiv i32 %size, 2
  %15 = shl nsw i32 %14, 1
  %16 = shl i32 %7, 1
  %17 = shl nsw i32 %5, 1
  %18 = icmp slt i32 %17, %15
  br i1 %18, label %.lr.ph5.i, label %._crit_edge6.i

.lr.ph5.i:                                        ; preds = %0
  %19 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 0, i32 0
  br label %85

._crit_edge6.i.loopexit:                          ; preds = %85
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %21 = add nsw i32 %5, %15
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i:                                         ; preds = %._crit_edge6.i
  %23 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %24 = bitcast i32* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = trunc i64 %25 to i32
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %28 = bitcast i32* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = trunc i64 %29 to i32
  %31 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %32 = bitcast i32* %31 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = trunc i64 %33 to i32
  %35 = lshr i64 %25, 32
  %36 = trunc i64 %35 to i32
  %37 = lshr i64 %29, 32
  %38 = trunc i64 %37 to i32
  %39 = lshr i64 %33, 32
  %40 = trunc i64 %39 to i32
  %41 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 2
  %42 = load i32, i32* %41, align 8
  %43 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %44 = bitcast i32* %43 to i64*
  %45 = load i64, i64* %44, align 8
  %46 = trunc i64 %45 to i32
  %47 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %48 = load i32, i32* %47, align 8
  %49 = lshr i64 %45, 32
  %50 = trunc i64 %49 to i32
  %51 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %52 = load double*, double** %51, align 8
  %53 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %54 = bitcast i32* %53 to i64*
  %55 = load i64, i64* %54, align 8
  %56 = trunc i64 %55 to i32
  %57 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %58 = bitcast i32* %57 to i64*
  %59 = load i64, i64* %58, align 8
  %60 = trunc i64 %59 to i32
  %61 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %62 = bitcast i32* %61 to i64*
  %63 = load i64, i64* %62, align 8
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %55, 32
  %66 = trunc i64 %65 to i32
  %67 = lshr i64 %59, 32
  %68 = trunc i64 %67 to i32
  %69 = lshr i64 %63, 32
  %70 = trunc i64 %69 to i32
  %71 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 2
  %72 = load i32, i32* %71, align 8
  %73 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %74 = bitcast i32* %73 to i64*
  %75 = load i64, i64* %74, align 8
  %76 = trunc i64 %75 to i32
  %77 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %78 = load i32, i32* %77, align 8
  %79 = lshr i64 %75, 32
  %80 = trunc i64 %79 to i32
  %81 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %82 = load double*, double** %81, align 8
  %83 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.163", %"struct.Eigen::TensorEvaluator.163"* %eval, i64 0, i32 0, i32 0
  %84 = load double*, double** %83, align 8
  br label %95

; <label>:85                                      ; preds = %85, %.lr.ph5.i
  %i.03.i = phi i32 [ %17, %.lr.ph5.i ], [ %93, %85 ]
  %86 = call %struct.double2.124 @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE7double2i(%"struct.Eigen::TensorEvaluator.164"* %19, i32 %i.03.i) #6
  %87 = extractvalue %struct.double2.124 %86, 0
  %88 = extractvalue %struct.double2.124 %86, 1
  %89 = load double*, double** %20, align 8, !tbaa !522
  %90 = sext i32 %i.03.i to i64
  %91 = getelementptr inbounds double, double* %89, i64 %90
  store double %87, double* %91, align 16
  %92 = getelementptr inbounds double, double* %91, i64 1
  store double %88, double* %92, align 8
  %93 = add nsw i32 %i.03.i, %16
  %94 = icmp slt i32 %93, %15
  br i1 %94, label %85, label %._crit_edge6.i.loopexit

; <label>:95                                      ; preds = %95, %.lr.ph.i
  %i1.02.i = phi i32 [ %21, %.lr.ph.i ], [ %141, %95 ]
  %96 = sdiv i32 %i1.02.i, %26
  %97 = srem i32 %96, %30
  %98 = mul nsw i32 %97, %34
  %99 = mul nsw i32 %96, %26
  %100 = sub nsw i32 %i1.02.i, %99
  %101 = sdiv i32 %100, %36
  %102 = srem i32 %101, %38
  %103 = mul nsw i32 %102, %40
  %104 = add nsw i32 %103, %98
  %105 = mul nsw i32 %101, %36
  %106 = sub nsw i32 %100, %105
  %107 = sdiv i32 %106, %42
  %108 = srem i32 %107, %46
  %109 = mul nsw i32 %108, %48
  %110 = add nsw i32 %104, %109
  %111 = mul nsw i32 %107, %42
  %112 = sub nsw i32 %106, %111
  %113 = srem i32 %112, %50
  %114 = add nsw i32 %110, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double* %52, i64 %115
  %.val.i.i.i.i.i.i = load double, double* %116, align 8, !tbaa !514
  %117 = sdiv i32 %i1.02.i, %56
  %118 = srem i32 %117, %60
  %119 = mul nsw i32 %118, %64
  %120 = mul nsw i32 %117, %56
  %121 = sub nsw i32 %i1.02.i, %120
  %122 = sdiv i32 %121, %66
  %123 = srem i32 %122, %68
  %124 = mul nsw i32 %123, %70
  %125 = add nsw i32 %124, %119
  %126 = mul nsw i32 %122, %66
  %127 = sub nsw i32 %121, %126
  %128 = sdiv i32 %127, %72
  %129 = srem i32 %128, %76
  %130 = mul nsw i32 %129, %78
  %131 = add nsw i32 %125, %130
  %132 = mul nsw i32 %128, %72
  %133 = sub nsw i32 %127, %132
  %134 = srem i32 %133, %80
  %135 = add nsw i32 %131, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds double, double* %82, i64 %136
  %.val.i.i.i1.i.i.i = load double, double* %137, align 8, !tbaa !514
  %138 = fadd double %.val.i.i.i.i.i.i, %.val.i.i.i1.i.i.i
  %139 = sext i32 %i1.02.i to i64
  %140 = getelementptr inbounds double, double* %84, i64 %139
  store double %138, double* %140, align 8, !tbaa !514
  %141 = add nsw i32 %i1.02.i, %7
  %142 = icmp slt i32 %141, %size
  br i1 %142, label %95, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %95
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  call void @llvm.lifetime.end(i64 200, i8* %8) #6
  ret void
}

; Function Attrs: inlinehint norecurse nounwind readonly
define linkonce_odr %struct.double2.124 @_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEESG_EENS_9GpuDeviceEE6packetILi16EEE7double2i(%"struct.Eigen::TensorEvaluator.164"* nocapture readonly %this, i32 %index) #5 comdat align 2 {
  %1 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 1, i32 0, i64 0
  %2 = load i32, i32* %1, align 4, !tbaa !178
  %3 = sdiv i32 %index, %2
  %4 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %5 = load i32, i32* %4, align 4, !tbaa !178
  %6 = srem i32 %3, %5
  %7 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 2, i32 0, i64 0
  %8 = load i32, i32* %7, align 4, !tbaa !178
  %9 = mul nsw i32 %8, %6
  %10 = mul nsw i32 %3, %2
  %11 = sub nsw i32 %index, %10
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 4, !tbaa !178
  %14 = sdiv i32 %11, %13
  %15 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 1
  %16 = load i32, i32* %15, align 4, !tbaa !178
  %17 = srem i32 %14, %16
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 2, i32 0, i64 1
  %19 = load i32, i32* %18, align 4, !tbaa !178
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %9
  %22 = mul nsw i32 %14, %13
  %23 = sub nsw i32 %11, %22
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 1, i32 0, i64 2
  %25 = load i32, i32* %24, align 4, !tbaa !178
  %26 = sdiv i32 %23, %25
  %27 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %28 = load i32, i32* %27, align 4, !tbaa !178
  %29 = srem i32 %26, %28
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 2, i32 0, i64 2
  %31 = load i32, i32* %30, align 4, !tbaa !178
  %32 = mul nsw i32 %31, %29
  %33 = add nsw i32 %21, %32
  %34 = mul nsw i32 %26, %25
  %35 = sub nsw i32 %23, %34
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 3, i32 1, i32 0, i32 0, i64 3
  %37 = load i32, i32* %36, align 4, !tbaa !178
  %38 = srem i32 %35, %37
  %39 = add nsw i32 %33, %38
  %40 = add nsw i32 %38, 2
  %41 = icmp sgt i32 %40, %37
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 1, i32 3, i32 0
  %43 = load double*, double** %42, align 8
  %44 = sext i32 %39 to i64
  %45 = getelementptr inbounds double, double* %43, i64 %44
  br i1 %41, label %48, label %46

; <label>:46                                      ; preds = %0
  %47 = getelementptr inbounds double, double* %45, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit

; <label>:48                                      ; preds = %0
  %49 = add nsw i32 %index, 1
  %50 = sdiv i32 %49, %2
  %51 = srem i32 %50, %5
  %52 = mul nsw i32 %51, %8
  %53 = mul nsw i32 %50, %2
  %54 = sub nsw i32 %49, %53
  %55 = sdiv i32 %54, %13
  %56 = srem i32 %55, %16
  %57 = mul nsw i32 %56, %19
  %58 = add nsw i32 %57, %52
  %59 = mul nsw i32 %55, %13
  %60 = sub nsw i32 %54, %59
  %61 = sdiv i32 %60, %25
  %62 = srem i32 %61, %28
  %63 = mul nsw i32 %62, %31
  %64 = add nsw i32 %58, %63
  %65 = mul nsw i32 %61, %25
  %66 = sub nsw i32 %60, %65
  %67 = srem i32 %66, %37
  %68 = add nsw i32 %64, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double* %43, i64 %69
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit: ; preds = %46, %48
  %.sroa.3.0.in.i.i = phi double* [ %47, %46 ], [ %70, %48 ]
  %.sroa.3.0.i.i = load double, double* %.sroa.3.0.in.i.i, align 8, !tbaa !514
  %.sroa.0.0.i.i = load double, double* %45, align 8, !tbaa !514
  %71 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 1, i32 0, i64 0
  %72 = load i32, i32* %71, align 4, !tbaa !178
  %73 = sdiv i32 %index, %72
  %74 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %75 = load i32, i32* %74, align 4, !tbaa !178
  %76 = srem i32 %73, %75
  %77 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 2, i32 0, i64 0
  %78 = load i32, i32* %77, align 4, !tbaa !178
  %79 = mul nsw i32 %78, %76
  %80 = mul nsw i32 %73, %72
  %81 = sub nsw i32 %index, %80
  %82 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 1, i32 0, i64 1
  %83 = load i32, i32* %82, align 4, !tbaa !178
  %84 = sdiv i32 %81, %83
  %85 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 1
  %86 = load i32, i32* %85, align 4, !tbaa !178
  %87 = srem i32 %84, %86
  %88 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 2, i32 0, i64 1
  %89 = load i32, i32* %88, align 4, !tbaa !178
  %90 = mul nsw i32 %89, %87
  %91 = add nsw i32 %90, %79
  %92 = mul nsw i32 %84, %83
  %93 = sub nsw i32 %81, %92
  %94 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 1, i32 0, i64 2
  %95 = load i32, i32* %94, align 4, !tbaa !178
  %96 = sdiv i32 %93, %95
  %97 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %98 = load i32, i32* %97, align 4, !tbaa !178
  %99 = srem i32 %96, %98
  %100 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 2, i32 0, i64 2
  %101 = load i32, i32* %100, align 4, !tbaa !178
  %102 = mul nsw i32 %101, %99
  %103 = add nsw i32 %91, %102
  %104 = mul nsw i32 %96, %95
  %105 = sub nsw i32 %93, %104
  %106 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 3, i32 1, i32 0, i32 0, i64 3
  %107 = load i32, i32* %106, align 4, !tbaa !178
  %108 = srem i32 %105, %107
  %109 = add nsw i32 %103, %108
  %110 = add nsw i32 %108, 2
  %111 = icmp sgt i32 %110, %107
  %112 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.164", %"struct.Eigen::TensorEvaluator.164"* %this, i64 0, i32 2, i32 3, i32 0
  %113 = load double*, double** %112, align 8
  %114 = sext i32 %109 to i64
  %115 = getelementptr inbounds double, double* %113, i64 %114
  br i1 %111, label %118, label %116

; <label>:116                                     ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit
  %117 = getelementptr inbounds double, double* %115, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit4

; <label>:118                                     ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit
  %119 = add nsw i32 %index, 1
  %120 = sdiv i32 %119, %72
  %121 = srem i32 %120, %75
  %122 = mul nsw i32 %121, %78
  %123 = mul nsw i32 %120, %72
  %124 = sub nsw i32 %119, %123
  %125 = sdiv i32 %124, %83
  %126 = srem i32 %125, %86
  %127 = mul nsw i32 %126, %89
  %128 = add nsw i32 %127, %122
  %129 = mul nsw i32 %125, %83
  %130 = sub nsw i32 %124, %129
  %131 = sdiv i32 %130, %95
  %132 = srem i32 %131, %98
  %133 = mul nsw i32 %132, %101
  %134 = add nsw i32 %128, %133
  %135 = mul nsw i32 %131, %95
  %136 = sub nsw i32 %130, %135
  %137 = srem i32 %136, %107
  %138 = add nsw i32 %134, %137
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds double, double* %113, i64 %139
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit4

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKdLi4ELi1EiEELi16EEEEENS_9GpuDeviceEE6packetILi16EEE7double2i.exit4: ; preds = %116, %118
  %.sroa.3.0.in.i.i1 = phi double* [ %117, %116 ], [ %140, %118 ]
  %.sroa.3.0.i.i2 = load double, double* %.sroa.3.0.in.i.i1, align 8, !tbaa !514
  %.sroa.0.0.i.i3 = load double, double* %115, align 8, !tbaa !514
  %141 = fadd double %.sroa.0.0.i.i, %.sroa.0.0.i.i3
  %142 = fadd double %.sroa.3.0.i.i, %.sroa.3.0.i.i2
  %oldret.i.i = insertvalue %struct.double2.124 undef, double %141, 0
  %oldret2.i.i = insertvalue %struct.double2.124 %oldret.i.i, double %142, 1
  ret %struct.double2.124 %oldret2.i.i
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.165"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load double*, double** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %15 = bitcast i32* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = trunc i64 %16 to i32
  %18 = lshr i64 %16, 32
  %19 = trunc i64 %18 to i32
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 3
  %21 = load i32, i32* %20, align 8
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %23 = bitcast i32* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = trunc i64 %24 to i32
  %26 = lshr i64 %24, 32
  %27 = trunc i64 %26 to i32
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %29 = bitcast i32* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = trunc i64 %30 to i32
  %32 = lshr i64 %30, 32
  %33 = trunc i64 %32 to i32
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %35 = load double*, double** %34, align 8
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %37 = bitcast i32* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %38, 32
  %41 = trunc i64 %40 to i32
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %43 = bitcast i32* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = trunc i64 %44 to i32
  %46 = lshr i64 %44, 32
  %47 = trunc i64 %46 to i32
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.165", %"struct.Eigen::TensorEvaluator.165"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 4
  %49 = load i32, i32* %48, align 8
  %50 = sdiv i32 %size, 2
  %51 = shl nsw i32 %50, 1
  %52 = shl i32 %7, 1
  %53 = shl nsw i32 %5, 1
  %54 = icmp slt i32 %53, %51
  br i1 %54, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %55 = add nsw i32 %5, %51
  %56 = icmp slt i32 %55, %size
  br i1 %56, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit
  %i.03.i = phi i32 [ %126, %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit ], [ %53, %.lr.ph5.i.preheader ]
  %57 = sext i32 %i.03.i to i64
  %58 = getelementptr inbounds double, double* %11, i64 %57
  %59 = load double, double* %58, align 8, !tbaa !514
  %60 = getelementptr inbounds double, double* %58, i64 1
  %61 = load double, double* %60, align 8, !tbaa !514
  %62 = sdiv i32 %i.03.i, %13
  %63 = srem i32 %62, %39
  %64 = mul nsw i32 %63, %25
  %65 = mul nsw i32 %62, %13
  %66 = sub nsw i32 %i.03.i, %65
  %67 = sdiv i32 %66, %17
  %68 = srem i32 %67, %41
  %69 = mul nsw i32 %68, %27
  %70 = add nsw i32 %69, %64
  %71 = mul nsw i32 %67, %17
  %72 = sub nsw i32 %66, %71
  %73 = sdiv i32 %72, %19
  %74 = srem i32 %73, %45
  %75 = mul nsw i32 %74, %31
  %76 = add nsw i32 %70, %75
  %77 = mul nsw i32 %73, %19
  %78 = sub nsw i32 %72, %77
  %79 = sdiv i32 %78, %21
  %80 = srem i32 %79, %47
  %81 = mul nsw i32 %80, %33
  %82 = add nsw i32 %76, %81
  %83 = mul nsw i32 %79, %21
  %84 = sub nsw i32 %78, %83
  %85 = srem i32 %84, %49
  %86 = add nsw i32 %82, %85
  %87 = add nsw i32 %85, 2
  %88 = icmp sgt i32 %87, %49
  %89 = sext i32 %86 to i64
  %90 = getelementptr inbounds double, double* %35, i64 %89
  br i1 %88, label %93, label %91

; <label>:91                                      ; preds = %.lr.ph5.i
  %92 = getelementptr inbounds double, double* %90, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit

; <label>:93                                      ; preds = %.lr.ph5.i
  %94 = or i32 %i.03.i, 1
  %95 = sdiv i32 %94, %13
  %96 = srem i32 %95, %39
  %97 = mul nsw i32 %96, %25
  %98 = mul nsw i32 %95, %13
  %99 = sub nsw i32 %94, %98
  %100 = sdiv i32 %99, %17
  %101 = srem i32 %100, %41
  %102 = mul nsw i32 %101, %27
  %103 = add nsw i32 %102, %97
  %104 = mul nsw i32 %100, %17
  %105 = sub nsw i32 %99, %104
  %106 = sdiv i32 %105, %19
  %107 = srem i32 %106, %45
  %108 = mul nsw i32 %107, %31
  %109 = add nsw i32 %103, %108
  %110 = mul nsw i32 %106, %19
  %111 = sub nsw i32 %105, %110
  %112 = sdiv i32 %111, %21
  %113 = srem i32 %112, %47
  %114 = mul nsw i32 %113, %33
  %115 = add nsw i32 %109, %114
  %116 = mul nsw i32 %112, %21
  %117 = sub nsw i32 %111, %116
  %118 = srem i32 %117, %49
  %119 = add nsw i32 %115, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds double, double* %35, i64 %120
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit: ; preds = %91, %93
  %.sroa.3.0.in.i = phi double* [ %92, %91 ], [ %121, %93 ]
  %.sroa.3.0.i = load double, double* %.sroa.3.0.in.i, align 8, !tbaa !514
  %.sroa.0.0.i = load double, double* %90, align 8, !tbaa !514
  %122 = fadd double %59, %.sroa.0.0.i
  %123 = fadd double %61, %.sroa.3.0.i
  %124 = getelementptr inbounds double, double* %9, i64 %57
  store double %122, double* %124, align 16
  %125 = getelementptr inbounds double, double* %124, i64 1
  store double %123, double* %125, align 8
  %126 = add nsw i32 %i.03.i, %52
  %127 = icmp slt i32 %126, %51
  br i1 %127, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %159, %.lr.ph.i ], [ %55, %.lr.ph.i.preheader ]
  %128 = sext i32 %i1.02.i to i64
  %129 = getelementptr inbounds double, double* %11, i64 %128
  %.val.i.i.i.i = load double, double* %129, align 8, !tbaa !514
  %130 = sdiv i32 %i1.02.i, %13
  %131 = srem i32 %130, %39
  %132 = mul nsw i32 %131, %25
  %133 = mul nsw i32 %130, %13
  %134 = sub nsw i32 %i1.02.i, %133
  %135 = sdiv i32 %134, %17
  %136 = srem i32 %135, %41
  %137 = mul nsw i32 %136, %27
  %138 = add nsw i32 %137, %132
  %139 = mul nsw i32 %135, %17
  %140 = sub nsw i32 %134, %139
  %141 = sdiv i32 %140, %19
  %142 = srem i32 %141, %45
  %143 = mul nsw i32 %142, %31
  %144 = add nsw i32 %138, %143
  %145 = mul nsw i32 %141, %19
  %146 = sub nsw i32 %140, %145
  %147 = sdiv i32 %146, %21
  %148 = srem i32 %147, %47
  %149 = mul nsw i32 %148, %33
  %150 = add nsw i32 %144, %149
  %151 = mul nsw i32 %147, %21
  %152 = sub nsw i32 %146, %151
  %153 = srem i32 %152, %49
  %154 = add nsw i32 %150, %153
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds double, double* %35, i64 %155
  %.val.i.i.i.i.i.i = load double, double* %156, align 8, !tbaa !514
  %157 = fadd double %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %158 = getelementptr inbounds double, double* %9, i64 %128
  store double %157, double* %158, align 8, !tbaa !514
  %159 = add nsw i32 %i1.02.i, %7
  %160 = icmp slt i32 %159, %size
  br i1 %160, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.170"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %13 = bitcast i32* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = trunc i64 %14 to i32
  %16 = lshr i64 %14, 32
  %17 = trunc i64 %16 to i32
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 3
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %21 = bitcast i32* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = trunc i64 %22 to i32
  %24 = lshr i64 %22, 32
  %25 = trunc i64 %24 to i32
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %27 = bitcast i32* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = trunc i64 %28 to i32
  %30 = lshr i64 %28, 32
  %31 = trunc i64 %30 to i32
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %33 = load double*, double** %32, align 8
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %35 = bitcast i32* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = trunc i64 %36 to i32
  %38 = lshr i64 %36, 32
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %41 = bitcast i32* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = trunc i64 %42 to i32
  %44 = lshr i64 %42, 32
  %45 = trunc i64 %44 to i32
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 4
  %47 = load i32, i32* %46, align 8
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.170", %"struct.Eigen::TensorEvaluator.170"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %49 = load double*, double** %48, align 8
  %50 = sdiv i32 %size, 2
  %51 = shl nsw i32 %50, 1
  %52 = shl i32 %7, 1
  %53 = shl nsw i32 %5, 1
  %54 = icmp slt i32 %53, %51
  br i1 %54, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %55 = add nsw i32 %5, %51
  %56 = icmp slt i32 %55, %size
  br i1 %56, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit
  %i.03.i = phi i32 [ %126, %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit ], [ %53, %.lr.ph5.i.preheader ]
  %57 = sdiv i32 %i.03.i, %11
  %58 = srem i32 %57, %37
  %59 = mul nsw i32 %58, %23
  %60 = mul nsw i32 %57, %11
  %61 = sub nsw i32 %i.03.i, %60
  %62 = sdiv i32 %61, %15
  %63 = srem i32 %62, %39
  %64 = mul nsw i32 %63, %25
  %65 = add nsw i32 %64, %59
  %66 = mul nsw i32 %62, %15
  %67 = sub nsw i32 %61, %66
  %68 = sdiv i32 %67, %17
  %69 = srem i32 %68, %43
  %70 = mul nsw i32 %69, %29
  %71 = add nsw i32 %65, %70
  %72 = mul nsw i32 %68, %17
  %73 = sub nsw i32 %67, %72
  %74 = sdiv i32 %73, %19
  %75 = srem i32 %74, %45
  %76 = mul nsw i32 %75, %31
  %77 = add nsw i32 %71, %76
  %78 = mul nsw i32 %74, %19
  %79 = sub nsw i32 %73, %78
  %80 = srem i32 %79, %47
  %81 = add nsw i32 %77, %80
  %82 = add nsw i32 %80, 2
  %83 = icmp sgt i32 %82, %47
  %84 = sext i32 %81 to i64
  %85 = getelementptr inbounds double, double* %33, i64 %84
  br i1 %83, label %88, label %86

; <label>:86                                      ; preds = %.lr.ph5.i
  %87 = getelementptr inbounds double, double* %85, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit

; <label>:88                                      ; preds = %.lr.ph5.i
  %89 = or i32 %i.03.i, 1
  %90 = sdiv i32 %89, %11
  %91 = srem i32 %90, %37
  %92 = mul nsw i32 %91, %23
  %93 = mul nsw i32 %90, %11
  %94 = sub nsw i32 %89, %93
  %95 = sdiv i32 %94, %15
  %96 = srem i32 %95, %39
  %97 = mul nsw i32 %96, %25
  %98 = add nsw i32 %97, %92
  %99 = mul nsw i32 %95, %15
  %100 = sub nsw i32 %94, %99
  %101 = sdiv i32 %100, %17
  %102 = srem i32 %101, %43
  %103 = mul nsw i32 %102, %29
  %104 = add nsw i32 %98, %103
  %105 = mul nsw i32 %101, %17
  %106 = sub nsw i32 %100, %105
  %107 = sdiv i32 %106, %19
  %108 = srem i32 %107, %45
  %109 = mul nsw i32 %108, %31
  %110 = add nsw i32 %104, %109
  %111 = mul nsw i32 %107, %19
  %112 = sub nsw i32 %106, %111
  %113 = srem i32 %112, %47
  %114 = add nsw i32 %110, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double* %33, i64 %115
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit: ; preds = %86, %88
  %.sroa.3.0.in.i = phi double* [ %87, %86 ], [ %116, %88 ]
  %.sroa.3.0.i = load double, double* %.sroa.3.0.in.i, align 8, !tbaa !514
  %.sroa.0.0.i = load double, double* %85, align 8, !tbaa !514
  %117 = sext i32 %i.03.i to i64
  %118 = getelementptr inbounds double, double* %49, i64 %117
  %119 = load double, double* %118, align 8, !tbaa !514
  %120 = getelementptr inbounds double, double* %118, i64 1
  %121 = load double, double* %120, align 8, !tbaa !514
  %122 = fadd double %.sroa.0.0.i, %119
  %123 = fadd double %.sroa.3.0.i, %121
  %124 = getelementptr inbounds double, double* %9, i64 %117
  store double %122, double* %124, align 16
  %125 = getelementptr inbounds double, double* %124, i64 1
  store double %123, double* %125, align 8
  %126 = add nsw i32 %i.03.i, %52
  %127 = icmp slt i32 %126, %51
  br i1 %127, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %159, %.lr.ph.i ], [ %55, %.lr.ph.i.preheader ]
  %128 = sdiv i32 %i1.02.i, %11
  %129 = srem i32 %128, %37
  %130 = mul nsw i32 %129, %23
  %131 = mul nsw i32 %128, %11
  %132 = sub nsw i32 %i1.02.i, %131
  %133 = sdiv i32 %132, %15
  %134 = srem i32 %133, %39
  %135 = mul nsw i32 %134, %25
  %136 = add nsw i32 %135, %130
  %137 = mul nsw i32 %133, %15
  %138 = sub nsw i32 %132, %137
  %139 = sdiv i32 %138, %17
  %140 = srem i32 %139, %43
  %141 = mul nsw i32 %140, %29
  %142 = add nsw i32 %136, %141
  %143 = mul nsw i32 %139, %17
  %144 = sub nsw i32 %138, %143
  %145 = sdiv i32 %144, %19
  %146 = srem i32 %145, %45
  %147 = mul nsw i32 %146, %31
  %148 = add nsw i32 %142, %147
  %149 = mul nsw i32 %145, %19
  %150 = sub nsw i32 %144, %149
  %151 = srem i32 %150, %47
  %152 = add nsw i32 %148, %151
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds double, double* %33, i64 %153
  %.val.i.i.i.i.i.i = load double, double* %154, align 8, !tbaa !514
  %155 = sext i32 %i1.02.i to i64
  %156 = getelementptr inbounds double, double* %49, i64 %155
  %.val.i.i.i.i = load double, double* %156, align 8, !tbaa !514
  %157 = fadd double %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %158 = getelementptr inbounds double, double* %9, i64 %155
  store double %157, double* %158, align 8, !tbaa !514
  %159 = add nsw i32 %i1.02.i, %7
  %160 = icmp slt i32 %159, %size
  br i1 %160, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.172"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load double*, double** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %13 = bitcast i32* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = trunc i64 %14 to i32
  %16 = lshr i64 %14, 32
  %17 = trunc i64 %16 to i32
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 3
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %21 = bitcast i32* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = trunc i64 %22 to i32
  %24 = lshr i64 %22, 32
  %25 = trunc i64 %24 to i32
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %27 = bitcast i32* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = trunc i64 %28 to i32
  %30 = lshr i64 %28, 32
  %31 = trunc i64 %30 to i32
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %33 = load double*, double** %32, align 8
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %35 = bitcast i32* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = trunc i64 %36 to i32
  %38 = lshr i64 %36, 32
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %41 = bitcast i32* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = trunc i64 %42 to i32
  %44 = lshr i64 %42, 32
  %45 = trunc i64 %44 to i32
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 4
  %47 = load i32, i32* %46, align 8
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %49 = load i32, i32* %48, align 4
  %50 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %51 = bitcast i32* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = trunc i64 %52 to i32
  %54 = lshr i64 %52, 32
  %55 = trunc i64 %54 to i32
  %56 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 3
  %57 = load i32, i32* %56, align 8
  %58 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %59 = bitcast i32* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = trunc i64 %62 to i32
  %64 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %65 = bitcast i32* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = trunc i64 %66 to i32
  %68 = lshr i64 %66, 32
  %69 = trunc i64 %68 to i32
  %70 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %71 = load double*, double** %70, align 8
  %72 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %73 = bitcast i32* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = trunc i64 %74 to i32
  %76 = lshr i64 %74, 32
  %77 = trunc i64 %76 to i32
  %78 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %79 = bitcast i32* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = trunc i64 %80 to i32
  %82 = lshr i64 %80, 32
  %83 = trunc i64 %82 to i32
  %84 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.172", %"struct.Eigen::TensorEvaluator.172"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 4
  %85 = load i32, i32* %84, align 8
  %86 = sdiv i32 %size, 2
  %87 = shl nsw i32 %86, 1
  %88 = shl i32 %7, 1
  %89 = shl nsw i32 %5, 1
  %90 = icmp slt i32 %89, %87
  br i1 %90, label %.lr.ph5.i.preheader, label %._crit_edge6.i

.lr.ph5.i.preheader:                              ; preds = %0
  br label %.lr.ph5.i

._crit_edge6.i.loopexit:                          ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit
  br label %._crit_edge6.i

._crit_edge6.i:                                   ; preds = %._crit_edge6.i.loopexit, %0
  %91 = add nsw i32 %5, %87
  %92 = icmp slt i32 %91, %size
  br i1 %92, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %._crit_edge6.i
  br label %.lr.ph.i

.lr.ph5.i:                                        ; preds = %.lr.ph5.i.preheader, %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit
  %i.03.i = phi i32 [ %218, %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit ], [ %89, %.lr.ph5.i.preheader ]
  %93 = sdiv i32 %i.03.i, %11
  %94 = srem i32 %93, %37
  %95 = mul nsw i32 %94, %23
  %96 = mul nsw i32 %93, %11
  %97 = sub nsw i32 %i.03.i, %96
  %98 = sdiv i32 %97, %15
  %99 = srem i32 %98, %39
  %100 = mul nsw i32 %99, %25
  %101 = add nsw i32 %100, %95
  %102 = mul nsw i32 %98, %15
  %103 = sub nsw i32 %97, %102
  %104 = sdiv i32 %103, %17
  %105 = srem i32 %104, %43
  %106 = mul nsw i32 %105, %29
  %107 = add nsw i32 %101, %106
  %108 = mul nsw i32 %104, %17
  %109 = sub nsw i32 %103, %108
  %110 = sdiv i32 %109, %19
  %111 = srem i32 %110, %45
  %112 = mul nsw i32 %111, %31
  %113 = add nsw i32 %107, %112
  %114 = mul nsw i32 %110, %19
  %115 = sub nsw i32 %109, %114
  %116 = srem i32 %115, %47
  %117 = add nsw i32 %113, %116
  %118 = add nsw i32 %116, 2
  %119 = icmp sgt i32 %118, %47
  %120 = sext i32 %117 to i64
  %121 = getelementptr inbounds double, double* %33, i64 %120
  br i1 %119, label %124, label %122

; <label>:122                                     ; preds = %.lr.ph5.i
  %123 = getelementptr inbounds double, double* %121, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit4

; <label>:124                                     ; preds = %.lr.ph5.i
  %125 = or i32 %i.03.i, 1
  %126 = sdiv i32 %125, %11
  %127 = srem i32 %126, %37
  %128 = mul nsw i32 %127, %23
  %129 = mul nsw i32 %126, %11
  %130 = sub nsw i32 %125, %129
  %131 = sdiv i32 %130, %15
  %132 = srem i32 %131, %39
  %133 = mul nsw i32 %132, %25
  %134 = add nsw i32 %133, %128
  %135 = mul nsw i32 %131, %15
  %136 = sub nsw i32 %130, %135
  %137 = sdiv i32 %136, %17
  %138 = srem i32 %137, %43
  %139 = mul nsw i32 %138, %29
  %140 = add nsw i32 %134, %139
  %141 = mul nsw i32 %137, %17
  %142 = sub nsw i32 %136, %141
  %143 = sdiv i32 %142, %19
  %144 = srem i32 %143, %45
  %145 = mul nsw i32 %144, %31
  %146 = add nsw i32 %140, %145
  %147 = mul nsw i32 %143, %19
  %148 = sub nsw i32 %142, %147
  %149 = srem i32 %148, %47
  %150 = add nsw i32 %146, %149
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds double, double* %33, i64 %151
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit4

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit4: ; preds = %122, %124
  %.sroa.3.0.in.i1 = phi double* [ %123, %122 ], [ %152, %124 ]
  %.sroa.3.0.i2 = load double, double* %.sroa.3.0.in.i1, align 8, !tbaa !514
  %.sroa.0.0.i3 = load double, double* %121, align 8, !tbaa !514
  %153 = sdiv i32 %i.03.i, %49
  %154 = srem i32 %153, %75
  %155 = mul nsw i32 %154, %61
  %156 = mul nsw i32 %153, %49
  %157 = sub nsw i32 %i.03.i, %156
  %158 = sdiv i32 %157, %53
  %159 = srem i32 %158, %77
  %160 = mul nsw i32 %159, %63
  %161 = add nsw i32 %160, %155
  %162 = mul nsw i32 %158, %53
  %163 = sub nsw i32 %157, %162
  %164 = sdiv i32 %163, %55
  %165 = srem i32 %164, %81
  %166 = mul nsw i32 %165, %67
  %167 = add nsw i32 %161, %166
  %168 = mul nsw i32 %164, %55
  %169 = sub nsw i32 %163, %168
  %170 = sdiv i32 %169, %57
  %171 = srem i32 %170, %83
  %172 = mul nsw i32 %171, %69
  %173 = add nsw i32 %167, %172
  %174 = mul nsw i32 %170, %57
  %175 = sub nsw i32 %169, %174
  %176 = srem i32 %175, %85
  %177 = add nsw i32 %173, %176
  %178 = add nsw i32 %176, 2
  %179 = icmp sgt i32 %178, %85
  %180 = sext i32 %177 to i64
  %181 = getelementptr inbounds double, double* %71, i64 %180
  br i1 %179, label %184, label %182

; <label>:182                                     ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit4
  %183 = getelementptr inbounds double, double* %181, i64 1
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit

; <label>:184                                     ; preds = %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit4
  %185 = or i32 %i.03.i, 1
  %186 = sdiv i32 %185, %49
  %187 = srem i32 %186, %75
  %188 = mul nsw i32 %187, %61
  %189 = mul nsw i32 %186, %49
  %190 = sub nsw i32 %185, %189
  %191 = sdiv i32 %190, %53
  %192 = srem i32 %191, %77
  %193 = mul nsw i32 %192, %63
  %194 = add nsw i32 %193, %188
  %195 = mul nsw i32 %191, %53
  %196 = sub nsw i32 %190, %195
  %197 = sdiv i32 %196, %55
  %198 = srem i32 %197, %81
  %199 = mul nsw i32 %198, %67
  %200 = add nsw i32 %194, %199
  %201 = mul nsw i32 %197, %55
  %202 = sub nsw i32 %196, %201
  %203 = sdiv i32 %202, %57
  %204 = srem i32 %203, %83
  %205 = mul nsw i32 %204, %69
  %206 = add nsw i32 %200, %205
  %207 = mul nsw i32 %203, %57
  %208 = sub nsw i32 %202, %207
  %209 = srem i32 %208, %85
  %210 = add nsw i32 %206, %209
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds double, double* %71, i64 %211
  br label %_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit

_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKdLi5ELi1EiEELi16EEEEENS_9GpuDeviceEE14packetRowMajorILi16EEE7double2i.exit: ; preds = %182, %184
  %.sroa.3.0.in.i = phi double* [ %183, %182 ], [ %212, %184 ]
  %.sroa.3.0.i = load double, double* %.sroa.3.0.in.i, align 8, !tbaa !514
  %.sroa.0.0.i = load double, double* %181, align 8, !tbaa !514
  %213 = fadd double %.sroa.0.0.i3, %.sroa.0.0.i
  %214 = fadd double %.sroa.3.0.i2, %.sroa.3.0.i
  %215 = sext i32 %i.03.i to i64
  %216 = getelementptr inbounds double, double* %9, i64 %215
  store double %213, double* %216, align 16
  %217 = getelementptr inbounds double, double* %216, i64 1
  store double %214, double* %217, align 8
  %218 = add nsw i32 %i.03.i, %88
  %219 = icmp slt i32 %218, %87
  br i1 %219, label %.lr.ph5.i, label %._crit_edge6.i.loopexit

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i1.02.i = phi i32 [ %277, %.lr.ph.i ], [ %91, %.lr.ph.i.preheader ]
  %220 = sdiv i32 %i1.02.i, %11
  %221 = srem i32 %220, %37
  %222 = mul nsw i32 %221, %23
  %223 = mul nsw i32 %220, %11
  %224 = sub nsw i32 %i1.02.i, %223
  %225 = sdiv i32 %224, %15
  %226 = srem i32 %225, %39
  %227 = mul nsw i32 %226, %25
  %228 = add nsw i32 %227, %222
  %229 = mul nsw i32 %225, %15
  %230 = sub nsw i32 %224, %229
  %231 = sdiv i32 %230, %17
  %232 = srem i32 %231, %43
  %233 = mul nsw i32 %232, %29
  %234 = add nsw i32 %228, %233
  %235 = mul nsw i32 %231, %17
  %236 = sub nsw i32 %230, %235
  %237 = sdiv i32 %236, %19
  %238 = srem i32 %237, %45
  %239 = mul nsw i32 %238, %31
  %240 = add nsw i32 %234, %239
  %241 = mul nsw i32 %237, %19
  %242 = sub nsw i32 %236, %241
  %243 = srem i32 %242, %47
  %244 = add nsw i32 %240, %243
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds double, double* %33, i64 %245
  %.val.i.i.i.i = load double, double* %246, align 8, !tbaa !514
  %247 = sdiv i32 %i1.02.i, %49
  %248 = srem i32 %247, %75
  %249 = mul nsw i32 %248, %61
  %250 = mul nsw i32 %247, %49
  %251 = sub nsw i32 %i1.02.i, %250
  %252 = sdiv i32 %251, %53
  %253 = srem i32 %252, %77
  %254 = mul nsw i32 %253, %63
  %255 = add nsw i32 %254, %249
  %256 = mul nsw i32 %252, %53
  %257 = sub nsw i32 %251, %256
  %258 = sdiv i32 %257, %55
  %259 = srem i32 %258, %81
  %260 = mul nsw i32 %259, %67
  %261 = add nsw i32 %255, %260
  %262 = mul nsw i32 %258, %55
  %263 = sub nsw i32 %257, %262
  %264 = sdiv i32 %263, %57
  %265 = srem i32 %264, %83
  %266 = mul nsw i32 %265, %69
  %267 = add nsw i32 %261, %266
  %268 = mul nsw i32 %264, %57
  %269 = sub nsw i32 %263, %268
  %270 = srem i32 %269, %85
  %271 = add nsw i32 %267, %270
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds double, double* %71, i64 %272
  %.val.i.i.i1.i = load double, double* %273, align 8, !tbaa !514
  %274 = fadd double %.val.i.i.i.i, %.val.i.i.i1.i
  %275 = sext i32 %i1.02.i to i64
  %276 = getelementptr inbounds double, double* %9, i64 %275
  store double %274, double* %276, align 8, !tbaa !514
  %277 = add nsw i32 %i1.02.i, %7
  %278 = icmp slt i32 %277, %size
  br i1 %278, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb1EE3runERSQ_iii.exit.loopexit, %._crit_edge6.i
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_(%"struct.Eigen::TensorEvaluator.174"* byval nocapture readonly align 8 %memcopied_eval, i64 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %8 = mul i32 %7, %2
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.174", %"struct.Eigen::TensorEvaluator.174"* %memcopied_eval, i64 0, i32 0, i32 0
  %11 = load i64*, i64** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.174", %"struct.Eigen::TensorEvaluator.174"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %13 = load i64*, i64** %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.174", %"struct.Eigen::TensorEvaluator.174"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %15 = load i64*, i64** %14, align 8
  %16 = icmp slt i64 %6, %size
  br i1 %16, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSN_lll.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i64 [ %22, %.lr.ph.i ], [ %6, %.lr.ph.i.preheader ]
  %sext.i.i.i = shl i64 %i.01.i, 32
  %17 = ashr exact i64 %sext.i.i.i, 32
  %18 = getelementptr inbounds i64, i64* %13, i64 %17
  %.val.i.i.i.i = load i64, i64* %18, align 8, !tbaa !524
  %19 = getelementptr inbounds i64, i64* %15, i64 %i.01.i
  %.val.i1.i.i.i = load i64, i64* %19, align 8, !tbaa !524
  %20 = add nsw i64 %.val.i1.i.i.i, %.val.i.i.i.i
  %21 = getelementptr inbounds i64, i64* %11, i64 %17
  store i64 %20, i64* %21, align 8, !tbaa !524
  %22 = add nuw nsw i64 %i.01.i, %9
  %23 = icmp slt i64 %22, %size
  br i1 %23, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSN_lll.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSN_lll.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSN_lll.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSN_lll.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElLb0EE3runERSN_lll.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.181"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.181", %"struct.Eigen::TensorEvaluator.181"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.181", %"struct.Eigen::TensorEvaluator.181"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load i64*, i64** %10, align 8
  %12 = icmp slt i32 %5, %size
  br i1 %12, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit

.lr.ph.i:                                         ; preds = %0
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.181", %"struct.Eigen::TensorEvaluator.181"* %memcopied_eval, i64 0, i32 1, i32 0, i32 0
  %14 = load i64*, i64** %13, align 8, !tbaa !526
  br label %15

; <label>:15                                      ; preds = %15, %.lr.ph.i
  %i.01.i = phi i32 [ %5, %.lr.ph.i ], [ %21, %15 ]
  %16 = sext i32 %i.01.i to i64
  %17 = getelementptr inbounds i64, i64* %11, i64 %16
  %.val.i.i.i.i = load i64, i64* %17, align 8, !tbaa !524
  %18 = load i64, i64* %14, align 8, !tbaa !524
  %19 = add nsw i64 %18, %.val.i.i.i.i
  %20 = getelementptr inbounds i64, i64* %9, i64 %16
  store i64 %19, i64* %20, align 8, !tbaa !524
  %21 = add nsw i32 %i.01.i, %7
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %15, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit.loopexit: ; preds = %15
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.184"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.184", %"struct.Eigen::TensorEvaluator.184"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.184", %"struct.Eigen::TensorEvaluator.184"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load i64*, i64** %10, align 8
  %12 = icmp slt i32 %5, %size
  br i1 %12, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit

.lr.ph.i:                                         ; preds = %0
  %13 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.184", %"struct.Eigen::TensorEvaluator.184"* %memcopied_eval, i64 0, i32 1, i32 0, i32 0
  %14 = load i64*, i64** %13, align 8, !tbaa !528
  br label %15

; <label>:15                                      ; preds = %15, %.lr.ph.i
  %i.01.i = phi i32 [ %5, %.lr.ph.i ], [ %21, %15 ]
  %16 = sext i32 %i.01.i to i64
  %17 = getelementptr inbounds i64, i64* %11, i64 %16
  %.val.i.i.i.i = load i64, i64* %17, align 8, !tbaa !524
  %18 = load i64, i64* %14, align 8, !tbaa !524
  %19 = add nsw i64 %18, %.val.i.i.i.i
  %20 = getelementptr inbounds i64, i64* %9, i64 %16
  store i64 %19, i64* %20, align 8, !tbaa !524
  %21 = add nsw i32 %i.01.i, %7
  %22 = icmp slt i32 %21, %size
  br i1 %22, label %15, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit.loopexit: ; preds = %15
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiLb0EE3runERSM_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.187"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.187", %"struct.Eigen::TensorEvaluator.187"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.187", %"struct.Eigen::TensorEvaluator.187"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load i64*, i64** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.187", %"struct.Eigen::TensorEvaluator.187"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %13 = load i64*, i64** %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.187", %"struct.Eigen::TensorEvaluator.187"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %15 = load i32, i32* %14, align 8
  %16 = icmp slt i32 %5, %size
  br i1 %16, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %24, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %17 = sext i32 %i.01.i to i64
  %18 = getelementptr inbounds i64, i64* %11, i64 %17
  %.val.i.i.i.i = load i64, i64* %18, align 8, !tbaa !524
  %19 = srem i32 %i.01.i, %15
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i64, i64* %13, i64 %20
  %.val.i.i.i.i.i.i = load i64, i64* %21, align 8, !tbaa !524
  %22 = add nsw i64 %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %23 = getelementptr inbounds i64, i64* %9, i64 %17
  store i64 %22, i64* %23, align 8, !tbaa !524
  %24 = add nsw i32 %i.01.i, %7
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.190"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.190", %"struct.Eigen::TensorEvaluator.190"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.190", %"struct.Eigen::TensorEvaluator.190"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %11 = load i64*, i64** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.190", %"struct.Eigen::TensorEvaluator.190"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.190", %"struct.Eigen::TensorEvaluator.190"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %15 = load i64*, i64** %14, align 8
  %16 = icmp slt i32 %5, %size
  br i1 %16, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %24, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %17 = srem i32 %i.01.i, %13
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i64, i64* %11, i64 %18
  %.val.i.i.i.i.i.i = load i64, i64* %19, align 8, !tbaa !524
  %20 = sext i32 %i.01.i to i64
  %21 = getelementptr inbounds i64, i64* %15, i64 %20
  %.val.i.i.i.i = load i64, i64* %21, align 8, !tbaa !524
  %22 = add nsw i64 %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %23 = getelementptr inbounds i64, i64* %9, i64 %20
  store i64 %22, i64* %23, align 8, !tbaa !524
  %24 = add nsw i32 %i.01.i, %7
  %25 = icmp slt i32 %24, %size
  br i1 %25, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.192"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.192", %"struct.Eigen::TensorEvaluator.192"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.192", %"struct.Eigen::TensorEvaluator.192"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %11 = load i64*, i64** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.192", %"struct.Eigen::TensorEvaluator.192"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.192", %"struct.Eigen::TensorEvaluator.192"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %15 = load i64*, i64** %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.192", %"struct.Eigen::TensorEvaluator.192"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %17 = load i32, i32* %16, align 8
  %18 = icmp slt i32 %5, %size
  br i1 %18, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %28, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %19 = srem i32 %i.01.i, %13
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i64, i64* %11, i64 %20
  %.val.i.i.i.i.i.i = load i64, i64* %21, align 8, !tbaa !524
  %22 = srem i32 %i.01.i, %17
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i64, i64* %15, i64 %23
  %.val.i.i.i1.i.i.i = load i64, i64* %24, align 8, !tbaa !524
  %25 = add nsw i64 %.val.i.i.i1.i.i.i, %.val.i.i.i.i.i.i
  %26 = sext i32 %i.01.i to i64
  %27 = getelementptr inbounds i64, i64* %9, i64 %26
  store i64 %25, i64* %27, align 8, !tbaa !524
  %28 = add nsw i32 %i.01.i, %7
  %29 = icmp slt i32 %28, %size
  br i1 %29, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.194"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.194", %"struct.Eigen::TensorEvaluator.194"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.194", %"struct.Eigen::TensorEvaluator.194"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load i64*, i64** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.194", %"struct.Eigen::TensorEvaluator.194"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.194", %"struct.Eigen::TensorEvaluator.194"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %15 = load i32, i32* %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.194", %"struct.Eigen::TensorEvaluator.194"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %17 = load i64*, i64** %16, align 8
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.194", %"struct.Eigen::TensorEvaluator.194"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %19 = bitcast i32* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = trunc i64 %20 to i32
  %22 = lshr i64 %20, 32
  %23 = trunc i64 %22 to i32
  %24 = icmp slt i32 %5, %size
  br i1 %24, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %38, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %25 = sext i32 %i.01.i to i64
  %26 = getelementptr inbounds i64, i64* %11, i64 %25
  %.val.i.i.i.i = load i64, i64* %26, align 8, !tbaa !524
  %27 = sdiv i32 %i.01.i, %13
  %28 = srem i32 %27, %21
  %29 = mul nsw i32 %28, %15
  %30 = mul nsw i32 %27, %13
  %31 = sub nsw i32 %i.01.i, %30
  %32 = srem i32 %31, %23
  %33 = add nsw i32 %32, %29
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i64, i64* %17, i64 %34
  %.val.i.i.i.i.i.i = load i64, i64* %35, align 8, !tbaa !524
  %36 = add nsw i64 %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %37 = getelementptr inbounds i64, i64* %9, i64 %25
  store i64 %36, i64* %37, align 8, !tbaa !524
  %38 = add nsw i32 %i.01.i, %7
  %39 = icmp slt i32 %38, %size
  br i1 %39, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.199"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.199", %"struct.Eigen::TensorEvaluator.199"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.199", %"struct.Eigen::TensorEvaluator.199"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.199", %"struct.Eigen::TensorEvaluator.199"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.199", %"struct.Eigen::TensorEvaluator.199"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %15 = load i64*, i64** %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.199", %"struct.Eigen::TensorEvaluator.199"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %17 = bitcast i32* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = trunc i64 %18 to i32
  %20 = lshr i64 %18, 32
  %21 = trunc i64 %20 to i32
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.199", %"struct.Eigen::TensorEvaluator.199"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %23 = load i64*, i64** %22, align 8
  %24 = icmp slt i32 %5, %size
  br i1 %24, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %38, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %25 = sdiv i32 %i.01.i, %11
  %26 = srem i32 %25, %19
  %27 = mul nsw i32 %26, %13
  %28 = mul nsw i32 %25, %11
  %29 = sub nsw i32 %i.01.i, %28
  %30 = srem i32 %29, %21
  %31 = add nsw i32 %30, %27
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i64, i64* %15, i64 %32
  %.val.i.i.i.i.i.i = load i64, i64* %33, align 8, !tbaa !524
  %34 = sext i32 %i.01.i to i64
  %35 = getelementptr inbounds i64, i64* %23, i64 %34
  %.val.i.i.i.i = load i64, i64* %35, align 8, !tbaa !524
  %36 = add nsw i64 %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %37 = getelementptr inbounds i64, i64* %9, i64 %34
  store i64 %36, i64* %37, align 8, !tbaa !524
  %38 = add nsw i32 %i.01.i, %7
  %39 = icmp slt i32 %38, %size
  br i1 %39, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.201"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.201", %"struct.Eigen::TensorEvaluator.201"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.201", %"struct.Eigen::TensorEvaluator.201"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.201", %"struct.Eigen::TensorEvaluator.201"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.201", %"struct.Eigen::TensorEvaluator.201"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %15 = load i64*, i64** %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.201", %"struct.Eigen::TensorEvaluator.201"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %17 = bitcast i32* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = trunc i64 %18 to i32
  %20 = lshr i64 %18, 32
  %21 = trunc i64 %20 to i32
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.201", %"struct.Eigen::TensorEvaluator.201"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %23 = load i32, i32* %22, align 8
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.201", %"struct.Eigen::TensorEvaluator.201"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %25 = load i32, i32* %24, align 8
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.201", %"struct.Eigen::TensorEvaluator.201"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %27 = load i64*, i64** %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.201", %"struct.Eigen::TensorEvaluator.201"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %29 = bitcast i32* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = trunc i64 %30 to i32
  %32 = lshr i64 %30, 32
  %33 = trunc i64 %32 to i32
  %34 = icmp slt i32 %5, %size
  br i1 %34, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %56, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %35 = sdiv i32 %i.01.i, %11
  %36 = srem i32 %35, %19
  %37 = mul nsw i32 %36, %13
  %38 = mul nsw i32 %35, %11
  %39 = sub nsw i32 %i.01.i, %38
  %40 = srem i32 %39, %21
  %41 = add nsw i32 %40, %37
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i64, i64* %15, i64 %42
  %.val.i.i.i.i.i.i = load i64, i64* %43, align 8, !tbaa !524
  %44 = sdiv i32 %i.01.i, %23
  %45 = srem i32 %44, %31
  %46 = mul nsw i32 %45, %25
  %47 = mul nsw i32 %44, %23
  %48 = sub nsw i32 %i.01.i, %47
  %49 = srem i32 %48, %33
  %50 = add nsw i32 %49, %46
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i64, i64* %27, i64 %51
  %.val.i.i.i1.i.i.i = load i64, i64* %52, align 8, !tbaa !524
  %53 = add nsw i64 %.val.i.i.i1.i.i.i, %.val.i.i.i.i.i.i
  %54 = sext i32 %i.01.i to i64
  %55 = getelementptr inbounds i64, i64* %9, i64 %54
  store i64 %53, i64* %55, align 8, !tbaa !524
  %56 = add nsw i32 %i.01.i, %7
  %57 = icmp slt i32 %56, %size
  br i1 %57, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.203"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.203", %"struct.Eigen::TensorEvaluator.203"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.203", %"struct.Eigen::TensorEvaluator.203"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load i64*, i64** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.203", %"struct.Eigen::TensorEvaluator.203"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.203", %"struct.Eigen::TensorEvaluator.203"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %15 = load i32, i32* %14, align 8
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.203", %"struct.Eigen::TensorEvaluator.203"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %17 = bitcast i32* %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = trunc i64 %18 to i32
  %20 = lshr i64 %18, 32
  %21 = trunc i64 %20 to i32
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.203", %"struct.Eigen::TensorEvaluator.203"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %23 = load i64*, i64** %22, align 8
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.203", %"struct.Eigen::TensorEvaluator.203"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %25 = bitcast i32* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = trunc i64 %26 to i32
  %28 = lshr i64 %26, 32
  %29 = trunc i64 %28 to i32
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.203", %"struct.Eigen::TensorEvaluator.203"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %31 = load i32, i32* %30, align 8
  %32 = icmp slt i32 %5, %size
  br i1 %32, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %52, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %33 = sext i32 %i.01.i to i64
  %34 = getelementptr inbounds i64, i64* %11, i64 %33
  %.val.i.i.i.i = load i64, i64* %34, align 8, !tbaa !524
  %35 = sdiv i32 %i.01.i, %13
  %36 = srem i32 %35, %27
  %37 = mul nsw i32 %36, %19
  %38 = mul nsw i32 %35, %13
  %39 = sub nsw i32 %i.01.i, %38
  %40 = sdiv i32 %39, %15
  %41 = srem i32 %40, %29
  %42 = mul nsw i32 %41, %21
  %43 = add nsw i32 %42, %37
  %44 = mul nsw i32 %40, %15
  %45 = sub nsw i32 %39, %44
  %46 = srem i32 %45, %31
  %47 = add nsw i32 %43, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i64, i64* %23, i64 %48
  %.val.i.i.i.i.i.i = load i64, i64* %49, align 8, !tbaa !524
  %50 = add nsw i64 %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %51 = getelementptr inbounds i64, i64* %9, i64 %33
  store i64 %50, i64* %51, align 8, !tbaa !524
  %52 = add nsw i32 %i.01.i, %7
  %53 = icmp slt i32 %52, %size
  br i1 %53, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.208"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.208", %"struct.Eigen::TensorEvaluator.208"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.208", %"struct.Eigen::TensorEvaluator.208"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.208", %"struct.Eigen::TensorEvaluator.208"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.208", %"struct.Eigen::TensorEvaluator.208"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %15 = bitcast i32* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = trunc i64 %16 to i32
  %18 = lshr i64 %16, 32
  %19 = trunc i64 %18 to i32
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.208", %"struct.Eigen::TensorEvaluator.208"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %21 = load i64*, i64** %20, align 8
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.208", %"struct.Eigen::TensorEvaluator.208"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %23 = bitcast i32* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = trunc i64 %24 to i32
  %26 = lshr i64 %24, 32
  %27 = trunc i64 %26 to i32
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.208", %"struct.Eigen::TensorEvaluator.208"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %29 = load i32, i32* %28, align 8
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.208", %"struct.Eigen::TensorEvaluator.208"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %31 = load i64*, i64** %30, align 8
  %32 = icmp slt i32 %5, %size
  br i1 %32, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %52, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %33 = sdiv i32 %i.01.i, %11
  %34 = srem i32 %33, %25
  %35 = mul nsw i32 %34, %17
  %36 = mul nsw i32 %33, %11
  %37 = sub nsw i32 %i.01.i, %36
  %38 = sdiv i32 %37, %13
  %39 = srem i32 %38, %27
  %40 = mul nsw i32 %39, %19
  %41 = add nsw i32 %40, %35
  %42 = mul nsw i32 %38, %13
  %43 = sub nsw i32 %37, %42
  %44 = srem i32 %43, %29
  %45 = add nsw i32 %41, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i64, i64* %21, i64 %46
  %.val.i.i.i.i.i.i = load i64, i64* %47, align 8, !tbaa !524
  %48 = sext i32 %i.01.i to i64
  %49 = getelementptr inbounds i64, i64* %31, i64 %48
  %.val.i.i.i.i = load i64, i64* %49, align 8, !tbaa !524
  %50 = add nsw i64 %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %51 = getelementptr inbounds i64, i64* %9, i64 %48
  store i64 %50, i64* %51, align 8, !tbaa !524
  %52 = add nsw i32 %i.01.i, %7
  %53 = icmp slt i32 %52, %size
  br i1 %53, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.210"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %15 = bitcast i32* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = trunc i64 %16 to i32
  %18 = lshr i64 %16, 32
  %19 = trunc i64 %18 to i32
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %21 = load i64*, i64** %20, align 8
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %23 = bitcast i32* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = trunc i64 %24 to i32
  %26 = lshr i64 %24, 32
  %27 = trunc i64 %26 to i32
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %29 = load i32, i32* %28, align 8
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %31 = load i32, i32* %30, align 4
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %33 = load i32, i32* %32, align 8
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %35 = bitcast i32* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = trunc i64 %36 to i32
  %38 = lshr i64 %36, 32
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %41 = load i64*, i64** %40, align 8
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %43 = bitcast i32* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = trunc i64 %44 to i32
  %46 = lshr i64 %44, 32
  %47 = trunc i64 %46 to i32
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.210", %"struct.Eigen::TensorEvaluator.210"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %49 = load i32, i32* %48, align 8
  %50 = icmp slt i32 %5, %size
  br i1 %50, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %84, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %51 = sdiv i32 %i.01.i, %11
  %52 = srem i32 %51, %25
  %53 = mul nsw i32 %52, %17
  %54 = mul nsw i32 %51, %11
  %55 = sub nsw i32 %i.01.i, %54
  %56 = sdiv i32 %55, %13
  %57 = srem i32 %56, %27
  %58 = mul nsw i32 %57, %19
  %59 = add nsw i32 %58, %53
  %60 = mul nsw i32 %56, %13
  %61 = sub nsw i32 %55, %60
  %62 = srem i32 %61, %29
  %63 = add nsw i32 %59, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i64, i64* %21, i64 %64
  %.val.i.i.i.i.i.i = load i64, i64* %65, align 8, !tbaa !524
  %66 = sdiv i32 %i.01.i, %31
  %67 = srem i32 %66, %45
  %68 = mul nsw i32 %67, %37
  %69 = mul nsw i32 %66, %31
  %70 = sub nsw i32 %i.01.i, %69
  %71 = sdiv i32 %70, %33
  %72 = srem i32 %71, %47
  %73 = mul nsw i32 %72, %39
  %74 = add nsw i32 %73, %68
  %75 = mul nsw i32 %71, %33
  %76 = sub nsw i32 %70, %75
  %77 = srem i32 %76, %49
  %78 = add nsw i32 %74, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i64, i64* %41, i64 %79
  %.val.i.i.i1.i.i.i = load i64, i64* %80, align 8, !tbaa !524
  %81 = add nsw i64 %.val.i.i.i1.i.i.i, %.val.i.i.i.i.i.i
  %82 = sext i32 %i.01.i to i64
  %83 = getelementptr inbounds i64, i64* %9, i64 %82
  store i64 %81, i64* %83, align 8, !tbaa !524
  %84 = add nsw i32 %i.01.i, %7
  %85 = icmp slt i32 %84, %size
  br i1 %85, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.212"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.212", %"struct.Eigen::TensorEvaluator.212"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.212", %"struct.Eigen::TensorEvaluator.212"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load i64*, i64** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.212", %"struct.Eigen::TensorEvaluator.212"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %13 = bitcast i32* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = trunc i64 %14 to i32
  %16 = lshr i64 %14, 32
  %17 = trunc i64 %16 to i32
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.212", %"struct.Eigen::TensorEvaluator.212"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 2
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.212", %"struct.Eigen::TensorEvaluator.212"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %21 = bitcast i32* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = trunc i64 %22 to i32
  %24 = lshr i64 %22, 32
  %25 = trunc i64 %24 to i32
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.212", %"struct.Eigen::TensorEvaluator.212"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %27 = load i32, i32* %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.212", %"struct.Eigen::TensorEvaluator.212"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %29 = load i64*, i64** %28, align 8
  %30 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.212", %"struct.Eigen::TensorEvaluator.212"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %31 = bitcast i32* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = trunc i64 %32 to i32
  %34 = lshr i64 %32, 32
  %35 = trunc i64 %34 to i32
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.212", %"struct.Eigen::TensorEvaluator.212"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %37 = bitcast i32* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %38, 32
  %41 = trunc i64 %40 to i32
  %42 = icmp slt i32 %5, %size
  br i1 %42, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %68, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %43 = sext i32 %i.01.i to i64
  %44 = getelementptr inbounds i64, i64* %11, i64 %43
  %.val.i.i.i.i = load i64, i64* %44, align 8, !tbaa !524
  %45 = sdiv i32 %i.01.i, %15
  %46 = srem i32 %45, %33
  %47 = mul nsw i32 %46, %23
  %48 = mul nsw i32 %45, %15
  %49 = sub nsw i32 %i.01.i, %48
  %50 = sdiv i32 %49, %17
  %51 = srem i32 %50, %35
  %52 = mul nsw i32 %51, %25
  %53 = add nsw i32 %52, %47
  %54 = mul nsw i32 %50, %17
  %55 = sub nsw i32 %49, %54
  %56 = sdiv i32 %55, %19
  %57 = srem i32 %56, %39
  %58 = mul nsw i32 %57, %27
  %59 = add nsw i32 %53, %58
  %60 = mul nsw i32 %56, %19
  %61 = sub nsw i32 %55, %60
  %62 = srem i32 %61, %41
  %63 = add nsw i32 %59, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i64, i64* %29, i64 %64
  %.val.i.i.i.i.i.i = load i64, i64* %65, align 8, !tbaa !524
  %66 = add nsw i64 %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %67 = getelementptr inbounds i64, i64* %9, i64 %43
  store i64 %66, i64* %67, align 8, !tbaa !524
  %68 = add nsw i32 %i.01.i, %7
  %69 = icmp slt i32 %68, %size
  br i1 %69, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.217"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.217", %"struct.Eigen::TensorEvaluator.217"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.217", %"struct.Eigen::TensorEvaluator.217"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = bitcast i32* %10 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = trunc i64 %12 to i32
  %14 = lshr i64 %12, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.217", %"struct.Eigen::TensorEvaluator.217"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 2
  %17 = load i32, i32* %16, align 8
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.217", %"struct.Eigen::TensorEvaluator.217"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %19 = bitcast i32* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = trunc i64 %20 to i32
  %22 = lshr i64 %20, 32
  %23 = trunc i64 %22 to i32
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.217", %"struct.Eigen::TensorEvaluator.217"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %25 = load i32, i32* %24, align 8
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.217", %"struct.Eigen::TensorEvaluator.217"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %27 = load i64*, i64** %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.217", %"struct.Eigen::TensorEvaluator.217"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %29 = bitcast i32* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = trunc i64 %30 to i32
  %32 = lshr i64 %30, 32
  %33 = trunc i64 %32 to i32
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.217", %"struct.Eigen::TensorEvaluator.217"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %35 = bitcast i32* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = trunc i64 %36 to i32
  %38 = lshr i64 %36, 32
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.217", %"struct.Eigen::TensorEvaluator.217"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %41 = load i64*, i64** %40, align 8
  %42 = icmp slt i32 %5, %size
  br i1 %42, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %68, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %43 = sdiv i32 %i.01.i, %13
  %44 = srem i32 %43, %31
  %45 = mul nsw i32 %44, %21
  %46 = mul nsw i32 %43, %13
  %47 = sub nsw i32 %i.01.i, %46
  %48 = sdiv i32 %47, %15
  %49 = srem i32 %48, %33
  %50 = mul nsw i32 %49, %23
  %51 = add nsw i32 %50, %45
  %52 = mul nsw i32 %48, %15
  %53 = sub nsw i32 %47, %52
  %54 = sdiv i32 %53, %17
  %55 = srem i32 %54, %37
  %56 = mul nsw i32 %55, %25
  %57 = add nsw i32 %51, %56
  %58 = mul nsw i32 %54, %17
  %59 = sub nsw i32 %53, %58
  %60 = srem i32 %59, %39
  %61 = add nsw i32 %57, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i64, i64* %27, i64 %62
  %.val.i.i.i.i.i.i = load i64, i64* %63, align 8, !tbaa !524
  %64 = sext i32 %i.01.i to i64
  %65 = getelementptr inbounds i64, i64* %41, i64 %64
  %.val.i.i.i.i = load i64, i64* %65, align 8, !tbaa !524
  %66 = add nsw i64 %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %67 = getelementptr inbounds i64, i64* %9, i64 %64
  store i64 %66, i64* %67, align 8, !tbaa !524
  %68 = add nsw i32 %i.01.i, %7
  %69 = icmp slt i32 %68, %size
  br i1 %69, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.219"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = bitcast i32* %10 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = trunc i64 %12 to i32
  %14 = lshr i64 %12, 32
  %15 = trunc i64 %14 to i32
  %16 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 2
  %17 = load i32, i32* %16, align 8
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %19 = bitcast i32* %18 to i64*
  %20 = load i64, i64* %19, align 8
  %21 = trunc i64 %20 to i32
  %22 = lshr i64 %20, 32
  %23 = trunc i64 %22 to i32
  %24 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %25 = load i32, i32* %24, align 8
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %27 = load i64*, i64** %26, align 8
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %29 = bitcast i32* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = trunc i64 %30 to i32
  %32 = lshr i64 %30, 32
  %33 = trunc i64 %32 to i32
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %35 = bitcast i32* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = trunc i64 %36 to i32
  %38 = lshr i64 %36, 32
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %41 = bitcast i32* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = trunc i64 %42 to i32
  %44 = lshr i64 %42, 32
  %45 = trunc i64 %44 to i32
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 2
  %47 = load i32, i32* %46, align 8
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %49 = bitcast i32* %48 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = trunc i64 %50 to i32
  %52 = lshr i64 %50, 32
  %53 = trunc i64 %52 to i32
  %54 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %55 = load i32, i32* %54, align 8
  %56 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %57 = load i64*, i64** %56, align 8
  %58 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %59 = bitcast i32* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = trunc i64 %62 to i32
  %64 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.219", %"struct.Eigen::TensorEvaluator.219"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %65 = bitcast i32* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = trunc i64 %66 to i32
  %68 = lshr i64 %66, 32
  %69 = trunc i64 %68 to i32
  %70 = icmp slt i32 %5, %size
  br i1 %70, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %116, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %71 = sdiv i32 %i.01.i, %13
  %72 = srem i32 %71, %31
  %73 = mul nsw i32 %72, %21
  %74 = mul nsw i32 %71, %13
  %75 = sub nsw i32 %i.01.i, %74
  %76 = sdiv i32 %75, %15
  %77 = srem i32 %76, %33
  %78 = mul nsw i32 %77, %23
  %79 = add nsw i32 %78, %73
  %80 = mul nsw i32 %76, %15
  %81 = sub nsw i32 %75, %80
  %82 = sdiv i32 %81, %17
  %83 = srem i32 %82, %37
  %84 = mul nsw i32 %83, %25
  %85 = add nsw i32 %79, %84
  %86 = mul nsw i32 %82, %17
  %87 = sub nsw i32 %81, %86
  %88 = srem i32 %87, %39
  %89 = add nsw i32 %85, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i64, i64* %27, i64 %90
  %.val.i.i.i.i.i.i = load i64, i64* %91, align 8, !tbaa !524
  %92 = sdiv i32 %i.01.i, %43
  %93 = srem i32 %92, %61
  %94 = mul nsw i32 %93, %51
  %95 = mul nsw i32 %92, %43
  %96 = sub nsw i32 %i.01.i, %95
  %97 = sdiv i32 %96, %45
  %98 = srem i32 %97, %63
  %99 = mul nsw i32 %98, %53
  %100 = add nsw i32 %99, %94
  %101 = mul nsw i32 %97, %45
  %102 = sub nsw i32 %96, %101
  %103 = sdiv i32 %102, %47
  %104 = srem i32 %103, %67
  %105 = mul nsw i32 %104, %55
  %106 = add nsw i32 %100, %105
  %107 = mul nsw i32 %103, %47
  %108 = sub nsw i32 %102, %107
  %109 = srem i32 %108, %69
  %110 = add nsw i32 %106, %109
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds i64, i64* %57, i64 %111
  %.val.i.i.i1.i.i.i = load i64, i64* %112, align 8, !tbaa !524
  %113 = add nsw i64 %.val.i.i.i1.i.i.i, %.val.i.i.i.i.i.i
  %114 = sext i32 %i.01.i to i64
  %115 = getelementptr inbounds i64, i64* %9, i64 %114
  store i64 %113, i64* %115, align 8, !tbaa !524
  %116 = add nsw i32 %i.01.i, %7
  %117 = icmp slt i32 %116, %size
  br i1 %117, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.221"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 1, i32 1, i32 0
  %11 = load i64*, i64** %10, align 8
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %13 = load i32, i32* %12, align 4
  %14 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %15 = bitcast i32* %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = trunc i64 %16 to i32
  %18 = lshr i64 %16, 32
  %19 = trunc i64 %18 to i32
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 3
  %21 = load i32, i32* %20, align 8
  %22 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %23 = bitcast i32* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = trunc i64 %24 to i32
  %26 = lshr i64 %24, 32
  %27 = trunc i64 %26 to i32
  %28 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %29 = bitcast i32* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = trunc i64 %30 to i32
  %32 = lshr i64 %30, 32
  %33 = trunc i64 %32 to i32
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %35 = load i64*, i64** %34, align 8
  %36 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %37 = bitcast i32* %36 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %38, 32
  %41 = trunc i64 %40 to i32
  %42 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %43 = bitcast i32* %42 to i64*
  %44 = load i64, i64* %43, align 8
  %45 = trunc i64 %44 to i32
  %46 = lshr i64 %44, 32
  %47 = trunc i64 %46 to i32
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.221", %"struct.Eigen::TensorEvaluator.221"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 4
  %49 = load i32, i32* %48, align 8
  %50 = icmp slt i32 %5, %size
  br i1 %50, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %82, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %51 = sext i32 %i.01.i to i64
  %52 = getelementptr inbounds i64, i64* %11, i64 %51
  %.val.i.i.i.i = load i64, i64* %52, align 8, !tbaa !524
  %53 = sdiv i32 %i.01.i, %13
  %54 = srem i32 %53, %39
  %55 = mul nsw i32 %54, %25
  %56 = mul nsw i32 %53, %13
  %57 = sub nsw i32 %i.01.i, %56
  %58 = sdiv i32 %57, %17
  %59 = srem i32 %58, %41
  %60 = mul nsw i32 %59, %27
  %61 = add nsw i32 %60, %55
  %62 = mul nsw i32 %58, %17
  %63 = sub nsw i32 %57, %62
  %64 = sdiv i32 %63, %19
  %65 = srem i32 %64, %45
  %66 = mul nsw i32 %65, %31
  %67 = add nsw i32 %61, %66
  %68 = mul nsw i32 %64, %19
  %69 = sub nsw i32 %63, %68
  %70 = sdiv i32 %69, %21
  %71 = srem i32 %70, %47
  %72 = mul nsw i32 %71, %33
  %73 = add nsw i32 %67, %72
  %74 = mul nsw i32 %70, %21
  %75 = sub nsw i32 %69, %74
  %76 = srem i32 %75, %49
  %77 = add nsw i32 %73, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds i64, i64* %35, i64 %78
  %.val.i.i.i.i.i.i = load i64, i64* %79, align 8, !tbaa !524
  %80 = add nsw i64 %.val.i.i.i.i.i.i, %.val.i.i.i.i
  %81 = getelementptr inbounds i64, i64* %9, i64 %51
  store i64 %80, i64* %81, align 8, !tbaa !524
  %82 = add nsw i32 %i.01.i, %7
  %83 = icmp slt i32 %82, %size
  br i1 %83, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.226"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %13 = bitcast i32* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = trunc i64 %14 to i32
  %16 = lshr i64 %14, 32
  %17 = trunc i64 %16 to i32
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 3
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %21 = bitcast i32* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = trunc i64 %22 to i32
  %24 = lshr i64 %22, 32
  %25 = trunc i64 %24 to i32
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %27 = bitcast i32* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = trunc i64 %28 to i32
  %30 = lshr i64 %28, 32
  %31 = trunc i64 %30 to i32
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %33 = load i64*, i64** %32, align 8
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %35 = bitcast i32* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = trunc i64 %36 to i32
  %38 = lshr i64 %36, 32
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %41 = bitcast i32* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = trunc i64 %42 to i32
  %44 = lshr i64 %42, 32
  %45 = trunc i64 %44 to i32
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 4
  %47 = load i32, i32* %46, align 8
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.226", %"struct.Eigen::TensorEvaluator.226"* %memcopied_eval, i64 0, i32 1, i32 2, i32 0
  %49 = load i64*, i64** %48, align 8
  %50 = icmp slt i32 %5, %size
  br i1 %50, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %82, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %51 = sdiv i32 %i.01.i, %11
  %52 = srem i32 %51, %37
  %53 = mul nsw i32 %52, %23
  %54 = mul nsw i32 %51, %11
  %55 = sub nsw i32 %i.01.i, %54
  %56 = sdiv i32 %55, %15
  %57 = srem i32 %56, %39
  %58 = mul nsw i32 %57, %25
  %59 = add nsw i32 %58, %53
  %60 = mul nsw i32 %56, %15
  %61 = sub nsw i32 %55, %60
  %62 = sdiv i32 %61, %17
  %63 = srem i32 %62, %43
  %64 = mul nsw i32 %63, %29
  %65 = add nsw i32 %59, %64
  %66 = mul nsw i32 %62, %17
  %67 = sub nsw i32 %61, %66
  %68 = sdiv i32 %67, %19
  %69 = srem i32 %68, %45
  %70 = mul nsw i32 %69, %31
  %71 = add nsw i32 %65, %70
  %72 = mul nsw i32 %68, %19
  %73 = sub nsw i32 %67, %72
  %74 = srem i32 %73, %47
  %75 = add nsw i32 %71, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i64, i64* %33, i64 %76
  %.val.i.i.i.i.i.i = load i64, i64* %77, align 8, !tbaa !524
  %78 = sext i32 %i.01.i to i64
  %79 = getelementptr inbounds i64, i64* %49, i64 %78
  %.val.i.i.i.i = load i64, i64* %79, align 8, !tbaa !524
  %80 = add nsw i64 %.val.i.i.i.i, %.val.i.i.i.i.i.i
  %81 = getelementptr inbounds i64, i64* %9, i64 %78
  store i64 %80, i64* %81, align 8, !tbaa !524
  %82 = add nsw i32 %i.01.i, %7
  %83 = icmp slt i32 %82, %size
  br i1 %83, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

; Function Attrs: norecurse nounwind
define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.228"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
  %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
  %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
  %3 = mul i32 %2, %1
  %4 = tail call i32 @llvm.ptx.read.tid.x() #6
  %5 = add i32 %3, %4
  %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
  %7 = mul i32 %6, %2
  %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 0, i32 0
  %9 = load i64*, i64** %8, align 8
  %10 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 0
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 1
  %13 = bitcast i32* %12 to i64*
  %14 = load i64, i64* %13, align 8
  %15 = trunc i64 %14 to i32
  %16 = lshr i64 %14, 32
  %17 = trunc i64 %16 to i32
  %18 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 1, i32 1, i32 0, i64 3
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 0
  %21 = bitcast i32* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = trunc i64 %22 to i32
  %24 = lshr i64 %22, 32
  %25 = trunc i64 %24 to i32
  %26 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 1, i32 2, i32 0, i64 2
  %27 = bitcast i32* %26 to i64*
  %28 = load i64, i64* %27, align 8
  %29 = trunc i64 %28 to i32
  %30 = lshr i64 %28, 32
  %31 = trunc i64 %30 to i32
  %32 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 0
  %33 = load i64*, i64** %32, align 8
  %34 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 0
  %35 = bitcast i32* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = trunc i64 %36 to i32
  %38 = lshr i64 %36, 32
  %39 = trunc i64 %38 to i32
  %40 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 2
  %41 = bitcast i32* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = trunc i64 %42 to i32
  %44 = lshr i64 %42, 32
  %45 = trunc i64 %44 to i32
  %46 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 1, i32 3, i32 1, i32 0, i32 0, i64 4
  %47 = load i32, i32* %46, align 8
  %48 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 0
  %49 = load i32, i32* %48, align 4
  %50 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 1
  %51 = bitcast i32* %50 to i64*
  %52 = load i64, i64* %51, align 8
  %53 = trunc i64 %52 to i32
  %54 = lshr i64 %52, 32
  %55 = trunc i64 %54 to i32
  %56 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 2, i32 1, i32 0, i64 3
  %57 = load i32, i32* %56, align 8
  %58 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 0
  %59 = bitcast i32* %58 to i64*
  %60 = load i64, i64* %59, align 8
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = trunc i64 %62 to i32
  %64 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 2, i32 2, i32 0, i64 2
  %65 = bitcast i32* %64 to i64*
  %66 = load i64, i64* %65, align 8
  %67 = trunc i64 %66 to i32
  %68 = lshr i64 %66, 32
  %69 = trunc i64 %68 to i32
  %70 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 0
  %71 = load i64*, i64** %70, align 8
  %72 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 0
  %73 = bitcast i32* %72 to i64*
  %74 = load i64, i64* %73, align 8
  %75 = trunc i64 %74 to i32
  %76 = lshr i64 %74, 32
  %77 = trunc i64 %76 to i32
  %78 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 2
  %79 = bitcast i32* %78 to i64*
  %80 = load i64, i64* %79, align 8
  %81 = trunc i64 %80 to i32
  %82 = lshr i64 %80, 32
  %83 = trunc i64 %82 to i32
  %84 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.228", %"struct.Eigen::TensorEvaluator.228"* %memcopied_eval, i64 0, i32 1, i32 2, i32 3, i32 1, i32 0, i32 0, i64 4
  %85 = load i32, i32* %84, align 8
  %86 = icmp slt i32 %5, %size
  br i1 %86, label %.lr.ph.i.preheader, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

.lr.ph.i.preheader:                               ; preds = %0
  br label %.lr.ph.i

.lr.ph.i:                                         ; preds = %.lr.ph.i.preheader, %.lr.ph.i
  %i.01.i = phi i32 [ %144, %.lr.ph.i ], [ %5, %.lr.ph.i.preheader ]
  %87 = sdiv i32 %i.01.i, %11
  %88 = srem i32 %87, %37
  %89 = mul nsw i32 %88, %23
  %90 = mul nsw i32 %87, %11
  %91 = sub nsw i32 %i.01.i, %90
  %92 = sdiv i32 %91, %15
  %93 = srem i32 %92, %39
  %94 = mul nsw i32 %93, %25
  %95 = add nsw i32 %94, %89
  %96 = mul nsw i32 %92, %15
  %97 = sub nsw i32 %91, %96
  %98 = sdiv i32 %97, %17
  %99 = srem i32 %98, %43
  %100 = mul nsw i32 %99, %29
  %101 = add nsw i32 %95, %100
  %102 = mul nsw i32 %98, %17
  %103 = sub nsw i32 %97, %102
  %104 = sdiv i32 %103, %19
  %105 = srem i32 %104, %45
  %106 = mul nsw i32 %105, %31
  %107 = add nsw i32 %101, %106
  %108 = mul nsw i32 %104, %19
  %109 = sub nsw i32 %103, %108
  %110 = srem i32 %109, %47
  %111 = add nsw i32 %107, %110
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i64, i64* %33, i64 %112
  %.val.i.i.i.i = load i64, i64* %113, align 8, !tbaa !524
  %114 = sdiv i32 %i.01.i, %49
  %115 = srem i32 %114, %75
  %116 = mul nsw i32 %115, %61
  %117 = mul nsw i32 %114, %49
  %118 = sub nsw i32 %i.01.i, %117
  %119 = sdiv i32 %118, %53
  %120 = srem i32 %119, %77
  %121 = mul nsw i32 %120, %63
  %122 = add nsw i32 %121, %116
  %123 = mul nsw i32 %119, %53
  %124 = sub nsw i32 %118, %123
  %125 = sdiv i32 %124, %55
  %126 = srem i32 %125, %81
  %127 = mul nsw i32 %126, %67
  %128 = add nsw i32 %122, %127
  %129 = mul nsw i32 %125, %55
  %130 = sub nsw i32 %124, %129
  %131 = sdiv i32 %130, %57
  %132 = srem i32 %131, %83
  %133 = mul nsw i32 %132, %69
  %134 = add nsw i32 %128, %133
  %135 = mul nsw i32 %131, %57
  %136 = sub nsw i32 %130, %135
  %137 = srem i32 %136, %85
  %138 = add nsw i32 %134, %137
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds i64, i64* %71, i64 %139
  %.val.i.i.i1.i = load i64, i64* %140, align 8, !tbaa !524
  %141 = add nsw i64 %.val.i.i.i1.i, %.val.i.i.i.i
  %142 = sext i32 %i.01.i to i64
  %143 = getelementptr inbounds i64, i64* %9, i64 %142
  store i64 %141, i64* %143, align 8, !tbaa !524
  %144 = add nsw i32 %i.01.i, %7
  %145 = icmp slt i32 %144, %size
  br i1 %145, label %.lr.ph.i, label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit: ; preds = %.lr.ph.i
  br label %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit

_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit: ; preds = %_ZN5Eigen8internal19EigenMetaKernelEvalINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiLb0EE3runERSQ_iii.exit.loopexit, %0
  ret void
}

attributes #0 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind readnone }
attributes #4 = { inlinehint norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint norecurse nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="sm_30" "target-features"="+ptx42" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!nvvm.annotations = !{!0, !1, !2, !3, !4, !5, !6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !144, !146, !146, !146, !146, !147, !147, !146}
!llvm.ident = !{!148}
!nvvm.internalize.after.link = !{}
!nvvmir.version = !{!149}

!0 = !{void (%"struct.Eigen::TensorEvaluator"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!1 = !{void (%"struct.Eigen::TensorEvaluator"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS4_INS5_ISC_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!2 = !{void (%"struct.Eigen::TensorEvaluator.6"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!3 = !{void (%"struct.Eigen::TensorEvaluator.6"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!4 = !{void (%"struct.Eigen::TensorEvaluator.8"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!5 = !{void (%"struct.Eigen::TensorEvaluator.8"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!6 = !{void (%"struct.Eigen::TensorEvaluator.10"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!7 = !{void (%"struct.Eigen::TensorEvaluator.10"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!8 = !{void (%"struct.Eigen::TensorEvaluator.13"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!9 = !{void (%"struct.Eigen::TensorEvaluator.13"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!10 = !{void (%"struct.Eigen::TensorEvaluator.15"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!11 = !{void (%"struct.Eigen::TensorEvaluator.15"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!12 = !{void (%"struct.Eigen::TensorEvaluator.17"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!13 = !{void (%"struct.Eigen::TensorEvaluator.17"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!14 = !{void (%"struct.Eigen::TensorEvaluator.24"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!15 = !{void (%"struct.Eigen::TensorEvaluator.24"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!16 = !{void (%"struct.Eigen::TensorEvaluator.26"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!17 = !{void (%"struct.Eigen::TensorEvaluator.26"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKS6_Li2ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!18 = !{void (%"struct.Eigen::TensorEvaluator.28"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!19 = !{void (%"struct.Eigen::TensorEvaluator.28"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!20 = !{void (%"struct.Eigen::TensorEvaluator.35"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!21 = !{void (%"struct.Eigen::TensorEvaluator.35"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!22 = !{void (%"struct.Eigen::TensorEvaluator.37"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!23 = !{void (%"struct.Eigen::TensorEvaluator.37"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKS6_Li3ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!24 = !{void (%"struct.Eigen::TensorEvaluator.39"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!25 = !{void (%"struct.Eigen::TensorEvaluator.39"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!26 = !{void (%"struct.Eigen::TensorEvaluator.46"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!27 = !{void (%"struct.Eigen::TensorEvaluator.46"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!28 = !{void (%"struct.Eigen::TensorEvaluator.48"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!29 = !{void (%"struct.Eigen::TensorEvaluator.48"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKS6_Li4ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!30 = !{void (%"struct.Eigen::TensorEvaluator.50"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!31 = !{void (%"struct.Eigen::TensorEvaluator.50"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESF_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!32 = !{void (%"struct.Eigen::TensorEvaluator.57"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!33 = !{void (%"struct.Eigen::TensorEvaluator.57"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESJ_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!34 = !{void (%"struct.Eigen::TensorEvaluator.59"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!35 = !{void (%"struct.Eigen::TensorEvaluator.59"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIS6_S6_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKS6_Li5ELi1EiEELi16EEEEESL_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!36 = !{void (%"struct.Eigen::TensorEvaluator.61"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!37 = !{void (%"struct.Eigen::TensorEvaluator.61"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!38 = !{void (%"struct.Eigen::TensorEvaluator.68"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!39 = !{void (%"struct.Eigen::TensorEvaluator.68"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!40 = !{void (%"struct.Eigen::TensorEvaluator.71"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!41 = !{void (%"struct.Eigen::TensorEvaluator.71"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIffNS0_13scalar_sum_opIffEEEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!42 = !{void (%"struct.Eigen::TensorEvaluator.74"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!43 = !{void (%"struct.Eigen::TensorEvaluator.74"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!44 = !{void (%"struct.Eigen::TensorEvaluator.77"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!45 = !{void (%"struct.Eigen::TensorEvaluator.77"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!46 = !{void (%"struct.Eigen::TensorEvaluator.79"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!47 = !{void (%"struct.Eigen::TensorEvaluator.79"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKfLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!48 = !{void (%"struct.Eigen::TensorEvaluator.81"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!49 = !{void (%"struct.Eigen::TensorEvaluator.81"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!50 = !{void (%"struct.Eigen::TensorEvaluator.86"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!51 = !{void (%"struct.Eigen::TensorEvaluator.86"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!52 = !{void (%"struct.Eigen::TensorEvaluator.88"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!53 = !{void (%"struct.Eigen::TensorEvaluator.88"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKfLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!54 = !{void (%"struct.Eigen::TensorEvaluator.90"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!55 = !{void (%"struct.Eigen::TensorEvaluator.90"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!56 = !{void (%"struct.Eigen::TensorEvaluator.95"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!57 = !{void (%"struct.Eigen::TensorEvaluator.95"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!58 = !{void (%"struct.Eigen::TensorEvaluator.97"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!59 = !{void (%"struct.Eigen::TensorEvaluator.97"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKfLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!60 = !{void (%"struct.Eigen::TensorEvaluator.99"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!61 = !{void (%"struct.Eigen::TensorEvaluator.99"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!62 = !{void (%"struct.Eigen::TensorEvaluator.104"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!63 = !{void (%"struct.Eigen::TensorEvaluator.104"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!64 = !{void (%"struct.Eigen::TensorEvaluator.106"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!65 = !{void (%"struct.Eigen::TensorEvaluator.106"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKfLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!66 = !{void (%"struct.Eigen::TensorEvaluator.108"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!67 = !{void (%"struct.Eigen::TensorEvaluator.108"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!68 = !{void (%"struct.Eigen::TensorEvaluator.113"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!69 = !{void (%"struct.Eigen::TensorEvaluator.113"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!70 = !{void (%"struct.Eigen::TensorEvaluator.115"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!71 = !{void (%"struct.Eigen::TensorEvaluator.115"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIffEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKfLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!72 = !{void (%"struct.Eigen::TensorEvaluator.117"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!73 = !{void (%"struct.Eigen::TensorEvaluator.117"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!74 = !{void (%"struct.Eigen::TensorEvaluator.125"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!75 = !{void (%"struct.Eigen::TensorEvaluator.125"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!76 = !{void (%"struct.Eigen::TensorEvaluator.128"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!77 = !{void (%"struct.Eigen::TensorEvaluator.128"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIddNS0_13scalar_sum_opIddEEEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!78 = !{void (%"struct.Eigen::TensorEvaluator.131"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!79 = !{void (%"struct.Eigen::TensorEvaluator.131"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!80 = !{void (%"struct.Eigen::TensorEvaluator.134"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!81 = !{void (%"struct.Eigen::TensorEvaluator.134"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!82 = !{void (%"struct.Eigen::TensorEvaluator.136"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!83 = !{void (%"struct.Eigen::TensorEvaluator.136"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKdLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!84 = !{void (%"struct.Eigen::TensorEvaluator.138"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!85 = !{void (%"struct.Eigen::TensorEvaluator.138"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!86 = !{void (%"struct.Eigen::TensorEvaluator.143"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!87 = !{void (%"struct.Eigen::TensorEvaluator.143"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!88 = !{void (%"struct.Eigen::TensorEvaluator.145"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!89 = !{void (%"struct.Eigen::TensorEvaluator.145"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKdLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!90 = !{void (%"struct.Eigen::TensorEvaluator.147"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!91 = !{void (%"struct.Eigen::TensorEvaluator.147"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!92 = !{void (%"struct.Eigen::TensorEvaluator.152"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!93 = !{void (%"struct.Eigen::TensorEvaluator.152"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!94 = !{void (%"struct.Eigen::TensorEvaluator.154"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!95 = !{void (%"struct.Eigen::TensorEvaluator.154"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKdLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!96 = !{void (%"struct.Eigen::TensorEvaluator.156"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!97 = !{void (%"struct.Eigen::TensorEvaluator.156"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!98 = !{void (%"struct.Eigen::TensorEvaluator.161"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!99 = !{void (%"struct.Eigen::TensorEvaluator.161"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!100 = !{void (%"struct.Eigen::TensorEvaluator.163"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!101 = !{void (%"struct.Eigen::TensorEvaluator.163"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKdLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!102 = !{void (%"struct.Eigen::TensorEvaluator.165"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!103 = !{void (%"struct.Eigen::TensorEvaluator.165"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!104 = !{void (%"struct.Eigen::TensorEvaluator.170"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!105 = !{void (%"struct.Eigen::TensorEvaluator.170"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!106 = !{void (%"struct.Eigen::TensorEvaluator.172"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!107 = !{void (%"struct.Eigen::TensorEvaluator.172"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIdLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIddEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKdLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!108 = !{void (%"struct.Eigen::TensorEvaluator.174"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"kernel", i32 1}
!109 = !{void (%"struct.Eigen::TensorEvaluator.174"*, i64)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS4_INS5_ISB_Li1ELi1ElEELi16EEEEEEENS_9GpuDeviceEEElEEvT_T0_, !"maxntidx", i32 1024}
!110 = !{void (%"struct.Eigen::TensorEvaluator.181"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!111 = !{void (%"struct.Eigen::TensorEvaluator.181"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!112 = !{void (%"struct.Eigen::TensorEvaluator.184"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!113 = !{void (%"struct.Eigen::TensorEvaluator.184"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_12scalar_rightIxxNS0_13scalar_sum_opIxxEEEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!114 = !{void (%"struct.Eigen::TensorEvaluator.187"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!115 = !{void (%"struct.Eigen::TensorEvaluator.187"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!116 = !{void (%"struct.Eigen::TensorEvaluator.190"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!117 = !{void (%"struct.Eigen::TensorEvaluator.190"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!118 = !{void (%"struct.Eigen::TensorEvaluator.192"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!119 = !{void (%"struct.Eigen::TensorEvaluator.192"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi1ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS4_INS5_IKxLi1ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!120 = !{void (%"struct.Eigen::TensorEvaluator.194"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!121 = !{void (%"struct.Eigen::TensorEvaluator.194"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!122 = !{void (%"struct.Eigen::TensorEvaluator.199"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!123 = !{void (%"struct.Eigen::TensorEvaluator.199"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!124 = !{void (%"struct.Eigen::TensorEvaluator.201"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!125 = !{void (%"struct.Eigen::TensorEvaluator.201"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi2ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS4_INS5_IKxLi2ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!126 = !{void (%"struct.Eigen::TensorEvaluator.203"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!127 = !{void (%"struct.Eigen::TensorEvaluator.203"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!128 = !{void (%"struct.Eigen::TensorEvaluator.208"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!129 = !{void (%"struct.Eigen::TensorEvaluator.208"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!130 = !{void (%"struct.Eigen::TensorEvaluator.210"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!131 = !{void (%"struct.Eigen::TensorEvaluator.210"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi3ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS4_INS5_IKxLi3ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!132 = !{void (%"struct.Eigen::TensorEvaluator.212"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!133 = !{void (%"struct.Eigen::TensorEvaluator.212"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!134 = !{void (%"struct.Eigen::TensorEvaluator.217"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!135 = !{void (%"struct.Eigen::TensorEvaluator.217"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!136 = !{void (%"struct.Eigen::TensorEvaluator.219"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!137 = !{void (%"struct.Eigen::TensorEvaluator.219"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi4ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS4_INS5_IKxLi4ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!138 = !{void (%"struct.Eigen::TensorEvaluator.221"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!139 = !{void (%"struct.Eigen::TensorEvaluator.221"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEESE_EEEEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!140 = !{void (%"struct.Eigen::TensorEvaluator.226"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!141 = !{void (%"struct.Eigen::TensorEvaluator.226"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESI_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!142 = !{void (%"struct.Eigen::TensorEvaluator.228"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"kernel", i32 1}
!143 = !{void (%"struct.Eigen::TensorEvaluator.228"*, i32)* @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorIxLi5ELi1EiEELi16EEEKNS_19TensorCwiseBinaryOpINS0_13scalar_sum_opIxxEEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS4_INS5_IKxLi5ELi1EiEELi16EEEEESK_EEEENS_9GpuDeviceEEEiEEvT_T0_, !"maxntidx", i32 1024}
!144 = !{null, !"align", i32 8}
!145 = !{null, !"align", i32 8, !"align", i32 65544, !"align", i32 131080}
!146 = !{null, !"align", i32 16}
!147 = !{null, !"align", i32 16, !"align", i32 65552, !"align", i32 131088}
!148 = !{!"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"}
!149 = !{i32 1, i32 2}
!150 = !{!151, !152, i64 0}
!151 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !155, i64 8, !153, i64 16}
!152 = !{!"any pointer", !153, i64 0}
!153 = !{!"omnipotent char", !154, i64 0}
!154 = !{!"Simple C/C++ TBAA"}
!155 = !{!"_ZTSN5Eigen6DSizesIiLi1EEE"}
!156 = !{!157, !158, i64 0}
!157 = !{!"_ZTSN5Eigen9half_impl6__halfE", !158, i64 0}
!158 = !{!"short", !153, i64 0}
!159 = !{!160, !152, i64 0}
!160 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !155, i64 8, !153, i64 16}
!161 = !{!162}
!162 = distinct !{!162, !163, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!163 = distinct !{!163, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!164 = !{!158, !158, i64 0}
!165 = !{!166, !152, i64 0}
!166 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1ElEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !167, i64 8, !153, i64 16}
!167 = !{!"_ZTSN5Eigen6DSizesIlLi1EEE"}
!168 = !{!169}
!169 = distinct !{!169, !170, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1ElEELi16EEENS_9GpuDeviceEE5coeffEl: %agg.result"}
!170 = distinct !{!170, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1ElEELi16EEENS_9GpuDeviceEE5coeffEl"}
!171 = !{!172, !172, i64 0}
!172 = !{!"float", !153, i64 0}
!173 = !{!174, !176}
!174 = distinct !{!174, !175, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!175 = distinct !{!175, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!176 = distinct !{!176, !177, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!177 = distinct !{!177, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!178 = !{!179, !179, i64 0}
!179 = !{!"int", !153, i64 0}
!180 = !{!153, !153, i64 0}
!181 = !{!182, !152, i64 0}
!182 = !{!"_ZTSN5Eigen8internal11scalar_leftINS_4halfES2_NS0_13scalar_sum_opIS2_S2_EEEE", !152, i64 0}
!183 = !{!184, !186}
!184 = distinct !{!184, !185, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!185 = distinct !{!185, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!186 = distinct !{!186, !187, !"_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal11scalar_leftINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!187 = distinct !{!187, !"_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal11scalar_leftINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!188 = !{!189, !191, !193, !186}
!189 = distinct !{!189, !190, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!190 = distinct !{!190, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!191 = distinct !{!191, !192, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!192 = distinct !{!192, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!193 = distinct !{!193, !194, !"_ZNK5Eigen8internal11scalar_leftINS_4halfES2_NS0_13scalar_sum_opIS2_S2_EEEclERKS2_: %agg.result"}
!194 = distinct !{!194, !"_ZNK5Eigen8internal11scalar_leftINS_4halfES2_NS0_13scalar_sum_opIS2_S2_EEEclERKS2_"}
!195 = !{!196, !152, i64 0}
!196 = !{!"_ZTSN5Eigen8internal12scalar_rightINS_4halfES2_NS0_13scalar_sum_opIS2_S2_EEEE", !152, i64 0}
!197 = !{!198, !200}
!198 = distinct !{!198, !199, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!199 = distinct !{!199, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!200 = distinct !{!200, !201, !"_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal12scalar_rightINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!201 = distinct !{!201, !"_ZNK5Eigen15TensorEvaluatorIKNS_18TensorCwiseUnaryOpINS_8internal12scalar_rightINS_4halfES4_NS2_13scalar_sum_opIS4_S4_EEEEKNS_9TensorMapINS_6TensorIKS4_Li1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!202 = !{!203, !205, !207, !200}
!203 = distinct !{!203, !204, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!204 = distinct !{!204, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!205 = distinct !{!205, !206, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!206 = distinct !{!206, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!207 = distinct !{!207, !208, !"_ZNK5Eigen8internal12scalar_rightINS_4halfES2_NS0_13scalar_sum_opIS2_S2_EEEclERKS2_: %agg.result"}
!208 = distinct !{!208, !"_ZNK5Eigen8internal12scalar_rightINS_4halfES2_NS0_13scalar_sum_opIS2_S2_EEEclERKS2_"}
!209 = !{!210}
!210 = distinct !{!210, !211, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!211 = distinct !{!211, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!212 = !{!213, !215}
!213 = distinct !{!213, !214, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!214 = distinct !{!214, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!215 = distinct !{!215, !216, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!216 = distinct !{!216, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!217 = !{!218, !213, !215}
!218 = distinct !{!218, !219, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!219 = distinct !{!219, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!220 = !{!221, !223}
!221 = distinct !{!221, !222, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!222 = distinct !{!222, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!223 = distinct !{!223, !224, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!224 = distinct !{!224, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!225 = !{!226, !228}
!226 = distinct !{!226, !227, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!227 = distinct !{!227, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!228 = distinct !{!228, !229, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!229 = distinct !{!229, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!230 = !{!231, !226, !228}
!231 = distinct !{!231, !232, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!232 = distinct !{!232, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!233 = !{!234}
!234 = distinct !{!234, !235, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!235 = distinct !{!235, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!236 = !{!237, !239}
!237 = distinct !{!237, !238, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!238 = distinct !{!238, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!239 = distinct !{!239, !240, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!240 = distinct !{!240, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!241 = !{!242, !244}
!242 = distinct !{!242, !243, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!243 = distinct !{!243, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!244 = distinct !{!244, !245, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!245 = distinct !{!245, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!246 = !{!247, !242, !244}
!247 = distinct !{!247, !248, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!248 = distinct !{!248, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!249 = !{!250, !252}
!250 = distinct !{!250, !251, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!251 = distinct !{!251, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!252 = distinct !{!252, !253, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!253 = distinct !{!253, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm1EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!254 = !{!255, !250, !252}
!255 = distinct !{!255, !256, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!256 = distinct !{!256, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi1ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!257 = !{!258, !260}
!258 = distinct !{!258, !259, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!259 = distinct !{!259, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!260 = distinct !{!260, !261, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!261 = distinct !{!261, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!262 = !{!263, !152, i64 0}
!263 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorINS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !264, i64 8, !153, i64 16}
!264 = !{!"_ZTSN5Eigen6DSizesIiLi2EEE"}
!265 = !{!266, !152, i64 0}
!266 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !264, i64 8, !153, i64 16}
!267 = !{!268}
!268 = distinct !{!268, !269, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!269 = distinct !{!269, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!270 = !{!271, !273}
!271 = distinct !{!271, !272, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!272 = distinct !{!272, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!273 = distinct !{!273, !274, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!274 = distinct !{!274, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!275 = !{!276, !271, !273}
!276 = distinct !{!276, !277, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!277 = distinct !{!277, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!278 = !{!279, !281}
!279 = distinct !{!279, !280, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!280 = distinct !{!280, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!281 = distinct !{!281, !282, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!282 = distinct !{!282, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!283 = !{!284, !286}
!284 = distinct !{!284, !285, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!285 = distinct !{!285, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!286 = distinct !{!286, !287, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!287 = distinct !{!287, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!288 = !{!289, !284, !286}
!289 = distinct !{!289, !290, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!290 = distinct !{!290, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!291 = !{!292}
!292 = distinct !{!292, !293, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!293 = distinct !{!293, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!294 = !{!295, !297}
!295 = distinct !{!295, !296, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!296 = distinct !{!296, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!297 = distinct !{!297, !298, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!298 = distinct !{!298, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!299 = !{!300, !302}
!300 = distinct !{!300, !301, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!301 = distinct !{!301, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!302 = distinct !{!302, !303, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!303 = distinct !{!303, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!304 = !{!305, !300, !302}
!305 = distinct !{!305, !306, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!306 = distinct !{!306, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!307 = !{!308, !310}
!308 = distinct !{!308, !309, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!309 = distinct !{!309, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!310 = distinct !{!310, !311, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!311 = distinct !{!311, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm2EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!312 = !{!313, !308, !310}
!313 = distinct !{!313, !314, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!314 = distinct !{!314, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi2ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!315 = !{!316, !318}
!316 = distinct !{!316, !317, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!317 = distinct !{!317, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!318 = distinct !{!318, !319, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!319 = distinct !{!319, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!320 = !{!321, !152, i64 0}
!321 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorINS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !322, i64 8, !153, i64 24}
!322 = !{!"_ZTSN5Eigen6DSizesIiLi3EEE"}
!323 = !{!324, !152, i64 0}
!324 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !322, i64 8, !153, i64 24}
!325 = !{!326}
!326 = distinct !{!326, !327, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!327 = distinct !{!327, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!328 = !{!329, !331}
!329 = distinct !{!329, !330, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!330 = distinct !{!330, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!331 = distinct !{!331, !332, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!332 = distinct !{!332, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!333 = !{!334, !329, !331}
!334 = distinct !{!334, !335, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!335 = distinct !{!335, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!336 = !{!337, !339}
!337 = distinct !{!337, !338, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!338 = distinct !{!338, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!339 = distinct !{!339, !340, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!340 = distinct !{!340, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!341 = !{!342, !344, !346}
!342 = distinct !{!342, !343, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!343 = distinct !{!343, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!344 = distinct !{!344, !345, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!345 = distinct !{!345, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!346 = distinct !{!346, !347, !"_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi: %agg.result"}
!347 = distinct !{!347, !"_ZNK5Eigen15TensorEvaluatorIKNS_19TensorCwiseBinaryOpINS_8internal13scalar_sum_opINS_4halfES4_EEKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKS4_Li3ELi1EiEELi16EEEEESF_EENS_9GpuDeviceEE5coeffEi"}
!348 = !{!349, !342, !344, !346}
!349 = distinct !{!349, !350, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!350 = distinct !{!350, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!351 = !{!352, !346}
!352 = distinct !{!352, !353, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!353 = distinct !{!353, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!354 = !{!355, !357}
!355 = distinct !{!355, !356, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!356 = distinct !{!356, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!357 = distinct !{!357, !358, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!358 = distinct !{!358, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!359 = !{!360, !362}
!360 = distinct !{!360, !361, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!361 = distinct !{!361, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!362 = distinct !{!362, !363, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!363 = distinct !{!363, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!364 = !{!365, !360, !362}
!365 = distinct !{!365, !366, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!366 = distinct !{!366, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!367 = !{!368, !370}
!368 = distinct !{!368, !369, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!369 = distinct !{!369, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!370 = distinct !{!370, !371, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!371 = distinct !{!371, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm3EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!372 = !{!373, !368, !370}
!373 = distinct !{!373, !374, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!374 = distinct !{!374, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi3ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!375 = !{!376, !378}
!376 = distinct !{!376, !377, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!377 = distinct !{!377, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!378 = distinct !{!378, !379, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!379 = distinct !{!379, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!380 = !{!381, !152, i64 0}
!381 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorINS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !382, i64 8, !153, i64 24}
!382 = !{!"_ZTSN5Eigen6DSizesIiLi4EEE"}
!383 = !{!384, !152, i64 0}
!384 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !382, i64 8, !153, i64 24}
!385 = !{!386}
!386 = distinct !{!386, !387, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!387 = distinct !{!387, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!388 = !{!389, !391}
!389 = distinct !{!389, !390, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!390 = distinct !{!390, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!391 = distinct !{!391, !392, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!392 = distinct !{!392, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!393 = !{!394, !389, !391}
!394 = distinct !{!394, !395, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!395 = distinct !{!395, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!396 = !{!397, !399}
!397 = distinct !{!397, !398, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!398 = distinct !{!398, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!399 = distinct !{!399, !400, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!400 = distinct !{!400, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!401 = !{!402, !404}
!402 = distinct !{!402, !403, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!403 = distinct !{!403, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!404 = distinct !{!404, !405, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!405 = distinct !{!405, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!406 = !{!407, !402, !404}
!407 = distinct !{!407, !408, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!408 = distinct !{!408, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!409 = !{!410}
!410 = distinct !{!410, !411, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!411 = distinct !{!411, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!412 = !{!413, !415}
!413 = distinct !{!413, !414, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!414 = distinct !{!414, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!415 = distinct !{!415, !416, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!416 = distinct !{!416, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!417 = !{!418, !420}
!418 = distinct !{!418, !419, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!419 = distinct !{!419, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!420 = distinct !{!420, !421, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!421 = distinct !{!421, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!422 = !{!423, !418, !420}
!423 = distinct !{!423, !424, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!424 = distinct !{!424, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!425 = !{!426, !428}
!426 = distinct !{!426, !427, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!427 = distinct !{!427, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!428 = distinct !{!428, !429, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!429 = distinct !{!429, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm4EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!430 = !{!431, !426, !428}
!431 = distinct !{!431, !432, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!432 = distinct !{!432, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi4ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!433 = !{!434, !436}
!434 = distinct !{!434, !435, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!435 = distinct !{!435, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!436 = distinct !{!436, !437, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!437 = distinct !{!437, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!438 = !{!439, !152, i64 0}
!439 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorINS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !440, i64 8, !153, i64 32}
!440 = !{!"_ZTSN5Eigen6DSizesIiLi5EEE"}
!441 = !{!442, !152, i64 0}
!442 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !440, i64 8, !153, i64 32}
!443 = !{!444}
!444 = distinct !{!444, !445, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!445 = distinct !{!445, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!446 = !{!447, !449}
!447 = distinct !{!447, !448, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!448 = distinct !{!448, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!449 = distinct !{!449, !450, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!450 = distinct !{!450, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!451 = !{!452, !447, !449}
!452 = distinct !{!452, !453, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!453 = distinct !{!453, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!454 = !{!455, !457}
!455 = distinct !{!455, !456, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!456 = distinct !{!456, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!457 = distinct !{!457, !458, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!458 = distinct !{!458, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!459 = !{!460, !462}
!460 = distinct !{!460, !461, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!461 = distinct !{!461, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!462 = distinct !{!462, !463, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!463 = distinct !{!463, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!464 = !{!465, !460, !462}
!465 = distinct !{!465, !466, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!466 = distinct !{!466, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!467 = !{!468}
!468 = distinct !{!468, !469, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!469 = distinct !{!469, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!470 = !{!471, !473}
!471 = distinct !{!471, !472, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!472 = distinct !{!472, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!473 = distinct !{!473, !474, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!474 = distinct !{!474, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!475 = !{!476, !478}
!476 = distinct !{!476, !477, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!477 = distinct !{!477, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!478 = distinct !{!478, !479, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!479 = distinct !{!479, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!480 = !{!481, !476, !478}
!481 = distinct !{!481, !482, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!482 = distinct !{!482, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!483 = !{!484, !486}
!484 = distinct !{!484, !485, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi: %agg.result"}
!485 = distinct !{!485, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE13coeffRowMajorEi"}
!486 = distinct !{!486, !487, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!487 = distinct !{!487, !"_ZNK5Eigen15TensorEvaluatorIKNS_20TensorBroadcastingOpIKNS_5arrayIlLm5EEEKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEEEENS_9GpuDeviceEE5coeffEi"}
!488 = !{!489, !484, !486}
!489 = distinct !{!489, !490, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi: %agg.result"}
!490 = distinct !{!490, !"_ZNK5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKNS_4halfELi5ELi1EiEELi16EEENS_9GpuDeviceEE5coeffEi"}
!491 = !{!492, !494}
!492 = distinct !{!492, !493, !"_ZN5Eigen9half_implplERKNS_4halfES3_: %agg.result"}
!493 = distinct !{!493, !"_ZN5Eigen9half_implplERKNS_4halfES3_"}
!494 = distinct !{!494, !495, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_: %agg.result"}
!495 = distinct !{!495, !"_ZNK5Eigen8internal13scalar_sum_opINS_4halfES2_EclERKS2_S5_"}
!496 = !{!497, !152, i64 0}
!497 = !{!"_ZTSN5Eigen8internal11scalar_leftIffNS0_13scalar_sum_opIffEEEE", !152, i64 0}
!498 = !{!499, !152, i64 0}
!499 = !{!"_ZTSN5Eigen8internal12scalar_rightIffNS0_13scalar_sum_opIffEEEE", !152, i64 0}
!500 = !{!501, !152, i64 0}
!501 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi2ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !264, i64 8, !153, i64 16}
!502 = !{!503, !152, i64 0}
!503 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi3ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !322, i64 8, !153, i64 24}
!504 = !{!505, !152, i64 0}
!505 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi3ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !322, i64 8, !153, i64 24}
!506 = !{!507, !152, i64 0}
!507 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi4ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !382, i64 8, !153, i64 24}
!508 = !{!509, !152, i64 0}
!509 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi4ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !382, i64 8, !153, i64 24}
!510 = !{!511, !152, i64 0}
!511 = !{!"_ZTSN5Eigen15TensorEvaluatorIKNS_9TensorMapINS_6TensorIKfLi5ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !440, i64 8, !153, i64 32}
!512 = !{!513, !152, i64 0}
!513 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIfLi5ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !440, i64 8, !153, i64 32}
!514 = !{!515, !515, i64 0}
!515 = !{!"double", !153, i64 0}
!516 = !{!517, !152, i64 0}
!517 = !{!"_ZTSN5Eigen8internal11scalar_leftIddNS0_13scalar_sum_opIddEEEE", !152, i64 0}
!518 = !{!519, !152, i64 0}
!519 = !{!"_ZTSN5Eigen8internal12scalar_rightIddNS0_13scalar_sum_opIddEEEE", !152, i64 0}
!520 = !{!521, !152, i64 0}
!521 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIdLi3ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !322, i64 8, !153, i64 24}
!522 = !{!523, !152, i64 0}
!523 = !{!"_ZTSN5Eigen15TensorEvaluatorINS_9TensorMapINS_6TensorIdLi4ELi1EiEELi16EEENS_9GpuDeviceEEE", !152, i64 0, !382, i64 8, !153, i64 24}
!524 = !{!525, !525, i64 0}
!525 = !{!"long long", !153, i64 0}
!526 = !{!527, !152, i64 0}
!527 = !{!"_ZTSN5Eigen8internal11scalar_leftIxxNS0_13scalar_sum_opIxxEEEE", !152, i64 0}
!528 = !{!529, !152, i64 0}
!529 = !{!"_ZTSN5Eigen8internal12scalar_rightIxxNS0_13scalar_sum_opIxxEEEE", !152, i64 0}
