#include "device.cuh"

///
/// Host - Device Implementation
///

#include "stdio.h"
#include "device_specific.cuh"

///
/// Huffman
///

void Huffman::compress(std::string_view input_file_path, Memory_Block_Size gpu_block_size)
{
  huffman_device_specific_compress();
}

void Huffman::decompress(std::string_view input_file_path)
{
  huffman_device_specific_decompress();
}

///
/// Lempel-Ziv-Welch
///

void Lempel_Ziv_Welch::compress(std::string_view input_file_path, Memory_Block_Size gpu_block_size)
{
  lzw_device_specific_compress();
}

void Lempel_Ziv_Welch::decompress(std::string_view input_file_path)
{
  lzw_device_specific_decompress();
}
