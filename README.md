# tinycr

```
$ ./build.sh
Crystal 0.7.6 [eb13f75] (Thu Aug 13 21:39:15 UTC 2015)

+ crystal build hello.cr --emit obj --prelude=empty --release
+ gcc hello.o -o hello -s --static -l:/usr/lib/x86_64-linux-musl/libc.a -Xlinker --gc-sections
+ wc -c
5400
$ ./hello
Hello!
```
