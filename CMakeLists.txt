# include(CopyRuntimeDependencies)

# list(APPEND LIBRARIES ${SOCKET_LIBRARIES})

# transform_makefile_inc("Makefile.am" "${CMAKE_CURRENT_BINARY_DIR}/Makefile.am.cmake")
# # Get 'noinst_PROGRAMS' variable
# include("${CMAKE_CURRENT_BINARY_DIR}/Makefile.am.cmake")
# set(EXAMPLES ${noinst_PROGRAMS})

# foreach(example IN LISTS EXAMPLES)
 
#   list(APPEND EXAMPLE_TARGETS ${example})
#   # to find generated header

#   add_executable(${example} "${example}.c")
#   target_include_directories(${example} PRIVATE "${CMAKE_CURRENT_BINARY_DIR}/../src" "../src")
#   target_link_libraries(${example} ${LIB_SELECTED} ${LIBRARIES})
#   set_target_properties(${example} PROPERTIES UNITY_BUILD OFF)
# endforeach()

# add_target_to_copy_dependencies(
#   TARGET copy_example_dependencies
#   DEPENDENCIES ${RUNTIME_DEPENDENCIES}
#   BEFORE_TARGETS ${EXAMPLE_TARGETS})
cmake_minimum_required(VERSION 3.18)

project("libssh2-playground")

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")



find_package(OpenSSL CONFIG REQUIRED)

if(OpenSSL_FOUND)
    message(STATUS "YES")
else()
    message(STATUS "NO")
endif()

find_package(Libssh2 1.11.0 EXACT REQUIRED)

if(Libssh2_FOUND)
    message(STATUS "YES")
else()
    message(STATUS "NO")
endif()

add_executable(${PROJECT_NAME}
    "src/main.c"
)

target_link_libraries(${PROJECT_NAME} ws2_32 crypt32 Libssh2::libssh2_static OpenSSL::SSL OpenSSL::Crypto)