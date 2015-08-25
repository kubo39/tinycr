WRITE = 1_u64
EXIT = 60_u64

def syscall(n, arg1, arg2, arg3 : UInt64) : UInt64
  dst :: UInt64
  asm("syscall" : "={rax}"(dst)
      : "{rax}"(n), "{rdi}"(arg1), "{rsi}"(arg2), "{rdx}"(arg3)
      : "rcx", "r11", "memory"
      : "volatile")
  return dst
end

def syscall(n, arg1 : UInt64) : UInt64
  dst :: UInt64
  asm("syscall" : "={rax}"(dst)
      : "{rax}"(n), "{rdi}"(arg1)
      : "rcx", "r11", "memory"
      : "volatile")
  return dst
end

def __main
  b = "Hello!\n".bytes
  syscall(WRITE, 1_u64, b.buffer.address, b.size.to_u64)
  syscall(EXIT, 0_u64)
end
