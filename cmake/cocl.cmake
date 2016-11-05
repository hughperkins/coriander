macro(add_cocl_executable OUTPUT SRCFILE)
    add_custom_command(
        OUTPUT ${OUTPUT}
        COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/bin/cocl ${SRCFILE} -o ${CMAKE_CURRENT_BINARY_DIR}/${OUTPUT}
        DEPENDS cocl clblast clew easycl
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
    )
    add_custom_target(build_${OUTPUT} ALL
        DEPENDS ${OUTPUT}
    )
endmacro(add_cocl_executable)

# add_custom_command()

# aMACRO(add_ srcfile)
  

#   INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

#   ### C/C++ sources
#   IF(src)      

#     ADD_LIBRARY(${package} MODULE ${src})
#     if(BUILD_STATIC)
#       ADD_LIBRARY(${package}_static STATIC ${src})
#     endif()

#     ### Torch packages supposes libraries prefix is "lib"
#     SET_TARGET_PROPERTIES(${package} PROPERTIES
#       PREFIX "lib"
#       IMPORT_PREFIX "lib"
#       INSTALL_NAME_DIR "@executable_path/${Torch_INSTALL_BIN2CPATH}")
    
#     IF(APPLE)
#       SET_TARGET_PROPERTIES(${package} PROPERTIES
#         LINK_FLAGS "-undefined dynamic_lookup")
#     ENDIF()

#     if(BUILD_STATIC)
#       SET_TARGET_PROPERTIES(${package}_static PROPERTIES
#         COMPILE_FLAGS "-fPIC")
#       SET_TARGET_PROPERTIES(${package}_static PROPERTIES
#         PREFIX "lib" IMPORT_PREFIX "lib" OUTPUT_NAME "${package}")
#     endif()

#     INSTALL(TARGETS ${package}
#       RUNTIME DESTINATION ${Torch_INSTALL_LUA_CPATH_SUBDIR}
#       LIBRARY DESTINATION ${Torch_INSTALL_LUA_CPATH_SUBDIR})
    
#   ENDIF(src)
  
#   ### lua sources
#   IF(luasrc)
#     INSTALL(FILES ${luasrc} 
#       DESTINATION ${Torch_INSTALL_LUA_PATH_SUBDIR}/${package})
#   ENDIF(luasrc)
    
# ENDMACRO(add_cocl_executable)
