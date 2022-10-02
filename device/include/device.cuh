#pragma once

///
/// Host - Device Interface
///

#include "Common.cuh"

class Huffman
{
private:
  Huffman();
  virtual ~Huffman();

public:
  static void compress(void* input, void* output);
  static void decompress(void* input, void* output);
};

class Lempel_Ziv_Welch
{
private:
  Lempel_Ziv_Welch();
  virtual ~Lempel_Ziv_Welch();

  static void device_specific_compress(void* input, void* output);
  static void device_specific_decompress(void* input, void* output);

public:
  static void compress(void* input, void* output);
  static void decompress(void* input, void* output);
};
