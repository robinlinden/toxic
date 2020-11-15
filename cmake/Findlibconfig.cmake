# - Try to find libconfig
# Once done this will define
#  libconfig_FOUND - True if libconfig is found.
#  libconfig_INCLUDE_DIRS - The include directories needed to use libconfig.
#  libconfig_LIBRARIES - The libraries needed to use libconfig.
#
# In addition to these variables, if libconfig is found, an IMPORTED target
# libconfig::libconfig will be defined.

find_path(libconfig_INCLUDE_DIR libconfig.h)
find_library(libconfig_LIBRARY NAMES config)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libconfig DEFAULT_MSG libconfig_INCLUDE_DIR libconfig_LIBRARY)

mark_as_advanced(libconfig_INCLUDE_DIR libconfig_LIBRARY)

set(libconfig_INCLUDE_DIRS ${libconfig_INCLUDE_DIR})
set(libconfig_LIBRARIES ${libconfig_LIBRARY})

if(${libconfig_FOUND})
    add_library(libconfig::libconfig INTERFACE IMPORTED)
    target_link_libraries(libconfig::libconfig INTERFACE ${libconfig_LIBRARIES})
    target_include_directories(libconfig::libconfig INTERFACE ${libconfig_INCLUDE_DIRS})
endif()
