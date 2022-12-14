# device_type can be changed in order to optimize for your gpu
# Available options:
# base
# gtx1660ti
device_type = base

# From here on out, don't change anything
nvcc_compiler_flags= -std c++17

# Application
appl_sources = $(huffman_output) $(lempel_ziv_welch_output) $(host_output)
appl_lib_include = build/lib 
appl_include =
appl_output = bin/appl
appl_dependencies =

# Source
src_include = src/include

# Device
device_sources = device/include/device.cu device/device_specific/$(device_type)/device_specific.cu
device_include = device/include
device_output = build/lib/device.lib
device_dependencies = $(src_include),$(device_include),$(huffman_include),$(lempel_ziv_welch_include)

# Device - Huffman
huffman_sources = device/algo/huffman/huffman.cu
huffman_include = device/algo/huffman
huffman_output = build/device/huffman/huffman.obj
huffman_dependencies = $(src_include)

# Device - Algo - Lempel-Ziv-Welch
lempel_ziv_welch_sources = device/algo/lempel_ziv_welch/lempel_ziv_welch.cu
lempel_ziv_welch_include = device/algo/lempel_ziv_welch
lempel_ziv_welch_output = build/device/lempel_ziv_welch/lempel_ziv_welch.obj
lempel_ziv_welch_dependencies = $(src_include)

# Host
host_sources = host/host.cu
host_include = 
host_output = build/host/host.obj
host_dependencies = $(src_include),$(device_include)

default: appl

# Application
ifeq ($(OS),Windows_NT)
appl: setup device_target host_target
	nvcc $(nvcc_compiler_flags) -L $(appl_lib_include) -l device $(appl_sources) -o $(appl_output)
else
appl: setup device_target host_target
	nvcc $(nvcc_compiler_flags) -L $(appl_lib_include) -l:device.lib $(appl_sources) -o $(appl_output)
endif

# Device
device_target: $(device_sources) $(device_include)/device.cuh huffman_target lempel_ziv_welch_target
	nvcc $(nvcc_compiler_flags) $(device_sources) -I $(device_dependencies) -o $(device_output) -lib

# Device - Algo - Huffman
huffman_target: $(huffman_sources) $(huffman_include)/huffman.cuh
	nvcc $(nvcc_compiler_flags) -c $(huffman_sources) -I $(huffman_dependencies) -o $(huffman_output)

# Device - Algo - Lempel-Ziv-Welch
lempel_ziv_welch_target: $(lempel_ziv_welch_sources) $(lempel_ziv_welch_include)/lempel_ziv_welch.cuh
	nvcc $(nvcc_compiler_flags) -c $(lempel_ziv_welch_sources) -I $(lempel_ziv_welch_dependencies) -o $(lempel_ziv_welch_output)

# Host
host_target: $(host_sources)
	nvcc $(nvcc_compiler_flags) -c $(host_sources) -I $(host_dependencies) -o $(host_output)

# Helper
setup:
	python scripts/build.py --create-build-folders

clean:
	python scripts/build.py --clean

VERY_CLEAN:
	python scripts/build.py --CLEAN

run:
	python scripts/build.py --run
