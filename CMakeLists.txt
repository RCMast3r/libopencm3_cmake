cmake_minimum_required(VERSION 3.5)
set(CMAKE_LIBRARY_PATH $ENV{CMAKE_LIBRARY_PATH})
set(CMAKE_INCLUDE_PATH $ENV{CMAKE_INCLUDE_PATH})

list(APPEND CMAKE_MODULE_PATH "${CMAKE_INSTALL_LIBDIR}")
project(libopencm3_stm32f4_cmake)

include(CMakePackageConfigHelpers)
configure_package_config_file(cmake/libopencm3_stm32f4Config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/libopencm3_stm32f4Config.cmake
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
  PATH_VARS CMAKE_MODULE_PATH CMAKE_LIBRARY_PATH CMAKE_INCLUDE_PATH)

install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/libopencm3_stm32f4Config.cmake"
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Findlibopencm3_stm32f4.cmake"
        DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
