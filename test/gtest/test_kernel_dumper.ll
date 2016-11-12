define float addrspace(1) *@someFunc(float addrspace(1) * %d1, float addrspace(1) * %v1) {
    ret float addrspace(1) *%v1
}

define void @someKernel(float addrspace(1) * %d1, float addrspace(1) * %d2) {
    %1 = alloca float addrspace(1)*, i32 1
    %2 = load float addrspace(1) *, float addrspace(1) **%1
    %3 = call float addrspace(1) * @someFunc(float addrspace(1) *%d1, float addrspace(1) *%2)
    ret void
}
