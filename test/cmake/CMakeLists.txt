cmake_minimum_required(VERSION 3.0.0 FATAL_ERROR)

set(COCL_HOME "/usr/local" CACHE STRING "Coriander directory, eg /usr/local")

# assumes you've installed coriander, into default location, ie /usr/local
set(COCL_PATH ${COCL_HOME}/bin/cocl)
include(${COCL_HOME}/share/cocl/cocl.cmake)

cocl_add_executable(cuda_sample cuda_sample.cu)
target_link_libraries(cuda_sample cocl clblast clew)

cocl_add_executable(many_cpp many_cpp.cpp many_cc.cc many_cu.cu)
target_link_libraries(many_cpp ${Coriander_LIBRARIES})
target_include_directories(many_cpp PRIVATE include)

include_directories(include2)
include_directories(include3)

cocl_add_library(mylibrary SHARED many_cc.cc many_cu.cu)
target_include_directories(mylibrary PRIVATE paris include anotherinc)
target_link_libraries(mylibrary ${Coriander_LIBRARIES})

cocl_add_library(mylibrary_static many_cc.cc many_cu.cu)
target_include_directories(mylibrary_static PRIVATE include)
target_link_libraries(mylibrary_static ${Coriander_LIBRARIES})

cocl_add_executable(uses_mylibrary many_cpp.cpp)
target_link_libraries(uses_mylibrary cocl clblast clew mylibrary)
target_include_directories(uses_mylibrary PRIVATE include)

cocl_add_executable(uses_mylibrary_static many_cpp.cpp)
target_link_libraries(uses_mylibrary_static ${Coriander_LIBRARIES} mylibrary_static)
target_include_directories(uses_mylibrary_static PRIVATE include)

cocl_add_executable(requires_define requires_define.cu)
# set_target_properties(requires_define PROPERTIES COMPILE_DEFINITIONS -DSHOULD_BE_DEFINED)
# set_target_properties(requires_define PROPERTIES COMPILE_DEFINITIONS -DSHOULD_BE_DEFINED2)
# add_definitions(-DSHOULD_BE_DEFINED3 -DSHOULD_BE_DEFINED4)
    # ei_add_target_property(${targetname} COMPILE_FLAGS "-DEIGEN_NO_ASSERTION_CHECKING=1")
set_target_properties(requires_define PROPERTIES COMPILE_FLAGS "-DSHOULD_BE_DEFINED -DSHOULD_BE_DEFINED2 -DSHOULD_BE_DEFINED3 -DSHOULD_BE_DEFINED4")
