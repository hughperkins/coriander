cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

set(LLVM40_HOME "/usr/local/opt/llvm-4.0" CACHE STRING "LLVM-4.0.0 directory, containing bin/clang++ etc")

macro(cocl_build_objects target_name target_type shared)
    set(filenames ${ARGN})
    if(NOT ${shared} STREQUAL SHARED)
        set(filenames ${filenames} ${shared})
        set(shared)
    endif()
    message("cocl_add_executable ${target_name} ${filenames}")
    message("shared ${shared}")

    # get_target_property(CURRENT_INCLUDE ${target_name} INCLUDE_DIRECTORIES)
    # message("target include directoires ${CURRENT_INCLUDE}")

    set(INCLUDE_ARGS)
    # get_directory_property(CURRENT_INCLUDE INCLUDE_DIRECTORIES)
    # STRING(REGEX MATCHALL "[^;]+" CURRENT_INCLUDE "${CURRENT_INCLUDE}")
    # foreach(INCDIR ${CURRENT_INCLUDE})
    #     SET(INCLUDE_ARGS ${INCLUDE_ARGS} -I ${INCDIR})
    # endforeach()
    # message("INCLUDE_ARGS ${INCLUDE_ARGS}")

    set(DEF_CMDLINE)
    get_directory_property(DirDefs DIRECTORY ${CMAKE_SOURCE_DIR} COMPILE_DEFINITIONS)
    set(DEF_CMDLINE)
    foreach(DEF ${DirDefs})
        SET(DEF_CMDLINE ${DEF_CMDLINE} -D${DEF})
    endforeach()
    message("DEF_CMDLINE ${DEF_CMDLINE}")

    set(OBJECTS)
    foreach(filename ${filenames})
        message("=====================")
        get_filename_component(EXT ${filename} EXT)
        message("filename ${filename} EXT ${EXT}")
        if(${EXT} STREQUAL .cu)
            message("its a cu")
            # set(COMMAND CLANG_HOME=${LLVM40_HOME}
            #     /usr/local/bin/cocl
            #     ${DEF_CMDLINE}
            #     ${INCLUDE_ARGS}
            #     ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
            #     -o ${filename}.o
            #     -c
            #     ${_TESTS_COCL_OPTIONS}
            # )
            # message("COMMAND ${COMMAND}")
            # add_custom_command(
            #     OUTPUT ${filename}.o
            #     COMMAND ${COMMAND} "-I$<JOIN:$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>,;-I>"
            #     DEPENDS ${filename}
            # )
            # add_custom_target(build_${target_name}_${filename}_o
            #     DEPENDS ${filename}.o
            # )
            # set(OBJECT_TARGETS ${OBJECT_TARGETS} build_${target_name}_${filename}_o)
            set(OBJECTS ${OBJECTS} ${filename}.o)
        else()
            set(OBJECTS ${OBJECTS} ${filename})
        endif()
    endforeach()

    if(${target_type} STREQUAL EXECUTABLE)
        add_executable(${target_name} ${OBJECTS})
    elseif(${target_type} STREQUAL LIBRARY)
        add_library(${target_name} ${shared} ${OBJECTS})
    endif()
    set_target_properties(${target_name} PROPERTIES LINKER_LANGUAGE CXX)

    # get_target_property(CURRENT_INCLUDE ${target_name} INCLUDE_DIRECTORIES)
    # message("target include directoires ${CURRENT_INCLUDE}")

    foreach(filename ${filenames})
        message("=====================")
        get_filename_component(EXT ${filename} EXT)
        message("filename ${filename} EXT ${EXT}")
                # ${INCLUDE_ARGS}
        if(${EXT} STREQUAL .cu)
            message("its a cu")
            set(COMMAND
                CLANG_HOME=${LLVM40_HOME}
                /usr/local/bin/cocl
                ${DEF_CMDLINE}
                # '\$\<\$\<BOOL:\$\<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>>:-I\$\<JOIN:\$\<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>,;-I>>'
                ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
                -o ${filename}.o
                -c
                ${_TESTS_COCL_OPTIONS}
            )
            message("COMMAND ${COMMAND}")
            # for the bit with angle brackets, see https://cmake.org/cmake/help/v3.0/manual/cmake-generator-expressions.7.html#manual:cmake-generator-expressions(7)
            # it's because we dot actually know the include directories yet, at the time of executing the contents of this macro
            # note that, despite what that page may claim, generator expressions cannot contain spaces, eg see:
            # http://cmake.3232098.n2.nabble.com/Custom-Commands-Generator-Expressions-tp7586630p7586631.html
            # (finding this bit about whitespace cost me a world of pain...)
                    # CLANG_HOME=${LLVM40_HOME}
            add_custom_command(
                OUTPUT ${filename}.o
                COMMAND
                    /usr/local/bin/cocl
                    ${DEF_CMDLINE}
                    "$<$<BOOL:$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>>:-I$<JOIN:$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>,;-I>>"
                    ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
                    -o ${filename}.o
                    -c
                    ${_TESTS_COCL_OPTIONS}
                DEPENDS ${filename}
                COMMAND_EXPAND_LISTS
            )
            add_custom_target(build_${target_name}_${filename}_o
                DEPENDS ${filename}.o
            )
        #     set(OBJECT_TARGETS ${OBJECT_TARGETS} build_${target_name}_${filename}_o)
        #     set(OBJECTS ${OBJECTS} ${filename}.o)
        # else()
        #     set(OBJECTS ${OBJECTS} ${filename})
        endif()
    endforeach()
