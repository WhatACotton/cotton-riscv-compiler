    .file "chapter1.c"
    .option nopic
    .text
    .align 1
    .globl main
    .type main, @function
main:
    addi sp,sp,-16
    sd ra,8(sp)
    addi s0,sp,16
    li a5, 42
    mv a0,a5
    ld s0,8(sp)
    addi sp,sp,16
    jr ra
    .size main, .-main
    .ident "GCC: (Xuantie-900 linux-5.10.4 musl gcc Toolchain V2.6.1 B-20220906) 10.2.0"
    .section .note.GNU-stack,"",@progbits
