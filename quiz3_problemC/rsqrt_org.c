#include <stdint.h>
#include "rsqrt_org.h"

static const uint32_t rsqrt_table[32] = {
    65536, 46341, 32768, 23170, 16384,
    11585,  8192,  5793,  4096,  2896,
     2048,  1448,  1024,   724,   512,
      362,   256,   181,   128,    90,
       64,    45,    32,    23,    16,
       11,     8,     6,     4,     3,
        2,     1
};

static int clz(uint32_t x)
{
    if (!x) return 32;
    int n = 0;
    uint32_t m = 0x80000000u;
    while ((x & m) == 0) {
        n++;
        m >>= 1;
    }
    return n;
}

static uint64_t mul32(uint32_t a, uint32_t b)
{
    uint64_t acc = 0;
    uint64_t va = a;
    uint32_t vb = b;
    while (vb) {
        if (vb & 1u)
            acc += va;
        va <<= 1;
        vb >>= 1;
    }
    return acc;
}

uint32_t fast_rsqrt(uint32_t x)
{
    if (x == 0) return 0xFFFFFFFFu;
    if (x == 1) return 65536u;

    int e = 31 - clz(x);
    uint32_t base = 1u << e;
    uint32_t y = rsqrt_table[e];

    if (x != base) {
        uint32_t next = (e < 31) ? rsqrt_table[e + 1] : 0;
        uint32_t diff = y - next;
        uint32_t dx = x - base;

        uint64_t tmp = (uint64_t)dx << 16;
        uint32_t t = (uint32_t)(tmp >> e);

        uint64_t prod = mul32(diff, t);
        y -= (uint32_t)(prod >> 16);
    }

    for (int k = 0; k < 2; ++k) {
        uint64_t y2_64 = mul32(y, y);
        uint32_t y2 = (uint32_t)y2_64;

        uint64_t xy2_64 = mul32(x, y2);
        uint32_t xy2 = (uint32_t)(xy2_64 >> 16);

        uint32_t corr = (3u << 16) - xy2;

        uint64_t update = mul32(y, corr);
        y = (uint32_t)(update >> 17);
    }

    return y;
}
