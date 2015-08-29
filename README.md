# tinycr

```
$ ./build.sh
Crystal 0.7.6 [eb13f75] (Thu Aug 13 21:39:15 UTC 2015)

+ '[' -e ivmai ']'
+ export LIBRARY_PATH=./bdwgc/.libs
+ LIBRARY_PATH=./bdwgc/.libs
+ crystal build hello.cr --emit obj --prelude=empty --release
+ gcc hello.o -o hello -s
+ wc -c
6272
$ ./hello
Hello!
```
