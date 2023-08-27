cmake_minimum_required(VERSION 3.5)
set(CMAKE_LIBRARY_PATH $ENV{CMAKE_LIBRARY_PATH})
set(CMAKE_INCLUDE_PATH $ENV{CMAKE_INCLUDE_PATH})
project(libopencm3_stm32f4_cmake)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")

install(FILES
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Findlibopencm3_stm32f4.cmake"
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
)
