if(NOT VTK_INSTALL_EXPORT_NAME)
  set(VTK_INSTALL_EXPORT_NAME VTKTargets)
endif()

MACRO(VTK_ADD_LIBRARY name)
  add_library(${name} ${ARGN})
  if (NOT VTK_INSTALL_NO_LIBRARIES)
    set_property(GLOBAL APPEND PROPERTY VTK_TARGETS ${name})
  endif (NOT VTK_INSTALL_NO_LIBRARIES)
ENDMACRO(VTK_ADD_LIBRARY)

MACRO(VTK_ADD_EXECUTABLE name)
  if(UNIX AND VTK_BUILD_FORWARDING_EXECUTABLES)
    vtk_add_executable_with_forwarding(VTK_EXE_SUFFIX ${name} ${ARGN})
    set_property(GLOBAL APPEND PROPERTY VTK_TARGETS ${name})
  else()
    add_executable(${name} ${ARGN})
    set_property(GLOBAL APPEND PROPERTY VTK_TARGETS ${name})
  endif()
ENDMACRO(VTK_ADD_EXECUTABLE)
