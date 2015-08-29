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

def syswrite
  dst :: UInt64
  write = 1_u64
  b = "Hello!\n".to_unsafe
  asm("syscall" : "={rax}"(dst)
      : "{rax}"(write), "{rdi}"(1), "{rsi}"(b), "{rdx}"(7)
      : "rcx", "r11", "memory"
      : "volatile")
end

def sysexit
  dst :: UInt64
  exit = 60_u64
  asm("syscall" : "={rax}"(dst)
      : "{rax}"(exit), "{rdi}"(0)
      : "rcx", "r11", "memory"
      : "volatile")
end

def __main
  syswrite; sysexit
end

__main
