# tinycr

```console
$ ./build.sh
Crystal 0.31.0 [8d4715a59] (2019-09-23)

LLVM: 8.0.0
Default target: x86_64-unknown-linux-gnu

+ crystal build hello.cr --emit obj --prelude=empty --release --verbose
cc "${@}" -o '/home/kubo39/dev/crystal/tinycr/hello'  -rdynamic  -L/home/kubo39/.anyenv/envs/crenv/versions/0.31.0/bin/../lib/crystal/lib -L/usr/lib -L/usr/local/lib _main.o
+ objdump -dr hello.o

hello.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <__crystal_main>:
   0:	c3                      retq
   1:	90                      nop
   2:	90                      nop
   3:	90                      nop
   4:	90                      nop
   5:	90                      nop
   6:	90                      nop
   7:	90                      nop
   8:	90                      nop
   9:	90                      nop
   a:	90                      nop
   b:	90                      nop
   c:	90                      nop
   d:	90                      nop
   e:	90                      nop
   f:	90                      nop

0000000000000010 <main>:
  10:	b8 01 00 00 00          mov    $0x1,%eax
  15:	bf 01 00 00 00          mov    $0x1,%edi
  1a:	be 08 00 40 00          mov    $0x400008,%esi
  1f:	ba 07 00 00 00          mov    $0x7,%edx
  24:	0f 05                   syscall
  26:	b8 3c 00 00 00          mov    $0x3c,%eax
  2b:	31 ff                   xor    %edi,%edi
  2d:	0f 05                   syscall
  2f:	31 c0                   xor    %eax,%eax
  31:	c3                      retq
+ ld hello.o -o hello --static -nostdlib --gc-sections -T script.ld
+ objcopy -j combined -O binary hello hello.bin
++ nm --format=posix hello
++ grep '\<main\>'
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
