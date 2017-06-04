macro(cocl_build_objects target_name target_type)
    set(shared)
    set(excludefromall)
    set(filenames)
    foreach(arg ${ARGN})
        if(${arg} STREQUAL SHARED)
            set(shared SHARED)
        elseif(${arg} STREQUAL EXCLUDE_FROM_ALL)
            set(excludefromall EXCLUDE_FROM_ALL)
        else()
            set(filenames ${filenames} ${arg})
        endif()
    endforeach()
    message("cocl_build_objects ${target_name} ${target_type} exclude from all: ${excludefromall} shared: ${shared} files: ${filenames}")

    set(DEF_CMDLINE)
    get_directory_property(DirDefs DIRECTORY ${CMAKE_SOURCE_DIR} COMPILE_DEFINITIONS)
    set(DEF_CMDLINE)
    foreach(DEF ${DirDefs})
        SET(DEF_CMDLINE ${DEF_CMDLINE} -D${DEF})
    endforeach()
    message("DEF_CMDLINE ${DEF_CMDLINE}")

    set(OBJECTS)
    foreach(filename ${filenames})
        get_filename_component(EXT ${filename} EXT)
        if(${EXT} STREQUAL .cu)
            set(OBJECTS ${OBJECTS} ${target_name}_${filename}.o)
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

    foreach(filename ${filenames})
        get_filename_component(EXT ${filename} EXT)
        if(${EXT} STREQUAL .cu)
            # message("its a cu")
            # for the bit with angle brackets, see https://cmake.org/cmake/help/v3.0/manual/cmake-generator-expressions.7.html#manual:cmake-generator-expressions(7)
            # it's because we dot actually know the include directories yet, at the time of executing the contents of this macro
            # note that, despite what that page may claim, generator expressions cannot contain spaces, eg see:
            # http://cmake.3232098.n2.nabble.com/Custom-Commands-Generator-Expressions-tp7586630p7586631.html
            # (finding this bit about whitespace cost me a world of pain...)
                    # CLANG_HOME=${LLVM40_HOME}
            add_custom_command(
                OUTPUT ${target_name}_${filename}.o
                COMMAND
                    ${COCL_PATH}
                    ${DEF_CMDLINE}
                    "$<$<BOOL:$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>>:-I$<JOIN:$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>,;-I>>"
                    ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
                    -o ${target_name}_${filename}.o
                    -c
                    ${_TESTS_COCL_OPTIONS}
                DEPENDS ${filename}
                COMMAND_EXPAND_LISTS
            )
            add_custom_target(build_${target_name}_${filename}_o
                DEPENDS ${target}_${filename}.o
            )
        endif()
    endforeach()
endmacro()
