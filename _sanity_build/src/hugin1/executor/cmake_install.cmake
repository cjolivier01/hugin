# Install script for directory: /home/colivier/src/hm2/external/hugin/src/hugin1/executor

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
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/hugin_executor" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/hugin_executor")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/hugin_executor"
         RPATH "/usr/local/lib/hugin")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/colivier/src/hm2/external/hugin/_sanity_build/src/hugin1/executor/hugin_executor")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/hugin_executor" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/hugin_executor")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/hugin_executor"
         OLD_RPATH "/home/colivier/src/hm2/external/hugin/_sanity_build/src/hugin1/base_wx:/home/colivier/src/hm2/external/hugin/_sanity_build/src/hugin_base:"
         NEW_RPATH "/usr/local/lib/hugin")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/hugin_executor")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hugin/data/output" TYPE FILE FILES
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_output/blended_stacks.executor"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_output/focus_stack.executor"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_output/fused_layers.executor"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_output/hdr_pano.executor"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_output/median_stack.executor"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_output/normal_enblend.executor"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_output/normal_enblend_cubic.executor"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_output/normal_layered_tiff.executor"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_output/normal_smartblend.executor"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_output/zeronoise.executor"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hugin/data/assistant" TYPE FILE FILES
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_assistant/duallens.assistant"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_assistant/multirow.assistant"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_assistant/normal.assistant"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_assistant/scanned.assistant"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_assistant/scanned2.assistant"
    "/home/colivier/src/hm2/external/hugin/src/hugin1/executor/user_defined_assistant/stacked.assistant"
    )
endif()

