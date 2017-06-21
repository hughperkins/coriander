# project(EIGEN_TESTS)

# cmake_minimum_required(VERSION 3.0)

# set(CLANG_HOME "/usr/local/opt/llvm-4.0" CACHE STRING "the clang-4.0.0 folder, containing lib, bin etc")
set(EIGEN_HOME "UNKNOWN" CACHE STRING "eigen folder")

set(EIGEN_TESTS test_cuda_elementwise_small test_cuda_elementwise test_cuda_nullary reduction_tiny reduction_sum reduction reduction_prod reduction_mean
  argmax test_cuda_elementwise_equal test_equal_int32 test_equal_int64 test_cuda_elementwise_abs reduction_sum_axisall
)

# set(EIGEN_HOME ${CMAKE_CURRENT_SOURCE_DIR}/../../..)

if(NOT EXISTS ${CMAKE_CURRENT_BINARY_DIR}/split_test_helper.h)  
  file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/split_test_helper.h "")
  foreach(i RANGE 1 999)
    file(APPEND ${CMAKE_CURRENT_BINARY_DIR}/split_test_helper.h
      "#ifdef EIGEN_TEST_PART_${i}\n"
      "#define CALL_SUBTEST_${i}(FUNC) CALL_SUBTEST(FUNC)\n"
      "#else\n"
      "#define CALL_SUBTEST_${i}(FUNC)\n"
      "#endif\n\n"
    )
  endforeach()
endif()

# include_directories(${EIGEN_HOME})
# include_directories(${EIGEN_HOME}/test)
# include_directories(${CMAKE_CURRENT_BINARY_DIR})

add_definitions(-DEIGEN_TEST_NO_FP16)
if(INDEXES_32BIT)
    add_definitions(-DEIGEN_DEFAULT_DENSE_INDEX_TYPE=int32_t)
endif()

# include(/usr/local/share/cocl/cocl.cmake)

foreach(EIGEN_TEST ${EIGEN_TESTS})
    cocl_add_executable(${EIGEN_TEST} ${TESTS_EXCLUDE} ${EIGEN_TEST}.cu)
    target_link_libraries(${EIGEN_TEST} cocl clblast clew easycl)
    target_include_directories(${EIGEN_TEST} PRIVATE ${COCL_INCLUDES})
    target_include_directories(${EIGEN_TEST} PRIVATE ${EIGEN_HOME})
    target_include_directories(${EIGEN_TEST} PRIVATE ${EIGEN_HOME}/test)
    target_include_directories(${EIGEN_TEST} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})  # for split_test_helper.h
    add_custom_target(run-${EIGEN_TEST}
        COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${EIGEN_TEST}
        DEPENDS ${EIGEN_TEST} ${CMAKE_CURRENT_SOURCE_DIR}/${EIGEN_TEST}.cu
    )
    set(BUILD_EIGEN_TEST_TARGETS ${BUILD_EIGEN_TEST_TARGETS} ${EIGEN_TEST})
    set(RUN_EIGEN_TEST_TARGETS ${RUN_EIGEN_TEST_TARGETS} run-${EIGEN_TEST})
endforeach()

add_custom_target(eigen-tests
    DEPENDS ${BUILD_EIGEN_TEST_TARGETS})
add_custom_target(run-eigen-tests
    DEPENDS eigen-tests ${RUN_EIGEN_TEST_TARGETS})
