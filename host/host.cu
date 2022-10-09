#include "Common.cuh"
#include <device.cuh>

#include <string>

int main(int argc, char* argv[])
{
  std::string file_input = "test.txt";

  Huffman::compress(file_input, Memory_Block_Size::MEMORY_BLOCK_32MB);

}
