cmake_minimum_required(VERSION 2.8)

option(BUILD_TESTS "Build tests" OFF)
set(TESTS_COCL_OPTIONS "" CACHE STRING "cocl options, semicolon-separated.  See cocl -h")
# option(TESTS_RUN_TRANSFORM_BRANCHES "")
option(TESTS_DEVICELL_INLINE "cocl option for tests" ON)
option(TESTS_DEVICELL_MEM2REG "cocl option for tests" ON)
option(TESTS_DEVICELL_INSTCOMBINE "cocl option for tests" ON)
set(TESTS_DEVICELL_OPT "O2" CACHE STRING "cocl option for tests")
option(EXPLAIN_CL "Add IR code into OpenCL.  For maintainers mostly" OFF)
option(TESTS_DUMP_CL "Writes OpenCL for tests to stdout.  For maintainers mostly" OFF)
option(COCL_SPAM "Lots of scrolly debug text.  Mostly for maintainer usage" OFF)
if(APPLE)
set(CLANG_HOME "/usr/local/opt/llvm-4.0" CACHE STRING "the downloaded clang-4.0.0 folder, containing lib, bin etc")
else()
set(CLANG_HOME "/usr/local/opt/llvm-4.0" CACHE STRING "the downloaded clang-4.0.0 folder, containing lib, bin etc")
endif()

if(TESTS_CL_BRANCHES_AS_SWITCH)
    unset(TESTS_CL_RUN_TRANSFORMS CACHE)
endif()

if(COCL_SPAM)
  option(COCL_SPAM_EVENTS "spam about events" OFF)
  option(COCL_SPAM_MEMORY "spam about memory" OFF)
  option(COCL_SPAM_KERNELLAUNCH "spam about kernel launch" OFF)
  option(COCL_SPAM_PROPERTIES "spam about getting properties (max workgroup size, memory et al)" OFF)
else()
  unset(COCL_SPAM_EVENTS CACHE)
  unset(COCL_SPAM_MEMORY CACHE)
  unset(COCL_SPAM_KERNELLAUNCH CACHE)
  unset(COCL_SPAM_PROPERTIES CACHE)
endif()

if(COCL_SPAM_EVENTS)
  add_definitions(-DCOCL_SPAM_EVENTS)
endif()
if(COCL_SPAM_MEMORY)
  add_definitions(-DCOCL_SPAM_MEMORY)
endif()
if(COCL_SPAM_KERNELLAUNCH)
  add_definitions(-DCOCL_SPAM_KERNELLAUNCH)
endif()
if(COCL_SPAM_PROPERTIES)
  add_definitions(-DCOCL_SPAM_PROPERTIES)
endif()

set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS})
if(TESTS_DEVICELL_INLINE)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};--devicell-opt;inline)
endif()
if(TESTS_DEVICELL_MEM2REG)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};--devicell-opt;mem2reg)
endif()
if(TESTS_DEVICELL_INSTCOMBINE)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};--devicell-opt;instcombine)
endif()
if(TESTS_DEVICELL_OPT)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};--devicell-opt;${TESTS_DEVICELL_OPT})
endif()
if(EXPLAIN_CL)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};--add_ir_to_cl)
endif()
# if(TESTS_DUMP_CL)
# set($ENV{COCL_DUMP_CL} "1")
# endif()

