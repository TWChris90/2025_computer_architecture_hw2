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
    if (x == 0) return 32;

    int n = 0;
    if ((x & 0xFFFF0000u) == 0) { n += 16; x <<= 16; }
    if ((x & 0xFF000000u) == 0) { n +=  8; x <<=  8; }
    if ((x & 0xF0000000u) == 0) { n +=  4; x <<=  4; }
    if ((x & 0xC0000000u) == 0) { n +=  2; x <<=  2; }
    if ((x & 0x80000000u) == 0) { n +=  1; }
    return n;
}

static void mul32(uint64_result_t *result, uint32_t a, uint32_t b)
{
    result->lo = 0;
    result->hi = 0;

    uint32_t a_lo = a;
    uint32_t a_hi = 0;

    for (int i = 0; i < 32; i++) {
        if (b & 1u) {
            uint32_t old_lo = result->lo;
            result->lo += a_lo;
            if (result->lo < old_lo) {
                result->hi++;
            }
            result->hi += a_hi;
        }
        a_hi = (a_hi << 1) | (a_lo >> 31);
        a_lo <<= 1;
        b >>= 1;
    }
}

uint32_t fast_rsqrt(uint32_t x)
{
    if (x == 0) return 0xFFFFFFFFu; 
    if (x == 1) return 65536u;

    int exp = 31 - clz(x);
    uint32_t y = rsqrt_table[exp];

    if (x > (1u << exp)) {
        uint32_t y_next = (exp < 31) ? rsqrt_table[exp + 1] : 0;
        uint32_t delta = y - y_next;

        uint32_t frac = ((x - (1u << exp)) << 16) >> exp;

        uint64_result_t t;
        mul32(&t, delta, frac);
        uint32_t prod = t.lo;
        y -= (prod >> 16);
    }

    for (int iter = 0; iter < 2; iter++) {
        uint64_result_t y2_result;
        mul32(&y2_result, y, y);
        uint32_t y2 = y2_result.lo;

        uint64_result_t xy2_temp;
        mul32(&xy2_temp, x, y2);
        uint32_t xy2 = (xy2_temp.hi << 16) | (xy2_temp.lo >> 16);

        uint64_result_t y_temp;
        mul32(&y_temp, y, (3u << 16) - xy2);
        uint32_t result = (y_temp.hi << 15) | (y_temp.lo >> 17);
        y = result;
    }

    return y;
}

unsigned int __mulsi3(unsigned int a, unsigned int b)
{
    unsigned int res = 0;
    while (b) {
        if (b & 1u) {
            res += a;
        }
        a <<= 1;
        b >>= 1;
    }
    return res;
}

static unsigned int udivmod32(unsigned int num, unsigned int den, unsigned int *rem)
{
    if (den == 0) {
        if (rem) *rem = 0xFFFFFFFFu;
        return 0xFFFFFFFFu;
    }

    unsigned int q = 0;
    unsigned int bit = 1;

    while ((den <= num) && ((den & 0x80000000u) == 0)) {
        den <<= 1;
        bit <<= 1;
    }

    while (bit != 0) {
        if (num >= den) {
            num -= den;
            q |= bit;
        }
        den >>= 1;
        bit >>= 1;
    }

    if (rem) {
        *rem = num;
    }
    return q;
}

unsigned int __udivsi3(unsigned int num, unsigned int den)
{
    unsigned int r;
    return udivmod32(num, den, &r);
}

unsigned int __umodsi3(unsigned int num, unsigned int den)
{
    unsigned int r;
    udivmod32(num, den, &r);
    return r;
}
