#include "device.cuh"

///
/// Host - Device Implementation
///

#include "stdio.h"

extern void huffman_device_specific_compress(void* input, void* output);
extern void huffman_device_specific_decompress(void* input, void* output);
extern void lzw_device_specific_compress(void* input, void* output);
extern void lzw_device_specific_decompress(void* input, void* output);

void Huffman::compress(void* input, void* output)
{
  huffman_device_specific_compress(input, output);
}

void Huffman::decompress(void* input, void* output)
{
  huffman_device_specific_decompress(input, output);
}

void Lempel_Ziv_Welch::compress(void* input, void* output)
{
  lzw_device_specific_compress(input, output);
}

void Lempel_Ziv_Welch::decompress(void* input, void* output)
{
  lzw_device_specific_decompress(input, output);
}
