
test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00010000 <_start>:
   10000:	00002117          	auipc	sp,0x2
   10004:	63010113          	addi	sp,sp,1584 # 12630 <__stack_top>
   10008:	00001297          	auipc	t0,0x1
   1000c:	62028293          	addi	t0,t0,1568 # 11628 <__bss_end>
   10010:	00001317          	auipc	t1,0x1
   10014:	61830313          	addi	t1,t1,1560 # 11628 <__bss_end>
   10018:	0062d863          	bge	t0,t1,10028 <_start+0x28>
   1001c:	0002a023          	sw	zero,0(t0)
   10020:	00428293          	addi	t0,t0,4
   10024:	ff5ff06f          	j	10018 <_start+0x18>
   10028:	5a8000ef          	jal	105d0 <main>
   1002c:	05d00893          	li	a7,93
   10030:	00000513          	li	a0,0
   10034:	00000073          	ecall
   10038:	0000006f          	j	10038 <_start+0x38>

0001003c <print_dec>:
   1003c:	ff010113          	addi	sp,sp,-16
   10040:	24050c63          	beqz	a0,10298 <print_dec+0x25c>
   10044:	00900713          	li	a4,9
   10048:	00010813          	mv	a6,sp
   1004c:	00010613          	mv	a2,sp
   10050:	00000693          	li	a3,0
   10054:	01000593          	li	a1,16
   10058:	02a77863          	bgeu	a4,a0,10088 <print_dec+0x4c>
   1005c:	00000793          	li	a5,0
   10060:	ff650513          	addi	a0,a0,-10
   10064:	00178793          	addi	a5,a5,1
   10068:	fea76ce3          	bltu	a4,a0,10060 <print_dec+0x24>
   1006c:	03050513          	addi	a0,a0,48
   10070:	00a60023          	sb	a0,0(a2)
   10074:	00168693          	addi	a3,a3,1
   10078:	00160613          	addi	a2,a2,1
   1007c:	00b68e63          	beq	a3,a1,10098 <print_dec+0x5c>
   10080:	00078513          	mv	a0,a5
   10084:	fca76ce3          	bltu	a4,a0,1005c <print_dec+0x20>
   10088:	002687b3          	add	a5,a3,sp
   1008c:	03050513          	addi	a0,a0,48
   10090:	00a78023          	sb	a0,0(a5)
   10094:	00168693          	addi	a3,a3,1
   10098:	fff68713          	addi	a4,a3,-1
   1009c:	00e80333          	add	t1,a6,a4
   100a0:	00100793          	li	a5,1
   100a4:	00030593          	mv	a1,t1
   100a8:	00078613          	mv	a2,a5
   100ac:	00100513          	li	a0,1
   100b0:	04000893          	li	a7,64
   100b4:	00000073          	ecall
   100b8:	1c070c63          	beqz	a4,10290 <print_dec+0x254>
   100bc:	ffe68713          	addi	a4,a3,-2
   100c0:	00e80333          	add	t1,a6,a4
   100c4:	00030593          	mv	a1,t1
   100c8:	00078613          	mv	a2,a5
   100cc:	00100513          	li	a0,1
   100d0:	04000893          	li	a7,64
   100d4:	00000073          	ecall
   100d8:	1a070c63          	beqz	a4,10290 <print_dec+0x254>
   100dc:	ffd68713          	addi	a4,a3,-3
   100e0:	00e80333          	add	t1,a6,a4
   100e4:	00030593          	mv	a1,t1
   100e8:	00078613          	mv	a2,a5
   100ec:	00100513          	li	a0,1
   100f0:	04000893          	li	a7,64
   100f4:	00000073          	ecall
   100f8:	18070c63          	beqz	a4,10290 <print_dec+0x254>
   100fc:	ffc68713          	addi	a4,a3,-4
   10100:	00e80333          	add	t1,a6,a4
   10104:	00030593          	mv	a1,t1
   10108:	00078613          	mv	a2,a5
   1010c:	00100513          	li	a0,1
   10110:	04000893          	li	a7,64
   10114:	00000073          	ecall
   10118:	16070c63          	beqz	a4,10290 <print_dec+0x254>
   1011c:	ffb68713          	addi	a4,a3,-5
   10120:	00e80333          	add	t1,a6,a4
   10124:	00030593          	mv	a1,t1
   10128:	00078613          	mv	a2,a5
   1012c:	00100513          	li	a0,1
   10130:	04000893          	li	a7,64
   10134:	00000073          	ecall
   10138:	14070c63          	beqz	a4,10290 <print_dec+0x254>
   1013c:	ffa68713          	addi	a4,a3,-6
   10140:	00e80333          	add	t1,a6,a4
   10144:	00030593          	mv	a1,t1
   10148:	00078613          	mv	a2,a5
   1014c:	00100513          	li	a0,1
   10150:	04000893          	li	a7,64
   10154:	00000073          	ecall
   10158:	12070c63          	beqz	a4,10290 <print_dec+0x254>
   1015c:	ff968713          	addi	a4,a3,-7
   10160:	00e80333          	add	t1,a6,a4
   10164:	00030593          	mv	a1,t1
   10168:	00078613          	mv	a2,a5
   1016c:	00100513          	li	a0,1
   10170:	04000893          	li	a7,64
   10174:	00000073          	ecall
   10178:	10070c63          	beqz	a4,10290 <print_dec+0x254>
   1017c:	ff868713          	addi	a4,a3,-8
   10180:	00e80333          	add	t1,a6,a4
   10184:	00030593          	mv	a1,t1
   10188:	00078613          	mv	a2,a5
   1018c:	00100513          	li	a0,1
   10190:	04000893          	li	a7,64
   10194:	00000073          	ecall
   10198:	0e070c63          	beqz	a4,10290 <print_dec+0x254>
   1019c:	ff768713          	addi	a4,a3,-9
   101a0:	00e80333          	add	t1,a6,a4
   101a4:	00030593          	mv	a1,t1
   101a8:	00078613          	mv	a2,a5
   101ac:	00100513          	li	a0,1
   101b0:	04000893          	li	a7,64
   101b4:	00000073          	ecall
   101b8:	0c070c63          	beqz	a4,10290 <print_dec+0x254>
   101bc:	ff668713          	addi	a4,a3,-10
   101c0:	00e80333          	add	t1,a6,a4
   101c4:	00030593          	mv	a1,t1
   101c8:	00078613          	mv	a2,a5
   101cc:	00100513          	li	a0,1
   101d0:	04000893          	li	a7,64
   101d4:	00000073          	ecall
   101d8:	0a070c63          	beqz	a4,10290 <print_dec+0x254>
   101dc:	ff568713          	addi	a4,a3,-11
   101e0:	00e80333          	add	t1,a6,a4
   101e4:	00030593          	mv	a1,t1
   101e8:	00078613          	mv	a2,a5
   101ec:	00100513          	li	a0,1
   101f0:	04000893          	li	a7,64
   101f4:	00000073          	ecall
   101f8:	08070c63          	beqz	a4,10290 <print_dec+0x254>
   101fc:	ff468713          	addi	a4,a3,-12
   10200:	00e80333          	add	t1,a6,a4
   10204:	00030593          	mv	a1,t1
   10208:	00078613          	mv	a2,a5
   1020c:	00100513          	li	a0,1
   10210:	04000893          	li	a7,64
   10214:	00000073          	ecall
   10218:	06070c63          	beqz	a4,10290 <print_dec+0x254>
   1021c:	ff368713          	addi	a4,a3,-13
   10220:	00e80333          	add	t1,a6,a4
   10224:	00030593          	mv	a1,t1
   10228:	00078613          	mv	a2,a5
   1022c:	00100513          	li	a0,1
   10230:	04000893          	li	a7,64
   10234:	00000073          	ecall
   10238:	04070c63          	beqz	a4,10290 <print_dec+0x254>
   1023c:	ff268713          	addi	a4,a3,-14
   10240:	00e80333          	add	t1,a6,a4
   10244:	00030593          	mv	a1,t1
   10248:	00078613          	mv	a2,a5
   1024c:	00100513          	li	a0,1
   10250:	04000893          	li	a7,64
   10254:	00000073          	ecall
   10258:	02070c63          	beqz	a4,10290 <print_dec+0x254>
   1025c:	ff168693          	addi	a3,a3,-15
   10260:	00d80733          	add	a4,a6,a3
   10264:	00070593          	mv	a1,a4
   10268:	00078613          	mv	a2,a5
   1026c:	00100513          	li	a0,1
   10270:	04000893          	li	a7,64
   10274:	00000073          	ecall
   10278:	00068c63          	beqz	a3,10290 <print_dec+0x254>
   1027c:	00080593          	mv	a1,a6
   10280:	00078613          	mv	a2,a5
   10284:	00100513          	li	a0,1
   10288:	04000893          	li	a7,64
   1028c:	00000073          	ecall
   10290:	01010113          	addi	sp,sp,16
   10294:	00008067          	ret
   10298:	03000793          	li	a5,48
   1029c:	00f10023          	sb	a5,0(sp)
   102a0:	00100713          	li	a4,1
   102a4:	00010593          	mv	a1,sp
   102a8:	00070613          	mv	a2,a4
   102ac:	00100513          	li	a0,1
   102b0:	04000893          	li	a7,64
   102b4:	00000073          	ecall
   102b8:	01010113          	addi	sp,sp,16
   102bc:	00008067          	ret

