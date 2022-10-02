#pragma once

///
/// Huffman algorithm interface
///

__global__ void huffman_compress(void* input, void* output);
__global__ void huffman_decompress(void* input, void* output);
