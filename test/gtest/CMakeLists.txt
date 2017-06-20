# to build this, please build using the CMakeLists.txt in the repo root
# this CMakeLists.txt, the one you are reading, is included by that one, via the one
# in this one's parent folder

if(UNIX)
    add_library(cocl_gtest SHARED  ${TESTS_EXCLUDE} ${THIRD_PARTY_DIR}/gtest/gtest-all.cc)
    target_link_libraries(cocl_gtest pthread)
else()
    add_library(cocl_gtest  ${TESTS_EXCLUDE} ${THIRD_PARTY_DIR}/gtest/gtest-all.cc)
endif()

add_executable(gtest-tests ${TESTS_EXCLUDE} gtest_main.cpp GtestGlobals.cpp
    test_block_dumper.cpp test_new_instruction_dumper.cpp
    test_type_dumper.cpp test_GlobalNames.cpp test_LocalNames.cpp
    test_struct_cloner.cpp test_function_dumper.cpp
    test_kernel_dumper.cpp test_global_constants.cpp
    test_hostside_opencl_funcs.cpp test_logging.cpp
    test_expressions_helper.cpp test_shims.cpp
    # test_simple.cu
    # test_cocl_simple.cu
)
# target_include_directories(gtest-tests PRIVATE src)
target_include_directories(gtest-tests PRIVATE ${COCL_INCLUDES})
# target_include_directories(gtest-tests PRIVATE src/EasyCL/thirdparty/clew/include)
target_include_directories(gtest-tests PRIVATE ${THIRD_PARTY_DIR}/gtest)
target_include_directories(gtest-tests PRIVATE ${CLANG_HOME}/include)
target_link_libraries(gtest-tests cocl_gtest easycl cocl ${LLVM_LIBS} ${LLVM_SYSLIBS})
target_compile_options(gtest-tests PRIVATE ${LLVM_CXXFLAGS} ${LLVM_DEFINES} -DCMAKE_CURRENT_SOURCE_DIR=\"${CMAKE_CURRENT_SOURCE_DIR}\")

add_custom_target(run-gtest-tests
    COMMAND echo
    COMMAND echo make run-gtest-tests
    COMMAND ${COCL_DUMP_CL_STR} ${CMAKE_CURRENT_BINARY_DIR}/gtest-tests
    DEPENDS gtest-tests
    DEPENDS cocl
    DEPENDS patch_hostside
)

set(BUILD_TEST_TARGETS ${BUILD_TEST_TARGETS} gtest-tests PARENT_SCOPE)
set(RUN_TEST_TARGETS ${RUN_TEST_TARGETS} run-gtest-tests PARENT_SCOPE)
