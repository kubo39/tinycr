require "intrinsics"
require "libc"
require "macros"
require "object"
require "exception"
require "value"
require "thread"
require "gc"
require "gc/boehm"
require "comparable"
require "enumerable"
require "iterable"
require "iterator"
require "number"
require "int"
require "pointer"
require "slice"
require "string"
require "static_array"
require "array"
require "math/math"
require "process"
require "raise"

def __main
  write = 1_u64
  dst :: UInt64
  b = "Hello!\n".bytes

  asm("syscall" : "={rax}"(dst)
      : "{rax}"(write), "{rdi}"(1), "{rsi}"(b.buffer.address), "{rdx}"(b.length.to_u64)
      : "rcx", "r11", "memory"
      : "volatile")
end

__main
