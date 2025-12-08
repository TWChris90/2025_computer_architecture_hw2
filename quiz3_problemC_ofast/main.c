#include <stdint.h>
#include "rsqrt_org.h"

#define printstr(ptr, length)                   \
    do {                                        \
        asm volatile(                           \
            "mv a1, %0\n"                       \
            "mv a2, %1\n"                       \
            "li a0, 1\n"                        \
            "li a7, 0x40\n"                     \
            "ecall\n"                           \
            :                                   \
            : "r"(ptr), "r"(length)             \
            : "a0", "a1", "a2", "a7", "memory");\
    } while (0)

void *memcpy(void *dest, const void *src, unsigned int n)
{
    unsigned char *d = (unsigned char *)dest;
    const unsigned char *s = (const unsigned char *)src;
    while (n) {
        *d = *s;
        d++;
        s++;
        n--;
    }
    return dest;
}

static void put_bytes(const char *s, uint32_t len)
{
    printstr(s, len);
}

static void put_char(char c)
{
    printstr(&c, 1);
}

static void put_text(const char *s)
{
    const char *p = s;
    while (*p) {
        p++;
    }
    printstr(s, (uint32_t)(p - s));
}

static void put_newline(void)
{
    put_char('\n');
}

static void put_space(void)
{
    put_char(' ');
}

static void print_dec(uint32_t n)
{
    char buf[16];
    int i = 0;

    if (n == 0) {
        put_char('0');
        return;
    }

    while (n && i < 16) {
        uint32_t t = n;
        uint32_t q = 0;

        while (t >= 10u) {
            t -= 10u;
            q++;
        }
        buf[i] = (char)('0' + t);
        i++;
        n = q;
    }

    while (i > 0) {
        i--;
        put_bytes(&buf[i], 1);
    }
}

extern uint32_t get_cycles(void);
extern uint32_t get_instret(void);
extern uint32_t fast_rsqrt(uint32_t x);

int main(void)
{
    /* 1, 3, 9, 25, 64, 123, 500 */
    uint32_t in[] = {1u, 3u, 9u, 25u, 64u, 123u, 500u};
    const char *true_exact[] = {
        "65536",
        "37837.23",
        "21845.33",
        "13107.20",
        "8192.0",
        "5909.18",
        "2930.86"
    };

    uint32_t n = 7u; 

    uint32_t total_cycles = 0u;
    uint32_t total_insts  = 0u;

    put_text("=====Fast Reciprocal sqrt Test=====");
    put_newline();
    put_text("Original version (-Ofast)");
    put_newline();

    {
        uint32_t i = 0u;
        while (i < n) {
            uint32_t x = in[i];

            uint32_t start_cycle = get_cycles();
            uint32_t start_inst  = get_instret();
            uint32_t y           = fast_rsqrt(x);
            uint32_t end_cycle   = get_cycles();
            uint32_t end_inst    = get_instret();

            uint32_t cycles = end_cycle - start_cycle;
            uint32_t insts  = end_inst - start_inst;

            total_cycles += cycles;
            total_insts  += insts;

            put_text("fast_rsqrt(");
            print_dec(x);
            put_text(") = ");
            print_dec(y);
            put_text(" (ideal ≈ ");
            put_text(true_exact[i]);
            put_char(')');
            put_newline();

            put_text("cycles: ");
            print_dec(cycles);
            put_text(", instructions: ");
            print_dec(insts);
            put_newline();

            i++;
        }
    }

    put_newline();
    put_text("Summary for fast_rsqrt:");
    put_newline();
    put_text("Total cycles: ");
    print_dec(total_cycles);
    put_newline();
    put_text("Total instructions: ");
    print_dec(total_insts);
    put_newline();

    put_text("=== fast_rsqrt test finished ===");
    put_newline();

    return 0;
}
