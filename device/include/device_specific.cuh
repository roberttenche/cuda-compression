#pragma once

#include "Common.cuh"

void huffman_device_specific_compress(uint8* bytes, uint32 bytes_size, Memory_Block_Size gpu_block_size);
void huffman_device_specific_decompress();

void lzw_device_specific_compress(uint8* bytes, uint32 bytes_size, Memory_Block_Size gpu_block_size);
void lzw_device_specific_decompress();
