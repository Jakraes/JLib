#ifndef __J_SYSCALL_H__
#define __J_SYSCALL_H__

#include "j_types.h"

void syscall_restart();
void syscall_exit(i32 error_code);
void syscall_fork();
void syscall_read(u32 fd, char* buf, u64 count);
void syscall_write(u32 fd, const char* buf, u64 count);

#endif