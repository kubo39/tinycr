# tinycr

```
$ ./build.sh
Crystal 0.12.0 [90eaec1] (Tue Feb 16 14:31:00 UTC 2016)

+ crystal build hello.cr --emit obj --prelude=empty --release
+ ld hello.o -o hello -e main -s --static -nostdlib --gc-sections
+ wc -c
656
+ ./hello
Hello!
```
