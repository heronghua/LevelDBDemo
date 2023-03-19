cmake_minimum_required(VERSION 3.2)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include_directories(./include/)
add_library(LIB_LEVELDB STATIC IMPORTED)
set_property(TARGET LIB_LEVELDB PROPERTY IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/lib/libleveldb.a)

project(LevelDBDemo)
add_executable(LevelDBDemo ./src/main.cpp) 
target_link_libraries(LevelDBDemo LIB_LEVELDB)
