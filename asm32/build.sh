#! /usr/bin/env bash

nasm -f elf32 -o $1.o $1.s
ld -m elf_i386 -o $1 $1.o