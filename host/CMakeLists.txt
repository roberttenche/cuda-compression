cmake_minimum_required(VERSION 3.22.1)

project(cuda-compression-host VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_CXX_STANDARD 20)

add_compile_options(
  "-g"
  "-Wall"
  "-O0"
)

if (WIN32)

  # Build host executable
  add_executable(host main.cpp)

  # # Link libraries to host
  # target_link_libraries(host PRIVATE
  #   device
  # )

  # # Include directory
  # target_include_directories(host PRIVATE
  #   ${PROJECT_SOURCE_DIR}/device
  # )

#   # Build libraries
#   add_subdirectory(lib-src)

#   # Sandbox is the main target
#   add_executable(Sandbox ${CMAKE_SOURCE_DIR}/src/main.cpp)

#   # Add public definitions here for all libraries
#   target_compile_definitions(Sandbox PRIVATE
#     REAL_ENG_PLATFORM_WINDOWS
#   )

#   # Link libraries to Sandbox
#   target_link_libraries(Sandbox PRIVATE
#     RealEngine
#   )

#   target_include_directories(Sandbox PRIVATE
#     ${PROJECT_SOURCE_DIR}/lib-src/RealEngine
#   )

endif (WIN32)

if (UNIX)

#   # Build libraries
#   add_subdirectory(lib-src)

#   # Sandbox is the main target
#   add_executable(Sandbox ${CMAKE_SOURCE_DIR}/src/main.cpp)

#   # Add public definitions here for all libraries
#   target_compile_definitions(Sandbox PRIVATE
#     REAL_ENG_PLATFORM_LINUX
#   )

#   # Link libraries to Sandbox
#   target_link_libraries(Sandbox PRIVATE
#     RealEngine
#   )

#   target_include_directories(Sandbox PRIVATE
#     ${PROJECT_SOURCE_DIR}/lib-src/RealEngine
#   )

endif (UNIX)
