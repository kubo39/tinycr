#!/usr/bin/env bash

set -e
export LANG=C

for c in crystal nasm; do
    command -v $c >/dev/null || (echo "Can't find $c, needed to build"; exit 1)
done

crystal -v
echo

set -x

crystal build hello.cr --emit obj --prelude=empty --release --verbose
objdump -dr hello.o
ld hello.o -o hello --static -nostdlib --gc-sections -T script.ld
objcopy -j combined -O binary hello hello.bin
ENTRY=$(nm --format=posix hello | grep '\<main\>' | awk '{print $3}')
nasm -f bin -o tinybin -D entry=0x$ENTRY elf.s
chmod u+x tinybin
hexdump -C tinybin
wc -c < tinybin
./tinybin
