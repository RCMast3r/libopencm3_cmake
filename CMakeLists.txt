cmake_minimum_required(VERSION 3.5)
include(./cmake/toolchain-arm-none-arm-eabi-gcc.cmake)

set(CMAKE_LIBRARY_PATH $ENV{CMAKE_LIBRARY_PATH})
set(CMAKE_INCLUDE_PATH $ENV{CMAKE_INCLUDE_PATH})

project(libopencm3_stm32f4_cmake)

set(INSTALL_CMAKE_DIR "${CMAKE_INSTALL_LIBDIR}/cmake" CACHE PATH "Installation directory for CMake files")

include(CMakePackageConfigHelpers)

configure_package_config_file(cmake/libopencm3_stm32f4Config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/libopencm3_stm32f4Config.cmake
  INSTALL_DESTINATION "${INSTALL_CMAKE_DIR}"
  PATH_VARS CMAKE_LIBRARY_PATH CMAKE_INCLUDE_PATH)

include(GNUInstallDirs)
install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/libopencm3_stm32f4Config.cmake"
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/libopencm3_stm32f4
)
