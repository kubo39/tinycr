# tinycr

```
$ ./build.sh
Crystal 0.19.1 [798b2e2] (2016-09-09)

+ crystal build hello.cr --emit obj --prelude=empty --release --verbose
cc -o "/home/kubo39/dev/crystal/tinycr/hello" "${@}"  -rdynamic  -L/usr/lib -L/usr/local/lib _main.o
+ ld hello.o -o hello -s --static -nostdlib --gc-sections -T script.ld
+ objcopy -j combined -O binary hello hello.bin
+ nasm -f bin -o tinybin -D entry=0x400070 elf.s
+ chmod +x tinybin
+ hexdump -C tinybin
00000000  7f 45 4c 46 02 01 01 00  48 65 6c 6c 6f 21 0a 00  |.ELF....Hello!..|
00000010  02 00 3e 00 01 00 00 00  70 00 40 00 00 00 00 00  |..>.....p.@.....|
00000020  38 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |8...............|
00000030  00 00 00 00 38 00 38 00  01 00 00 00 07 00 00 00  |....8.8.........|
00000040  00 00 00 00 00 00 00 00  00 00 40 00 00 00 00 00  |..........@.....|
00000050  00 00 40 00 00 00 00 00  99 00 00 00 00 00 00 00  |..@.............|
00000060  99 00 00 00 00 00 00 00  00 10 00 00 00 00 00 00  |................|
00000070  48 89 35 29 00 00 00 b8  01 00 00 00 bf 01 00 00  |H.5)............|
00000080  00 be 08 00 40 00 ba 07  00 00 00 0f 05 b8 3c 00  |....@.........<.|
00000090  00 00 31 ff 0f 05 31 c0  c3                       |..1...1..|
00000099
+ wc -c
153
+ ./tinybin
Hello!
```