000102c0 <memcpy>:
   102c0:	0a060463          	beqz	a2,10368 <memcpy+0xa8>
   102c4:	fff60793          	addi	a5,a2,-1
   102c8:	00600713          	li	a4,6
   102cc:	06f77c63          	bgeu	a4,a5,10344 <memcpy+0x84>
   102d0:	00b567b3          	or	a5,a0,a1
   102d4:	0037f793          	andi	a5,a5,3
   102d8:	00158713          	addi	a4,a1,1
   102dc:	06079663          	bnez	a5,10348 <memcpy+0x88>
   102e0:	40e507b3          	sub	a5,a0,a4
   102e4:	0037b793          	sltiu	a5,a5,3
   102e8:	06079063          	bnez	a5,10348 <memcpy+0x88>
   102ec:	ffc67813          	andi	a6,a2,-4
   102f0:	010586b3          	add	a3,a1,a6
   102f4:	00050793          	mv	a5,a0
   102f8:	0005a703          	lw	a4,0(a1)
   102fc:	00458593          	addi	a1,a1,4
   10300:	00478793          	addi	a5,a5,4
   10304:	fee7ae23          	sw	a4,-4(a5)
   10308:	feb698e3          	bne	a3,a1,102f8 <memcpy+0x38>
   1030c:	010507b3          	add	a5,a0,a6
   10310:	41060733          	sub	a4,a2,a6
   10314:	05060a63          	beq	a2,a6,10368 <memcpy+0xa8>
   10318:	0006c583          	lbu	a1,0(a3)
   1031c:	00100613          	li	a2,1
   10320:	00b78023          	sb	a1,0(a5)
   10324:	04c70263          	beq	a4,a2,10368 <memcpy+0xa8>
   10328:	0016c583          	lbu	a1,1(a3)
   1032c:	00200613          	li	a2,2
   10330:	00b780a3          	sb	a1,1(a5)
   10334:	02c70a63          	beq	a4,a2,10368 <memcpy+0xa8>
   10338:	0026c703          	lbu	a4,2(a3)
   1033c:	00e78123          	sb	a4,2(a5)
   10340:	00008067          	ret
   10344:	00158713          	addi	a4,a1,1
   10348:	00c50633          	add	a2,a0,a2
   1034c:	00050793          	mv	a5,a0
   10350:	0005c683          	lbu	a3,0(a1)
   10354:	00178793          	addi	a5,a5,1
   10358:	00070593          	mv	a1,a4
   1035c:	fed78fa3          	sb	a3,-1(a5)
   10360:	00170713          	addi	a4,a4,1
   10364:	fec796e3          	bne	a5,a2,10350 <memcpy+0x90>
   10368:	00008067          	ret

0001036c <get_cycles>:
   1036c:	c80025f3          	rdcycleh	a1
   10370:	c0002573          	rdcycle	a0
   10374:	c8002673          	rdcycleh	a2
   10378:	fec59ae3          	bne	a1,a2,1036c <get_cycles>
   1037c:	00008067          	ret

00010380 <get_instret>:
   10380:	c82025f3          	rdinstreth	a1
   10384:	c0202573          	rdinstret	a0
   10388:	c8202673          	rdinstreth	a2
   1038c:	fec59ae3          	bne	a1,a2,10380 <get_instret>
   10390:	00008067          	ret

00010394 <fast_rsqrt>:
   10394:	22050663          	beqz	a0,105c0 <fast_rsqrt+0x22c>
   10398:	00100793          	li	a5,1
   1039c:	00050313          	mv	t1,a0
   103a0:	22f50463          	beq	a0,a5,105c8 <fast_rsqrt+0x234>
   103a4:	ff010113          	addi	sp,sp,-16
   103a8:	00812623          	sw	s0,12(sp)
   103ac:	000107b7          	lui	a5,0x10
   103b0:	1af56c63          	bltu	a0,a5,10568 <fast_rsqrt+0x1d4>
   103b4:	00050793          	mv	a5,a0
   103b8:	00800693          	li	a3,8
   103bc:	00000613          	li	a2,0
   103c0:	01000737          	lui	a4,0x1000
   103c4:	00e7f663          	bgeu	a5,a4,103d0 <fast_rsqrt+0x3c>
   103c8:	00879793          	slli	a5,a5,0x8
   103cc:	00068613          	mv	a2,a3
   103d0:	10000737          	lui	a4,0x10000
   103d4:	00e7f663          	bgeu	a5,a4,103e0 <fast_rsqrt+0x4c>
   103d8:	00460613          	addi	a2,a2,4
   103dc:	00479793          	slli	a5,a5,0x4
   103e0:	40000737          	lui	a4,0x40000
   103e4:	1ae7f063          	bgeu	a5,a4,10584 <fast_rsqrt+0x1f0>
   103e8:	00279713          	slli	a4,a5,0x2
   103ec:	00260613          	addi	a2,a2,2
   103f0:	00074463          	bltz	a4,103f8 <fast_rsqrt+0x64>
   103f4:	00160613          	addi	a2,a2,1
   103f8:	01f00693          	li	a3,31
   103fc:	40c686b3          	sub	a3,a3,a2
   10400:	00011737          	lui	a4,0x11
   10404:	00269593          	slli	a1,a3,0x2
   10408:	5a870713          	addi	a4,a4,1448 # 115a8 <rsqrt_table>
   1040c:	00100793          	li	a5,1
   10410:	00b705b3          	add	a1,a4,a1
   10414:	00d797b3          	sll	a5,a5,a3
   10418:	0005a503          	lw	a0,0(a1)
   1041c:	0467fe63          	bgeu	a5,t1,10478 <fast_rsqrt+0xe4>
   10420:	02000593          	li	a1,32
   10424:	40c58633          	sub	a2,a1,a2
   10428:	00261613          	slli	a2,a2,0x2
   1042c:	00c70733          	add	a4,a4,a2
   10430:	00072703          	lw	a4,0(a4)
   10434:	00050593          	mv	a1,a0
   10438:	40e50533          	sub	a0,a0,a4
   1043c:	40f30733          	sub	a4,t1,a5
   10440:	01071713          	slli	a4,a4,0x10
   10444:	00d75733          	srl	a4,a4,a3
   10448:	00000613          	li	a2,0
   1044c:	02000693          	li	a3,32
   10450:	00177793          	andi	a5,a4,1
   10454:	40f007b3          	neg	a5,a5
   10458:	00a7f7b3          	and	a5,a5,a0
   1045c:	fff68693          	addi	a3,a3,-1
   10460:	00f60633          	add	a2,a2,a5
   10464:	00151513          	slli	a0,a0,0x1
   10468:	00175713          	srli	a4,a4,0x1
   1046c:	fe0692e3          	bnez	a3,10450 <fast_rsqrt+0xbc>
   10470:	01065613          	srli	a2,a2,0x10
   10474:	40c58533          	sub	a0,a1,a2
   10478:	00200e13          	li	t3,2
   1047c:	00030f37          	lui	t5,0x30
   10480:	00100e93          	li	t4,1
   10484:	00050593          	mv	a1,a0
   10488:	00050693          	mv	a3,a0
   1048c:	02000713          	li	a4,32
   10490:	00000613          	li	a2,0
   10494:	0016f793          	andi	a5,a3,1
   10498:	40f007b3          	neg	a5,a5
   1049c:	00b7f7b3          	and	a5,a5,a1
   104a0:	fff70713          	addi	a4,a4,-1
   104a4:	00f60633          	add	a2,a2,a5
   104a8:	00159593          	slli	a1,a1,0x1
   104ac:	0016d693          	srli	a3,a3,0x1
   104b0:	fe0712e3          	bnez	a4,10494 <fast_rsqrt+0x100>
   104b4:	00000693          	li	a3,0
   104b8:	00000893          	li	a7,0
   104bc:	00030593          	mv	a1,t1
   104c0:	02000793          	li	a5,32
   104c4:	00b70fb3          	add	t6,a4,a1
   104c8:	00167813          	andi	a6,a2,1
   104cc:	00efb433          	sltu	s0,t6,a4
   104d0:	01f5d393          	srli	t2,a1,0x1f
   104d4:	00189293          	slli	t0,a7,0x1
   104d8:	fff78793          	addi	a5,a5,-1 # ffff <_start-0x1>
   104dc:	00080863          	beqz	a6,104ec <fast_rsqrt+0x158>
   104e0:	008686b3          	add	a3,a3,s0
   104e4:	011686b3          	add	a3,a3,a7
   104e8:	000f8713          	mv	a4,t6
   104ec:	0053e8b3          	or	a7,t2,t0
   104f0:	00159593          	slli	a1,a1,0x1
   104f4:	00165613          	srli	a2,a2,0x1
   104f8:	fc0796e3          	bnez	a5,104c4 <fast_rsqrt+0x130>
   104fc:	01069693          	slli	a3,a3,0x10
   10500:	01075713          	srli	a4,a4,0x10
   10504:	00e6e733          	or	a4,a3,a4
   10508:	40ef0733          	sub	a4,t5,a4
   1050c:	00000893          	li	a7,0
   10510:	00000593          	li	a1,0
   10514:	02000613          	li	a2,32
   10518:	00a78833          	add	a6,a5,a0
   1051c:	00177693          	andi	a3,a4,1
   10520:	00f833b3          	sltu	t2,a6,a5
   10524:	01f55293          	srli	t0,a0,0x1f
   10528:	00159f93          	slli	t6,a1,0x1
   1052c:	fff60613          	addi	a2,a2,-1
   10530:	00068863          	beqz	a3,10540 <fast_rsqrt+0x1ac>
   10534:	007888b3          	add	a7,a7,t2
   10538:	00b888b3          	add	a7,a7,a1
   1053c:	00080793          	mv	a5,a6
   10540:	01f2e5b3          	or	a1,t0,t6
   10544:	00151513          	slli	a0,a0,0x1
   10548:	00175713          	srli	a4,a4,0x1
   1054c:	fc0616e3          	bnez	a2,10518 <fast_rsqrt+0x184>
   10550:	00f89893          	slli	a7,a7,0xf
   10554:	0117d793          	srli	a5,a5,0x11
   10558:	00f8e533          	or	a0,a7,a5
   1055c:	01de0e63          	beq	t3,t4,10578 <fast_rsqrt+0x1e4>
   10560:	00100e13          	li	t3,1
   10564:	f21ff06f          	j	10484 <fast_rsqrt+0xf0>
   10568:	01051793          	slli	a5,a0,0x10
   1056c:	01800693          	li	a3,24
   10570:	01000613          	li	a2,16
   10574:	e4dff06f          	j	103c0 <fast_rsqrt+0x2c>
   10578:	00c12403          	lw	s0,12(sp)
   1057c:	01010113          	addi	sp,sp,16
   10580:	00008067          	ret
   10584:	e607d8e3          	bgez	a5,103f4 <fast_rsqrt+0x60>
   10588:	01f00813          	li	a6,31
   1058c:	40c806b3          	sub	a3,a6,a2
   10590:	00011737          	lui	a4,0x11
   10594:	00269593          	slli	a1,a3,0x2
   10598:	5a870713          	addi	a4,a4,1448 # 115a8 <rsqrt_table>
   1059c:	00100793          	li	a5,1
   105a0:	00b705b3          	add	a1,a4,a1
   105a4:	00d797b3          	sll	a5,a5,a3
   105a8:	0005a503          	lw	a0,0(a1)
   105ac:	ec67f6e3          	bgeu	a5,t1,10478 <fast_rsqrt+0xe4>
   105b0:	e70698e3          	bne	a3,a6,10420 <fast_rsqrt+0x8c>
   105b4:	00050593          	mv	a1,a0
   105b8:	800007b7          	lui	a5,0x80000
   105bc:	e81ff06f          	j	1043c <fast_rsqrt+0xa8>
   105c0:	fff00513          	li	a0,-1
   105c4:	00008067          	ret
   105c8:	00010537          	lui	a0,0x10
   105cc:	00008067          	ret

