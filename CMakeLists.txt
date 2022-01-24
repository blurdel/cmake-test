cmake_minimum_required(VERSION 3.1)

project(cmaketest)

MESSAGE(STATUS "src: ${PROJECT_SOURCE_DIR}")
MESSAGE(STATUS "bin: ${PROJECT_BINARY_DIR}")

set (CMAKE_CXX_STANDARD 11)
set (CMAKE_CXX_STANDARD_REQUIRED True)

add_compile_options(-m64 -Wall
    "$<$<CONFIG:DEBUG>:-O0>"
)

add_link_options(-m64 -static-libgcc -Wl,--no-as-needed)
add_definitions("-DRTI_STATIC")

add_executable(myapp
    src/main.cpp
)

target_include_directories(myapp
    PUBLIC src
)

target_link_libraries(myapp PRIVATE pthread)
