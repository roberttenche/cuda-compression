cmake_minimum_required(VERSION 3.22.1)

project(cuda-compression-device LANGUAGES CXX CUDA)

if (WIN32)

  add_executable(device base/device.cu)

  target_include_directories(device ${CMAKE_SOURCE_DIR})

  target_compile_features(device PUBLIC cxx_std_11)

endif (WIN32)

if (UNIX)

endif (UNIX)
