cmake_minimum_required(VERSION 2.8)

set(EASYCL_SRCS src/EasyCL/CLKernel.cpp src/EasyCL/CLWrapper.cpp src/EasyCL/platforminfo_helper.cpp src/EasyCL/EasyCL.cpp
    src/EasyCL/deviceinfo_helper.cpp src/EasyCL/util/easycl_stringhelper.cpp src/EasyCL/DevicesInfo.cpp src/EasyCL/DeviceInfo.cpp)

set(COCL_SRCS src/hostside_opencl_funcs.cpp src/cocl_events.cpp src/cocl_blas.cpp src/cocl_device.cpp src/cocl_error.cpp
    src/cocl_memory.cpp src/cocl_properties.cpp src/cocl_streams.cpp src/cocl_clsources.cpp src/cocl_context.cpp)

# include_directories(src/EasyCL/thirdparty/clew/include/proxy-opencl)
# include_directories(src/EasyCL/thirdparty/clew/include)
# include_directories(src/EasyCL)
# include_directories(include)
# # include_directories(/usr/include/llvm-3.8)
# include_directories(/usr/lib/llvm-3.8/include)

# reference http://llvm.org/docs/CMake.html#embedding
# include(/usr/lib/llvm-3.8/share/clang/cmake/ClangTargets.cmake)

# SET(CMAKE_MODULE_PATH
# set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "/usr/share/llvm-3.8/cmake")

# set(LLVM_INSTALL_PREFIX /usr/share/llvm-3.8)
# set(LLVM_CMAKE_DIR /usr/share/llvm-3.8)
# include(/usr/share/llvm-3.8/cmake/LLVMConfig.cmake)
# find_package(LLVM REQUIRED CONFIG)

# message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
# message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

set(CMAKE_CC_FLAGS "-fPIC")
set(LLVM_COMPILE_FLAGS "-fvisibility-inlines-hidden -ffunction-sections -fdata-sections")
set(CMAKE_CXX_FLAGS "-std=c++11 -fPIC ${LLVM_COMPILE_FLAGS}")
add_definitions(-DUSE_CLEW)  # turns off direct linking with libOpenCL.so, all goes via clew dynamic loader (no need to link with libOpenCL at build time)
# for llvm:
add_definitions(-D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS)

# set(LLVM_LIBRARIES_PATH /usr/lib/llvm-3.8/lib)
# set (LLVM_LIBS
#     ${LLVM_LIBRARIES_PATH}/libLLVMSupport.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMCore.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMMC.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMTarget.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMAnalysis.a
#     # ${LLVM_LIBRARIES_PATH}/libLLVMipa.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMTransformUtils.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMInstCombine.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMScalarOpts.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMCodeGen.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMExecutionEngine.a
#     # ${LLVM_LIBRARIES_PATH}/libLLVMJIT.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMX86Utils.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMX86Info.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMMCParser.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMX86AsmParser.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMX86AsmPrinter.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMAsmPrinter.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMSelectionDAG.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMX86CodeGen.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMX86Disassembler.a
#     ${LLVM_LIBRARIES_PATH}/libLLVMInterpreter.a
# )
set (LLVM_LIBS /usr/lib/llvm-3.8/lib/libLLVM.so)

# execute_process(
#   COMMAND llvm-config-3.8 --ldflags --system-libs --libs
#   OUTPUT_VARIABLE LLVM_LINK_FLAGS
# )
# execute_process(
#   COMMAND llvm-config-3.8 --ldflags
#   OUTPUT_VARIABLE LLVM_LDFLAGS
#   OUTPUT_STRIP_TRAILING_WHITESPACE
# )
# execute_process(
#   COMMAND llvm-config-3.8 --libs
#   OUTPUT_VARIABLE LLVM_LIBS
#   OUTPUT_STRIP_TRAILING_WHITESPACE
# )
# message("LLVM_LDFLAGS ${LLVM_LDFLAGS}")
# message("LLVM_LIBS ${LLVM_LIBS}")
# set(CMAKE_SHARED_LINKER_FLAGS "-Wl,-rpath,$ORIGIN ${LLVM_LINK_FLAGS}")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-rpath,$ORIGIN")
# message("CMAKE_SHARED_LINKER_FLAGS ${CMAKE_SHARED_LINKER_FLAGS}")

# llvm_map_components_to_libnames(llvm_libs support core irreader)

add_executable(ir-to-opencl
    src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp src/mutations.cpp src/readIR.cpp src/struct_clone.cpp
    src/handle_branching.cpp src/branching_transforms.cpp src/flowcontrolinstructions.cpp third_party/argparsecpp/argparsecpp.cpp)