endmacro()

macro(cocl_add_executable target_name)
    set(filenames ${ARGN})
    message("cocl_add_executable ${target_name} ${filenames}")
    # set(OBJECTS)
    # foreach(filename ${filenames})
    #     message("=====================")
    #     get_filename_component(EXT ${filename} EXT)
    #     message("filename ${filename} EXT ${EXT}")
    #     if(${EXT} STREQUAL .cu)
    #         message("its a cu")
    #         set(COMMAND CLANG_HOME=${LLVM40_HOME}
    #             /usr/local/bin/cocl
    #             ${DEF_CMDLINE}
    #             ${INCLUDE_ARGS}
    #             ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
    #             -o ${filename}.o
    #             -c
    #             ${_TESTS_COCL_OPTIONS}
    #         )
    #         message("COMMAND ${COMMAND}")
    #         add_custom_command(
    #             OUTPUT ${filename}.o
    #             COMMAND ${COMMAND}
    #             DEPENDS ${filename}
    #         )
    #         add_custom_target(build_${target_name}_${filename}_o
    #             DEPENDS ${filename}.o
    #         )
    #         set(OBJECT_TARGETS ${OBJECT_TARGETS} build_${target_name}_${filename}_o)
    #         set(OBJECTS ${OBJECTS} ${filename}.o)
    #     else()
    #         set(OBJECTS ${OBJECTS} ${filename})
    #     endif()
    # endforeach()

    cocl_build_objects(${target_name} EXECUTABLE ${filenames})
    # message("OBJECTS ${OBJECTS}")
    # add_executable(${target_name} ${OBJECTS})
    # set_target_properties(${target_name} PROPERTIES LINKER_LANGUAGE CXX)
endmacro(cocl_add_executable)

macro(cocl_add_library target_name shared)
    set(filenames ${ARGN})
    if(NOT ${shared} STREQUAL SHARED)
        set(filenames ${filenames} ${shared})
        set(shared)
    endif()
    message("cocl_add_library ${target_name} shared=${shared}; ${filenames}")

    cocl_build_objects(${target_name} LIBRARY ${shared} ${filenames})

    # set(OBJECTS)
    # foreach(filename ${filenames})
    #     message("=====================")
    #     get_filename_component(EXT ${filename} EXT)
    #     message("filename ${filename} EXT ${EXT}")
    #     if(${EXT} STREQUAL .cu)
    #         message("its a cu")
    #         set(COMMAND CLANG_HOME=${LLVM40_HOME}
    #             /usr/local/bin/cocl
    #             ${DEF_CMDLINE}
    #             ${INCLUDE_ARGS}
    #             ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
    #             -o ${filename}.o
    #             -c
    #             ${_TESTS_COCL_OPTIONS}
    #         )
    #         message("COMMAND ${COMMAND}")
    #         add_custom_command(
    #             OUTPUT ${filename}.o
    #             COMMAND ${COMMAND}
    #             DEPENDS ${filename}
    #         )
    #         add_custom_target(build_${target_name}_${filename}_o
    #             DEPENDS ${filename}.o
    #         )
    #         # set(OBJECT_TARGETS ${OBJECT_TARGETS} build_${target_name}_${filename}_o)
    #         set(OBJECTS ${OBJECTS} ${filename}.o)
    #     else()
    #         set(OBJECTS ${OBJECTS} ${filename})
    #     endif()
    # endforeach()

    # message("OBJECTS ${OBJECTS}")
    # add_library(${target_name} ${shared} ${OBJECTS})
    # set_target_properties(${target_name} PROPERTIES LINKER_LANGUAGE CXX)
endmacro(cocl_add_library)

cocl_add_executable(cuda_sample cuda_sample.cu)
target_link_libraries(cuda_sample cocl clblast clew)

# cocl_add_executable(many_cpp many_cpp.cpp many_cc.cc many_cu.cu)
# target_link_libraries(many_cpp cocl clblast clew)
# target_include_directories(many_cpp PRIVATE include)

# include_directories(include2)
# include_directories(include3)

cocl_add_library(mylibrary many_cc.cc many_cu.cu)
target_include_directories(mylibrary PRIVATE paris include anotherinc)
target_link_libraries(mylibrary cocl clblast clew)

# cocl_add_library(mylibrary_static many_cc.cc many_cu.cu)
# target_include_directories(mylibrary_static PRIVATE include)
# target_link_libraries(mylibrary_static cocl clblast clew)

# cocl_add_executable(uses_mylibrary many_cpp.cpp)
# target_link_libraries(uses_mylibrary cocl clblast clew mylibrary)
# target_include_directories(uses_mylibrary PRIVATE include)

# cocl_add_executable(uses_mylibrary_static many_cpp.cpp)
# target_link_libraries(uses_mylibrary_static cocl clblast clew mylibrary_static)
# target_include_directories(uses_mylibrary_static PRIVATE include)
