.text
.globl problemA_main
.type problemA_main,%function
.align 2
problemA_main:
    addi sp,sp,-16
    sw ra,12(sp)
    sw s0,8(sp)
    sw s1,4(sp)
    sw s2,0(sp)
    li a0,3
    li a1,0
    li a2,2
    li a3,1
    jal ra,hanoi
    li a0,0
    lw s2,0(sp)
    lw s1,4(sp)
    lw s0,8(sp)
    lw ra,12(sp)
    addi sp,sp,16
    jr ra
hanoi:
    addi sp,sp,-20
    sw ra,16(sp)
    sw a0,12(sp)
    sw a1,8(sp)
    sw a2,4(sp)
    sw a3,0(sp)
    beq a0,x0,h_ret
    addi a0,a0,-1
    mv t0,a2
    mv a2,a3
    mv a3,t0
    jal ra,hanoi
    lw a0,12(sp)
    lw a1,8(sp)
    lw a2,4(sp)
    jal ra,print_move
    lw a0,12(sp)
    lw a1,8(sp)
    lw a2,4(sp)
    lw a3,0(sp)
    addi a0,a0,-1
    mv t0,a1
    mv a1,a3
    mv a3,t0
    jal ra,hanoi
h_ret:
    lw ra,16(sp)
    addi sp,sp,20
    jr ra
print_move:
    addi sp,sp,-16
    sw ra,12(sp)
    sw a0,8(sp)
    sw a1,4(sp)
    sw a2,0(sp)
    addi t0,a0,-1
    la t1,disks
    add t1,t1,t0
    lbu t0,0(t1)
    la t2,pegs
    add t3,t2,a1
    lbu t1,0(t3)
    add t3,t2,a2
    lbu t2,0(t3)
    la t3,chbuf
    sb t0,0(t3)
    li a0,1
    la a1,str1
    li a2,10
    li a7,0x40
    ecall
    li a0,1
    la a1,chbuf
    li a2,1
    li a7,0x40
    ecall
    li a0,1
    la a1,str2
    li a2,6
    li a7,0x40
    ecall
    sb t1,0(t3)
    li a0,1
    la a1,chbuf
    li a2,1
    li a7,0x40
    ecall
    li a0,1
    la a1,str3
    li a2,4
    li a7,0x40
    ecall
    sb t2,0(t3)
    li a0,1
    la a1,chbuf
    li a2,1
    li a7,0x40
    ecall
    li a0,1
    la a1,newline
    li a2,1
    li a7,0x40
    ecall
    lw ra,12(sp)
    addi sp,sp,16
    jr ra
.data
pegs:   .byte 65,66,67
disks:  .byte 49,50,51
str1:   .ascii "Move Disk "
str2:   .ascii " from "
str3:   .ascii " to "
newline:.ascii "\n"
chbuf:  .byte 0
