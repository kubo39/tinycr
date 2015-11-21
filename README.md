# tinycr

```
$ ./build.sh
Crystal 0.9.1 [b3b1223] (Fri Oct 30 03:31:36 UTC 2015)

+ crystal build hello.cr --emit obj --prelude=empty --release
+ gcc hello.o -o hello -e main -s --static -nostdlib -Xlinker --gc-sections
+ wc -c
832
```
