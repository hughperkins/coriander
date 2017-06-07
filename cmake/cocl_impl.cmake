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

    set(OBJECTS)
    foreach(filename ${filenames})
        get_filename_component(EXT ${filename} EXT)
        string(REPLACE / _ FILENAME_NO_SLASH ${filename})
        if(${EXT} STREQUAL .cu)
            # for the bit with angle brackets, see https://cmake.org/cmake/help/v3.0/manual/cmake-generator-expressions.7.html#manual:cmake-generator-expressions(7)
            # it's because we dot actually know the include directories yet, at the time of executing the contents of this macro
            # note that, despite what that page may claim, generator expressions cannot contain spaces, eg see:
            # http://cmake.3232098.n2.nabble.com/Custom-Commands-Generator-Expressions-tp7586630p7586631.html
            # (finding this bit about whitespace cost me a world of pain...)
                    #"$<$<BOOL:$<TARGET_PROPERTY:${target_name},COMPILE_FLAGS>>:$<JOIN:$<TARGET_PROPERTY:${target_name},COMPILE_FLAGS>,;>>"
                    # "$<$<BOOL:$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>>:-I$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>>"
                    # "$<$<BOOL:$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>>:$<JOIN:-I$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>,;-I>>"
            add_custom_command(
                OUTPUT ${target_name}.d/${filename}.o
                COMMAND
                    ${COCL_PATH}
                    --clang-home ${CLANG_HOME}
                    "$<$<BOOL:$<TARGET_PROPERTY:${target_name},COMPILE_FLAGS>>:$<JOIN:$<TARGET_PROPERTY:${target_name},COMPILE_FLAGS>,;>>;"
                    "$<$<BOOL:$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>>:$<JOIN:-I$<TARGET_PROPERTY:${target_name},INCLUDE_DIRECTORIES>,;-I>>"
                    ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
                    -o ${target_name}.d/${filename}.o
                    -c
                DEPENDS ${filename}
                VERBATIM
            )
            add_custom_target(build_${target_name}_${FILENAME_NO_SLASH}_o
                DEPENDS ${target}.d/${filename}.o
            )
            set(OBJECTS ${OBJECTS} ${target_name}.d/${filename}.o)
        else()
            set(OBJECTS ${OBJECTS} ${filename})
        endif()
    endforeach()

    if(${target_type} STREQUAL EXECUTABLE)
        add_executable(${target_name} ${excludefromall} ${OBJECTS})
    elseif(${target_type} STREQUAL LIBRARY)
        add_library(${target_name} ${shared} ${OBJECTS})
    endif()
    set_target_properties(${target_name} PROPERTIES LINKER_LANGUAGE CXX)
endmacro()

macro(cocl_add_executable target_name)
    cocl_build_objects(${target_name} EXECUTABLE ${ARGN})
endmacro(cocl_add_executable)

macro(cocl_add_library target_name)
    cocl_build_objects(${target_name} LIBRARY ${ARGN})
endmacro(cocl_add_library)

find_library(COCL_RUNTIME_LIBRARY cocl HINTS ${COCL_LIB})
find_library(CLBLAST_RUNTIME_LIBRARY clblast HINTS ${COCL_LIB})
find_library(CLEW_RUNTIME_LIBRARY clew HINTS ${COCL_LIB})
find_library(EASYCL_RUNTIME_LIBRARY easycl HINTS ${COCL_LIB})
mark_as_advanced(FORCE COCL_RUNTIME_LIBRARY CLBLAST_RUNTIME_LIBRARY CLEW_RUNTIME_LIBRARY EASYCL_RUNTIME_LIBRARY)

SET(Coriander_LIBRARIES ${COCL_RUNTIME_LIBRARY} ${CLBLAST_RUNTIME_LIBRARY} ${EASYCL_RUNTIME_LIBRARY} ${CLEW_RUNTIME_LIBRARY})
