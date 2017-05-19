define i32 @type_return() {
  ret i32 0
}

define i32 @add() {
  %1 = add i32 5, 7
  ret i32 %1
}

define void @float32() {
  %1 = fadd float 1.25, 3.0
  ret void
}

define void @float64() {
  %1 = fadd double 1.25, 3.0
  ret void
}

define void @pointer_float32() {
    %1 = alloca float, i32 1
    ret void
}

define void @pointer_globalpfloat() {
    %1 = alloca float addrspace(1) *, i32 1
    %2 = load float addrspace(1)*, float addrspace(1) ** %1
    ret void
}

define void @array_int() {
    %1 = alloca [4 x i32], i32 1
    %2 = load [4 x i32], [4 x i32]* %1
    ret void
}

%struct_mystruct = type { i32, float }

define void @mystruct() {
    %1 = alloca %struct_mystruct, i32 1
    %2 = load %struct_mystruct, %struct_mystruct* %1
    ret void
}

%"struct.mystruct" = type { i32, float, float*, float* }

%"class.tensorflow::random::Array" = type { [4 x i32], [6 x float] }
