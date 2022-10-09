#include "Common.cuh"
#include "device.cuh"
#include "huffman.cuh"
#include "lempel_ziv_welch.cuh"

#include <stdio.h>

static uint16 device_cuda_cores = 512u;

///
/// Huffman
///

void huffman_device_specific_compress()
{
  //
  // Insert math here
  //

  // call algo
  huffman_compress<<<1, device_cuda_cores>>>();
  cudaDeviceSynchronize();
}
void huffman_device_specific_decompress()
{
  //
  // Insert math here
  //

  // call algo
  huffman_decompress<<<1, device_cuda_cores>>>();
  cudaDeviceSynchronize();
}

///
/// Lempel-Ziv-Welch
///

void lzw_device_specific_compress()
{
  //
  // Insert math here
  //

  // call algo
  lempel_ziv_welch_compress<<<1, device_cuda_cores>>>();
  cudaDeviceSynchronize();
}
void lzw_device_specific_decompress()
{
  //
  // Insert math here
  //

  // call algo
  lempel_ziv_welch_decompress<<<1, device_cuda_cores>>>();
  cudaDeviceSynchronize();
}
