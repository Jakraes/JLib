#include "j_io.h"

u64 str_len(const char *str) {
    u64 len = 0;
    for (; str[len] != '\0'; len++);
    return len;
}

void print(const char *str) {
    syscall_write(1, str, str_len(str));
}