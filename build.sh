#!/bin/bash

set -e

crystal -v
echo

set -x

crystal build hello.cr --emit obj --prelude=empty --release
ld hello.o -o hello -s --static -nostdlib --gc-sections -T script.ld
objcopy -j combined -O binary hello hello.bin
nasm -f bin -o tinybin -D entry=0x400070 elf.s
chmod +x tinybin
hexdump -C tinybin
wc -c < tinybin
./tinybin
