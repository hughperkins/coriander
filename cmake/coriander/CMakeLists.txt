cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

set(LLVM40_HOME "/usr/local/opt/llvm-4.0" CACHE STRING "LLVM-4.0.0 directory, containing bin/clang++ etc")

# macro(cocl_build_objects)
    # 

macro(cocl_add_executable target_name)
    set(filenames ${ARGN})
    message("cocl_add_executable ${target_name} ${filenames}")
    set(OBJECTS)
    foreach(filename ${filenames})
        message("=====================")
        get_filename_component(EXT ${filename} EXT)
        message("filename ${filename} EXT ${EXT}")
        if(${EXT} STREQUAL .cu)
            message("its a cu")
            set(COMMAND CLANG_HOME=${LLVM40_HOME}
                /usr/local/bin/cocl
                ${DEF_CMDLINE}
                ${INCLUDE_ARGS}
                ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
                -o ${filename}.o
                -c
                ${_TESTS_COCL_OPTIONS}
            )
            message("COMMAND ${COMMAND}")
            add_custom_command(
                OUTPUT ${filename}.o
                COMMAND ${COMMAND}
                DEPENDS ${filename}
            )
            add_custom_target(build_${target_name}_${filename}_o
                DEPENDS ${filename}.o
            )
            set(OBJECT_TARGETS ${OBJECT_TARGETS} build_${target_name}_${filename}_o)
            set(OBJECTS ${OBJECTS} ${filename}.o)
        else()
            set(OBJECTS ${OBJECTS} ${filename})
        endif()
    endforeach()

    message("OBJECTS ${OBJECTS}")
    add_executable(${target_name} ${OBJECTS})
    set_target_properties(${target_name} PROPERTIES LINKER_LANGUAGE CXX)
endmacro(cocl_add_executable)

macro(cocl_add_library target_name shared)
    set(filenames ${ARGN})
    if(NOT ${shared} STREQUAL SHARED)
        set(filenames ${filenames} ${shared})
        set(shared)
    endif()
    message("cocl_add_executable ${target_name} ${filenames}")
    set(OBJECTS)
    foreach(filename ${filenames})
        message("=====================")
        get_filename_component(EXT ${filename} EXT)
        message("filename ${filename} EXT ${EXT}")
        if(${EXT} STREQUAL .cu)
            message("its a cu")
            set(COMMAND CLANG_HOME=${LLVM40_HOME}
                /usr/local/bin/cocl
                ${DEF_CMDLINE}
                ${INCLUDE_ARGS}
                ${CMAKE_CURRENT_SOURCE_DIR}/${filename}
                -o ${filename}.o
                -c
                ${_TESTS_COCL_OPTIONS}
            )
            message("COMMAND ${COMMAND}")
            add_custom_command(
                OUTPUT ${filename}.o
                COMMAND ${COMMAND}
                DEPENDS ${filename}
            )
            add_custom_target(build_${target_name}_${filename}_o
                DEPENDS ${filename}.o
            )
            set(OBJECT_TARGETS ${OBJECT_TARGETS} build_${target_name}_${filename}_o)
            set(OBJECTS ${OBJECTS} ${filename}.o)
        else()
            set(OBJECTS ${OBJECTS} ${filename})
        endif()
    endforeach()

    message("OBJECTS ${OBJECTS}")
    add_library(${target_name} ${shared} ${OBJECTS})
    set_target_properties(${target_name} PROPERTIES LINKER_LANGUAGE CXX)
endmacro(cocl_add_executable)

cocl_add_executable(cuda_sample cuda_sample.cu)
target_link_libraries(cuda_sample cocl clblast clew)

cocl_add_executable(many_cpp many_cpp.cpp many_cc.cc many_cu.cu)
target_link_libraries(many_cpp cocl clblast clew)
target_include_directories(many_cpp PRIVATE include)

cocl_add_library(mylibrary SHARED many_cc.cc many_cu.cu)
target_include_directories(mylibrary PRIVATE include)
target_link_libraries(mylibrary cocl clblast clew)

cocl_add_library(mylibrary_static many_cc.cc many_cu.cu)
target_include_directories(mylibrary_static PRIVATE include)
target_link_libraries(mylibrary_static cocl clblast clew)

cocl_add_executable(uses_mylibrary many_cpp.cpp)
target_link_libraries(uses_mylibrary cocl clblast clew mylibrary)
target_include_directories(uses_mylibrary PRIVATE include)

cocl_add_executable(uses_mylibrary_static many_cpp.cpp)
target_link_libraries(uses_mylibrary_static cocl clblast clew mylibrary_static)
target_include_directories(uses_mylibrary_static PRIVATE include)
