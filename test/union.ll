%"union.Eigen::half_impl::FP32" = type { i32 }

@_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic = internal unnamed_addr addrspace(1) constant %"union.Eigen::half_impl::FP32" { i32 947912704 }, align 4

define void @test_union(float* nocapture %data) {
  %1 = load float, float* addrspacecast (float addrspace(1)* bitcast (%"union.Eigen::half_impl::FP32" addrspace(1)* @_ZZN5Eigen9half_impl13half_to_floatENS0_6__halfEE5magic to float addrspace(1)*) to float*)
  ret void
}

!nvvm.annotations = !{!0}

!0 = !{void (float*)* @test_union, !"kernel", i32 1}
