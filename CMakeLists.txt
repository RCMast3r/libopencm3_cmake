cmake_minimum_required(VERSION 3.5)
set(CMAKE_LIBRARY_PATH $ENV{CMAKE_LIBRARY_PATH})
set(CMAKE_INCLUDE_PATH $ENV{CMAKE_INCLUDE_PATH})
project(libopencm3_stm32f4_cmake)


list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/")
find_package(libopencm3_stm32f4)

add_library(libopencm3_stm32f4_test INTERFACE)
target_link_libraries(libopencm3_stm32f4_test INTERFACE libopencm3_stm32f4::libopencm3_stm32f4)

install(TARGETS libopencm3_stm32f4_test
        EXPORT libopencm3_stm32f4_testTargets
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

install(EXPORT libopencm3_stm32f4_testTargets
        FILE libopencm3_stm32f4_testTargets.cmake
        NAMESPACE libopencm3::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
)

export(EXPORT libopencm3_stm32f4_testTargets
       FILE "${CMAKE_CURRENT_BINARY_DIR}/cmake/libopencm3_stm32f4_testTargets.cmake"
       NAMESPACE libopencm3::
)

include(CMakePackageConfigHelpers)
configure_package_config_file(cmake/libopencm3_stm32f4Config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/libopencm3_stm32f4Config.cmake
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
  PATH_VARS CMAKE_MODULE_PATH CMAKE_LIBRARY_PATH CMAKE_INCLUDE_PATH)

install(FILES
        "${CMAKE_CURRENT_BINARY_DIR}/libopencm3_stm32f4Config.cmake"
        "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Findlibopencm3_stm32f4.cmake"
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake
)
