#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
  if (argc != 2)
  {
    fprintf(stderr, "引数の個数が正しくありません\n");
    return 1;
  }

  printf("    .file \"chapter1.c\"\n");
  printf("    .option nopic\n");
  printf("    .text\n");
  printf("    .align 1\n");
  printf("    .globl main\n");
  printf("    .type main, @function\n");
  printf("main:\n");
  printf("    addi sp,sp,-16\n");
  printf("    sd ra,8(sp)\n");
  printf("    addi s0,sp,16\n");
  printf("    li a5, %d\n", atoi(argv[1]));
  printf("    mv a0,a5\n");
  printf("    ld s0,8(sp)\n");
  printf("    addi sp,sp,16\n");
  printf("    jr ra\n");
  printf("    .size main, .-main\n");
  printf("    .ident \"GCC: (Xuantie-900 linux-5.10.4 musl gcc Toolchain V2.6.1 B-20220906) 10.2.0\"\n");
  printf("    .section .note.GNU-stack,\"\",@progbits\n");
  return 0;
}