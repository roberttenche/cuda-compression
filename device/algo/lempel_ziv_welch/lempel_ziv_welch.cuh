#pragma once

///
/// Lempel-Ziv-Welch algorithm interface
///

__global__ void lempel_ziv_welch_compress(void* input, void* output);
__global__ void lempel_ziv_welch_decompress(void* input, void* output);
