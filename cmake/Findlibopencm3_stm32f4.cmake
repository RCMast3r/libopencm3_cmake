include(GNUInstallDirs)==

find_library(
    libopencm3_stm32f4_LIBRARY
    NAMES libopencm3_stm32f4.a
    HINTS ${CMAKE_LIBRARY_PATH}
    )

find_path(libopencm3_stm32f4_INCLUDE_DIR
  HINTS ${CMAKE_INCLUDE_PATH}/ 
  NAMES libopencm3 libopencmsis
  )
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libopencm3_stm32f4 DEFAULT_MSG
                                  libopencm3_stm32f4_LIBRARY
                                  libopencm3_stm32f4_INCLUDE_DIR)

mark_as_advanced(libopencm3_stm32f4_LIBRARY libopencm3_stm32f4_INCLUDE_DIR)

if(libopencm3_stm32f4_FOUND AND NOT TARGET libopencm3::libopencm3_stm32f4)
  add_library(libopencm3::libopencm3_stm32f4 STATIC IMPORTED)
  set_target_properties(
    libopencm3::libopencm3_stm32f4
    PROPERTIES
      INTERFACE_INCLUDE_DIRECTORIES "${libopencm3_stm32f4_INCLUDE_DIR}"
      IMPORTED_LOCATION ${libopencm3_stm32f4_LIBRARY})
endif()