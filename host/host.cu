#include "Common.cuh"
#include <device.cuh>

#include <iostream>
#include <string>
#include <limits>

int main(int argc, char* argv[])
{

  std::string file_input = "D:\\GIT\\cuda-compression\\tests\\cuda-compression-test-files\\test_32KB.txt";

  Exit_Code exit_code = Huffman::compress(file_input, Memory_Block_Size::MEMORY_BLOCK_8KB);

  std::cout << "exit_code : " << Exit_Code_To_String(exit_code) << std::endl;

  return 0;
}
