#!/bin/bash

set -e

crystal -v
echo

set -x

crystal build hello.cr --emit obj --prelude=empty --release --verbose
ld hello.o -o hello --static -nostdlib --gc-sections -T script.ld
objcopy -j combined -O binary hello hello.bin
ENTRY=$(nm -f posix hello | grep 'main' | awk '{print $3}')
nasm -f bin -o tinybin -D entry=0x$ENTRY elf.s
chmod +x tinybin
hexdump -C tinybin
wc -c < tinybin
./tinybin
