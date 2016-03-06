class String
  def to_unsafe
    pointerof(@a)
  end
end

def syswrite
  dst = 0_u64
  write = 1_u64
  b = " Hello!\n".to_unsafe  # It's terrible workaround!
  asm("syscall" : "={rax}"(dst)
      : "{rax}"(write), "{rdi}"(1), "{rsi}"(b), "{rdx}"(7)
      : "rcx", "r11", "memory"
      : "volatile")
end

def sysexit
  dst = 0_u64
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
