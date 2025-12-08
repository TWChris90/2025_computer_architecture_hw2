#ifndef RSQRT_ORG
#define RSQRT_ORG

#include <stdint.h>

typedef struct {
    uint32_t lo;
    uint32_t hi;
} uint64_result_t;

static void mul32(uint64_result_t *result, uint32_t a, uint32_t b);
static int clz(uint32_t x);
uint32_t fast_rsqrt(uint32_t x);

#endif
