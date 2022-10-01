#include "device.cuh"

#include <stdio.h>

__device__ void test()
{
  printf("Hello from the GPU!\n");
}
