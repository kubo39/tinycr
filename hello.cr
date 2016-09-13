dst = 0_u64
write = 1_u64
exit = 60_u64
asm("syscall" : "={rax}"(dst)
    : "{rax}"(write), "{rdi}"(1), "{rsi}"(0x400008), "{rdx}"(7)
    : "rcx", "r11", "memory"
    : "volatile")
asm("syscall" : "={rax}"(dst)
    : "{rax}"(60), "{rdi}"(0)
    : "rcx", "r11", "memory"
    : "volatile")
