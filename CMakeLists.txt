cmake_minimum_required(VERSION 2.8)

option(BUILD_TESTS "Build tests" OFF)
set(TESTS_COCL_OPTIONS "" CACHE STRING "cocl options, semicolon-separated.  See cocl -h")
# option(TESTS_RUN_TRANSFORM_BRANCHES "")
option(TESTS_DEVICELL_INLINE "cocl option for tests" ON)
option(TESTS_DEVICELL_MEM2REG "cocl option for tests" ON)
option(TESTS_DEVICELL_INSTCOMBINE "cocl option for tests" ON)
set(TESTS_DEVICELL_OPT "O2" CACHE STRING "cocl option for tests")
option(OFFSET_32BIT "type to use for offsets. off lets you use more memory.  on is necessary on beignet" ON)
option(EXPLAIN_CL "Add IR code into OpenCL.  For maintainers mostly" OFF)
option(COCL_SPAM "Lots of scrolly debug text.  Mostly for maintainer usage" OFF)
set(CLANG_HOME "/usr/lib/llvm-3.8" CACHE STRING "eg the downloaded clang-3.8.0 folder, containing lib, bin etc")

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
if(EXPLAIN_CL)
set(_TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS};--add_ir_to_cl)
endif()

set(EASYCL_SRCS src/EasyCL/CLKernel.cpp src/EasyCL/CLWrapper.cpp src/EasyCL/platforminfo_helper.cpp src/EasyCL/EasyCL.cpp
    src/EasyCL/deviceinfo_helper.cpp src/EasyCL/util/easycl_stringhelper.cpp src/EasyCL/DevicesInfo.cpp src/EasyCL/DeviceInfo.cpp)

# set(COCL_BRANCHING_SRCS
#     src/branches_as_switch/branches_as_switch.cpp
#     src/handle_branching.cpp src/branching_transforms.cpp src/flowcontrolinstructions.cpp
#     src/flowcontrol/returnblock.cpp src/flowcontrol/sequence.cpp src/flowcontrol/basicblockblock.cpp
#     src/flowcontrol/conditionalbranch.cpp src/flowcontrol/dowhile.cpp src/flowcontrol/if.scpp
#     src/flowcontrol/for.cpp src/flowcontrol/rootblock.cpp src/flowcontrol/block.cpp)

# message("CLANG_HOME: ${CLANG_HOME}")

set(COCL_SRCS src/type_dumper.cpp src/GlobalNames.cpp src/LocalNames.cpp src/InstructionDumper.cpp
    src/ConstantDumper.cpp
    src/struct_clone.cpp src/basicblockdumper.cpp src/ExpressionsHelper.cpp src/readIR.cpp
    src/function_names_map.cpp src/function_dumper.cpp src/kernel_dumper.cpp src/mutations.cpp
    src/ir-to-opencl_main.cpp third_party/argparsecpp/argparsecpp.cpp
    src/hostside_opencl_funcs.cpp src/cocl_events.cpp src/cocl_blas.cpp src/cocl_device.cpp src/cocl_error.cpp
    src/cocl_memory.cpp src/cocl_properties.cpp src/cocl_streams.cpp src/cocl_clsources.cpp src/cocl_context.cpp
    src/ir-to-opencl.cpp src/shims.cpp
)

set(CMAKE_CC_FLAGS "-fPIC")
set(CMAKE_CXX_FLAGS "-std=c++11 -fPIC")
add_definitions(-DUSE_CLEW)  # turns off direct linking with libOpenCL.so, all goes via clew dynamic loader (no need to link with libOpenCL at build time)
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-rpath,$ORIGIN")

