#!/bin/bash

dirname=ivmai

set -e

crystal -v
echo

set -x

if [ -e $dirname ]; then
  git clone git://github.com/ivmai/libatomic_ops.git
  git clone git://github.com/ivmai/bdwgc.git
  ln -s `pwd`/libatomic_ops `pwd`/bdwgc/libatomic_ops
  cd bdwgc
  autoreconf -vif
  automake --add-missing
  ./configure
  make
  cd ..
fi

export LIBRARY_PATH=./bdwgc/.libs
crystal build hello.cr --emit obj --prelude=empty --release
gcc hello.o -o hello -s -lgc -lpthread -lunwind
wc -c < hello
