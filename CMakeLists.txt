cmake_minimum_required(VERSION 2.8)

option(BUILD_TESTS "Build tests" OFF)
set(TESTS_COCL_OPTIONS "" CACHE STRING "cocl options, semicolon-separated.  See cocl -h")
# option(TESTS_RUN_TRANSFORM_BRANCHES "")
option(TESTS_DEVICELL_INLINE "cocl option for tests" ON)
option(TESTS_DEVICELL_MEM2REG "cocl option for tests" ON)
option(TESTS_DEVICELL_INSTCOMBINE "cocl option for tests" ON)
set(TESTS_DEVICELL_OPT "O2" CACHE STRING "cocl option for tests")
option(TESTS_CL_RUN_TRANSFORMS "cocl option for tests" OFF)
option(TESTS_CL_BRANCHES_AS_SWITCH "cocl option for tests" OFF)
option(OFFSET_32BIT "type to use for offsets. off lets you use more memory.  on is necessary on beignet" ON)
option(COCL_SPAM "Lots of scrolly debug text.  Mostly for maintainer usage" OFF)

if(TESTS_CL_BRANCHES_AS_SWITCH)
    unset(TESTS_CL_RUN_TRANSFORMS CACHE)
endif()

set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS})
if(TESTS_DEVICELL_INLINE)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};-devicell-opt;inline)
endif()
if(TESTS_DEVICELL_MEM2REG)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};-devicell-opt;mem2reg)
endif()
if(TESTS_DEVICELL_INSTCOMBINE)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};-devicell-opt;instcombine)
endif()
if(TESTS_DEVICELL_OPT)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};-devicell-opt;-O${TESTS_DEVICELL_OPT})
endif()

if(TESTS_CL_RUN_TRANSFORMS)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};--run_branching_transforms)
endif()
if(TESTS_CL_BRANCHES_AS_SWITCH)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};--branches_as_switch)
endif()

set(EASYCL_SRCS src/EasyCL/CLKernel.cpp src/EasyCL/CLWrapper.cpp src/EasyCL/platforminfo_helper.cpp src/EasyCL/EasyCL.cpp
    src/EasyCL/deviceinfo_helper.cpp src/EasyCL/util/easycl_stringhelper.cpp src/EasyCL/DevicesInfo.cpp src/EasyCL/DeviceInfo.cpp)

set(COCL_SRCS src/hostside_opencl_funcs.cpp src/cocl_events.cpp src/cocl_blas.cpp src/cocl_device.cpp src/cocl_error.cpp
    src/cocl_memory.cpp src/cocl_properties.cpp src/cocl_streams.cpp src/cocl_clsources.cpp src/cocl_context.cpp
    src/ir-to-opencl.cpp src/function_names_map.cpp
    src/ir-to-opencl-common.cpp src/mutations.cpp src/readIR.cpp src/struct_clone.cpp
    src/branches_as_switch/branches_as_switch.cpp src/type_dumper.cpp
    src/handle_branching.cpp src/branching_transforms.cpp src/flowcontrolinstructions.cpp third_party/argparsecpp/argparsecpp.cpp
    src/flowcontrol/returnblock.cpp src/flowcontrol/sequence.cpp src/flowcontrol/basicblockblock.cpp
    src/flowcontrol/conditionalbranch.cpp src/flowcontrol/dowhile.cpp src/flowcontrol/if.cpp
    src/flowcontrol/for.cpp src/flowcontrol/rootblock.cpp src/flowcontrol/block.cpp)
set(COCL_SRCS src/type_dumper.cpp src/GlobalNames.cpp src/LocalNames.cpp
    # src/struct_clone.cpp
)

set(CMAKE_CC_FLAGS "-fPIC")
set(LLVM_COMPILE_FLAGS "-fvisibility-inlines-hidden -ffunction-sections -fdata-sections")
set(CMAKE_CXX_FLAGS "-std=c++11 -fPIC ${LLVM_COMPILE_FLAGS}")
add_definitions(-DUSE_CLEW)  # turns off direct linking with libOpenCL.so, all goes via clew dynamic loader (no need to link with libOpenCL at build time)
# for llvm:
add_definitions(-D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS)

set (LLVM_LIBS /usr/lib/llvm-3.8/lib/libLLVM.so)

set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-rpath,$ORIGIN")

# add_executable(ir-to-opencl
#     src/ir-to-opencl.cpp src/ir-to-opencl-common.cpp src/mutations.cpp src/readIR.cpp src/struct_clone.cpp
#     src/branches_as_switch/branches_as_switch.cpp
#     src/handle_branching.cpp src/branching_transforms.cpp src/flowcontrolinstructions.cpp third_party/argparsecpp/argparsecpp.cpp
#     src/flowcontrol/returnblock.cpp src/flowcontrol/sequence.cpp src/flowcontrol/basicblockblock.cpp
#     src/flowcontrol/conditionalbranch.cpp src/flowcontrol/dowhile.cpp src/flowcontrol/if.cpp
#     src/flowcontrol/for.cpp src/flowcontrol/rootblock.cpp src/flowcontrol/block.cpp
# )
# target_include_directories(ir-to-opencl PRIVATE src)
# target_include_directories(ir-to-opencl PRIVATE third_party/argparsecpp)
# target_include_directories(ir-to-opencl PRIVATE /usr/lib/llvm-3.8/include)
# set_target_properties(ir-to-opencl PROPERTIES
#     LINK_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${LLVM_LDFLAGS}"
# )
# target_link_libraries(ir-to-opencl "${LLVM_LIBS}")
# target_link_libraries(ir-to-opencl pthread)
# if(OFFSET_32BIT)
#     target_compile_definitions(ir-to-opencl PRIVATE -DOFFSET_32BIT)
# endif()

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
# target_include_directories(easycl PRIVATE src/EasyCL/thirdparty/clew/include/proxy-opencl)
target_include_directories(easycl PRIVATE src/EasyCL/thirdparty/clew/include)
target_include_directories(easycl PRIVATE src/EasyCL)
target_link_libraries(easycl clew)

