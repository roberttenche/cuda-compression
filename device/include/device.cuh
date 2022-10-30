#pragma once

///
/// Host - Device Interface
///

#include "Common.cuh"

#include <string>
#include <stdexcept>

enum class Exit_Code
{
  ALL_GOOD,
  FILE_NOT_ACCESSIBLE,
  FILE_TOO_SMALL,
  UNTREATED_ERROR = 0xFFu
};

static inline std::string Exit_Code_To_String(Exit_Code exit_code)
{
  switch (exit_code)
  {
    case Exit_Code::ALL_GOOD:
      return "ALL_GOOD";
      break;
    case Exit_Code::FILE_NOT_ACCESSIBLE:
      return "FILE_NOT_ACCESSIBLE";
      break;
    case Exit_Code::UNTREATED_ERROR:
      return "UNTREATED_ERROR";
      break;
    case Exit_Code::FILE_TOO_SMALL:
      return "FILE_TOO_SMALL";
      break;

    default:
      throw std::runtime_error("Exit_Code_To_String ERROR: Default should not be reachable");
      break;
  }
}

class Huffman
{
public:
  static Exit_Code compress(std::string input_file_path, Memory_Block_Size gpu_block_size);
  static Exit_Code decompress(std::string input_file_path);

private:
  Huffman();
  virtual ~Huffman();

  static Exit_Code exit_code;
  static Memory_Block_Size gpu_block_size; // how big are the blocks sent to the gpu
  static Memory_Block_Size cpu_ram_size; // how much ram is allocated to the program
};

class Lempel_Ziv_Welch
{
public:
  static Exit_Code compress(std::string input_file_path, Memory_Block_Size gpu_block_size);
  static Exit_Code decompress(std::string input_file_path);

private:
  Lempel_Ziv_Welch();
  virtual ~Lempel_Ziv_Welch();

  static Exit_Code exit_code;
  static Memory_Block_Size gpu_block_size; // how big are the blocks sent to the gpu
  static Memory_Block_Size cpu_ram_size; // how much ram is allocated to the program
};
