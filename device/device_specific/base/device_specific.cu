#include "Common.cuh"
#include "device.cuh"
#include "huffman.cuh"
#include "lempel_ziv_welch.cuh"

#include <stdio.h>

uint16 device_cuda_cores = 512u;

void huffman_device_specific_compress(void* input, void* output)
{
  //
  // Insert math here
  //

  // call algo
  huffman_compress<<<1, device_cuda_cores>>>(input, output);
  cudaDeviceSynchronize();
}
void huffman_device_specific_decompress(void* input, void* output)
{
  //
  // Insert math here
  //

  // call algo
  huffman_decompress<<<1, device_cuda_cores>>>(input, output);
  cudaDeviceSynchronize();
}

void lzw_device_specific_compress(void* input, void* output)
{
  //
  // Insert math here
  //

  // call algo
  lempel_ziv_welch_compress<<<1, device_cuda_cores>>>(input, output);
  cudaDeviceSynchronize();
}
void lzw_device_specific_decompress(void* input, void* output)
{
  //
  // Insert math here
  //

  // call algo
  lempel_ziv_welch_decompress<<<1, device_cuda_cores>>>(input, output);
  cudaDeviceSynchronize();
}