FILE(GLOB YAMLCPP_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/third_party/yaml-cpp/src/*.cpp)
# message("YAMLCPP_SRCS ${YAMLCPP_SRCS}")

set(EASYCL_SRCS src/EasyCL/CLKernel.cpp src/EasyCL/CLWrapper.cpp src/EasyCL/platforminfo_helper.cpp src/EasyCL/EasyCL.cpp
    src/EasyCL/deviceinfo_helper.cpp src/EasyCL/util/easycl_stringhelper.cpp src/EasyCL/DevicesInfo.cpp src/EasyCL/DeviceInfo.cpp)

# set(COCL_BRANCHING_SRCS
#     src/branches_as_switch/branches_as_switch.cpp
#     src/handle_branching.cpp src/branching_transforms.cpp src/flowcontrolinstructions.cpp
#     src/flowcontrol/returnblock.cpp src/flowcontrol/sequence.cpp src/flowcontrol/basicblockblock.cpp
#     src/flowcontrol/conditionalbranch.cpp src/flowcontrol/dowhile.cpp src/flowcontrol/if.scpp
#     src/flowcontrol/for.cpp src/flowcontrol/rootblock.cpp src/flowcontrol/block.cpp)

# message("CLANG_HOME: ${CLANG_HOME}")

set(COCL_SRCS src/type_dumper.cpp src/GlobalNames.cpp src/LocalNames.cpp src/new_instruction_dumper.cpp
    src/struct_clone.cpp src/basicblockdumper.cpp src/ExpressionsHelper.cpp src/readIR.cpp
    src/function_names_map.cpp src/function_dumper.cpp src/kernel_dumper.cpp src/mutations.cpp
    third_party/argparsecpp/argparsecpp.cpp src/cocl_dnn.cpp src/cocl_dnn_gemm.cpp src/cocl_dnn_pooling.cpp
    src/cocl_dnn_conv.cpp src/cocl_dnn_act.cpp
    src/hostside_opencl_funcs.cpp src/cocl_events.cpp src/cocl_blas.cpp src/cocl_device.cpp src/cocl_error.cpp
    src/cocl_memory.cpp src/cocl_properties.cpp src/cocl_streams.cpp src/cocl_clsources.cpp src/cocl_context.cpp
    src/ir-to-opencl.cpp src/shims.cpp src/LocalValueInfo.cpp src/ClWriter.cpp src/cocl_vector_types.cpp
    src/cocl_logging.cpp src/DebugDumper.cpp src/fill_buffer.cpp
)

set(CMAKE_CC_FLAGS "-fPIC")
set(CMAKE_CXX_FLAGS "-std=c++11 -fPIC -g -Wno-covered-switch-default -Wno-sign-compare")
add_definitions(-DUSE_CLEW)  # turns off direct linking with libOpenCL.so, all goes via clew dynamic loader (no need to link with libOpenCL at build time)
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-rpath,$ORIGIN")

execute_process(
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/cmake/get-llvm-cxxflags.sh ${CLANG_HOME}
    OUTPUT_VARIABLE LLVM_CXXFLAGS
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
# message("LLVM_CXXFLAGS ${LLVM_CXXFLAGS}")
STRING(REGEX REPLACE " " ";" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
# message("LLVM_CXXFLAGS ${LLVM_CXXFLAGS}")
string(REGEX REPLACE ";-std=c\\+\\+0x" ";-std=c++11" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
string(REGEX REPLACE ";-fno-exceptions" ";-fexceptions" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
# string(REGEX REPLACE ";-fno-rtti" "" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
string(REGEX REPLACE ";-DNDEBUG" "" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
string(REGEX REPLACE ";-isysroot;[^;]" "" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
# message("LLVM_CXXFLAGS ${LLVM_CXXFLAGS}")

# split LLVM_CXXFLAGS into defines vs other options
STRING(REGEX MATCHALL ";-D[^;]+" LLVM_DEFINES "${LLVM_CXXFLAGS}")
STRING(REGEX REPLACE ";+" ";" LLVM_DEFINES "${LLVM_DEFINES}")
STRING(REGEX REPLACE ";-D[^;]+" "" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
# message("LLVM_DEFINES ${LLVM_DEFINES}")
# message("LLVM_CXXFLAGS ${LLVM_CXXFLAGS}")

execute_process(
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/cmake/llvm-syslibs.sh ${CLANG_HOME}
    OUTPUT_VARIABLE LLVM_SYSLIBS
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

execute_process(
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/cmake/get-llvm-libs.sh ${CLANG_HOME}
    OUTPUT_VARIABLE LLVM_LIBFILES
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

STRING(REGEX MATCHALL "[^ ]+" LLVM_LIBFILES "${LLVM_LIBFILES}")

foreach(LIB ${LLVM_LIBFILES})
   if(LLVM_LIBS)
   set(LLVM_LIBS ${LLVM_LIBS} ${CLANG_HOME}/lib/${LIB})
   else()
   set(LLVM_LIBS "${CLANG_HOME}/lib/${LIB}")
   endif()
endforeach()

add_executable(ir-to-opencl src/ir-to-opencl_main.cpp third_party/argparsecpp/argparsecpp.cpp)
target_include_directories(ir-to-opencl PRIVATE third_party/argparsecpp)
target_include_directories(ir-to-opencl PRIVATE ${CLANG_HOME}/include)
target_compile_options(ir-to-opencl PRIVATE ${LLVM_CXXFLAGS} ${LLVM_DEFINES})
target_link_libraries(ir-to-opencl cocl ${LLVM_SYSLIBS})

add_executable(patch_hostside
    src/patch_hostside.cpp src/struct_clone.cpp src/mutations.cpp src/readIR.cpp
    third_party/argparsecpp/argparsecpp.cpp src/type_dumper.cpp src/GlobalNames.cpp
    src/EasyCL/util/easycl_stringhelper.cpp src/cocl_logging.cpp
)
target_include_directories(patch_hostside PRIVATE ${CLANG_HOME}/include)
target_include_directories(patch_hostside PRIVATE third_party/argparsecpp)
target_include_directories(patch_hostside PRIVATE src/EasyCL)
target_compile_options(patch_hostside PRIVATE ${LLVM_CXXFLAGS} ${LLVM_DEFINES})
target_link_libraries(patch_hostside "${LLVM_LIBS}"  ${LLVM_SYSLIBS})

add_library(clew SHARED src/EasyCL/thirdparty/clew/src/clew.c)
target_include_directories(clew PRIVATE src/EasyCL/thirdparty/clew/include)
target_link_libraries(clew dl)

add_library(easycl SHARED ${EASYCL_SRCS})
target_include_directories(easycl PRIVATE src/EasyCL/thirdparty/clew/include)
target_include_directories(easycl PRIVATE src/EasyCL)
target_link_libraries(easycl clew)

add_library(cocl SHARED ${COCL_SRCS} ${YAMLCPP_SRCS})
target_include_directories(cocl PRIVATE src/EasyCL/thirdparty/clew/include/proxy-opencl)
target_include_directories(cocl PRIVATE src/CLBlast/include)
target_include_directories(cocl PRIVATE include)
target_include_directories(cocl PRIVATE src)
target_include_directories(cocl PRIVATE third_party/argparsecpp)
target_include_directories(cocl PRIVATE third_party/yaml-cpp/include)
target_include_directories(cocl PRIVATE ${CLANG_HOME}/include)
target_include_directories(cocl PRIVATE src/EasyCL/thirdparty/clew/include)
if(COCL_SPAM)
    set(COCL_DEFINITIONS ${COCL_DEFINITIONS} -DCOCL_SPAM)
endif()
if(COCL_DEFINITIONS)
    target_compile_definitions(cocl PRIVATE ${COCL_DEFINITIONS})
endif()
target_compile_options(cocl PRIVATE ${LLVM_CXXFLAGS} ${LLVM_DEFINES} -Wno-sign-compare -Wno-covered-switch-default)
target_link_libraries(cocl easycl ${LLVM_LIBS} ${LLVM_SYSLIBS})

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
target_compile_options(clblast PRIVATE -Wno-switch)
target_include_directories(clblast PRIVATE src/EasyCL/thirdparty/clew/include/proxy-opencl)
target_include_directories(clblast PRIVATE src/CLBlast/include)
target_include_directories(clblast PRIVATE src/EasyCL/thirdparty/clew/include)
target_link_libraries(clblast clew)

target_link_libraries(cocl clblast)

# ==================================================================================================
# tests

if(APPLE)
  set(SO_SUFFIX dylib)
else()
  set(SO_SUFFIX so)
endif()

set(THIS_COCL_PATH ${CMAKE_CURRENT_SOURCE_DIR}/bin/cocl)
set(COCL_ARTIFACTS patch_hostside cocl)
# set(THIS_BIN_DIR ${CMAKE_CURRENT_BINARY_DIR})
set(THIS_LIB_DIR ${CMAKE_CURRENT_BINARY_DIR})
set(THIS_CMAKE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
CONFIGURE_FILE(
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/cocl.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/cmake/cocl-internal.cmake" @ONLY)

include("${CMAKE_CURRENT_BINARY_DIR}/cmake/cocl-internal.cmake")

set(TESTS_EXCLUDE EXCLUDE_FROM_ALL)
if(BUILD_TESTS)
  set(TESTS_EXCLUDE)
endif(BUILD_TESTS)

set(TESTS testblas cuda_sample context byvaluestructwithpointer multigpu multithreading
    offsetkernelargs properties test_bitcast test_callbacks testcumemcpy testevents2
    testevents testfloat4 test_kernelcachedok testmath testmemcpydevicetodevice test_memhostalloc
    testneg testnullpointer testpartialcopy testshfl teststream test_types
    singlebuffer test_devices test_buffers longname test_char test_structs
    test_floatstarstar
)

if(TESTS_DUMP_CL)
    set(COCL_DUMP_CL_STR "COCL_DUMP_CL=1")
endif()
include_directories(include/cocl/proxy_includes)
foreach(TEST ${TESTS})
    cocl_add_executable(${TEST} ${TESTS_EXCLUDE} test/cocl/${TEST}.cu)
    target_link_libraries(${TEST} cocl clew clblast easycl)
    add_custom_target(run-${TEST}
        COMMAND echo
        COMMAND echo make run-${TEST}
        COMMAND ${COCL_DUMP_CL_STR} ${CMAKE_CURRENT_BINARY_DIR}/${TEST}
        DEPENDS ${TEST}
        DEPENDS cocl
        DEPENDS patch_hostside
    )
    set(RUN_TEST_TARGETS ${RUN_TEST_TARGETS} run-${TEST})
    set(BUILD_TEST_TARGETS ${BUILD_TEST_TARGETS} ${TEST})
endforeach()
add_custom_target(run-tests-travis
  DEPENDS run-cuda_sample run-context run-offsetkernelargs run-test_callbacks run-testcumemcpy
      run-testnullpointer run-testpartialcopy run-teststream run-singlebuffer)

if(UNIX)
    add_library(cocl_gtest SHARED  ${TESTS_EXCLUDE} third_party/gtest/gtest-all.cc)
    target_link_libraries(cocl_gtest pthread)
else()
    add_library(cocl_gtest  ${TESTS_EXCLUDE} third_party/gtest/gtest-all.cc)
endif()

add_executable(cocl_unittests ${TESTS_EXCLUDE} test/gtest/gtest_main.cpp test/gtest/GtestGlobals.cpp
    test/gtest/test_block_dumper.cpp test/gtest/test_new_instruction_dumper.cpp
    test/gtest/test_type_dumper.cpp test/gtest/test_GlobalNames.cpp test/gtest/test_LocalNames.cpp
    test/gtest/test_struct_cloner.cpp test/gtest/test_function_dumper.cpp
    test/gtest/test_kernel_dumper.cpp test/gtest/test_global_constants.cpp
    test/gtest/test_dnn_conv.cpp test/gtest/test_dnn_pooling.cpp test/gtest/test_dnn_act.cpp
    test/gtest/test_dnn_loss.cpp
    test/gtest/test_hostside_opencl_funcs.cpp test/gtest/test_logging.cpp
    test/gtest/test_expressions_helper.cpp test/gtest/test_shims.cpp
    # test/gtest/test_simple.cu
    # test/gtest/test_cocl_simple.cu
)
target_include_directories(cocl_unittests PRIVATE src)
target_include_directories(cocl_unittests PRIVATE include)
target_include_directories(cocl_unittests PRIVATE src/EasyCL/thirdparty/clew/include)
target_include_directories(cocl_unittests PRIVATE third_party/gtest)
target_include_directories(cocl_unittests PRIVATE ${CLANG_HOME}/include)
target_link_libraries(cocl_unittests cocl_gtest easycl cocl ${LLVM_LIBS} ${LLVM_SYSLIBS})
target_compile_options(cocl_unittests PRIVATE ${LLVM_CXXFLAGS} ${LLVM_DEFINES})

add_custom_target(run-cocl_unittests
    COMMAND echo
    COMMAND echo make run-cocl_unittests
    COMMAND ${COCL_DUMP_CL_STR} ${CMAKE_CURRENT_BINARY_DIR}/cocl_unittests
    DEPENDS cocl_unittests
    DEPENDS cocl
    DEPENDS patch_hostside
)

add_custom_target(tests
    DEPENDS ${BUILD_TEST_TARGETS} cocl_unittests)
add_custom_target(run-end-to-end-tests
    DEPENDS ${RUN_TEST_TARGETS})
add_custom_target(run-tests
    DEPENDS ${RUN_TEST_TARGETS} run-cocl_unittests)

FILE(GLOB_RECURSE COCL_HEADERS
  LIST_DIRECTORIES false
  ${CMAKE_CURRENT_SOURCE_DIR}/include/cocl/*)
set(CLEW_HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/src/EasyCL/thirdparty/clew/include/clew.h)
FILE(GLOB EASYCL_HEADERS_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/src/EasyCL/*.h)
# FILE(GLOB CLEW_PROXYHEADERS) ${CMAKE_CURRENT_SOURCE_DIR}/src/EasyCL/thirdparty/clew/include/proxy-opencl/*.h)

set(THIS_COCL_PATH ${CMAKE_INSTALL_PREFIX}/bin/cocl)
# set(THIS_BIN_DIR ${CMAKE_INSTALL_PREFIX}/bin)
set(THIS_LIB_DIR ${CMAKE_INSTALL_PREFIX}/lib)
set(COCL_ARTIFACTS )
CONFIGURE_FILE(
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/cocl.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/cmake/cocl.cmake" @ONLY)
CONFIGURE_FILE(
  "${CMAKE_CURRENT_SOURCE_DIR}/bin/cocl-wrap.in"
  "${CMAKE_CURRENT_BINARY_DIR}/bin/cocl" @ONLY)
# CONFIGURE_FILE(
#   "${CMAKE_CURRENT_SOURCE_DIR}/bin/cocl"
#   "${CMAKE_CURRENT_BINARY_DIR}/bin/cocl_wrapped" @ONLY)
INSTALL(FILES ${COCL_HEADERS} DESTINATION include/cocl)
# INSTALL(FILES ${CLEW_PROXYHEADERS} DESTINATION include/clew/proxy-opencl)

# cocl
INSTALL(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/bin/cocl DESTINATION bin RENAME cocl_wrapped)
INSTALL(PROGRAMS ${CMAKE_BINARY_DIR}/bin/cocl DESTINATION bin)

# INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/share/cocl/cocl.Makefile DESTINATION share/cocl)
INSTALL(FILES ${CLEW_HEADERS} DESTINATION include)
INSTALL(FILES ${EASYCL_HEADERS_ROOT} DESTINATION include/EasyCL)
# INSTALL(FILES ${CMAKE_SOURCE_DIR}/cmake/cocl.cmake DESTINATION share/cocl)
INSTALL(FILES ${CMAKE_BINARY_DIR}/cmake/cocl.cmake ${CMAKE_SOURCE_DIR}/cmake/cocl_impl.cmake DESTINATION share/cocl)
install(TARGETS easycl clew clblast cocl patch_hostside EXPORT cocl-targets
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)
install(EXPORT cocl-targets DESTINATION lib/cocl)

########### Add uninstall target ###############
CONFIGURE_FILE(
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/cmake_uninstall.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/cmake/cmake_uninstall.cmake"
  IMMEDIATE @ONLY)
ADD_CUSTOM_TARGET(uninstall
  "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_BINARY_DIR}/cmake/cmake_uninstall.cmake") 
