cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

set(COCL_PATH /usr/local/bin/cocl)
include(cmake/cocl.cmake)

macro(cocl_add_executable target_name)
    cocl_build_objects(${target_name} EXECUTABLE ${ARGN})
endmacro(cocl_add_executable)

macro(cocl_add_library target_name)
    cocl_build_objects(${target_name} LIBRARY ${ARGN})
endmacro(cocl_add_library)

cocl_add_executable(cuda_sample cuda_sample.cu)
target_link_libraries(cuda_sample cocl clblast clew)

cocl_add_executable(many_cpp many_cpp.cpp many_cc.cc many_cu.cu)
target_link_libraries(many_cpp cocl clblast clew)
target_include_directories(many_cpp PRIVATE include)

include_directories(include2)
include_directories(include3)

cocl_add_library(mylibrary SHARED many_cc.cc many_cu.cu)
target_include_directories(mylibrary PRIVATE paris include anotherinc)
target_link_libraries(mylibrary cocl clblast clew)

cocl_add_library(mylibrary_static many_cc.cc many_cu.cu)
target_include_directories(mylibrary_static PRIVATE include)
target_link_libraries(mylibrary_static cocl clblast clew)

cocl_add_executable(uses_mylibrary many_cpp.cpp)
target_link_libraries(uses_mylibrary cocl clblast clew mylibrary)
target_include_directories(uses_mylibrary PRIVATE include)

cocl_add_executable(uses_mylibrary_static many_cpp.cpp)
target_link_libraries(uses_mylibrary_static cocl clblast clew mylibrary_static)
target_include_directories(uses_mylibrary_static PRIVATE include)