target_include_directories(ir-to-opencl PRIVATE src)
target_include_directories(ir-to-opencl PRIVATE third_party/argparsecpp)
target_include_directories(ir-to-opencl PRIVATE /usr/lib/llvm-3.8/include)
# target_link_libraries(ir-to-opencl llvm)
set_target_properties(ir-to-opencl PROPERTIES
    LINK_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${LLVM_LDFLAGS}"
)
target_link_libraries(ir-to-opencl "${LLVM_LIBS}")
target_link_libraries(ir-to-opencl pthread)

add_executable(patch-hostside
    src/patch-hostside.cpp src/struct_clone.cpp src/mutations.cpp src/readIR.cpp src/ir-to-opencl-common.cpp
    third_party/argparsecpp/argparsecpp.cpp
)
target_include_directories(patch-hostside PRIVATE /usr/lib/llvm-3.8/include)
target_include_directories(patch-hostside PRIVATE third_party/argparsecpp)
set_target_properties(patch-hostside PROPERTIES
    LINK_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${LLVM_LDFLAGS}"
)
target_link_libraries(patch-hostside "${LLVM_LIBS}")

add_library(clew SHARED src/EasyCL/thirdparty/clew/src/clew.c)
target_link_libraries(clew dl)

add_library(easycl SHARED ${EASYCL_SRCS})
include_directories(easycl PRIVATE src/EasyCL/thirdparty/clew/include/proxy-opencl)
include_directories(easycl PRIVATE src/EasyCL/thirdparty/clew/include)
include_directories(easycl PRIVATE src/EasyCL)
target_link_libraries(easycl clew)

add_library(cocl SHARED ${COCL_SRCS})
target_include_directories(cocl PRIVATE src/CLBlast/include)
target_link_libraries(cocl easycl)

# # target_include_directories(cocl PRIVATE src/CLBlast/include)

# # SET(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" "${CMAKE_MODULE_PATH}")
# # FindPackage(cocl)
include(cmake/cocl.cmake)

# ==================================================================================================

# next ~20 lines or so are copied from CLBlast CMakeLists.txt (seems easier than figuring out the whole cmake import/export
# bit...)
# I prefixed the vars with CLBLAST_ , and removed all the level 1/2 routines, which we dont use

# Sets the supported routines and the used kernels. New routines and kernels should be added here.
set(CLBLAST_KERNELS copy_fast copy_pad transpose_fast transpose_pad xaxpy xdot xger xgemm xgemv)
set(CLBLAST_LEVEL1_ROUTINES xswap xscal xcopy xaxpy xdot xdotu xdotc xnrm2 xasum xamax)
set(CLBLAST_LEVEL2_ROUTINES xgemv xgbmv xhemv xhbmv xhpmv xsymv xsbmv xspmv xtrmv xtbmv xtpmv
                    xger xgeru xgerc xher xhpr xher2 xhpr2 xsyr xspr xsyr2 xspr2)
set(CLBLAST_LEVEL3_ROUTINES xgemm xsymm xhemm xsyrk xherk xsyr2k xher2k xtrmm)
set(CLBLAST_LEVELX_ROUTINES xomatcopy)
set(CLBLAST_ROUTINES ${CLBLAST_LEVEL1_ROUTINES} ${CLBLAST_LEVEL2_ROUTINES} ${CLBLAST_LEVEL3_ROUTINES} ${CLBLAST_LEVELX_ROUTINES})
set(CLBLAST_PRECISIONS 32 64 3232 6464 16)

# Gathers all source-files
set(CLBLAST_SOURCES
  src/CLBlast/src/database/database.cpp
  src/CLBlast/src/routines/common.cpp
  src/CLBlast/src/cache.cpp
  src/CLBlast/src/clblast.cpp
  src/CLBlast/src/clblast_c.cpp
  src/CLBlast/src/routine.cpp
  src/CLBlast/src/utilities.cpp
)
foreach(ROUTINE ${CLBLAST_LEVEL1_ROUTINES})
  set(CLBLAST_SOURCES ${CLBLAST_SOURCES} src/CLBlast/src/routines/level1/${ROUTINE}.cpp)
endforeach()
foreach(ROUTINE ${CLBLAST_LEVEL2_ROUTINES})
  set(CLBLAST_SOURCES ${CLBLAST_SOURCES} src/CLBlast/src/routines/level2/${ROUTINE}.cpp)
endforeach()
foreach(ROUTINE ${CLBLAST_LEVEL3_ROUTINES})
  set(CLBLAST_SOURCES ${CLBLAST_SOURCES} src/CLBlast/src/routines/level3/${ROUTINE}.cpp)
endforeach()
foreach(ROUTINE ${CLBLAST_LEVELX_ROUTINES})
  set(CLBLAST_SOURCES ${CLBLAST_SOURCES} src/CLBlast/src/routines/levelx/${ROUTINE}.cpp)
endforeach()

include_directories(src/CLBlast/src)
add_library(clblast SHARED ${CLBLAST_SOURCES})

target_include_directories(clblast PRIVATE src/CLBlast/include)

# ==================================================================================================
# tests

add_cocl_executable(testblas test/cocl/testblas.cu)
