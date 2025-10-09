# Install script for directory: /home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hugin/xrc/data" TYPE FILE FILES
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/add_project.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/add_projects.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/autocrop_tool.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/center_pano.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/crop_tool.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/crop_tool_small.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/dedication.htm"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/drag_tool.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/drag_tool_small.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/druid.control.128.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/druid.images.128.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/druid.lenses.128.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/druid.optimize.128.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/druid.stitch.128.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/edit_add.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/filenew.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/fileopen.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/filesave.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/filesaveas.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/fit_pano.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/gl_preview.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/gl_preview_small.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/hugin.ico"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/hugin.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/hugin_small.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/identify_tool.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/identify_tool_small.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/info.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/intro.htm"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/keyboard_pl.html"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/list.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/logo.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/number1.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/number2.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/number3.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/optimize.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/output_blended_fused.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/output_fused_blended.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/output_hdr.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/output_normal.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/pause.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/photometric.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview_auto_update.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview_control_point_tool.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview_control_point_tool_small.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview_layout.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview_layout_small.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview_num_transform.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview_show_all.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview_show_none.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview_white_balance.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/preview_white_balance_small.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/ptbatcher.ico"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/ptbatcher.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/ptbatcher_pause.ico"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/ptbatcher_pause.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/ptbatcher_running.ico"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/ptbatcher_running.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/pto_icon.ico"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/pto_icon.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/redo.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/reload.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/remove_project.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/skip.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/splash.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/sponsors.htm"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/start.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/stop.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/straighten_pano.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/tips.txt"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/transparent.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/undo.png"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/upstream.txt"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hugin/xrc/data" TYPE FILE FILES "/home/colivier/src/hm2/external/hugin/_sanity_build/src/hugin1/hugin/xrc/data/about.htm")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hugin/xrc/data" TYPE FILE FILES "/home/colivier/src/hm2/external/hugin/COPYING.txt")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hugin/data" TYPE FILE FILES "/home/colivier/src/hm2/external/hugin/src/hugin1/hugin/xrc/data/expressions.ini")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/colivier/src/hm2/external/hugin/_sanity_build/src/hugin1/hugin/xrc/data/help_en_EN/cmake_install.cmake")
endif()

