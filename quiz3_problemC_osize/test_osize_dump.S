
test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00010000 <_start>:
.globl _start
.type _start, @function

_start:
    # Set up stack pointer
    la sp, __stack_top
   10000:	00002117          	auipc	sp,0x2
   10004:	91010113          	addi	sp,sp,-1776 # 11910 <__stack_top>

    # Clear BSS
    la t0, __bss_start
   10008:	00001297          	auipc	t0,0x1
   1000c:	90828293          	addi	t0,t0,-1784 # 10910 <__bss_end>
    la t1, __bss_end
   10010:	00001317          	auipc	t1,0x1
   10014:	90030313          	addi	t1,t1,-1792 # 10910 <__bss_end>
1:
    bge t0, t1, 2f
   10018:	0062d863          	bge	t0,t1,10028 <_start+0x28>
    sw zero, 0(t0)
   1001c:	0002a023          	sw	zero,0(t0)
    addi t0, t0, 4
   10020:	00428293          	addi	t0,t0,4
    j 1b
   10024:	ff5ff06f          	j	10018 <_start+0x18>

2:
    # Call main
    call main
   10028:	42c000ef          	jal	10454 <main>

    # Exit syscall (if main returns)
    li a7, 93    # exit syscall number
   1002c:	05d00893          	li	a7,93
    li a0, 0     # exit code
   10030:	00000513          	li	a0,0
    ecall
   10034:	00000073          	ecall

    # Infinite loop (should never reach here)
3:
    j 3b
   10038:	0000006f          	j	10038 <_start+0x38>

0001003c <put_char>:
   1003c:	ff010113          	addi	sp,sp,-16
{
    printstr(s, len);
}

static void put_char(char c)
{
   10040:	00a107a3          	sb	a0,15(sp)
    printstr(&c, 1);
   10044:	00f10793          	addi	a5,sp,15
   10048:	00100713          	li	a4,1
   1004c:	00078593          	mv	a1,a5
   10050:	00070613          	mv	a2,a4
   10054:	00100513          	li	a0,1
   10058:	04000893          	li	a7,64
   1005c:	00000073          	ecall
}
   10060:	01010113          	addi	sp,sp,16
   10064:	00008067          	ret

00010068 <put_text>:

static void put_text(const char *s)
{
   10068:	00050713          	mv	a4,a0
    const char *p = s;
   1006c:	00050793          	mv	a5,a0
    while (*p) p++;
   10070:	0007c683          	lbu	a3,0(a5)
   10074:	02069063          	bnez	a3,10094 <put_text+0x2c>
    printstr(s, (uint32_t)(p - s));
   10078:	40e787b3          	sub	a5,a5,a4
   1007c:	00070593          	mv	a1,a4
   10080:	00078613          	mv	a2,a5
   10084:	00100513          	li	a0,1
   10088:	04000893          	li	a7,64
   1008c:	00000073          	ecall
}
   10090:	00008067          	ret
    while (*p) p++;
   10094:	00178793          	addi	a5,a5,1
   10098:	fd9ff06f          	j	10070 <put_text+0x8>

0001009c <put_newline>:

