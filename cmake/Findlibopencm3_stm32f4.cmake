include(GNUInstallDirs)

find_library(
    libopencm3_stm32f4_LIBRARY
    NAMES libopencm3_stm32f4
    HINTS ${PROJECT_BINARY_DIR}/prebuilt/
    PATH_SUFFIXES libopencm3/native-linux-x64/)

find_path(libopencm3_INCLUDE_DIR
  NAMES Pipeline.hpp
  HINTS ${PROJECT_BINARY_DIR}/prebuilt/ ${CMAKE_INSTALL_INCLUDEDIR}
  PATH_SUFFIXES libopencm3/native-linux-api/imagepipeline/ LibImagePipeline/imagepipeline)

include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(libopencm3 DEFAULT_MSG
                                  libopencm3_LIBRARY
                                  libopencm3_INCLUDE_DIR)

mark_as_advanced(libopencm3_LIBRARY LIBIMAGEPIPELINE_INCLUDE_DIR)

if(libopencm3_FOUND AND NOT TARGET libopencm3::libopencm3)
  add_library(libopencm3::libopencm3 STATIC IMPORTED)
  set_target_properties(
    libopencm3::libopencm3
    PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${libopencm3_INCLUDE_DIR}"
      IMPORTED_LOCATION ${libopencm3_LIBRARY})
endif()