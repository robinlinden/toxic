# - Try to find toxcore
# Once done this will define
#  toxcore_FOUND - True if toxcore is found.
#  toxcore_INCLUDE_DIRS - The include directories needed to use toxcore.
#  toxcore_LIBRARIES - The libraries needed to use toxcore.
#
# In addition to these variables, if toxcore is found, an IMPORTED target
# toxcore::toxcore will be defined.

find_path(toxcore_INCLUDE_DIR tox/tox.h)
find_library(toxcore_LIBRARY NAMES toxcore)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(toxcore DEFAULT_MSG toxcore_INCLUDE_DIR toxcore_LIBRARY)

mark_as_advanced(toxcore_INCLUDE_DIR toxcore_LIBRARY)

set(toxcore_INCLUDE_DIRS ${toxcore_INCLUDE_DIR})
set(toxcore_LIBRARIES ${toxcore_LIBRARY})

if(${toxcore_FOUND})
    add_library(toxcore::toxcore INTERFACE IMPORTED)
    target_link_libraries(toxcore::toxcore INTERFACE ${toxcore_LIBRARIES})
    target_include_directories(toxcore::toxcore INTERFACE ${toxcore_INCLUDE_DIRS})
endif()
