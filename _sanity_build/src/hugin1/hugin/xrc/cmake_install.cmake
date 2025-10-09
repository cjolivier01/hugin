# Install script for directory: /home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hugin/xrc" TYPE FILE FILES
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/about.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/batch_frame.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/batch_menu.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/batch_toolbar.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/cp_editor_panel.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/cp_list_frame.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/cpdetector_dialog.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/dlg_warning.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/edit_script_dialog.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/image_variable_dlg.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/images_panel.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/import_raw_dialog.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/lenscal_frame.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/lensdb_dialogs.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/main_frame.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/main_menu.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/main_tool.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/mask_editor_panel.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/optimize_panel.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/optimize_photo_panel.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/pano_panel.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/pref_dialog.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/preview_frame.xrc"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/reset_dialog.xrc"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/colivier/src/hm2/external/hugin/_sanity_build/src/hugin1/hugin/xrc/data/cmake_install.cmake")
endif()

