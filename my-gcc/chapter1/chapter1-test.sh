#!/bin/bash
assert() {
  expected="$1"
  input="$2"
  echo "compiling chapter1.c"
  gcc -o tmp-compiler "chapter1.c" 
  ./tmp-compiler $expected> tmp.s
  riscv64-unknown-elf-gcc -o tmp tmp.s
  qemu-riscv64 tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 0 0
assert 42 42

echo OK