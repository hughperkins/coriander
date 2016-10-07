%"struct.firsttype" = type { i32 }

@myglobal = addrspace(4) constant %"struct.firsttype" { i32 1234 }

define void @test_union1(float* nocapture %data) {
  %1 = load %"struct.firsttype", %"struct.firsttype" addrspace(4)* @myglobal
  ret void
}

define void @test_union(float* nocapture %data) {
  %1 = load float, float* addrspacecast (float addrspace(4)* bitcast (%"struct.firsttype" addrspace(4)* @myglobal to float addrspace(4)*) to float*)
  ret void
}

!nvvm.annotations = !{!0, !1}

!0 = !{void (float*)* @test_union, !"kernel", i32 1}
!1 = !{void (float*)* @test_union1, !"kernel", i32 1}
