cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

set(LLVM40_HOME "/usr/local/opt/llvm-4.0" CACHE STRING "LLVM-4.0.0 directory, containing bin/clang++ etc")

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
                #DEPENDS /usr/local/bin/cocl clblast clew easycl /usr/local/bin/patch-hostside ${SRCFILE}
                DEPENDS ${filename}
            )
            add_custom_target(build_${filename}_o
                DEPENDS ${filename}.o
            )
            set(OBJECT_TARGETS ${OBJECT_TARGETS} build_${filename}_o)
            set(OBJECTS ${OBJECTS} ${filename}.o)
        else()
            set(OBJECTS ${OBJECTS} ${filename})
        endif()
    endforeach()

    message("OBJECTS ${OBJECTS}")
    add_executable(${target_name} ${OBJECTS})
    set_target_properties(${target_name} PROPERTIES LINKER_LANGUAGE CXX)

    # add_custom_command(
    #     OUTPUT ${filename}_cocl.o
    #     # COMMENT "CLANG_HOME=/usr/local/opt/llvm-4.0 /usr/local/bin/cocl ${DEF_CMDLINE} ${INCLUDE_ARGS} ${SRCFILE} -o ${TARGETNAME}.o -c ${_TESTS_COCL_OPTIONS}"
    #     COMMAND g++ -o ${CMAKE_CURRENT_BINARY_DIR}/${OUTPUT} ${${OUTPUT}_OBJS} -L/usr/local/lib -lcocl -lclblast -leasycl -lclew -lpthread
    #     DEPENDS ${${OUTPUT}_OBJS}
    #     #DEPENDS /usr/local/bin/cocl clblast clew easycl /usr/local/bin/patch-hostside ${SRCFILE}
    # )
endmacro(cocl_add_executable)

cocl_add_executable(cuda_sample cuda_sample.cu)
target_link_libraries(cuda_sample cocl clblast clew)

cocl_add_executable(many_cpp many_cpp.cpp many_cc.cc many_cu.cu)
target_link_libraries(many_cpp cocl clblast clew)
target_include_directories(many_cpp PRIVATE include)
