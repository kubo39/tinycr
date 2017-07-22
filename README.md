# tinycr

```console
$ ./build.sh
Crystal 0.23.0 [3c3d3e2] (2017-06-28) LLVM 3.8.1

+ crystal build hello.cr --emit obj --prelude=empty --release --verbose
cc "${@}" -o '/home/kubo39/dev/crystal/tinycr/hello'  -rdynamic  -L/usr/lib -L/usr/local/lib _main.o
+ objdump -dr hello.o

hello.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
   0:   b8 01 00 00 00          mov    $0x1,%eax
   5:   bf 01 00 00 00          mov    $0x1,%edi
   a:   be 08 00 40 00          mov    $0x400008,%esi
   f:   ba 07 00 00 00          mov    $0x7,%edx
  14:   0f 05                   syscall
  16:   b8 3c 00 00 00          mov    $0x3c,%eax
  1b:   31 ff                   xor    %edi,%edi
  1d:   0f 05                   syscall
  1f:   31 c0                   xor    %eax,%eax
  21:   c3                      retq
+ ld hello.o -o hello --static -nostdlib --gc-sections -T script.ld
+ objcopy -j combined -O binary hello hello.bin
++ nm --format=posix hello
++ grep main
++ awk '{print $3}'
+ ENTRY=0000000000400070
+ nasm -f bin -o tinybin -D entry=0x0000000000400070 elf.s
+ chmod +x tinybin
+ hexdump -C tinybin
00000000  7f 45 4c 46 02 01 01 00  48 65 6c 6c 6f 21 0a 00  |.ELF....Hello!..|
00000010  02 00 3e 00 01 00 00 00  70 00 40 00 00 00 00 00  |..>.....p.@.....|
00000020  38 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |8...............|
00000030  00 00 00 00 38 00 38 00  01 00 00 00 07 00 00 00  |....8.8.........|
00000040  00 00 00 00 00 00 00 00  00 00 40 00 00 00 00 00  |..........@.....|
00000050  00 00 40 00 00 00 00 00  92 00 00 00 00 00 00 00  |..@.............|
00000060  92 00 00 00 00 00 00 00  00 10 00 00 00 00 00 00  |................|
00000070  b8 01 00 00 00 bf 01 00  00 00 be 08 00 40 00 ba  |.............@..|
00000080  07 00 00 00 0f 05 b8 3c  00 00 00 31 ff 0f 05 31  |.......<...1...1|
00000090  c0 c3                                             |..|
00000092
+ wc -c
146
+ ./tinybin
Hello!
```