add_library(cocl SHARED ${COCL_SRCS})
target_include_directories(cocl PRIVATE src/EasyCL/thirdparty/clew/include/proxy-opencl)
target_include_directories(cocl PRIVATE src/CLBlast/include)
target_include_directories(cocl PRIVATE include)
target_include_directories(cocl PRIVATE src)
target_include_directories(cocl PRIVATE third_party/argparsecpp)
target_include_directories(cocl PRIVATE /usr/lib/llvm-3.8/include)
if(COCL_SPAM)
    set(COCL_DEFINITIONS ${COCL_DEFINITIONS} -DCOCL_SPAM)
endif()
if(OFFSET_32BIT)
    set(COCL_DEFINITIONS ${COCL_DEFINITIONS} -DOFFSET_32BIT)
endif()
if(COCL_DEFINITIONS)
    target_compile_definitions(cocl PRIVATE ${COCL_DEFINITIONS})
endif()
target_link_libraries(cocl easycl)
target_link_libraries(cocl "${LLVM_LIBS}")

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
target_include_directories(clblast PRIVATE src/EasyCL/thirdparty/clew/include/proxy-opencl)
target_include_directories(clblast PRIVATE src/CLBlast/include)

target_link_libraries(cocl clblast)

# ==================================================================================================
# tests

include(cmake/cocl.cmake)

if(BUILD_TESTS)
    set(TESTS testblas cuda_sample context byvaluestructwithpointer multigpu multithreading
        offsetkernelargs properties test_bitcast test_callbacks testcumemcpy testevents2
        testevents testfloat4 test_kernelcachedok testmath testmemcpydevicetodevice test_memhostalloc
        testneg testnullpointer testpartialcopy testshfl teststream test_types
        singlebuffer
    )

    foreach(TEST ${TESTS})
        add_cocl_executable(${TEST} test/cocl/${TEST}.cu)
        add_custom_target(run-${TEST}
            COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${TEST}
            DEPENDS ${TEST}
        )
        set(TEST_TARGETS ${TEST_TARGETS} run-${TEST})
    endforeach()
    add_custom_target(run-tests
        DEPENDS ${TEST_TARGETS})

    if(UNIX)
        add_library(cocl_gtest SHARED third_party/gtest/gtest-all.cc)
        target_link_libraries(cocl_gtest pthread)
    else()
        add_library(cocl_gtest third_party/gtest/gtest-all.cc)
    endif()

    add_executable(cocl_unittests test/gtest/gtest_main.cpp test/gtest/GtestGlobals.cpp
        # test/gtest/test_block_dumper.cpp src/basicblockdumper.cpp
        test/gtest/test_type_dumper.cpp test/gtest/test_GlobalNames.cpp test/gtest/test_LocalNames.cpp
        # test/gtest/test_struct_cloner.cpp
    )
    target_include_directories(cocl_unittests PRIVATE src)
    target_include_directories(cocl_unittests PRIVATE third_party/gtest)
    target_include_directories(cocl_unittests PRIVATE /usr/lib/llvm-3.8/include)
    target_link_libraries(cocl_unittests "${LLVM_LIBS}" cocl_gtest easycl cocl)
endif(BUILD_TESTS)

FILE(GLOB_RECURSE COCL_HEADERS
  LIST_DIRECTORIES false
  ${CMAKE_CURRENT_SOURCE_DIR}/include/cocl/*)
set(CLEW_HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/src/EasyCL/thirdparty/clew/include/clew.h)
FILE(GLOB EASYCL_HEADERS_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/src/EasyCL/*.h)
# FILE(GLOB CLEW_PROXYHEADERS) ${CMAKE_CURRENT_SOURCE_DIR}/src/EasyCL/thirdparty/clew/include/proxy-opencl/*.h)

CONFIGURE_FILE(
  "${CMAKE_CURRENT_SOURCE_DIR}/cmake/cocl.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/cmake/cocl.cmake" @ONLY)
INSTALL(FILES ${COCL_HEADERS} DESTINATION include/cocl)
# INSTALL(FILES ${CLEW_PROXYHEADERS} DESTINATION include/clew/proxy-opencl)
INSTALL(PROGRAMS ${CMAKE_CURRENT_SOURCE_DIR}/bin/cocl DESTINATION bin)
INSTALL(FILES ${CMAKE_CURRENT_SOURCE_DIR}/share/cocl/cocl.Makefile DESTINATION share/cocl)
INSTALL(FILES ${CLEW_HEADERS} DESTINATION include)
INSTALL(FILES ${EASYCL_HEADERS_ROOT} DESTINATION include/EasyCL)
# INSTALL(FILES ${CMAKE_SOURCE_DIR}/cmake/cocl.cmake DESTINATION share/cocl)
INSTALL(FILES ${CMAKE_BINARY_DIR}/cmake/cocl.cmake DESTINATION share/cocl)
install(TARGETS easycl clew clblast cocl patch-hostside EXPORT cocl-targets
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