static void put_newline(void)
{
    put_char('\n');
   1009c:	00a00513          	li	a0,10
   100a0:	f9dff06f          	j	1003c <put_char>

000100a4 <print_dec>:
{
    put_char(' ');
}

static void print_dec(uint32_t n)
{
   100a4:	fd010113          	addi	sp,sp,-48
   100a8:	02112623          	sw	ra,44(sp)
   100ac:	02812423          	sw	s0,40(sp)
   100b0:	02912223          	sw	s1,36(sp)
   100b4:	03212023          	sw	s2,32(sp)
   100b8:	01312e23          	sw	s3,28(sp)
   100bc:	01412c23          	sw	s4,24(sp)
   100c0:	01512a23          	sw	s5,20(sp)
    char buf[16];
    int i = 0;

    if (n == 0) {
   100c4:	04051463          	bnez	a0,1010c <print_dec+0x68>
        buf[i++] = '0';
   100c8:	03000793          	li	a5,48
   100cc:	00f10023          	sb	a5,0(sp)
   100d0:	00100413          	li	s0,1
            buf[i++] = (char)('0' + (n % 10u));
            n /= 10u;
        }
    }

    while (i-- > 0) {
   100d4:	fff00793          	li	a5,-1
        put_bytes(&buf[i], 1);
   100d8:	00010713          	mv	a4,sp
    printstr(s, len);
   100dc:	00100693          	li	a3,1
    while (i-- > 0) {
   100e0:	fff40413          	addi	s0,s0,-1
   100e4:	06f41c63          	bne	s0,a5,1015c <print_dec+0xb8>
    }
}
   100e8:	02c12083          	lw	ra,44(sp)
   100ec:	02812403          	lw	s0,40(sp)
   100f0:	02412483          	lw	s1,36(sp)
   100f4:	02012903          	lw	s2,32(sp)
   100f8:	01c12983          	lw	s3,28(sp)
   100fc:	01812a03          	lw	s4,24(sp)
   10100:	01412a83          	lw	s5,20(sp)
   10104:	03010113          	addi	sp,sp,48
   10108:	00008067          	ret
   1010c:	00050493          	mv	s1,a0
   10110:	00010913          	mv	s2,sp
    int i = 0;
   10114:	00000413          	li	s0,0
        while (n > 0 && i < (int)sizeof(buf)) {
   10118:	00900a93          	li	s5,9
   1011c:	01000a13          	li	s4,16
            buf[i++] = (char)('0' + (n % 10u));
   10120:	00a00593          	li	a1,10
   10124:	00048513          	mv	a0,s1
   10128:	2f0000ef          	jal	10418 <__umodsi3>
   1012c:	03050513          	addi	a0,a0,48
   10130:	00a90023          	sb	a0,0(s2)
            n /= 10u;
   10134:	00a00593          	li	a1,10
   10138:	00048513          	mv	a0,s1
   1013c:	00048993          	mv	s3,s1
   10140:	290000ef          	jal	103d0 <__udivsi3>
            buf[i++] = (char)('0' + (n % 10u));
   10144:	00140413          	addi	s0,s0,1
            n /= 10u;
   10148:	00050493          	mv	s1,a0
        while (n > 0 && i < (int)sizeof(buf)) {
   1014c:	f93af4e3          	bgeu	s5,s3,100d4 <print_dec+0x30>
   10150:	00190913          	addi	s2,s2,1
   10154:	fd4416e3          	bne	s0,s4,10120 <print_dec+0x7c>
   10158:	f7dff06f          	j	100d4 <print_dec+0x30>
        put_bytes(&buf[i], 1);
   1015c:	00870833          	add	a6,a4,s0
    printstr(s, len);
   10160:	00080593          	mv	a1,a6
   10164:	00068613          	mv	a2,a3
   10168:	00100513          	li	a0,1
   1016c:	04000893          	li	a7,64
   10170:	00000073          	ecall
}
   10174:	f6dff06f          	j	100e0 <print_dec+0x3c>

00010178 <memcpy>:
    while (n--) {
   10178:	00000793          	li	a5,0
   1017c:	00f61463          	bne	a2,a5,10184 <memcpy+0xc>
}
   10180:	00008067          	ret
        *d++ = *s++;
   10184:	00f58733          	add	a4,a1,a5
   10188:	00074683          	lbu	a3,0(a4)
   1018c:	00f50733          	add	a4,a0,a5
   10190:	00178793          	addi	a5,a5,1
   10194:	00d70023          	sb	a3,0(a4)
   10198:	fe5ff06f          	j	1017c <memcpy+0x4>

0001019c <get_cycles>:
.text

.globl get_cycles
.align 2
get_cycles:
    csrr a1, cycleh
   1019c:	c80025f3          	rdcycleh	a1
    csrr a0, cycle
   101a0:	c0002573          	rdcycle	a0
    csrr a2, cycleh
   101a4:	c8002673          	rdcycleh	a2
    bne a1, a2, get_cycles
   101a8:	fec59ae3          	bne	a1,a2,1019c <get_cycles>
    ret
   101ac:	00008067          	ret

000101b0 <get_instret>:

# Read 64-bit instruction retired counter
.globl get_instret
.align 2
get_instret:
    csrr a1, instreth
   101b0:	c82025f3          	rdinstreth	a1
    csrr a0, instret
   101b4:	c0202573          	rdinstret	a0
    csrr a2, instreth
   101b8:	c8202673          	rdinstreth	a2
    bne a1, a2, get_instret
   101bc:	fec59ae3          	bne	a1,a2,101b0 <get_instret>
    ret
   101c0:	00008067          	ret

000101c4 <mul32>:
}

/* 只用 32-bit 模擬 64-bit 乘法：result = a * b */
static void mul32(uint64_result_t *result, uint32_t a, uint32_t b)
{
    result->lo = 0;
   101c4:	00052023          	sw	zero,0(a0)
    result->hi = 0;
   101c8:	00052223          	sw	zero,4(a0)
   101cc:	02000713          	li	a4,32

    uint32_t a_lo = a;
    uint32_t a_hi = 0;
   101d0:	00000793          	li	a5,0

    for (int i = 0; i < 32; i++) {
        if (b & 1u) {
   101d4:	00167693          	andi	a3,a2,1
   101d8:	02068663          	beqz	a3,10204 <mul32+0x40>
            uint32_t old_lo = result->lo;
            result->lo += a_lo;
   101dc:	00052683          	lw	a3,0(a0)
   101e0:	00b68833          	add	a6,a3,a1
   101e4:	01052023          	sw	a6,0(a0)
            if (result->lo < old_lo) {
   101e8:	00d87863          	bgeu	a6,a3,101f8 <mul32+0x34>
                result->hi++;
   101ec:	00452683          	lw	a3,4(a0)
   101f0:	00168693          	addi	a3,a3,1
   101f4:	00d52223          	sw	a3,4(a0)
            }
            result->hi += a_hi;
   101f8:	00452683          	lw	a3,4(a0)
   101fc:	00f686b3          	add	a3,a3,a5
   10200:	00d52223          	sw	a3,4(a0)
        }
        a_hi = (a_hi << 1) | (a_lo >> 31);
   10204:	01f5d693          	srli	a3,a1,0x1f
   10208:	00179793          	slli	a5,a5,0x1
    for (int i = 0; i < 32; i++) {
   1020c:	fff70713          	addi	a4,a4,-1
        a_hi = (a_hi << 1) | (a_lo >> 31);
   10210:	00f6e7b3          	or	a5,a3,a5
        a_lo <<= 1;
   10214:	00159593          	slli	a1,a1,0x1
        b >>= 1;
   10218:	00165613          	srli	a2,a2,0x1
    for (int i = 0; i < 32; i++) {
   1021c:	fa071ce3          	bnez	a4,101d4 <mul32+0x10>
    }
}
   10220:	00008067          	ret

00010224 <fast_rsqrt>:

/* 主要的 fast reciprocal sqrt 演算法 */
uint32_t fast_rsqrt(uint32_t x)
{
   10224:	fc010113          	addi	sp,sp,-64
   10228:	02812c23          	sw	s0,56(sp)
   1022c:	02112e23          	sw	ra,60(sp)
   10230:	02912a23          	sw	s1,52(sp)
   10234:	03212823          	sw	s2,48(sp)
   10238:	03312623          	sw	s3,44(sp)
   1023c:	03412423          	sw	s4,40(sp)
    if (x == 0) return 0xFFFFFFFFu;  /* 視為 Inf */
   10240:	fff00413          	li	s0,-1
   10244:	12050463          	beqz	a0,1036c <fast_rsqrt+0x148>
   10248:	000107b7          	lui	a5,0x10
    if (x == 1) return 65536u;
   1024c:	00100713          	li	a4,1
   10250:	00050493          	mv	s1,a0
   10254:	00078413          	mv	s0,a5
   10258:	10e50a63          	beq	a0,a4,1036c <fast_rsqrt+0x148>
    if ((x & 0xFFFF0000u) == 0) { n += 16; x <<= 16; }
   1025c:	12f57a63          	bgeu	a0,a5,10390 <fast_rsqrt+0x16c>
   10260:	01051793          	slli	a5,a0,0x10
   10264:	01000713          	li	a4,16
    if ((x & 0xFF000000u) == 0) { n +=  8; x <<=  8; }
   10268:	010006b7          	lui	a3,0x1000
   1026c:	00d7f663          	bgeu	a5,a3,10278 <fast_rsqrt+0x54>
   10270:	00870713          	addi	a4,a4,8
   10274:	00879793          	slli	a5,a5,0x8
    if ((x & 0xF0000000u) == 0) { n +=  4; x <<=  4; }
   10278:	100006b7          	lui	a3,0x10000
   1027c:	00d7f663          	bgeu	a5,a3,10288 <fast_rsqrt+0x64>
   10280:	00470713          	addi	a4,a4,4
   10284:	00479793          	slli	a5,a5,0x4
    if ((x & 0xC0000000u) == 0) { n +=  2; x <<=  2; }
   10288:	400006b7          	lui	a3,0x40000
   1028c:	00d7f663          	bgeu	a5,a3,10298 <fast_rsqrt+0x74>
   10290:	00270713          	addi	a4,a4,2
   10294:	00279793          	slli	a5,a5,0x2
    if ((x & 0x80000000u) == 0) { n +=  1; }
   10298:	fff7c793          	not	a5,a5
   1029c:	01f7d793          	srli	a5,a5,0x1f
   102a0:	00f70733          	add	a4,a4,a5

    /* 1. 找 exponent */
    int exp = 31 - clz(x);
   102a4:	01f00513          	li	a0,31
   102a8:	40e50633          	sub	a2,a0,a4
    uint32_t y = rsqrt_table[exp];
   102ac:	000116b7          	lui	a3,0x11
   102b0:	89068693          	addi	a3,a3,-1904 # 10890 <rsqrt_table>
   102b4:	00261793          	slli	a5,a2,0x2
   102b8:	00f687b3          	add	a5,a3,a5
   102bc:	0007a403          	lw	s0,0(a5) # 10000 <_start>

    /* 2. 做線性插值修正初始值 */
    if (x > (1u << exp)) {
   102c0:	00100793          	li	a5,1
   102c4:	00c797b3          	sll	a5,a5,a2
   102c8:	0497f063          	bgeu	a5,s1,10308 <fast_rsqrt+0xe4>
        uint32_t y_next = (exp < 31) ? rsqrt_table[exp + 1] : 0;
   102cc:	00000593          	li	a1,0
   102d0:	00a60c63          	beq	a2,a0,102e8 <fast_rsqrt+0xc4>
   102d4:	02000813          	li	a6,32
   102d8:	40e80733          	sub	a4,a6,a4
   102dc:	00271713          	slli	a4,a4,0x2
   102e0:	00e686b3          	add	a3,a3,a4
   102e4:	0006a583          	lw	a1,0(a3)
        uint32_t delta = y - y_next;

        /* frac = ((x - 2^exp) << 16) >> exp;  全用 32-bit shift */
        uint32_t frac = ((x - (1u << exp)) << 16) >> exp;
   102e8:	40f487b3          	sub	a5,s1,a5
   102ec:	01079793          	slli	a5,a5,0x10

        /* 原本寫成 (delta * frac) >> 16，這裡用 mul32 再取低 32-bit，避免 64-bit 乘法 */
        uint64_result_t t;
        mul32(&t, delta, frac);
   102f0:	00c7d633          	srl	a2,a5,a2
   102f4:	40b405b3          	sub	a1,s0,a1
   102f8:	01810513          	addi	a0,sp,24
   102fc:	ec9ff0ef          	jal	101c4 <mul32>
        uint32_t prod = t.lo;
        y -= (prod >> 16);
   10300:	01a15783          	lhu	a5,26(sp)
   10304:	40f40433          	sub	s0,s0,a5
    }

    /* 3. 兩次 Newton-Raphson 修正 */
    for (int iter = 0; iter < 2; iter++) {
   10308:	00200913          	li	s2,2
        uint64_result_t xy2_temp;
        mul32(&xy2_temp, x, y2);
        uint32_t xy2 = (xy2_temp.hi << 16) | (xy2_temp.lo >> 16);

        uint64_result_t y_temp;
        mul32(&y_temp, y, (3u << 16) - xy2);
   1030c:	00030a37          	lui	s4,0x30
   10310:	00100993          	li	s3,1
        mul32(&y2_result, y, y);
   10314:	00040613          	mv	a2,s0
   10318:	00040593          	mv	a1,s0
   1031c:	00810513          	addi	a0,sp,8
   10320:	ea5ff0ef          	jal	101c4 <mul32>
        mul32(&xy2_temp, x, y2);
   10324:	00812603          	lw	a2,8(sp)
   10328:	00048593          	mv	a1,s1
   1032c:	01010513          	addi	a0,sp,16
   10330:	e95ff0ef          	jal	101c4 <mul32>
        uint32_t xy2 = (xy2_temp.hi << 16) | (xy2_temp.lo >> 16);
   10334:	01412603          	lw	a2,20(sp)
   10338:	01215783          	lhu	a5,18(sp)
        mul32(&y_temp, y, (3u << 16) - xy2);
   1033c:	00040593          	mv	a1,s0
        uint32_t xy2 = (xy2_temp.hi << 16) | (xy2_temp.lo >> 16);
   10340:	01061613          	slli	a2,a2,0x10
   10344:	00f66633          	or	a2,a2,a5
        mul32(&y_temp, y, (3u << 16) - xy2);
   10348:	40ca0633          	sub	a2,s4,a2
   1034c:	01810513          	addi	a0,sp,24
   10350:	e75ff0ef          	jal	101c4 <mul32>
        uint32_t result = (y_temp.hi << 15) | (y_temp.lo >> 17);
   10354:	01812783          	lw	a5,24(sp)
   10358:	01c12403          	lw	s0,28(sp)
   1035c:	0117d793          	srli	a5,a5,0x11
   10360:	00f41413          	slli	s0,s0,0xf
   10364:	00f46433          	or	s0,s0,a5
    for (int iter = 0; iter < 2; iter++) {
   10368:	03391a63          	bne	s2,s3,1039c <fast_rsqrt+0x178>
        y = result;
    }

    return y;
}
   1036c:	03c12083          	lw	ra,60(sp)
   10370:	00040513          	mv	a0,s0
   10374:	03812403          	lw	s0,56(sp)
   10378:	03412483          	lw	s1,52(sp)
   1037c:	03012903          	lw	s2,48(sp)
   10380:	02c12983          	lw	s3,44(sp)
   10384:	02812a03          	lw	s4,40(sp)
   10388:	04010113          	addi	sp,sp,64
   1038c:	00008067          	ret
   10390:	00050793          	mv	a5,a0
    int n = 0;
   10394:	00000713          	li	a4,0
   10398:	ed1ff06f          	j	10268 <fast_rsqrt+0x44>
   1039c:	00100913          	li	s2,1
   103a0:	f75ff06f          	j	10314 <fast_rsqrt+0xf0>

000103a4 <__mulsi3>:
/*  __mulsi3 / __udivsi3 / __umodsi3                         */
/*  只用加減與位移，不再用 * / %，避免再產生遞迴呼叫            */
/* ========================================================= */

unsigned int __mulsi3(unsigned int a, unsigned int b)
{
   103a4:	00050793          	mv	a5,a0
    unsigned int res = 0;
   103a8:	00000513          	li	a0,0
    while (b) {
   103ac:	00059463          	bnez	a1,103b4 <__mulsi3+0x10>
        }
        a <<= 1;
        b >>= 1;
    }
    return res;
}
   103b0:	00008067          	ret
        if (b & 1u) {
   103b4:	0015f713          	andi	a4,a1,1
   103b8:	40e00733          	neg	a4,a4
   103bc:	00f77733          	and	a4,a4,a5
   103c0:	00e50533          	add	a0,a0,a4
        a <<= 1;
   103c4:	00179793          	slli	a5,a5,0x1
        b >>= 1;
   103c8:	0015d593          	srli	a1,a1,0x1
   103cc:	fe1ff06f          	j	103ac <__mulsi3+0x8>

000103d0 <__udivsi3>:
    }
    return q;
}

unsigned int __udivsi3(unsigned int num, unsigned int den)
{
   103d0:	00050713          	mv	a4,a0
    unsigned int bit = 1;
   103d4:	00100793          	li	a5,1
    if (den == 0) {
   103d8:	00059c63          	bnez	a1,103f0 <__udivsi3+0x20>
        return 0xFFFFFFFFu;
   103dc:	fff00513          	li	a0,-1
    unsigned int r;
    return udivmod32(num, den, &r);
}
   103e0:	00008067          	ret
    while ((den <= num) && ((den & 0x80000000u) == 0)) {
   103e4:	0005c863          	bltz	a1,103f4 <__udivsi3+0x24>
        den <<= 1;
   103e8:	00159593          	slli	a1,a1,0x1
        bit <<= 1;
   103ec:	00179793          	slli	a5,a5,0x1
    while ((den <= num) && ((den & 0x80000000u) == 0)) {
   103f0:	feb77ae3          	bgeu	a4,a1,103e4 <__udivsi3+0x14>
   103f4:	00000513          	li	a0,0
    while (bit != 0) {
   103f8:	00079463          	bnez	a5,10400 <__udivsi3+0x30>
   103fc:	00008067          	ret
        if (num >= den) {
   10400:	00b76663          	bltu	a4,a1,1040c <__udivsi3+0x3c>
            num -= den;
   10404:	40b70733          	sub	a4,a4,a1
            q |= bit;
   10408:	00f56533          	or	a0,a0,a5
        den >>= 1;
   1040c:	0015d593          	srli	a1,a1,0x1
        bit >>= 1;
   10410:	0017d793          	srli	a5,a5,0x1
   10414:	fe5ff06f          	j	103f8 <__udivsi3+0x28>

00010418 <__umodsi3>:
    unsigned int bit = 1;
   10418:	00100793          	li	a5,1
    if (den == 0) {
   1041c:	00059a63          	bnez	a1,10430 <__umodsi3+0x18>
        if (rem) *rem = 0xFFFFFFFFu;
   10420:	fff00513          	li	a0,-1
unsigned int __umodsi3(unsigned int num, unsigned int den)
{
    unsigned int r;
    udivmod32(num, den, &r);
    return r;
}
   10424:	00008067          	ret
        den <<= 1;
   10428:	00159593          	slli	a1,a1,0x1
        bit <<= 1;
   1042c:	00179793          	slli	a5,a5,0x1
    while ((den <= num) && ((den & 0x80000000u) == 0)) {
   10430:	00b56463          	bltu	a0,a1,10438 <__umodsi3+0x20>
   10434:	fe05dae3          	bgez	a1,10428 <__umodsi3+0x10>
    while (bit != 0) {
   10438:	00079463          	bnez	a5,10440 <__umodsi3+0x28>
   1043c:	00008067          	ret
        if (num >= den) {
   10440:	00b56463          	bltu	a0,a1,10448 <__umodsi3+0x30>
            num -= den;
   10444:	40b50533          	sub	a0,a0,a1
        den >>= 1;
   10448:	0015d593          	srli	a1,a1,0x1
        bit >>= 1;
   1044c:	0017d793          	srli	a5,a5,0x1
   10450:	fe9ff06f          	j	10438 <__umodsi3+0x20>

Disassembly of section .text.startup:

00010454 <main>:

extern uint32_t get_cycles(void);
extern uint32_t get_instret(void);

int main(void)
{
   10454:	f5010113          	addi	sp,sp,-176
   10458:	09612823          	sw	s6,144(sp)
    /* 這組就是你截圖那組舊測資 */
    uint32_t in[] = {1, 3, 9, 25, 64, 123, 500};
   1045c:	000115b7          	lui	a1,0x11
   10460:	01c10b13          	addi	s6,sp,28
{
   10464:	0a812423          	sw	s0,168(sp)
    uint32_t in[] = {1, 3, 9, 25, 64, 123, 500};
   10468:	01c00613          	li	a2,28
   1046c:	83c58413          	addi	s0,a1,-1988 # 1083c <main+0x3e8>
   10470:	000b0513          	mv	a0,s6
   10474:	83c58593          	addi	a1,a1,-1988
{
   10478:	0a112623          	sw	ra,172(sp)
   1047c:	0a912223          	sw	s1,164(sp)
   10480:	0b212023          	sw	s2,160(sp)
   10484:	09512a23          	sw	s5,148(sp)
   10488:	09712623          	sw	s7,140(sp)
   1048c:	09812423          	sw	s8,136(sp)
   10490:	09912223          	sw	s9,132(sp)
   10494:	09a12023          	sw	s10,128(sp)
   10498:	07b12e23          	sw	s11,124(sp)
   1049c:	09312e23          	sw	s3,156(sp)
   104a0:	09412c23          	sw	s4,152(sp)
    uint32_t in[] = {1, 3, 9, 25, 64, 123, 500};
   104a4:	cd5ff0ef          	jal	10178 <memcpy>
    const char *true_exact[] = {
   104a8:	01c00613          	li	a2,28
   104ac:	00c405b3          	add	a1,s0,a2
   104b0:	03810513          	addi	a0,sp,56
   104b4:	cc5ff0ef          	jal	10178 <memcpy>
        "65536",   "37837.23", "21845.33",
        "13107.20","8192.0",   "5909.18",
        "2930.86"
    };
    uint32_t exact_mul10[] = {
   104b8:	05410b93          	addi	s7,sp,84
   104bc:	01c00613          	li	a2,28
   104c0:	03840593          	addi	a1,s0,56
   104c4:	000b8513          	mv	a0,s7
   104c8:	cb1ff0ef          	jal	10178 <memcpy>
    uint32_t n = sizeof(in) / sizeof(in[0]);

    uint32_t total_cycles = 0;
    uint32_t total_insts  = 0;

    put_text("=====Fast Reciprocal sqrt Test=====");
   104cc:	00010537          	lui	a0,0x10
   104d0:	6fc50513          	addi	a0,a0,1788 # 106fc <main+0x2a8>
   104d4:	b95ff0ef          	jal	10068 <put_text>
    put_newline();
   104d8:	bc5ff0ef          	jal	1009c <put_newline>
    put_text("Original version");
   104dc:	00010537          	lui	a0,0x10
   104e0:	72050513          	addi	a0,a0,1824 # 10720 <main+0x2cc>
   104e4:	b85ff0ef          	jal	10068 <put_text>
    put_newline();
   104e8:	00000a93          	li	s5,0
   104ec:	bb1ff0ef          	jal	1009c <put_newline>
    uint32_t total_insts  = 0;
   104f0:	00000493          	li	s1,0
    uint32_t total_cycles = 0;
   104f4:	00000913          	li	s2,0
                       : (value - result_mul100);
        error = error * 100u;
        uint32_t remainder = error % value;
        uint32_t error_percent = error / value;

        put_text("fast_rsqrt(");
   104f8:	00010db7          	lui	s11,0x10
        print_dec(x);
        put_text(") = ");
   104fc:	00010d37          	lui	s10,0x10
        print_dec(y);
        put_text(" (ideal ≈ ");
   10500:	00010cb7          	lui	s9,0x10
        put_text(true_exact[i]);
        put_text("), error ≈ ");
   10504:	00010c37          	lui	s8,0x10
        uint32_t x = in[i];
   10508:	015b07b3          	add	a5,s6,s5
   1050c:	0007a783          	lw	a5,0(a5)
   10510:	00f12023          	sw	a5,0(sp)
        uint32_t start_cycle = get_cycles();
   10514:	c89ff0ef          	jal	1019c <get_cycles>
   10518:	00050993          	mv	s3,a0
        uint32_t start_inst  = get_instret();
   1051c:	c95ff0ef          	jal	101b0 <get_instret>
   10520:	00050413          	mv	s0,a0
        uint32_t y = fast_rsqrt(x);
   10524:	00012503          	lw	a0,0(sp)
   10528:	cfdff0ef          	jal	10224 <fast_rsqrt>
   1052c:	00050a13          	mv	s4,a0
        uint32_t end_cycle   = get_cycles();
   10530:	c6dff0ef          	jal	1019c <get_cycles>
   10534:	00a12223          	sw	a0,4(sp)
        uint32_t end_inst    = get_instret();
   10538:	c79ff0ef          	jal	101b0 <get_instret>
        uint32_t value = exact_mul10[i];
   1053c:	015b87b3          	add	a5,s7,s5
   10540:	0007a583          	lw	a1,0(a5)
        uint32_t result_mul100 = y * 100u;
   10544:	001a1793          	slli	a5,s4,0x1
        uint32_t cycles = end_cycle - start_cycle;
   10548:	00412683          	lw	a3,4(sp)
        uint32_t result_mul100 = y * 100u;
   1054c:	014787b3          	add	a5,a5,s4
   10550:	00379793          	slli	a5,a5,0x3
   10554:	014787b3          	add	a5,a5,s4
        uint32_t cycles = end_cycle - start_cycle;
   10558:	413686b3          	sub	a3,a3,s3
        uint32_t result_mul100 = y * 100u;
   1055c:	00279793          	slli	a5,a5,0x2
        uint32_t insts  = end_inst - start_inst;
   10560:	408509b3          	sub	s3,a0,s0
        total_cycles += cycles;
   10564:	00d90933          	add	s2,s2,a3
        total_insts  += insts;
   10568:	013484b3          	add	s1,s1,s3
                       : (value - result_mul100);
   1056c:	40f58533          	sub	a0,a1,a5
   10570:	00f5f463          	bgeu	a1,a5,10578 <main+0x124>
   10574:	40b78533          	sub	a0,a5,a1
        error = error * 100u;
   10578:	00151413          	slli	s0,a0,0x1
   1057c:	00a40433          	add	s0,s0,a0
   10580:	00341413          	slli	s0,s0,0x3
   10584:	00a40433          	add	s0,s0,a0
   10588:	00241413          	slli	s0,s0,0x2
        uint32_t remainder = error % value;
   1058c:	00040513          	mv	a0,s0
   10590:	00d12623          	sw	a3,12(sp)
   10594:	00b12423          	sw	a1,8(sp)
   10598:	e81ff0ef          	jal	10418 <__umodsi3>
        uint32_t error_percent = error / value;
   1059c:	00812583          	lw	a1,8(sp)
        uint32_t remainder = error % value;
   105a0:	00a12223          	sw	a0,4(sp)
        uint32_t error_percent = error / value;
   105a4:	00040513          	mv	a0,s0
   105a8:	e29ff0ef          	jal	103d0 <__udivsi3>
   105ac:	00050413          	mv	s0,a0
        put_text("fast_rsqrt(");
   105b0:	734d8513          	addi	a0,s11,1844 # 10734 <main+0x2e0>
   105b4:	ab5ff0ef          	jal	10068 <put_text>
        print_dec(x);
   105b8:	00012503          	lw	a0,0(sp)
   105bc:	ae9ff0ef          	jal	100a4 <print_dec>
        put_text(") = ");
   105c0:	740d0513          	addi	a0,s10,1856 # 10740 <main+0x2ec>
   105c4:	aa5ff0ef          	jal	10068 <put_text>
        print_dec(y);
   105c8:	000a0513          	mv	a0,s4
   105cc:	ad9ff0ef          	jal	100a4 <print_dec>
        put_text(" (ideal ≈ ");
   105d0:	748c8513          	addi	a0,s9,1864 # 10748 <main+0x2f4>
   105d4:	a95ff0ef          	jal	10068 <put_text>
        put_text(true_exact[i]);
   105d8:	03810793          	addi	a5,sp,56
   105dc:	015787b3          	add	a5,a5,s5
   105e0:	0007a503          	lw	a0,0(a5)
    for (uint32_t i = 0; i < n; i++) {
   105e4:	004a8a93          	addi	s5,s5,4
        put_text(true_exact[i]);
   105e8:	a81ff0ef          	jal	10068 <put_text>
        put_text("), error ≈ ");
   105ec:	758c0513          	addi	a0,s8,1880 # 10758 <main+0x304>
   105f0:	a79ff0ef          	jal	10068 <put_text>
        print_dec(error_percent);
   105f4:	00040513          	mv	a0,s0
   105f8:	aadff0ef          	jal	100a4 <print_dec>
        put_text("% (rem = ");
   105fc:	000107b7          	lui	a5,0x10
   10600:	76878513          	addi	a0,a5,1896 # 10768 <main+0x314>
   10604:	a65ff0ef          	jal	10068 <put_text>
        print_dec(remainder);
   10608:	00412503          	lw	a0,4(sp)
   1060c:	a99ff0ef          	jal	100a4 <print_dec>
        put_char('/');
   10610:	02f00513          	li	a0,47
   10614:	a29ff0ef          	jal	1003c <put_char>
        print_dec(value);
   10618:	00812583          	lw	a1,8(sp)
   1061c:	00058513          	mv	a0,a1
   10620:	a85ff0ef          	jal	100a4 <print_dec>
        put_char(')');
   10624:	02900513          	li	a0,41
   10628:	a15ff0ef          	jal	1003c <put_char>
        put_newline();
   1062c:	a71ff0ef          	jal	1009c <put_newline>

        put_text("cycles: ");
   10630:	00010537          	lui	a0,0x10
   10634:	77450513          	addi	a0,a0,1908 # 10774 <main+0x320>
   10638:	a31ff0ef          	jal	10068 <put_text>
        print_dec(cycles);
   1063c:	00c12683          	lw	a3,12(sp)
   10640:	00068513          	mv	a0,a3
   10644:	a61ff0ef          	jal	100a4 <print_dec>
        put_text(", instructions: ");
   10648:	00010537          	lui	a0,0x10
   1064c:	78050513          	addi	a0,a0,1920 # 10780 <main+0x32c>
   10650:	a19ff0ef          	jal	10068 <put_text>
        print_dec(insts);
   10654:	00098513          	mv	a0,s3
   10658:	a4dff0ef          	jal	100a4 <print_dec>
        put_newline();
   1065c:	a41ff0ef          	jal	1009c <put_newline>
    for (uint32_t i = 0; i < n; i++) {
   10660:	01c00793          	li	a5,28
   10664:	eafa92e3          	bne	s5,a5,10508 <main+0xb4>
    }

    put_newline();
   10668:	a35ff0ef          	jal	1009c <put_newline>
    put_text("Summary for fast_rsqrt:");
   1066c:	00010537          	lui	a0,0x10
   10670:	79450513          	addi	a0,a0,1940 # 10794 <main+0x340>
   10674:	9f5ff0ef          	jal	10068 <put_text>
    put_newline();
   10678:	a25ff0ef          	jal	1009c <put_newline>
    put_text("Total cycles: ");
   1067c:	00010537          	lui	a0,0x10
   10680:	7ac50513          	addi	a0,a0,1964 # 107ac <main+0x358>
   10684:	9e5ff0ef          	jal	10068 <put_text>
    print_dec(total_cycles);
   10688:	00090513          	mv	a0,s2
   1068c:	a19ff0ef          	jal	100a4 <print_dec>
    put_newline();
   10690:	a0dff0ef          	jal	1009c <put_newline>
    put_text("Total instructions: ");
   10694:	00010537          	lui	a0,0x10
   10698:	7bc50513          	addi	a0,a0,1980 # 107bc <main+0x368>
   1069c:	9cdff0ef          	jal	10068 <put_text>
    print_dec(total_insts);
   106a0:	00048513          	mv	a0,s1
   106a4:	a01ff0ef          	jal	100a4 <print_dec>
    put_newline();
   106a8:	9f5ff0ef          	jal	1009c <put_newline>

    put_text("=== fast_rsqrt test finished ===");
   106ac:	00010537          	lui	a0,0x10
   106b0:	7d450513          	addi	a0,a0,2004 # 107d4 <main+0x380>
   106b4:	9b5ff0ef          	jal	10068 <put_text>
    put_newline();
   106b8:	9e5ff0ef          	jal	1009c <put_newline>

    return 0;
}
   106bc:	0ac12083          	lw	ra,172(sp)
   106c0:	0a812403          	lw	s0,168(sp)
   106c4:	0a412483          	lw	s1,164(sp)
   106c8:	0a012903          	lw	s2,160(sp)
   106cc:	09c12983          	lw	s3,156(sp)
   106d0:	09812a03          	lw	s4,152(sp)
   106d4:	09412a83          	lw	s5,148(sp)
   106d8:	09012b03          	lw	s6,144(sp)
   106dc:	08c12b83          	lw	s7,140(sp)
   106e0:	08812c03          	lw	s8,136(sp)
   106e4:	08412c83          	lw	s9,132(sp)
   106e8:	08012d03          	lw	s10,128(sp)
   106ec:	07c12d83          	lw	s11,124(sp)
   106f0:	00000513          	li	a0,0
   106f4:	0b010113          	addi	sp,sp,176
   106f8:	00008067          	ret
