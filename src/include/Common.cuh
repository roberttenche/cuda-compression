#pragma once

typedef unsigned char       uint8;
typedef unsigned short      uint16;
typedef unsigned long       uint32;
typedef unsigned long long  uint64;

typedef signed char         sint8;
typedef signed short        sint16;
typedef signed long         sint32;
typedef signed long long    sint64;

///
/// @brief The size of GPU blocks used for compression
/// 1st column : Number of bytes / block
/// 2nd column : Threads / 1GB of memory using block
/// 3rd column : 2KB overhead percentage from 1st column
///
enum class Memory_Block_Size
{
  MEMORY_BLOCK_8KB,   // |  8192       | 131072 | 25                     |
  MEMORY_BLOCK_16KB,  // | 16384       | 65536  | 12.5                   |
  MEMORY_BLOCK_32KB,  // | 32768       | 32768  | 6.25                   |
  MEMORY_BLOCK_64KB,  // | 65536       | 16384  | 3.125                  |
  MEMORY_BLOCK_128KB, // | 131072      | 8192   | 1.5625                 |
  MEMORY_BLOCK_256KB, // | 262144      | 4096   | 0.78125                |
  MEMORY_BLOCK_512KB, // | 524288      | 2048   | 0.390625               |
  MEMORY_BLOCK_1MB,   // | 1048576     | 1024   | 0.1953125              |
  MEMORY_BLOCK_2MB,   // | 2097152     | 512    | 0.09765625             |
  MEMORY_BLOCK_4MB,   // | 4194304     | 256    | 0.048828125            |
  MEMORY_BLOCK_8MB,   // | 8388608     | 128    | 0.0244140625           |
  MEMORY_BLOCK_16MB,  // | 16777216    | 64     | 0.01220703125          |
  MEMORY_BLOCK_32MB,  // | 33554432    | 32     | 0.006103515625         |
  MEMORY_BLOCK_64MB,  // | 67108864    | 16     | 0.0030517578125        |
  MEMORY_BLOCK_128MB, // | 134217728   | 8      | 0.00152587890625       |
  MEMORY_BLOCK_256MB, // | 268435456   | 4      | 0.000762939453125      |
  MEMORY_BLOCK_512MB, // | 536870912   | 2      | 0.0003814697265625     |
  MEMORY_BLOCK_1GB,   // | 1073741824  | 1      | 0.00019073486328125    |
  MEMORY_BLOCK_2GB,   // | 2147483648  | 05     | 9.5367431640625e-05    |
  MEMORY_BLOCK_4GB,   // | 4294967296  | 0250   | 4.76837158203125e-05   |
  MEMORY_BLOCK_8GB,   // | 8589934592  | 0125   | 2.384185791015625e-05  |
  MEMORY_BLOCK_16GB,  // | 17179869184 | 00625  | 1.1920928955078125e-05 |
};

static inline uint64 Memory_Block_Size_to_uint64(Memory_Block_Size size)
{
  switch (size)
  {
  case Memory_Block_Size::MEMORY_BLOCK_8KB:   return        8192uLL;
  case Memory_Block_Size::MEMORY_BLOCK_16KB:  return       16384uLL;
  case Memory_Block_Size::MEMORY_BLOCK_32KB:  return       32768uLL;
  case Memory_Block_Size::MEMORY_BLOCK_64KB:  return       65536uLL;
  case Memory_Block_Size::MEMORY_BLOCK_128KB: return      131072uLL;
  case Memory_Block_Size::MEMORY_BLOCK_256KB: return      262144uLL;
  case Memory_Block_Size::MEMORY_BLOCK_512KB: return      524288uLL;
  case Memory_Block_Size::MEMORY_BLOCK_1MB:   return     1048576uLL;
  case Memory_Block_Size::MEMORY_BLOCK_2MB:   return     2097152uLL;
  case Memory_Block_Size::MEMORY_BLOCK_4MB:   return     4194304uLL;
  case Memory_Block_Size::MEMORY_BLOCK_8MB:   return     8388608uLL;
  case Memory_Block_Size::MEMORY_BLOCK_16MB:  return    16777216uLL;
  case Memory_Block_Size::MEMORY_BLOCK_32MB:  return    33554432uLL;
  case Memory_Block_Size::MEMORY_BLOCK_64MB:  return    67108864uLL;
  case Memory_Block_Size::MEMORY_BLOCK_128MB: return   134217728uLL;
  case Memory_Block_Size::MEMORY_BLOCK_256MB: return   268435456uLL;
  case Memory_Block_Size::MEMORY_BLOCK_512MB: return   536870912uLL;
  case Memory_Block_Size::MEMORY_BLOCK_1GB:   return  1073741824uLL;
  case Memory_Block_Size::MEMORY_BLOCK_2GB:   return  2147483648uLL;
  case Memory_Block_Size::MEMORY_BLOCK_4GB:   return  4294967296uLL;
  case Memory_Block_Size::MEMORY_BLOCK_8GB:   return  8589934592uLL;
  case Memory_Block_Size::MEMORY_BLOCK_16GB:  return 17179869184uLL;
  default:                                    return         0x0uLL;
  }
}
