macro(add_cocl_executable OUTPUT SRCFILE)
    add_custom_command(
        OUTPUT ${OUTPUT}
        COMMENT "${CMAKE_CURRENT_SOURCE_DIR}/bin/cocl ${SRCFILE} -o ${CMAKE_CURRENT_BINARY_DIR}/${OUTPUT}"
        COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/bin/cocl ${SRCFILE} -o ${CMAKE_CURRENT_BINARY_DIR}/${OUTPUT}
        DEPENDS cocl clblast clew easycl
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )
    add_custom_target(build_${OUTPUT} ALL
        DEPENDS ${OUTPUT}
    )
endmacro(add_cocl_executable)
