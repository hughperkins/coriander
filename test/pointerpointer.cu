// The code which is causing the pointer pointer address space error:

// %"struct.Eigen::half_impl::__half" = type { i16 }
// %"struct.Eigen::half_impl::half_base" = type { %"struct.Eigen::half_impl::__half" }
// %"struct.Eigen::half" = type { %"struct.Eigen::half_impl::half_base" }
// %"struct.Eigen::DSizes" = type { %"class.Eigen::array" }
// %"class.Eigen::array" = type { [1 x i32] }
// %"struct.Eigen::GpuDevice" = type <{ %"class.Eigen::StreamInterface"*, i32, [4 x i8] }>
// %"class.Eigen::StreamInterface" = type { i32 (...)** }
// %"struct.Eigen::TensorEvaluator.0" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
// %"struct.Eigen::TensorEvaluator.2" = type { %"struct.Eigen::half"*, %"struct.Eigen::DSizes", %"struct.Eigen::GpuDevice"* }
// %"struct.Eigen::TensorEvaluator.7" = type { %"struct.Eigen::internal::scalar_left", %"struct.Eigen::TensorEvaluator.2" }
// %"struct.Eigen::TensorEvaluator.6" = type { %"struct.Eigen::TensorEvaluator.0", %"struct.Eigen::TensorEvaluator.7" }

// ; Function Attrs: norecurse nounwind
// define weak_odr void @_ZN5Eigen8internal15EigenMetaKernelINS_15TensorEvaluatorIKNS_14TensorAssignOpINS_9TensorMapINS_6TensorINS_4halfELi1ELi1EiEELi16EEEKNS_18TensorCwiseUnaryOpINS0_11scalar_leftIS6_S6_NS0_13scalar_sum_opIS6_S6_EEEEKNS4_INS5_IKS6_Li1ELi1EiEELi16EEEEEEENS_9GpuDeviceEEEiEEvT_T0_(%"struct.Eigen::TensorEvaluator.6"* byval nocapture readonly align 8 %memcopied_eval, i32 %size) #1 comdat {
//   %1 = tail call i32 @llvm.ptx.read.ctaid.x() #6
//   %2 = tail call i32 @llvm.ptx.read.ntid.x() #6
//   %3 = mul i32 %2, %1
//   %4 = tail call i32 @llvm.ptx.read.tid.x() #6
//   %5 = add i32 %3, %4
//   %6 = tail call i32 @llvm.ptx.read.nctaid.x() #6
//   %7 = mul i32 %6, %2
//   %8 = getelementptr inbounds %"struct.Eigen::TensorEvaluator.6", %"struct.Eigen::TensorEvaluator.6"* %memcopied_eval, i64 0, i32 0, i32 0
//   %9 = load %"struct.Eigen::half"*, %"struct.Eigen::half"** %8, align 8


struct MyStruct {
    float floatvalue;
    int intvalue;
};

__device__ __host__ float sumStruct(struct MyStruct **p_structs, int N) {
    float sum = 0;
    for(int i = 0; i < N; i++) {
        struct MyStruct *mystruct = p_structs[i];
        sum += mystruct->floatvalue + float(mystruct->intvalue) * 3.5f;
    }
    return sum;
}

__global__ void mykernel(float *data, MyStruct *structs, int N) {
    data[0] = sumStruct(&structs, N);
    data[3] = sumStruct(&structs, 123);
    data[4] = sumStruct(&structs, 12300);
}

class HalfImpl {
public:
    short myshort;
};

class HalfBase : public HalfImpl {
};

class Half : public HalfBase {

};

class StreamInterface {
};

class GpuDevice {
public:
    int myint;
    StreamInterface *pstreamInterface;
};

class TensorEvaluator0 {
public:
    Half *phalf;
    GpuDevice gpuDevice;
};

class TensorEvaluator2 {
public:
    Half *phalf;
    GpuDevice gpuDevice;
};

class TensorEvaluator7 {
public:
    Half *phalf;
    TensorEvaluator2 te2;
};
class TensorEvaluator6 {
public:
    class TensorEvaluator0 te0;
    class TensorEvaluator7 te7;
};

// __device__ __host__ float getGpuDeviceValue(GpuDevice *devices, int N) {
//     float sum = 0;
//     for(int i = 0; i < N; i++) {
//         sum += devices[i].myfloat * (5.5f + i);
//     }
//     return sum;
// }

__device__ __host__ float getHalfValue(Half *half, int a) {
    return (float)(half[a].myshort + 123);
}

__global__ void myte6kernel(TensorEvaluator6 *structs, float *data, GpuDevice *gpudevices, int a, int b, int c) {
    Half *phalf = structs[a].te0.phalf;
    data[0] = getHalfValue(phalf, a);
    //gpudevices[b] = structs[a].te0.gpuDevice;
    // float sum = 0;
    // for(int i = 0; i < 1000; i++) {
    //     sum += getGpuDeviceValue(&structs[i].te0.gpuDevice, c + i);
    // }
    // data[1] = sum;
}
