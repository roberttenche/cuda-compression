#include "lempel_ziv_welch.cuh"

#include <stdio.h>

///
/// Lempel-Ziv-Welch algorithm implementation
///

__global__ void lempel_ziv_welch_compress(void* input, void* output)
{
  printf("Lempel-Ziv-Welch compression unimplemented!!! - threadIdx:%d\n", threadIdx.x);
}
__global__ void lempel_ziv_welch_decompress(void* input, void* output)
{
  printf("Lempel-Ziv-Welch decompression unimplemented!!! - threadIdx:%d\n", threadIdx.x);
}
