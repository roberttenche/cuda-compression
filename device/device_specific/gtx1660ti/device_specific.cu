#include "Common.cuh"
#include "device.cuh"
#include "huffman.cuh"
#include "lempel_ziv_welch.cuh"

static uint16 device_cuda_cores = 1024u;
