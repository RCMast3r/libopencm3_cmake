include(GNUInstallDirs)
message(${PROJECT_BINARY_DIR})

find_library(
    libopencm3_stm32f4_LIBRARY
    NAMES libopencm3_stm32f4
    HINTS ${PROJECT_BINARY_DIR}/
    PATH_SUFFIXES lib/)

find_path(libopencm3_INCLUDE_DIR
  NAMES Pipeline.hpp
  HINTS ${PROJECT_BINARY_DIR}/ ${CMAKE_INSTALL_INCLUDEDIR}
  PATH_SUFFIXES include)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(libopencm3 DEFAULT_MSG
                                  libopencm3_LIBRARY
                                  libopencm3_INCLUDE_DIR)

mark_as_advanced(libopencm3_LIBRARY libopencm3_INCLUDE_DIR)

if(libopencm3_FOUND AND NOT TARGET libopencm3::libopencm3_stm32f4)
  add_library(libopencm3::libopencm3_stm32f4 STATIC IMPORTED)
  set_target_properties(
    libopencm3::libopencm3_stm32f4
    PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${libopencm3_INCLUDE_DIR}"
      IMPORTED_LOCATION ${libopencm3_LIBRARY})
endif()