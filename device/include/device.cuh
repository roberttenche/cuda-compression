#pragma once

///
/// Host - Device Interface
///

#include "Common.cuh"
#include <string>

///
/// @brief The size of GPU blocks used for compression.
///
/// See comments below for exact byte + thread numbers / GB.
///
enum class Memory_Block_Size {

  MEMORY_BLOCK_32KB,  // 32.768   BYTES       - 32.768 Threads
  MEMORY_BLOCK_64KB,  // 65.536   BYTES       - 16.384 Threads
  MEMORY_BLOCK_128KB, // 131.072  BYTES       - 8.192  Threads
  MEMORY_BLOCK_256KB, // 262.144  BYTES       - 4.096  Threads
  MEMORY_BLOCK_512KB, // 524.288  BYTES       - 2.048  Threads
  MEMORY_BLOCK_1MB,   // 1.048.576  BYTES     - 1.024  Threads
  MEMORY_BLOCK_2MB,   // 2.097.152  BYTES     - 512    Threads
  MEMORY_BLOCK_4MB,   // 4.194.304  BYTES     - 256    Threads
  MEMORY_BLOCK_8MB,   // 8.388.608  BYTES     - 128    Threads
  MEMORY_BLOCK_16MB,  // 16.777.216 BYTES     - 64     Threads
  MEMORY_BLOCK_32MB,  // 33.554.432 BYTES     - 32     Threads
  MEMORY_BLOCK_64MB,  // 67.108.864 BYTES     - 16     Threads
  MEMORY_BLOCK_128MB, // 134.217.728 BYTES    - 8      Threads
  MEMORY_BLOCK_256MB, // 268.435.456 BYTES    - 4      Threads
  MEMORY_BLOCK_512MB, // 536.870.912 BYTES    - 2      Threads
  MEMORY_BLOCK_1GB,   // 1.073.741.824 BYTES  - 1      Thread
  MEMORY_BLOCK_2GB,   // 2.147.483.648 BYTES  - 0.5    Threads
  MEMORY_BLOCK_4GB,   // 4.294.967.296 BYTES  - 0.250  Threads
  MEMORY_BLOCK_8GB,   // 8.589.934.592 BYTES  - 0.125  Threads
  MEMORY_BLOCK_16GB,  // 17.179.869.184 BYTES - 0.0625 Threads
};

class Huffman
{
private:
  Huffman();
  virtual ~Huffman();

public:
  static void compress(std::string_view input_file_path, Memory_Block_Size gpu_block_size);
  static void decompress(std::string_view input_file_path);
};

class Lempel_Ziv_Welch
{
private:
  Lempel_Ziv_Welch();
  virtual ~Lempel_Ziv_Welch();

public:
  static void compress(std::string_view input_file_path, Memory_Block_Size gpu_block_size);
  static void decompress(std::string_view input_file_path);
};
