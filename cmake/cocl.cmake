macro(add_cocl_executable OUTPUT SRCFILE)
    # if(TESTS_COCL_OPTIONS)
    # message("have TESTS_COCL_OPTIONS")
    # STRING(REGEX MATCHALL "[^;]+" TESTS_COCL_OPTIONS ${TESTS_COCL_OPTIONS})
    # endif()
    # message("have ${TESTS_COCL_OPTIONS}")
    add_custom_command(
        OUTPUT ${OUTPUT}
        COMMENT "${CMAKE_CURRENT_SOURCE_DIR}/bin/cocl ${SRCFILE} -o ${CMAKE_CURRENT_BINARY_DIR}/${OUTPUT} ${_TESTS_COCL_OPTIONS}"
        COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/bin/cocl ${SRCFILE} -o ${CMAKE_CURRENT_BINARY_DIR}/${OUTPUT} ${_TESTS_COCL_OPTIONS}
        DEPENDS cocl clblast clew easycl ir-to-opencl patch-hostside
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )
    add_custom_target(build_${OUTPUT}
        DEPENDS ${OUTPUT}
    )
endmacro(add_cocl_executable)
