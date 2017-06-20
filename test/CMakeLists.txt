# Designed to be run from the main CMakeLists.txt, in the root of the Coriander repo
# via include(...)

set(TESTS_EXCLUDE EXCLUDE_FROM_ALL)
if(BUILD_TESTS)
  set(TESTS_EXCLUDE)
endif(BUILD_TESTS)

add_subdirectory(test/gtest)
add_subdirectory(test/endtoend)

if(EIGEN_TESTS)
  add_subdirectory(test/eigen)
  set(BUILD_TEST_TARGETS ${BUILD_TEST_TARGETS} eigen-tests)
  set(RUN_TEST_TARGETS ${RUN_TEST_TARGETS} run-eigen-tests)
endif()

add_custom_target(tests
    DEPENDS clblast clew easycl cocl patch_hostside ir-to-opencl ${BUILD_TEST_TARGETS})
add_custom_target(run-tests
    DEPENDS tests ${RUN_TEST_TARGETS})
