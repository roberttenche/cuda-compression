#include "device.cuh"

///
/// Host - Device Implementation
///

#include "Common.cuh"
#include "device_specific.cuh"

#include <filesystem>
#include <fstream>

#include <iostream>

///
/// Huffman
///

Exit_Code Huffman::compress(std::string input_file_path, Memory_Block_Size gpu_block_size)
{
  uint8* bytes = nullptr;
  uint32 bytes_size = 0uL;

  // get file size
  bytes_size = std::filesystem::file_size(input_file_path);

  std::cout << "FILE SIZE : " << bytes_size << std::endl;

  // check that file size is big enough for at least 1 memory block
  if (bytes_size < Memory_Block_Size_to_uint64(gpu_block_size))
  {
    return exit_code = Exit_Code::FILE_TOO_SMALL;
  }

  std::ifstream input_file(input_file_path, std::ios::binary);

  // check if file can be opened
  if (!input_file.is_open())
  {
    return exit_code = Exit_Code::FILE_NOT_ACCESSIBLE;
  }



  input_file.close();

  // run huffman compression
  huffman_device_specific_compress(bytes, bytes_size, gpu_block_size);

  // free allocated memory
  cudaFree(bytes);
  
  // all good
  return exit_code = Exit_Code::ALL_GOOD;
}

Exit_Code Huffman::decompress(std::string input_file_path)
{
  huffman_device_specific_decompress();

  return exit_code = Exit_Code::ALL_GOOD;
}

Exit_Code Huffman::exit_code = Exit_Code::UNTREATED_ERROR;
Memory_Block_Size Huffman::gpu_block_size = Memory_Block_Size::MEMORY_BLOCK_32MB;
Memory_Block_Size Huffman::cpu_ram_size = Memory_Block_Size::MEMORY_BLOCK_2GB;

///
/// Lempel-Ziv-Welch
///

Exit_Code Lempel_Ziv_Welch::compress(std::string input_file_path, Memory_Block_Size gpu_block_size)
{
  uint8* bytes = nullptr;
  uint32 bytes_size = 0uL;

  lzw_device_specific_compress(bytes, bytes_size, gpu_block_size);

  return exit_code = Exit_Code::ALL_GOOD;
}

Exit_Code Lempel_Ziv_Welch::decompress(std::string input_file_path)
{
  lzw_device_specific_decompress();

  return exit_code = Exit_Code::ALL_GOOD;
}

Exit_Code Lempel_Ziv_Welch::exit_code = Exit_Code::UNTREATED_ERROR;
Memory_Block_Size Lempel_Ziv_Welch::gpu_block_size = Memory_Block_Size::MEMORY_BLOCK_32MB;
Memory_Block_Size Lempel_Ziv_Welch::cpu_ram_size = Memory_Block_Size::MEMORY_BLOCK_2GB;
