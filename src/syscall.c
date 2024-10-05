#include "j_syscall.h"

extern void syscall_restart__();
extern void syscall_exit__(i32);
extern void syscall_fork__();
extern void syscall_read__(u32, char*, u64);
extern void syscall_write__(u32, const char*, u64);

void syscall_restart() {
    syscall_restart__();
}

void syscall_exit(i32 error_code) {
    syscall_exit__(error_code);
}

void syscall_fork() {
    syscall_fork__();
}

void syscall_read(u32 fd, char* buf, u64 count) {
    syscall_read__(fd, buf, count);
}

void syscall_write(u32 fd, const char* buf, u64 count) {
    syscall_write__(fd, buf, count);
}