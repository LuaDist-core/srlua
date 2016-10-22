# Copyright (C) 2015 LuaDist.
# Created by Peter Drahoš
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.

project ( srlua C )
cmake_minimum_required ( VERSION 2.8 )

set ( INSTALL_BIN bin CACHE PATH "Where to install binaries to." )
set ( INSTALL_SHARE share CACHE PATH "Directory for shared data." )

find_package ( Lua REQUIRED )
include_directories(${LUA_INCLUDE_DIR})

add_executable(glue glue.c glue.rc)
add_executable(srlua srlua.c progdir.c srlua.rc)

target_link_libraries(glue ${LUA_LIBRARIES})
target_link_libraries(srlua ${LUA_LIBRARIES})

# No console version on windows
if (WIN32)
  add_executable(wsrlua WIN32 wmain.c srlua.c srlua.rc)
  target_link_libraries(wsrlua ${LUA_LIBRARIES})
  install(TARGETS wsrlua DESTINATION ${INSTALL_BIN})
endif()

install(TARGETS glue srlua DESTINATION ${INSTALL_BIN})
install(FILES README.md DESTINATION ${INSTALL_SHARE})
install(FILES test.lua DESTINATION ${INSTALL_SHARE}/test)