Disassembly of section .text.startup:

000105d0 <main>:
   105d0:	000117b7          	lui	a5,0x11
   105d4:	57078793          	addi	a5,a5,1392 # 11570 <main+0xfa0>
   105d8:	0007a383          	lw	t2,0(a5)
   105dc:	0047a283          	lw	t0,4(a5)
   105e0:	0087af83          	lw	t6,8(a5)
   105e4:	00c7af03          	lw	t5,12(a5)
   105e8:	0307a683          	lw	a3,48(a5)
   105ec:	0147ae03          	lw	t3,20(a5)
   105f0:	0187a303          	lw	t1,24(a5)
   105f4:	01c7a883          	lw	a7,28(a5)
   105f8:	0207a803          	lw	a6,32(a5)
   105fc:	0247a503          	lw	a0,36(a5)
   10600:	0287a583          	lw	a1,40(a5)
   10604:	02c7a603          	lw	a2,44(a5)
   10608:	0347a703          	lw	a4,52(a5)
   1060c:	0107ae83          	lw	t4,16(a5)
   10610:	f6010113          	addi	sp,sp,-160
   10614:	000117b7          	lui	a5,0x11
   10618:	08112e23          	sw	ra,156(sp)
   1061c:	08812c23          	sw	s0,152(sp)
   10620:	08912a23          	sw	s1,148(sp)
   10624:	09212823          	sw	s2,144(sp)
   10628:	09312623          	sw	s3,140(sp)
   1062c:	09412423          	sw	s4,136(sp)
   10630:	09512223          	sw	s5,132(sp)
   10634:	09612023          	sw	s6,128(sp)
   10638:	07712e23          	sw	s7,124(sp)
   1063c:	07812c23          	sw	s8,120(sp)
   10640:	07912a23          	sw	s9,116(sp)
   10644:	07a12823          	sw	s10,112(sp)
   10648:	07b12623          	sw	s11,108(sp)
   1064c:	02712423          	sw	t2,40(sp)
   10650:	02512623          	sw	t0,44(sp)
   10654:	03f12823          	sw	t6,48(sp)
   10658:	03e12a23          	sw	t5,52(sp)
   1065c:	03d12c23          	sw	t4,56(sp)
   10660:	04d12c23          	sw	a3,88(sp)
   10664:	03c12e23          	sw	t3,60(sp)
   10668:	44478693          	addi	a3,a5,1092 # 11444 <main+0xe74>
   1066c:	04612023          	sw	t1,64(sp)
   10670:	05112223          	sw	a7,68(sp)
   10674:	05012423          	sw	a6,72(sp)
   10678:	04a12623          	sw	a0,76(sp)
   1067c:	04b12823          	sw	a1,80(sp)
   10680:	04c12a23          	sw	a2,84(sp)
   10684:	04e12e23          	sw	a4,92(sp)
   10688:	44478793          	addi	a5,a5,1092
   1068c:	0017c703          	lbu	a4,1(a5)
   10690:	00178793          	addi	a5,a5,1
   10694:	fe071ce3          	bnez	a4,1068c <main+0xbc>
   10698:	40d787b3          	sub	a5,a5,a3
   1069c:	00068593          	mv	a1,a3
   106a0:	00078613          	mv	a2,a5
   106a4:	00100513          	li	a0,1
   106a8:	04000893          	li	a7,64
   106ac:	00000073          	ecall
   106b0:	00a00793          	li	a5,10
   106b4:	00f10c23          	sb	a5,24(sp)
   106b8:	01810b93          	addi	s7,sp,24
   106bc:	00100793          	li	a5,1
   106c0:	000b8593          	mv	a1,s7
   106c4:	00078613          	mv	a2,a5
   106c8:	00100513          	li	a0,1
   106cc:	04000893          	li	a7,64
   106d0:	00000073          	ecall
   106d4:	000117b7          	lui	a5,0x11
   106d8:	46878693          	addi	a3,a5,1128 # 11468 <main+0xe98>
   106dc:	46878793          	addi	a5,a5,1128
   106e0:	0017c703          	lbu	a4,1(a5)
   106e4:	00178793          	addi	a5,a5,1
   106e8:	fe071ce3          	bnez	a4,106e0 <main+0x110>
   106ec:	40d787b3          	sub	a5,a5,a3
   106f0:	00068593          	mv	a1,a3
   106f4:	00078613          	mv	a2,a5
   106f8:	00100513          	li	a0,1
   106fc:	04000893          	li	a7,64
   10700:	00000073          	ecall
   10704:	00a00793          	li	a5,10
   10708:	00f10c23          	sb	a5,24(sp)
   1070c:	00100c13          	li	s8,1
   10710:	000b8593          	mv	a1,s7
   10714:	000c0613          	mv	a2,s8
   10718:	00100513          	li	a0,1
   1071c:	04000893          	li	a7,64
   10720:	00000073          	ecall
   10724:	00011337          	lui	t1,0x11
   10728:	00011837          	lui	a6,0x11
   1072c:	00011db7          	lui	s11,0x11
   10730:	04410f13          	addi	t5,sp,68
   10734:	02810d13          	addi	s10,sp,40
   10738:	49830a13          	addi	s4,t1,1176 # 11498 <main+0xec8>
   1073c:	4a880b13          	addi	s6,a6,1192 # 114a8 <main+0xed8>
   10740:	4b4d8d93          	addi	s11,s11,1204 # 114b4 <main+0xee4>
   10744:	00000993          	li	s3,0
   10748:	00000a93          	li	s5,0
   1074c:	00900413          	li	s0,9
   10750:	01000c93          	li	s9,16
   10754:	000d2903          	lw	s2,0(s10)
   10758:	01e12623          	sw	t5,12(sp)
   1075c:	c11ff0ef          	jal	1036c <get_cycles>
   10760:	00a12423          	sw	a0,8(sp)
   10764:	c1dff0ef          	jal	10380 <get_instret>
   10768:	00050693          	mv	a3,a0
   1076c:	00090513          	mv	a0,s2
   10770:	00d12223          	sw	a3,4(sp)
   10774:	c21ff0ef          	jal	10394 <fast_rsqrt>
   10778:	00050493          	mv	s1,a0
   1077c:	bf1ff0ef          	jal	1036c <get_cycles>
   10780:	00a12023          	sw	a0,0(sp)
   10784:	bfdff0ef          	jal	10380 <get_instret>
   10788:	00412683          	lw	a3,4(sp)
   1078c:	00812603          	lw	a2,8(sp)
   10790:	00012783          	lw	a5,0(sp)
   10794:	40d50733          	sub	a4,a0,a3
   10798:	00c12f03          	lw	t5,12(sp)
   1079c:	000116b7          	lui	a3,0x11
   107a0:	40c787b3          	sub	a5,a5,a2
   107a4:	48468e93          	addi	t4,a3,1156 # 11484 <main+0xeb4>
   107a8:	00011637          	lui	a2,0x11
   107ac:	00fa8ab3          	add	s5,s5,a5
   107b0:	00e989b3          	add	s3,s3,a4
   107b4:	000e8693          	mv	a3,t4
   107b8:	49060e13          	addi	t3,a2,1168 # 11490 <main+0xec0>
   107bc:	0016c603          	lbu	a2,1(a3)
   107c0:	00168693          	addi	a3,a3,1
   107c4:	fe061ce3          	bnez	a2,107bc <main+0x1ec>
   107c8:	41d686b3          	sub	a3,a3,t4
   107cc:	000e8593          	mv	a1,t4
   107d0:	00068613          	mv	a2,a3
   107d4:	00100513          	li	a0,1
   107d8:	04000893          	li	a7,64
   107dc:	00000073          	ecall
   107e0:	00000293          	li	t0,0
   107e4:	000b8613          	mv	a2,s7
   107e8:	200902e3          	beqz	s2,111ec <main+0xc1c>
   107ec:	03247863          	bgeu	s0,s2,1081c <main+0x24c>
   107f0:	00000693          	li	a3,0
   107f4:	ff690913          	addi	s2,s2,-10
   107f8:	00168693          	addi	a3,a3,1
   107fc:	ff246ce3          	bltu	s0,s2,107f4 <main+0x224>
   10800:	03090913          	addi	s2,s2,48
   10804:	01260023          	sb	s2,0(a2)
   10808:	00128293          	addi	t0,t0,1
   1080c:	00160613          	addi	a2,a2,1
   10810:	01928e63          	beq	t0,s9,1082c <main+0x25c>
   10814:	00068913          	mv	s2,a3
   10818:	fd246ce3          	bltu	s0,s2,107f0 <main+0x220>
   1081c:	002286b3          	add	a3,t0,sp
   10820:	03090913          	addi	s2,s2,48
   10824:	01268c23          	sb	s2,24(a3)
   10828:	00128293          	addi	t0,t0,1
   1082c:	fff28693          	addi	a3,t0,-1
   10830:	00db83b3          	add	t2,s7,a3
   10834:	00038593          	mv	a1,t2
   10838:	000c0613          	mv	a2,s8
   1083c:	00100513          	li	a0,1
   10840:	04000893          	li	a7,64
   10844:	00000073          	ecall
   10848:	1c068c63          	beqz	a3,10a20 <main+0x450>
   1084c:	ffe28693          	addi	a3,t0,-2
   10850:	00db83b3          	add	t2,s7,a3
   10854:	00038593          	mv	a1,t2
   10858:	000c0613          	mv	a2,s8
   1085c:	00100513          	li	a0,1
   10860:	04000893          	li	a7,64
   10864:	00000073          	ecall
   10868:	1a068c63          	beqz	a3,10a20 <main+0x450>
   1086c:	ffd28693          	addi	a3,t0,-3
   10870:	00db83b3          	add	t2,s7,a3
   10874:	00038593          	mv	a1,t2
   10878:	000c0613          	mv	a2,s8
   1087c:	00100513          	li	a0,1
   10880:	04000893          	li	a7,64
   10884:	00000073          	ecall
   10888:	18068c63          	beqz	a3,10a20 <main+0x450>
   1088c:	ffc28693          	addi	a3,t0,-4
   10890:	00db83b3          	add	t2,s7,a3
   10894:	00038593          	mv	a1,t2
   10898:	000c0613          	mv	a2,s8
   1089c:	00100513          	li	a0,1
   108a0:	04000893          	li	a7,64
   108a4:	00000073          	ecall
   108a8:	16068c63          	beqz	a3,10a20 <main+0x450>
   108ac:	ffb28693          	addi	a3,t0,-5
   108b0:	00db83b3          	add	t2,s7,a3
   108b4:	00038593          	mv	a1,t2
   108b8:	000c0613          	mv	a2,s8
   108bc:	00100513          	li	a0,1
   108c0:	04000893          	li	a7,64
   108c4:	00000073          	ecall
   108c8:	14068c63          	beqz	a3,10a20 <main+0x450>
   108cc:	ffa28693          	addi	a3,t0,-6
   108d0:	00db83b3          	add	t2,s7,a3
   108d4:	00038593          	mv	a1,t2
   108d8:	000c0613          	mv	a2,s8
   108dc:	00100513          	li	a0,1
   108e0:	04000893          	li	a7,64
   108e4:	00000073          	ecall
   108e8:	12068c63          	beqz	a3,10a20 <main+0x450>
   108ec:	ff928693          	addi	a3,t0,-7
   108f0:	00db83b3          	add	t2,s7,a3
   108f4:	00038593          	mv	a1,t2
   108f8:	000c0613          	mv	a2,s8
   108fc:	00100513          	li	a0,1
   10900:	04000893          	li	a7,64
   10904:	00000073          	ecall
   10908:	10068c63          	beqz	a3,10a20 <main+0x450>
   1090c:	ff828693          	addi	a3,t0,-8
   10910:	00db83b3          	add	t2,s7,a3
   10914:	00038593          	mv	a1,t2
   10918:	000c0613          	mv	a2,s8
   1091c:	00100513          	li	a0,1
   10920:	04000893          	li	a7,64
   10924:	00000073          	ecall
   10928:	0e068c63          	beqz	a3,10a20 <main+0x450>
   1092c:	ff728693          	addi	a3,t0,-9
   10930:	00db83b3          	add	t2,s7,a3
   10934:	00038593          	mv	a1,t2
   10938:	000c0613          	mv	a2,s8
   1093c:	00100513          	li	a0,1
   10940:	04000893          	li	a7,64
   10944:	00000073          	ecall
   10948:	0c068c63          	beqz	a3,10a20 <main+0x450>
   1094c:	ff628693          	addi	a3,t0,-10
   10950:	00db83b3          	add	t2,s7,a3
   10954:	00038593          	mv	a1,t2
   10958:	000c0613          	mv	a2,s8
   1095c:	00100513          	li	a0,1
   10960:	04000893          	li	a7,64
   10964:	00000073          	ecall
   10968:	0a068c63          	beqz	a3,10a20 <main+0x450>
   1096c:	ff528693          	addi	a3,t0,-11
   10970:	00db83b3          	add	t2,s7,a3
   10974:	00038593          	mv	a1,t2
   10978:	000c0613          	mv	a2,s8
   1097c:	00100513          	li	a0,1
   10980:	04000893          	li	a7,64
   10984:	00000073          	ecall
   10988:	08068c63          	beqz	a3,10a20 <main+0x450>
   1098c:	ff428693          	addi	a3,t0,-12
   10990:	00db83b3          	add	t2,s7,a3
   10994:	00038593          	mv	a1,t2
   10998:	000c0613          	mv	a2,s8
   1099c:	00100513          	li	a0,1
   109a0:	04000893          	li	a7,64
   109a4:	00000073          	ecall
   109a8:	06068c63          	beqz	a3,10a20 <main+0x450>
   109ac:	ff328693          	addi	a3,t0,-13
   109b0:	00db83b3          	add	t2,s7,a3
   109b4:	00038593          	mv	a1,t2
   109b8:	000c0613          	mv	a2,s8
   109bc:	00100513          	li	a0,1
   109c0:	04000893          	li	a7,64
   109c4:	00000073          	ecall
   109c8:	04068c63          	beqz	a3,10a20 <main+0x450>
   109cc:	ff228693          	addi	a3,t0,-14
   109d0:	00db83b3          	add	t2,s7,a3
   109d4:	00038593          	mv	a1,t2
   109d8:	000c0613          	mv	a2,s8
   109dc:	00100513          	li	a0,1
   109e0:	04000893          	li	a7,64
   109e4:	00000073          	ecall
   109e8:	02068c63          	beqz	a3,10a20 <main+0x450>
   109ec:	ff128293          	addi	t0,t0,-15
   109f0:	005b86b3          	add	a3,s7,t0
   109f4:	00068593          	mv	a1,a3
   109f8:	000c0613          	mv	a2,s8
   109fc:	00100513          	li	a0,1
   10a00:	04000893          	li	a7,64
   10a04:	00000073          	ecall
   10a08:	00028c63          	beqz	t0,10a20 <main+0x450>
   10a0c:	000b8593          	mv	a1,s7
   10a10:	000c0613          	mv	a2,s8
   10a14:	00100513          	li	a0,1
   10a18:	04000893          	li	a7,64
   10a1c:	00000073          	ecall
   10a20:	000e0693          	mv	a3,t3
   10a24:	0016c603          	lbu	a2,1(a3)
   10a28:	00168693          	addi	a3,a3,1
   10a2c:	fe061ce3          	bnez	a2,10a24 <main+0x454>
   10a30:	41c686b3          	sub	a3,a3,t3
   10a34:	000e0593          	mv	a1,t3
   10a38:	00068613          	mv	a2,a3
   10a3c:	00100513          	li	a0,1
   10a40:	04000893          	li	a7,64
   10a44:	00000073          	ecall
   10a48:	00000293          	li	t0,0
   10a4c:	000b8613          	mv	a2,s7
   10a50:	7a048e63          	beqz	s1,1120c <main+0xc3c>
   10a54:	02947863          	bgeu	s0,s1,10a84 <main+0x4b4>
   10a58:	00000693          	li	a3,0
   10a5c:	ff648493          	addi	s1,s1,-10
   10a60:	00168693          	addi	a3,a3,1
   10a64:	fe946ce3          	bltu	s0,s1,10a5c <main+0x48c>
   10a68:	03048493          	addi	s1,s1,48
   10a6c:	00960023          	sb	s1,0(a2)
   10a70:	00128293          	addi	t0,t0,1
   10a74:	00160613          	addi	a2,a2,1
   10a78:	01928e63          	beq	t0,s9,10a94 <main+0x4c4>
   10a7c:	00068493          	mv	s1,a3
   10a80:	fc946ce3          	bltu	s0,s1,10a58 <main+0x488>
   10a84:	002286b3          	add	a3,t0,sp
   10a88:	03048493          	addi	s1,s1,48
   10a8c:	00968c23          	sb	s1,24(a3)
   10a90:	00128293          	addi	t0,t0,1
   10a94:	fff28693          	addi	a3,t0,-1
   10a98:	00db83b3          	add	t2,s7,a3
   10a9c:	00038593          	mv	a1,t2
   10aa0:	000c0613          	mv	a2,s8
   10aa4:	00100513          	li	a0,1
   10aa8:	04000893          	li	a7,64
   10aac:	00000073          	ecall
   10ab0:	1c068c63          	beqz	a3,10c88 <main+0x6b8>
   10ab4:	ffe28693          	addi	a3,t0,-2
   10ab8:	00db83b3          	add	t2,s7,a3
   10abc:	00038593          	mv	a1,t2
   10ac0:	000c0613          	mv	a2,s8
   10ac4:	00100513          	li	a0,1
   10ac8:	04000893          	li	a7,64
   10acc:	00000073          	ecall
   10ad0:	1a068c63          	beqz	a3,10c88 <main+0x6b8>
   10ad4:	ffd28693          	addi	a3,t0,-3
   10ad8:	00db83b3          	add	t2,s7,a3
   10adc:	00038593          	mv	a1,t2
   10ae0:	000c0613          	mv	a2,s8
   10ae4:	00100513          	li	a0,1
   10ae8:	04000893          	li	a7,64
   10aec:	00000073          	ecall
   10af0:	18068c63          	beqz	a3,10c88 <main+0x6b8>
   10af4:	ffc28693          	addi	a3,t0,-4
   10af8:	00db83b3          	add	t2,s7,a3
   10afc:	00038593          	mv	a1,t2
   10b00:	000c0613          	mv	a2,s8
   10b04:	00100513          	li	a0,1
   10b08:	04000893          	li	a7,64
   10b0c:	00000073          	ecall
   10b10:	16068c63          	beqz	a3,10c88 <main+0x6b8>
   10b14:	ffb28693          	addi	a3,t0,-5
   10b18:	00db83b3          	add	t2,s7,a3
   10b1c:	00038593          	mv	a1,t2
   10b20:	000c0613          	mv	a2,s8
   10b24:	00100513          	li	a0,1
   10b28:	04000893          	li	a7,64
   10b2c:	00000073          	ecall
   10b30:	14068c63          	beqz	a3,10c88 <main+0x6b8>
   10b34:	ffa28693          	addi	a3,t0,-6
   10b38:	00db83b3          	add	t2,s7,a3
   10b3c:	00038593          	mv	a1,t2
   10b40:	000c0613          	mv	a2,s8
   10b44:	00100513          	li	a0,1
   10b48:	04000893          	li	a7,64
   10b4c:	00000073          	ecall
   10b50:	12068c63          	beqz	a3,10c88 <main+0x6b8>
   10b54:	ff928693          	addi	a3,t0,-7
   10b58:	00db83b3          	add	t2,s7,a3
   10b5c:	00038593          	mv	a1,t2
   10b60:	000c0613          	mv	a2,s8
   10b64:	00100513          	li	a0,1
   10b68:	04000893          	li	a7,64
   10b6c:	00000073          	ecall
   10b70:	10068c63          	beqz	a3,10c88 <main+0x6b8>
   10b74:	ff828693          	addi	a3,t0,-8
   10b78:	00db83b3          	add	t2,s7,a3
   10b7c:	00038593          	mv	a1,t2
   10b80:	000c0613          	mv	a2,s8
   10b84:	00100513          	li	a0,1
   10b88:	04000893          	li	a7,64
   10b8c:	00000073          	ecall
   10b90:	0e068c63          	beqz	a3,10c88 <main+0x6b8>
   10b94:	ff728693          	addi	a3,t0,-9
   10b98:	00db83b3          	add	t2,s7,a3
   10b9c:	00038593          	mv	a1,t2
   10ba0:	000c0613          	mv	a2,s8
   10ba4:	00100513          	li	a0,1
   10ba8:	04000893          	li	a7,64
   10bac:	00000073          	ecall
   10bb0:	0c068c63          	beqz	a3,10c88 <main+0x6b8>
   10bb4:	ff628693          	addi	a3,t0,-10
   10bb8:	00db83b3          	add	t2,s7,a3
   10bbc:	00038593          	mv	a1,t2
   10bc0:	000c0613          	mv	a2,s8
   10bc4:	00100513          	li	a0,1
   10bc8:	04000893          	li	a7,64
   10bcc:	00000073          	ecall
   10bd0:	0a068c63          	beqz	a3,10c88 <main+0x6b8>
   10bd4:	ff528693          	addi	a3,t0,-11
   10bd8:	00db83b3          	add	t2,s7,a3
   10bdc:	00038593          	mv	a1,t2
   10be0:	000c0613          	mv	a2,s8
   10be4:	00100513          	li	a0,1
   10be8:	04000893          	li	a7,64
   10bec:	00000073          	ecall
   10bf0:	08068c63          	beqz	a3,10c88 <main+0x6b8>
   10bf4:	ff428693          	addi	a3,t0,-12
   10bf8:	00db83b3          	add	t2,s7,a3
   10bfc:	00038593          	mv	a1,t2
   10c00:	000c0613          	mv	a2,s8
   10c04:	00100513          	li	a0,1
   10c08:	04000893          	li	a7,64
   10c0c:	00000073          	ecall
   10c10:	06068c63          	beqz	a3,10c88 <main+0x6b8>
   10c14:	ff328693          	addi	a3,t0,-13
   10c18:	00db83b3          	add	t2,s7,a3
   10c1c:	00038593          	mv	a1,t2
   10c20:	000c0613          	mv	a2,s8
   10c24:	00100513          	li	a0,1
   10c28:	04000893          	li	a7,64
   10c2c:	00000073          	ecall
   10c30:	04068c63          	beqz	a3,10c88 <main+0x6b8>
   10c34:	ff228693          	addi	a3,t0,-14
   10c38:	00db83b3          	add	t2,s7,a3
   10c3c:	00038593          	mv	a1,t2
   10c40:	000c0613          	mv	a2,s8
   10c44:	00100513          	li	a0,1
   10c48:	04000893          	li	a7,64
   10c4c:	00000073          	ecall
   10c50:	02068c63          	beqz	a3,10c88 <main+0x6b8>
   10c54:	ff128293          	addi	t0,t0,-15
   10c58:	005b86b3          	add	a3,s7,t0
   10c5c:	00068593          	mv	a1,a3
   10c60:	000c0613          	mv	a2,s8
   10c64:	00100513          	li	a0,1
   10c68:	04000893          	li	a7,64
   10c6c:	00000073          	ecall
   10c70:	00028c63          	beqz	t0,10c88 <main+0x6b8>
   10c74:	000b8593          	mv	a1,s7
   10c78:	000c0613          	mv	a2,s8
   10c7c:	00100513          	li	a0,1
   10c80:	04000893          	li	a7,64
   10c84:	00000073          	ecall
   10c88:	000a0693          	mv	a3,s4
   10c8c:	0016c603          	lbu	a2,1(a3)
   10c90:	00168693          	addi	a3,a3,1
   10c94:	fe061ce3          	bnez	a2,10c8c <main+0x6bc>
   10c98:	414686b3          	sub	a3,a3,s4
   10c9c:	000a0593          	mv	a1,s4
   10ca0:	00068613          	mv	a2,a3
   10ca4:	00100513          	li	a0,1
   10ca8:	04000893          	li	a7,64
   10cac:	00000073          	ecall
   10cb0:	000f2283          	lw	t0,0(t5) # 30000 <__stack_top+0x1d9d0>
   10cb4:	0002c683          	lbu	a3,0(t0)
   10cb8:	78068263          	beqz	a3,1143c <main+0xe6c>
   10cbc:	00028693          	mv	a3,t0
   10cc0:	0016c603          	lbu	a2,1(a3)
   10cc4:	00168693          	addi	a3,a3,1
   10cc8:	fe061ce3          	bnez	a2,10cc0 <main+0x6f0>
   10ccc:	405686b3          	sub	a3,a3,t0
   10cd0:	00028593          	mv	a1,t0
   10cd4:	00068613          	mv	a2,a3
   10cd8:	00100513          	li	a0,1
   10cdc:	04000893          	li	a7,64
   10ce0:	00000073          	ecall
   10ce4:	02900693          	li	a3,41
   10ce8:	00d10c23          	sb	a3,24(sp)
   10cec:	000b8593          	mv	a1,s7
   10cf0:	000c0613          	mv	a2,s8
   10cf4:	00100513          	li	a0,1
   10cf8:	04000893          	li	a7,64
   10cfc:	00000073          	ecall
   10d00:	00a00693          	li	a3,10
   10d04:	00d10c23          	sb	a3,24(sp)
   10d08:	000b8593          	mv	a1,s7
   10d0c:	000c0613          	mv	a2,s8
   10d10:	00100513          	li	a0,1
   10d14:	04000893          	li	a7,64
   10d18:	00000073          	ecall
   10d1c:	000b0693          	mv	a3,s6
   10d20:	0016c603          	lbu	a2,1(a3)
   10d24:	00168693          	addi	a3,a3,1
   10d28:	fe061ce3          	bnez	a2,10d20 <main+0x750>
   10d2c:	416686b3          	sub	a3,a3,s6
   10d30:	000b0593          	mv	a1,s6
   10d34:	00068613          	mv	a2,a3
   10d38:	00100513          	li	a0,1
   10d3c:	04000893          	li	a7,64
   10d40:	00000073          	ecall
   10d44:	00000293          	li	t0,0
   10d48:	000b8613          	mv	a2,s7
   10d4c:	4e078063          	beqz	a5,1122c <main+0xc5c>
   10d50:	02f47863          	bgeu	s0,a5,10d80 <main+0x7b0>
   10d54:	00000693          	li	a3,0
   10d58:	ff678793          	addi	a5,a5,-10
   10d5c:	00168693          	addi	a3,a3,1
   10d60:	fef46ce3          	bltu	s0,a5,10d58 <main+0x788>
   10d64:	03078793          	addi	a5,a5,48
   10d68:	00f60023          	sb	a5,0(a2)
   10d6c:	00128293          	addi	t0,t0,1
   10d70:	00160613          	addi	a2,a2,1
   10d74:	01928e63          	beq	t0,s9,10d90 <main+0x7c0>
   10d78:	00068793          	mv	a5,a3
   10d7c:	fcf46ce3          	bltu	s0,a5,10d54 <main+0x784>
   10d80:	002286b3          	add	a3,t0,sp
   10d84:	03078793          	addi	a5,a5,48
   10d88:	00f68c23          	sb	a5,24(a3)
   10d8c:	00128293          	addi	t0,t0,1
   10d90:	fff28793          	addi	a5,t0,-1
   10d94:	00fb86b3          	add	a3,s7,a5
   10d98:	00068593          	mv	a1,a3
   10d9c:	000c0613          	mv	a2,s8
   10da0:	00100513          	li	a0,1
   10da4:	04000893          	li	a7,64
   10da8:	00000073          	ecall
   10dac:	1c078c63          	beqz	a5,10f84 <main+0x9b4>
   10db0:	ffe28793          	addi	a5,t0,-2
   10db4:	00fb86b3          	add	a3,s7,a5
   10db8:	00068593          	mv	a1,a3
   10dbc:	000c0613          	mv	a2,s8
   10dc0:	00100513          	li	a0,1
   10dc4:	04000893          	li	a7,64
   10dc8:	00000073          	ecall
   10dcc:	1a078c63          	beqz	a5,10f84 <main+0x9b4>
   10dd0:	ffd28793          	addi	a5,t0,-3
   10dd4:	00fb86b3          	add	a3,s7,a5
   10dd8:	00068593          	mv	a1,a3
   10ddc:	000c0613          	mv	a2,s8
   10de0:	00100513          	li	a0,1
   10de4:	04000893          	li	a7,64
   10de8:	00000073          	ecall
   10dec:	18078c63          	beqz	a5,10f84 <main+0x9b4>
   10df0:	ffc28793          	addi	a5,t0,-4
   10df4:	00fb86b3          	add	a3,s7,a5
   10df8:	00068593          	mv	a1,a3
   10dfc:	000c0613          	mv	a2,s8
   10e00:	00100513          	li	a0,1
   10e04:	04000893          	li	a7,64
   10e08:	00000073          	ecall
   10e0c:	16078c63          	beqz	a5,10f84 <main+0x9b4>
   10e10:	ffb28793          	addi	a5,t0,-5
   10e14:	00fb86b3          	add	a3,s7,a5
   10e18:	00068593          	mv	a1,a3
   10e1c:	000c0613          	mv	a2,s8
   10e20:	00100513          	li	a0,1
   10e24:	04000893          	li	a7,64
   10e28:	00000073          	ecall
   10e2c:	14078c63          	beqz	a5,10f84 <main+0x9b4>
   10e30:	ffa28793          	addi	a5,t0,-6
   10e34:	00fb86b3          	add	a3,s7,a5
   10e38:	00068593          	mv	a1,a3
   10e3c:	000c0613          	mv	a2,s8
   10e40:	00100513          	li	a0,1
   10e44:	04000893          	li	a7,64
   10e48:	00000073          	ecall
   10e4c:	12078c63          	beqz	a5,10f84 <main+0x9b4>
   10e50:	ff928793          	addi	a5,t0,-7
   10e54:	00fb86b3          	add	a3,s7,a5
   10e58:	00068593          	mv	a1,a3
   10e5c:	000c0613          	mv	a2,s8
   10e60:	00100513          	li	a0,1
   10e64:	04000893          	li	a7,64
   10e68:	00000073          	ecall
   10e6c:	10078c63          	beqz	a5,10f84 <main+0x9b4>
   10e70:	ff828793          	addi	a5,t0,-8
   10e74:	00fb86b3          	add	a3,s7,a5
   10e78:	00068593          	mv	a1,a3
   10e7c:	000c0613          	mv	a2,s8
   10e80:	00100513          	li	a0,1
   10e84:	04000893          	li	a7,64
   10e88:	00000073          	ecall
   10e8c:	0e078c63          	beqz	a5,10f84 <main+0x9b4>
   10e90:	ff728793          	addi	a5,t0,-9
   10e94:	00fb86b3          	add	a3,s7,a5
   10e98:	00068593          	mv	a1,a3
   10e9c:	000c0613          	mv	a2,s8
   10ea0:	00100513          	li	a0,1
   10ea4:	04000893          	li	a7,64
   10ea8:	00000073          	ecall
   10eac:	0c078c63          	beqz	a5,10f84 <main+0x9b4>
   10eb0:	ff628793          	addi	a5,t0,-10
   10eb4:	00fb86b3          	add	a3,s7,a5
   10eb8:	00068593          	mv	a1,a3
   10ebc:	000c0613          	mv	a2,s8
   10ec0:	00100513          	li	a0,1
   10ec4:	04000893          	li	a7,64
   10ec8:	00000073          	ecall
   10ecc:	0a078c63          	beqz	a5,10f84 <main+0x9b4>
   10ed0:	ff528793          	addi	a5,t0,-11
   10ed4:	00fb86b3          	add	a3,s7,a5
   10ed8:	00068593          	mv	a1,a3
   10edc:	000c0613          	mv	a2,s8
   10ee0:	00100513          	li	a0,1
   10ee4:	04000893          	li	a7,64
   10ee8:	00000073          	ecall
   10eec:	08078c63          	beqz	a5,10f84 <main+0x9b4>
   10ef0:	ff428793          	addi	a5,t0,-12
   10ef4:	00fb86b3          	add	a3,s7,a5
   10ef8:	00068593          	mv	a1,a3
   10efc:	000c0613          	mv	a2,s8
   10f00:	00100513          	li	a0,1
   10f04:	04000893          	li	a7,64
   10f08:	00000073          	ecall
   10f0c:	06078c63          	beqz	a5,10f84 <main+0x9b4>
   10f10:	ff328793          	addi	a5,t0,-13
   10f14:	00fb86b3          	add	a3,s7,a5
   10f18:	00068593          	mv	a1,a3
   10f1c:	000c0613          	mv	a2,s8
   10f20:	00100513          	li	a0,1
   10f24:	04000893          	li	a7,64
   10f28:	00000073          	ecall
   10f2c:	04078c63          	beqz	a5,10f84 <main+0x9b4>
   10f30:	ff228793          	addi	a5,t0,-14
   10f34:	00fb86b3          	add	a3,s7,a5
   10f38:	00068593          	mv	a1,a3
   10f3c:	000c0613          	mv	a2,s8
   10f40:	00100513          	li	a0,1
   10f44:	04000893          	li	a7,64
   10f48:	00000073          	ecall
   10f4c:	02078c63          	beqz	a5,10f84 <main+0x9b4>
   10f50:	ff128293          	addi	t0,t0,-15
   10f54:	005b87b3          	add	a5,s7,t0
   10f58:	00078593          	mv	a1,a5
   10f5c:	000c0613          	mv	a2,s8
   10f60:	00100513          	li	a0,1
   10f64:	04000893          	li	a7,64
   10f68:	00000073          	ecall
   10f6c:	00028c63          	beqz	t0,10f84 <main+0x9b4>
   10f70:	000b8593          	mv	a1,s7
   10f74:	000c0613          	mv	a2,s8
   10f78:	00100513          	li	a0,1
   10f7c:	04000893          	li	a7,64
   10f80:	00000073          	ecall
   10f84:	000d8793          	mv	a5,s11
   10f88:	0017c683          	lbu	a3,1(a5)
   10f8c:	00178793          	addi	a5,a5,1
   10f90:	fe069ce3          	bnez	a3,10f88 <main+0x9b8>
   10f94:	41b787b3          	sub	a5,a5,s11
   10f98:	000d8593          	mv	a1,s11
   10f9c:	00078613          	mv	a2,a5
   10fa0:	00100513          	li	a0,1
   10fa4:	04000893          	li	a7,64
   10fa8:	00000073          	ecall
   10fac:	000b8613          	mv	a2,s7
   10fb0:	28070e63          	beqz	a4,1124c <main+0xc7c>
   10fb4:	02e47863          	bgeu	s0,a4,10fe4 <main+0xa14>
   10fb8:	00000793          	li	a5,0
   10fbc:	ff670713          	addi	a4,a4,-10
   10fc0:	00178793          	addi	a5,a5,1
   10fc4:	fee46ce3          	bltu	s0,a4,10fbc <main+0x9ec>
   10fc8:	03070713          	addi	a4,a4,48
   10fcc:	00e60023          	sb	a4,0(a2)
   10fd0:	00168693          	addi	a3,a3,1
   10fd4:	00160613          	addi	a2,a2,1
   10fd8:	01968e63          	beq	a3,s9,10ff4 <main+0xa24>
   10fdc:	00078713          	mv	a4,a5
   10fe0:	fce46ce3          	bltu	s0,a4,10fb8 <main+0x9e8>
   10fe4:	002687b3          	add	a5,a3,sp
   10fe8:	03070713          	addi	a4,a4,48
   10fec:	00e78c23          	sb	a4,24(a5)
   10ff0:	00168693          	addi	a3,a3,1
   10ff4:	fff68793          	addi	a5,a3,-1
   10ff8:	00fb8733          	add	a4,s7,a5
   10ffc:	00070593          	mv	a1,a4
   11000:	000c0613          	mv	a2,s8
   11004:	00100513          	li	a0,1
   11008:	04000893          	li	a7,64
   1100c:	00000073          	ecall
   11010:	24078c63          	beqz	a5,11268 <main+0xc98>
   11014:	ffe68793          	addi	a5,a3,-2
   11018:	00fb8733          	add	a4,s7,a5
   1101c:	00070593          	mv	a1,a4
   11020:	000c0613          	mv	a2,s8
   11024:	00100513          	li	a0,1
   11028:	04000893          	li	a7,64
   1102c:	00000073          	ecall
   11030:	22078c63          	beqz	a5,11268 <main+0xc98>
   11034:	ffd68793          	addi	a5,a3,-3
   11038:	00fb8733          	add	a4,s7,a5
   1103c:	00070593          	mv	a1,a4
   11040:	000c0613          	mv	a2,s8
   11044:	00100513          	li	a0,1
   11048:	04000893          	li	a7,64
   1104c:	00000073          	ecall
   11050:	20078c63          	beqz	a5,11268 <main+0xc98>
   11054:	ffc68793          	addi	a5,a3,-4
   11058:	00fb8733          	add	a4,s7,a5
   1105c:	00070593          	mv	a1,a4
   11060:	000c0613          	mv	a2,s8
   11064:	00100513          	li	a0,1
   11068:	04000893          	li	a7,64
   1106c:	00000073          	ecall
   11070:	1e078c63          	beqz	a5,11268 <main+0xc98>
   11074:	ffb68793          	addi	a5,a3,-5
   11078:	00fb8733          	add	a4,s7,a5
   1107c:	00070593          	mv	a1,a4
   11080:	000c0613          	mv	a2,s8
   11084:	00100513          	li	a0,1
   11088:	04000893          	li	a7,64
   1108c:	00000073          	ecall
   11090:	1c078c63          	beqz	a5,11268 <main+0xc98>
   11094:	ffa68793          	addi	a5,a3,-6
   11098:	00fb8733          	add	a4,s7,a5
   1109c:	00070593          	mv	a1,a4
   110a0:	000c0613          	mv	a2,s8
   110a4:	00100513          	li	a0,1
   110a8:	04000893          	li	a7,64
   110ac:	00000073          	ecall
   110b0:	1a078c63          	beqz	a5,11268 <main+0xc98>
   110b4:	ff968793          	addi	a5,a3,-7
   110b8:	00fb8733          	add	a4,s7,a5
   110bc:	00070593          	mv	a1,a4
   110c0:	000c0613          	mv	a2,s8
   110c4:	00100513          	li	a0,1
   110c8:	04000893          	li	a7,64
   110cc:	00000073          	ecall
   110d0:	18078c63          	beqz	a5,11268 <main+0xc98>
   110d4:	ff868793          	addi	a5,a3,-8
   110d8:	00fb8733          	add	a4,s7,a5
   110dc:	00070593          	mv	a1,a4
   110e0:	000c0613          	mv	a2,s8
   110e4:	00100513          	li	a0,1
   110e8:	04000893          	li	a7,64
   110ec:	00000073          	ecall
   110f0:	16078c63          	beqz	a5,11268 <main+0xc98>
   110f4:	ff768793          	addi	a5,a3,-9
   110f8:	00fb8733          	add	a4,s7,a5
   110fc:	00070593          	mv	a1,a4
   11100:	000c0613          	mv	a2,s8
   11104:	00100513          	li	a0,1
   11108:	04000893          	li	a7,64
   1110c:	00000073          	ecall
   11110:	14078c63          	beqz	a5,11268 <main+0xc98>
   11114:	ff668793          	addi	a5,a3,-10
   11118:	00fb8733          	add	a4,s7,a5
   1111c:	00070593          	mv	a1,a4
   11120:	000c0613          	mv	a2,s8
   11124:	00100513          	li	a0,1
   11128:	04000893          	li	a7,64
   1112c:	00000073          	ecall
   11130:	12078c63          	beqz	a5,11268 <main+0xc98>
   11134:	ff568793          	addi	a5,a3,-11
   11138:	00fb8733          	add	a4,s7,a5
   1113c:	00070593          	mv	a1,a4
   11140:	000c0613          	mv	a2,s8
   11144:	00100513          	li	a0,1
   11148:	04000893          	li	a7,64
   1114c:	00000073          	ecall
   11150:	10078c63          	beqz	a5,11268 <main+0xc98>
   11154:	ff468793          	addi	a5,a3,-12
   11158:	00fb8733          	add	a4,s7,a5
   1115c:	00070593          	mv	a1,a4
   11160:	000c0613          	mv	a2,s8
   11164:	00100513          	li	a0,1
   11168:	04000893          	li	a7,64
   1116c:	00000073          	ecall
   11170:	0e078c63          	beqz	a5,11268 <main+0xc98>
   11174:	ff368793          	addi	a5,a3,-13
   11178:	00fb8733          	add	a4,s7,a5
   1117c:	00070593          	mv	a1,a4
   11180:	000c0613          	mv	a2,s8
   11184:	00100513          	li	a0,1
   11188:	04000893          	li	a7,64
   1118c:	00000073          	ecall
   11190:	0c078c63          	beqz	a5,11268 <main+0xc98>
   11194:	ff268793          	addi	a5,a3,-14
   11198:	00fb8733          	add	a4,s7,a5
   1119c:	00070593          	mv	a1,a4
   111a0:	000c0613          	mv	a2,s8
   111a4:	00100513          	li	a0,1
   111a8:	04000893          	li	a7,64
   111ac:	00000073          	ecall
   111b0:	0a078c63          	beqz	a5,11268 <main+0xc98>
   111b4:	ff168693          	addi	a3,a3,-15
   111b8:	00db87b3          	add	a5,s7,a3
   111bc:	00078593          	mv	a1,a5
   111c0:	000c0613          	mv	a2,s8
   111c4:	00100513          	li	a0,1
   111c8:	04000893          	li	a7,64
   111cc:	00000073          	ecall
   111d0:	08068c63          	beqz	a3,11268 <main+0xc98>
   111d4:	000b8593          	mv	a1,s7
   111d8:	000c0613          	mv	a2,s8
   111dc:	00100513          	li	a0,1
   111e0:	04000893          	li	a7,64
   111e4:	00000073          	ecall
   111e8:	0800006f          	j	11268 <main+0xc98>
   111ec:	03000693          	li	a3,48
   111f0:	00d10c23          	sb	a3,24(sp)
   111f4:	000b8593          	mv	a1,s7
   111f8:	000c0613          	mv	a2,s8
   111fc:	00100513          	li	a0,1
   11200:	04000893          	li	a7,64
   11204:	00000073          	ecall
   11208:	819ff06f          	j	10a20 <main+0x450>
   1120c:	03000693          	li	a3,48
   11210:	00d10c23          	sb	a3,24(sp)
   11214:	000b8593          	mv	a1,s7
   11218:	000c0613          	mv	a2,s8
   1121c:	00100513          	li	a0,1
   11220:	04000893          	li	a7,64
   11224:	00000073          	ecall
   11228:	a61ff06f          	j	10c88 <main+0x6b8>
   1122c:	03000793          	li	a5,48
   11230:	00f10c23          	sb	a5,24(sp)
   11234:	000b8593          	mv	a1,s7
   11238:	000c0613          	mv	a2,s8
   1123c:	00100513          	li	a0,1
   11240:	04000893          	li	a7,64
   11244:	00000073          	ecall
   11248:	d3dff06f          	j	10f84 <main+0x9b4>
   1124c:	03000793          	li	a5,48
   11250:	00f10c23          	sb	a5,24(sp)
   11254:	000b8593          	mv	a1,s7
   11258:	000c0613          	mv	a2,s8
   1125c:	00100513          	li	a0,1
   11260:	04000893          	li	a7,64
   11264:	00000073          	ecall
   11268:	00a00793          	li	a5,10
   1126c:	00f10c23          	sb	a5,24(sp)
   11270:	000b8593          	mv	a1,s7
   11274:	000c0613          	mv	a2,s8
   11278:	00100513          	li	a0,1
   1127c:	04000893          	li	a7,64
   11280:	00000073          	ecall
   11284:	004d0d13          	addi	s10,s10,4
   11288:	04410713          	addi	a4,sp,68
   1128c:	004f0f13          	addi	t5,t5,4
   11290:	cda71263          	bne	a4,s10,10754 <main+0x184>
   11294:	00f10c23          	sb	a5,24(sp)
   11298:	000b8593          	mv	a1,s7
   1129c:	000c0613          	mv	a2,s8
   112a0:	00100513          	li	a0,1
   112a4:	04000893          	li	a7,64
   112a8:	00000073          	ecall
   112ac:	000117b7          	lui	a5,0x11
   112b0:	4c878693          	addi	a3,a5,1224 # 114c8 <main+0xef8>
   112b4:	4c878793          	addi	a5,a5,1224
   112b8:	0017c703          	lbu	a4,1(a5)
   112bc:	00178793          	addi	a5,a5,1
   112c0:	fe071ce3          	bnez	a4,112b8 <main+0xce8>
   112c4:	40d787b3          	sub	a5,a5,a3
   112c8:	00068593          	mv	a1,a3
   112cc:	00078613          	mv	a2,a5
   112d0:	00100513          	li	a0,1
   112d4:	04000893          	li	a7,64
   112d8:	00000073          	ecall
   112dc:	00a00793          	li	a5,10
   112e0:	00f10c23          	sb	a5,24(sp)
   112e4:	00100793          	li	a5,1
   112e8:	000b8593          	mv	a1,s7
   112ec:	00078613          	mv	a2,a5
   112f0:	00100513          	li	a0,1
   112f4:	04000893          	li	a7,64
   112f8:	00000073          	ecall
   112fc:	000117b7          	lui	a5,0x11
   11300:	4e078693          	addi	a3,a5,1248 # 114e0 <main+0xf10>
   11304:	4e078793          	addi	a5,a5,1248
   11308:	0017c703          	lbu	a4,1(a5)
   1130c:	00178793          	addi	a5,a5,1
   11310:	fe071ce3          	bnez	a4,11308 <main+0xd38>
   11314:	40d787b3          	sub	a5,a5,a3
   11318:	00068593          	mv	a1,a3
   1131c:	00078613          	mv	a2,a5
   11320:	00100513          	li	a0,1
   11324:	04000893          	li	a7,64
   11328:	00000073          	ecall
   1132c:	000a8513          	mv	a0,s5
   11330:	d0dfe0ef          	jal	1003c <print_dec>
   11334:	00a00793          	li	a5,10
   11338:	00f10c23          	sb	a5,24(sp)
   1133c:	00100793          	li	a5,1
   11340:	000b8593          	mv	a1,s7
   11344:	00078613          	mv	a2,a5
   11348:	00100513          	li	a0,1
   1134c:	04000893          	li	a7,64
   11350:	00000073          	ecall
   11354:	000117b7          	lui	a5,0x11
   11358:	4f078693          	addi	a3,a5,1264 # 114f0 <main+0xf20>
   1135c:	4f078793          	addi	a5,a5,1264
   11360:	0017c703          	lbu	a4,1(a5)
   11364:	00178793          	addi	a5,a5,1
   11368:	fe071ce3          	bnez	a4,11360 <main+0xd90>
   1136c:	40d787b3          	sub	a5,a5,a3
   11370:	00068593          	mv	a1,a3
   11374:	00078613          	mv	a2,a5
   11378:	00100513          	li	a0,1
   1137c:	04000893          	li	a7,64
   11380:	00000073          	ecall
   11384:	00098513          	mv	a0,s3
   11388:	cb5fe0ef          	jal	1003c <print_dec>
   1138c:	00a00793          	li	a5,10
   11390:	00f10c23          	sb	a5,24(sp)
   11394:	00100793          	li	a5,1
   11398:	000b8593          	mv	a1,s7
   1139c:	00078613          	mv	a2,a5
   113a0:	00100513          	li	a0,1
   113a4:	04000893          	li	a7,64
   113a8:	00000073          	ecall
   113ac:	000117b7          	lui	a5,0x11
   113b0:	50878693          	addi	a3,a5,1288 # 11508 <main+0xf38>
   113b4:	50878793          	addi	a5,a5,1288
   113b8:	0017c703          	lbu	a4,1(a5)
   113bc:	00178793          	addi	a5,a5,1
   113c0:	fe071ce3          	bnez	a4,113b8 <main+0xde8>
   113c4:	40d787b3          	sub	a5,a5,a3
   113c8:	00068593          	mv	a1,a3
   113cc:	00078613          	mv	a2,a5
   113d0:	00100513          	li	a0,1
   113d4:	04000893          	li	a7,64
   113d8:	00000073          	ecall
   113dc:	00a00793          	li	a5,10
   113e0:	00f10c23          	sb	a5,24(sp)
   113e4:	00100793          	li	a5,1
   113e8:	000b8593          	mv	a1,s7
   113ec:	00078613          	mv	a2,a5
   113f0:	00100513          	li	a0,1
   113f4:	04000893          	li	a7,64
   113f8:	00000073          	ecall
   113fc:	09c12083          	lw	ra,156(sp)
   11400:	09812403          	lw	s0,152(sp)
   11404:	09412483          	lw	s1,148(sp)
   11408:	09012903          	lw	s2,144(sp)
   1140c:	08c12983          	lw	s3,140(sp)
   11410:	08812a03          	lw	s4,136(sp)
   11414:	08412a83          	lw	s5,132(sp)
   11418:	08012b03          	lw	s6,128(sp)
   1141c:	07c12b83          	lw	s7,124(sp)
   11420:	07812c03          	lw	s8,120(sp)
   11424:	07412c83          	lw	s9,116(sp)
   11428:	07012d03          	lw	s10,112(sp)
   1142c:	06c12d83          	lw	s11,108(sp)
   11430:	00000513          	li	a0,0
   11434:	0a010113          	addi	sp,sp,160
   11438:	00008067          	ret
   1143c:	00000693          	li	a3,0
   11440:	891ff06f          	j	10cd0 <main+0x700>
