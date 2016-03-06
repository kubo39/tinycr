#!/bin/bash

set -e

crystal -v
echo

set -x

crystal build hello.cr --emit obj --prelude=empty --release
ld hello.o -o hello -e main -s --static -nostdlib --gc-sections
wc -c < hello
./hello
