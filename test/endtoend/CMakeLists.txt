# to build this, please build using the CMakeLists.txt in the repo root
# this CMakeLists.txt, the one you are reading, is included by that one, via the one
# in this one's parent folder

set(TESTS testblas cuda_sample context byvaluestructwithpointer multigpu multithreading
    offsetkernelargs properties test_bitcast test_callbacks testcumemcpy testevents2
    testevents testfloat4 test_kernelcachedok testmath testmemcpydevicetodevice test_memhostalloc
    testneg testnullpointer testpartialcopy testshfl teststream test_types
    singlebuffer test_devices test_buffers longname test_char test_structs
    test_floatstarstar
)

# include_directories(include/cocl/proxy_includes)
set(E2E_TEST_BUILD_TARGETS)
set(E2E_TEST_RUN_TARGETS)
foreach(TEST ${TESTS})
    cocl_add_executable(${TEST} ${TESTS_EXCLUDE} ${TEST}.cu)
    target_link_libraries(${TEST} cocl clew clblast easycl)
    target_include_directories(${TEST} PRIVATE ${COCL_INCLUDES})
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

set(BUILD_TEST_TARGETS ${BUILD_TEST_TARGETS} endtoend-tests PARENT_SCOPE)
set(RUN_TEST_TARGETS ${RUN_TEST_TARGETS} run-endtoend-tests PARENT_SCOPE)
