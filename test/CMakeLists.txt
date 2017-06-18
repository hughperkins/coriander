# Designed to be run from the main CMakeLists.txt, in the root of the Coriander repo
# via include(...)

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

# set(COCL_DUMP_CL_STR "COCL_DUMP_CL=1")
include_directories(include/cocl/proxy_includes)
set(E2E_TEST_BUILD_TARGETS)
set(E2E_TEST_RUN_TARGETS)
foreach(TEST ${TESTS})
    cocl_add_executable(${TEST} ${TESTS_EXCLUDE} test/endtoend/${TEST}.cu)
    target_link_libraries(${TEST} cocl clew clblast easycl)
    add_custom_target(run-${TEST}
        COMMAND echo
        COMMAND echo make run-${TEST}
        COMMAND ${COCL_DUMP_CL_STR} ${CMAKE_CURRENT_BINARY_DIR}/${TEST}
        DEPENDS ${TEST}
        DEPENDS cocl
        DEPENDS patch_hostside
    )
    set(E2E_TEST_BUILD_TARGETS ${E2E_TEST_BUILD_TARGETS} ${TEST})
    set(E2E_TEST_RUN_TARGETS ${E2E_TEST_RUN_TARGETS} run-${TEST})
endforeach()

add_custom_target(endtoend-tests
    DEPENDS ${E2E_TEST_BUILD_TARGETS})
add_custom_target(run-endtoend-tests
    DEPENDS endtoend-tests ${E2E_TEST_RUN_TARGETS})

set(BUILD_TEST_TARGETS ${BUILD_TEST_TARGETS} endtoend-tests)
set(RUN_TEST_TARGETS ${RUN_TEST_TARGETS} run-endtoend-tests)

# add_custom_target(run-tests-travis
#   DEPENDS run-cuda_sample run-context run-offsetkernelargs run-test_callbacks run-testcumemcpy
#       run-testnullpointer run-testpartialcopy run-teststream run-singlebuffer)

if(UNIX)
    add_library(cocl_gtest SHARED  ${TESTS_EXCLUDE} third_party/gtest/gtest-all.cc)
    target_link_libraries(cocl_gtest pthread)
else()
    add_library(cocl_gtest  ${TESTS_EXCLUDE} third_party/gtest/gtest-all.cc)
endif()

add_executable(gtest-tests ${TESTS_EXCLUDE} test/gtest/gtest_main.cpp test/gtest/GtestGlobals.cpp
    test/gtest/test_block_dumper.cpp test/gtest/test_new_instruction_dumper.cpp
    test/gtest/test_type_dumper.cpp test/gtest/test_GlobalNames.cpp test/gtest/test_LocalNames.cpp
    test/gtest/test_struct_cloner.cpp test/gtest/test_function_dumper.cpp
    test/gtest/test_kernel_dumper.cpp test/gtest/test_global_constants.cpp
    test/gtest/test_hostside_opencl_funcs.cpp test/gtest/test_logging.cpp
    test/gtest/test_expressions_helper.cpp test/gtest/test_shims.cpp
    # test/gtest/test_simple.cu
    # test/gtest/test_cocl_simple.cu
)
target_include_directories(gtest-tests PRIVATE src)
target_include_directories(gtest-tests PRIVATE include)
target_include_directories(gtest-tests PRIVATE src/EasyCL/thirdparty/clew/include)
target_include_directories(gtest-tests PRIVATE third_party/gtest)
target_include_directories(gtest-tests PRIVATE ${CLANG_HOME}/include)
target_link_libraries(gtest-tests cocl_gtest easycl cocl ${LLVM_LIBS} ${LLVM_SYSLIBS})
target_compile_options(gtest-tests PRIVATE ${LLVM_CXXFLAGS} ${LLVM_DEFINES})

add_custom_target(run-gtest-tests
    COMMAND echo
    COMMAND echo make run-gtest-tests
    COMMAND ${COCL_DUMP_CL_STR} ${CMAKE_CURRENT_BINARY_DIR}/gtest-tests
    DEPENDS gtest-tests
    DEPENDS cocl
    DEPENDS patch_hostside
)

set(BUILD_TEST_TARGETS ${BUILD_TEST_TARGETS} gtest-tests)
set(RUN_TEST_TARGETS ${RUN_TEST_TARGETS} run-gtest-tests)

if(EIGEN_TESTS)
  add_subdirectory(test/eigen)
  set(BUILD_TEST_TARGETS ${BUILD_TEST_TARGETS} eigen-tests)
  set(RUN_TEST_TARGETS ${RUN_TEST_TARGETS} run-eigen-tests)
endif()

add_custom_target(tests
    DEPENDS clblast clew easycl cocl patch_hostside ir-to-opencl ${BUILD_TEST_TARGETS})
add_custom_target(run-tests
    DEPENDS tests ${RUN_TEST_TARGETS})
