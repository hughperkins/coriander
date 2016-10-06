%firsttype = type { i32 }

@myglobal = addrspace(1) constant %firsttype { i32 1234 }

define void @test_union(float* nocapture %data) {
  %1 = load float, float* addrspacecast (float addrspace(1)* bitcast (%firsttype addrspace(1)* @myglobal to float addrspace(1)*) to float*)
  ret void
}

!nvvm.annotations = !{!0}

!0 = !{void (float*)* @test_union, !"kernel", i32 1}
