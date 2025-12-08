#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include "rsqrt_org.h"

#define printstr(ptr, length)                   \
    do {                                        \
        asm volatile(                           \
            "add a7, x0, 0x40;"                 \
            "add a0, x0, 0x1;" /* stdout */     \
            "add a1, x0, %0;"                   \
            "mv  a2, %1;" /* number of bytes */ \
            "ecall;"                            \
            :                                   \
            : "r"(ptr), "r"(length)             \
            : "a0", "a1", "a2", "a7");          \
    } while (0)

/* Convenience wrappers around printstr */
#define TEST_OUTPUT(msg, length) printstr(msg, length)

#define TEST_LOG(msg)                      \
    do {                                   \
        char _m[] = msg;                   \
        TEST_OUTPUT(_m, sizeof(_m) - 1);   \
    } while (0)

extern uint64_t get_cycles(void);
extern uint64_t get_instret(void);

/* Simple byte-wise memcpy so that GCC does not pull in libc. */
void *memcpy(void *dst, const void *src, size_t n)
{
    uint8_t *d = (uint8_t *)dst;
    const uint8_t *s = (const uint8_t *)src;
    while (n--)
        *d++ = *s++;
    return dst;
}

static unsigned long udiv(unsigned long dividend, unsigned long divisor)
{
    if (divisor == 0)
        return 0;

    unsigned long quotient = 0;
    unsigned long remainder = 0;

    for (int i = 31; i >= 0; i--) {
        remainder <<= 1;
        remainder |= (dividend >> i) & 1UL;

        if (remainder >= divisor) {
            remainder -= divisor;
            quotient |= (1UL << i);
        }
    }
    return quotient;
}

/* Same idea as udiv(), but we only keep the final remainder. */
static unsigned long umod(unsigned long dividend, unsigned long divisor)
{
    if (divisor == 0)
        return 0;

    unsigned long remainder = 0;

    for (int i = 31; i >= 0; i--) {
        remainder <<= 1;
        remainder |= (dividend >> i) & 1UL;

        if (remainder >= divisor)
            remainder -= divisor;
    }
    return remainder;
}

static uint32_t umul(uint32_t a, uint32_t b)
{
    uint32_t res = 0;
    while (b) {
        if (b & 1U)
            res += a;
        a <<= 1;
        b >>= 1;
    }
    return res;
}

/* GCC sometimes emits calls to __mulsi3 for 32-bit integer multiply. */
uint32_t __mulsi3(uint32_t a, uint32_t b)
{
    return umul(a, b);
}

/* Print unsigned long in hexadecimal followed by a newline. */
static void print_hex(unsigned long val)
{
    char buf[20];
    char *p = buf + sizeof(buf) - 1;

    *p-- = '\n';

    if (val == 0) {
        *p-- = '0';
    } else {
        while (val) {
            int digit = val & 0xF;
            *p-- = (digit < 10) ? ('0' + digit) : ('a' + digit - 10);
            val >>= 4;
        }
    }
    p++;
    printstr(p, (buf + sizeof(buf) - p));
}

static void print_dec(unsigned long val)
{
    char buf[20];
    char *p = buf + sizeof(buf) - 1;

    *p-- = '\n';

    if (val == 0) {
        *p-- = '0';
    } else {
        while (val) {
            *p-- = '0' + umod(val, 10);
            val   = udiv(val, 10);
        }
    }
    p++;
    printstr(p, (buf + sizeof(buf) - p));
}

/* Same as print_dec() but without automatically appending a newline. */
static void print_dec_raw(unsigned long val)
{
    char buf[20];
    char *p = buf + sizeof(buf) - 1;

    if (val == 0) {
        *p-- = '0';
    } else {
        while (val) {
            *p-- = '0' + umod(val, 10);
            val   = udiv(val, 10);
        }
    }
    p++;
    printstr(p, (buf + sizeof(buf) - p));
}

/* Utility: compute length of a C string. */
static uint32_t str_len(const char *s)
{
    const char *p = s;
    while (*p) p++;
    return (uint32_t)(p - s);
}

