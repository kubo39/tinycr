#!/bin/bash

dirname=ivmai

set -e

crystal -v
echo

set -x

crystal build hello.cr --emit obj --prelude=empty --release
gcc hello.o -o hello -s
wc -c < hello