execute_process(
    COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/cmake/get-llvm-cxxflags.sh ${CLANG_HOME}
    OUTPUT_VARIABLE LLVM_CXXFLAGS
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
message("LLVM_CXXFLAGS ${LLVM_CXXFLAGS}")
STRING(REGEX REPLACE " " ";" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
message("LLVM_CXXFLAGS ${LLVM_CXXFLAGS}")
string(REGEX REPLACE ";-std=c\\+\\+0x" ";-std=c++11" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
string(REGEX REPLACE ";-fno-exceptions" ";-fexceptions" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
string(REGEX REPLACE ";-DNDEBUG" "" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
string(REGEX REPLACE ";-isysroot;[^;]" "" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
message("LLVM_CXXFLAGS ${LLVM_CXXFLAGS}")

# split LLVM_CXXFLAGS into defines vs other options
STRING(REGEX MATCHALL ";-D[^;]+" LLVM_DEFINES "${LLVM_CXXFLAGS}")
STRING(REGEX REPLACE ";+" ";" LLVM_DEFINES "${LLVM_DEFINES}")
STRING(REGEX REPLACE ";-D[^;]+" "" LLVM_CXXFLAGS "${LLVM_CXXFLAGS}")
message("LLVM_DEFINES ${LLVM_DEFINES}")
message("LLVM_CXXFLAGS ${LLVM_CXXFLAGS}")

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
target_link_libraries(ir-to-opencl cocl ${LLVM_SYSLIBS})
# if(OFFSET_32BIT)
#     target_compile_definitions(ir-to-opencl PRIVATE -DOFFSET_32BIT)
# endif()

add_executable(patch-hostside
    src/patch-hostside.cpp src/struct_clone.cpp src/mutations.cpp src/readIR.cpp
    third_party/argparsecpp/argparsecpp.cpp src/type_dumper.cpp src/GlobalNames.cpp
    src/EasyCL/util/easycl_stringhelper.cpp
)
target_include_directories(patch-hostside PRIVATE ${CLANG_HOME}/include)
target_include_directories(patch-hostside PRIVATE third_party/argparsecpp)
target_include_directories(patch-hostside PRIVATE src/EasyCL)
target_compile_options(patch-hostside PRIVATE ${LLVM_CXXFLAGS} ${LLVM_DEFINES})
target_link_libraries(patch-hostside "${LLVM_LIBS}"  ${LLVM_SYSLIBS})

add_library(clew SHARED src/EasyCL/thirdparty/clew/src/clew.c)
target_include_directories(clew PRIVATE src/EasyCL/thirdparty/clew/include)
target_link_libraries(clew dl)

add_library(easycl SHARED ${EASYCL_SRCS})
target_include_directories(easycl PRIVATE src/EasyCL/thirdparty/clew/include)
target_include_directories(easycl PRIVATE src/EasyCL)
target_link_libraries(easycl clew)

add_library(cocl SHARED ${COCL_SRCS})
target_include_directories(cocl PRIVATE src/EasyCL/thirdparty/clew/include/proxy-opencl)
target_include_directories(cocl PRIVATE src/CLBlast/include)
target_include_directories(cocl PRIVATE include)
target_include_directories(cocl PRIVATE src)
target_include_directories(cocl PRIVATE third_party/argparsecpp)
target_include_directories(cocl PRIVATE ${CLANG_HOME}/include)
target_include_directories(cocl PRIVATE src/EasyCL/thirdparty/clew/include)
if(COCL_SPAM)
    set(COCL_DEFINITIONS ${COCL_DEFINITIONS} -DCOCL_SPAM)
endif()
if(OFFSET_32BIT)
    set(COCL_DEFINITIONS ${COCL_DEFINITIONS} -DOFFSET_32BIT)
endif()
if(COCL_DEFINITIONS)
    target_compile_definitions(cocl PRIVATE ${COCL_DEFINITIONS})
endif()
target_compile_options(cocl PRIVATE ${LLVM_CXXFLAGS} ${LLVM_DEFINES})
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
target_include_directories(clblast PRIVATE src/EasyCL/thirdparty/clew/include/proxy-opencl)
target_include_directories(clblast PRIVATE src/CLBlast/include)
target_include_directories(clblast PRIVATE src/EasyCL/thirdparty/clew/include)
target_link_libraries(clblast clew)

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

    add_executable(test_instructiondumper test/gtest/gtest_main.cpp test/gtest/GtestGlobals.cpp
      src/type_dumper.cpp src/GlobalNames.cpp src/LocalNames.cpp src/ConstantDumper.cpp
      src/mutations.cpp src/ExpressionsHelper.cpp src/readIR.cpp
      src/function_names_map.cpp
      src/InstructionDumper.cpp test/gtest/test_instructiondumper.cpp)
    target_include_directories(test_instructiondumper PRIVATE src)
    target_include_directories(test_instructiondumper PRIVATE third_party/gtest)
    target_include_directories(test_instructiondumper PRIVATE /usr/lib/llvm-3.8/include)
    target_link_libraries(test_instructiondumper "${LLVM_LIBS}" cocl_gtest easycl ${LLVM_SYSLIBS})

    add_executable(cocl_unittests test/gtest/gtest_main.cpp test/gtest/GtestGlobals.cpp
        test/gtest/test_block_dumper.cpp test/gtest/test_instructiondumper.cpp
        test/gtest/test_type_dumper.cpp test/gtest/test_GlobalNames.cpp test/gtest/test_LocalNames.cpp
        test/gtest/test_struct_cloner.cpp test/gtest/test_function_dumper.cpp
        test/gtest/test_kernel_dumper.cpp test/gtest/test_global_constants.cpp
    )
    target_include_directories(cocl_unittests PRIVATE src)
    target_include_directories(cocl_unittests PRIVATE third_party/gtest)
    target_include_directories(cocl_unittests PRIVATE ${CLANG_HOME}/include)
    target_link_libraries(cocl_unittests cocl_gtest easycl cocl ${LLVM_LIBS} ${LLVM_SYSLIBS})
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
install(TARGETS easycl clew clblast cocl patch-hostside ir-to-opencl EXPORT cocl-targets
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