static void report_result(uint32_t x,
                          uint32_t y_approx,
                          uint32_t ideal_times100,
                          const char *ideal_str)
{
    TEST_LOG("  fast_rsqrt(");
    print_dec_raw(x);
    TEST_LOG(") = ");
    print_dec_raw(y_approx);
    TEST_LOG("  (ideal ≈ ");
    TEST_OUTPUT(ideal_str, str_len(ideal_str));
    TEST_LOG(")");

    /* scale approximate result by 100 for percent computation */
    uint32_t approx_times100 = umul(y_approx, 100U);

    uint32_t diff = (approx_times100 > ideal_times100)
                    ? (approx_times100 - ideal_times100)
                    : (ideal_times100 - approx_times100);

    /* diff * 100 / ideal_times100  →  integer estimate of percentage */
    diff = umul(diff, 100U);
    uint32_t remainder      = umod(diff, ideal_times100);
    uint32_t error_percent  = udiv(diff, ideal_times100);

    TEST_LOG(", error ≈ ");
    print_dec_raw(error_percent);
    TEST_LOG("% (rem = ");
    print_dec_raw(remainder);
    TEST_LOG("/");
    print_dec(ideal_times100);    /* this adds a newline */
}

static void run_tests(void)
{
    uint64_t start_cycle, end_cycle;
    uint64_t start_inst, end_inst;

    TEST_LOG("\n[Q3-C] fast_rsqrt bare-metal test\n");
    TEST_LOG("Each error% is computed using integer math; remainder reveals\n");
    TEST_LOG("how much precision is lost by division.\n\n");

    /* Custom test set: mix of small and medium inputs. */
    uint32_t inputs[] = {1, 3, 9, 25, 64, 123, 500};
    const char *ideal_strs[] = {
        "65536.0",   /* 2^16 / sqrt(1)   */
        "37837.23",  /* 2^16 / sqrt(3)   */
        "21845.33",  /* 2^16 / sqrt(9)   */
        "13107.20",  /* 2^16 / sqrt(25)  */
        "8192.0",    /* 2^16 / sqrt(64)  */
        "5909.18",   /* 2^16 / sqrt(123) */
        "2930.86"    /* 2^16 / sqrt(500) */
    };

    uint32_t ideal_times100[] = {
        6553600U,  /* 65536.00 * 100 */
        3783723U,  /* 37837.23 * 100 */
        2184533U,  /* 21845.33 * 100 */
        1310720U,  /* 13107.20 * 100 */
        819200U,   /*  8192.00 * 100 */
        590918U,   /*  5909.18 * 100 */
        293086U    /*  2930.86 * 100 */
    };

    const int N = (int)(sizeof(inputs) / sizeof(inputs[0]));

    uint64_t total_cycles = 0;
    uint64_t total_insts  = 0;

    for (int i = 0; i < N; i++) {
        uint32_t x = inputs[i];

        start_cycle = get_cycles();
        start_inst  = get_instret();

        uint32_t y = fast_rsqrt(x);

        end_cycle = get_cycles();
        end_inst  = get_instret();

        uint64_t delta_cycle = end_cycle - start_cycle;
        uint64_t delta_inst  = end_inst  - start_inst;

        total_cycles += delta_cycle;
        total_insts  += delta_inst;

        report_result(x, y, ideal_times100[i], ideal_strs[i]);

        TEST_LOG("    cycles: ");
        print_dec_raw((unsigned long)delta_cycle);
        TEST_LOG(", instructions: ");
        print_dec((unsigned long)delta_inst);
    }

    TEST_LOG("\nSummary for fast_rsqrt:\n");
    TEST_LOG("  Total cycles: ");
    print_dec((unsigned long)total_cycles);
    TEST_LOG("  Total instructions: ");
    print_dec((unsigned long)total_insts);
}


int main(void)
{
    uint64_t start_cycle = get_cycles();
    uint64_t start_inst  = get_instret();

    run_tests();

    uint64_t end_cycle = get_cycles();
    uint64_t end_inst  = get_instret();

    TEST_LOG("\nIncluding test framework overhead:\n");
    TEST_LOG("  Cycles: ");
    print_dec((unsigned long)(end_cycle - start_cycle));
    TEST_LOG("  Instructions: ");
    print_dec((unsigned long)(end_inst - start_inst));

    TEST_LOG("=== fast_rsqrt test finished ===\n");
    return 0;
}
