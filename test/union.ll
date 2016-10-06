%firsttype = type { i32 }

@some_call = internal unnamed_addr addrspace(1) constant %firsttype { i32 947912704 }

define void @test_union(float* nocapture %data) {
  %1 = load float, float* addrspacecast (float addrspace(1)* bitcast (%firsttype addrspace(1)* @some_call to float addrspace(1)*) to float*)
  ret void
}

!nvvm.annotations = !{!0}

!0 = !{void (float*)* @test_union, !"kernel", i32 1}
