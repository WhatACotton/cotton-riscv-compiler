#!/bin/bash
assert() {
  expected="$1"
  input="$2"
  echo "compiling chapter3.c"
  gcc -o tmp-compiler "chapter3.c" 
  ./tmp-compiler $expected > tmp.s
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
assert 2 '1+1'
assert 21 '5+20-4'
assert 40 '12+34-5-1'

echo OK
