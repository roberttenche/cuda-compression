#include "Common.cuh"
#include <device.cuh>

#include <stdio.h>

int main(int argc, char* argv[])
{
  uint32 a;
  uint32 b;

  Huffman::compress(&a, &b);
  Huffman::decompress(&a, &b);
  Lempel_Ziv_Welch::compress(&a, &b);
  Lempel_Ziv_Welch::decompress(&a, &b);

}
