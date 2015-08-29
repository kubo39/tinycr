require "intrinsics"
require "libc"
require "macros"
require "object"
require "comparable"
require "enumerable"
require "iterator"
require "string"

class String
  def to_unsafe
    cstr
  end
end

def __main
  write = 1_u64
  dst :: UInt64
  b = "Hello!\n".to_unsafe

  asm("syscall" : "={rax}"(dst)
      : "{rax}"(write), "{rdi}"(1), "{rsi}"(b), "{rdx}"(7)
      : "rcx", "r11", "memory"
      : "volatile")
end

__main
