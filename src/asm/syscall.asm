section     .note.GNU-stack noalloc noexec nowrite progbits

section     .text
global      syscall_restart_syscall__
global      syscall_exit__
global      syscall_fork__
global      syscall_read__
global      syscall_write__

; void syscall_restart_syscall__();
syscall_restart_syscall__:
    push    ebp
    mov     ebp, esp
    mov     eax, 0x00
    int     0x80
    leave
    ret

; void syscall_exit__(i32);
syscall_exit__:
    push    ebp
    mov     ebp, esp
    mov     eax, 0x01
    mov     ebx, [esp + 8]
    int     0x80
    leave
    ret

; void syscall_fork__();
syscall_fork__:
    push    ebp
    mov     ebp, esp
    mov     eax, 0x02
    int     0x80
    leave
    ret

; void syscall_read__(u32, char*, u64);
syscall_read__:
    push    ebp
    mov     ebp, esp
    mov     eax, 0x03
    mov     ebx, [ebp + 8]    
    mov     ecx, [ebp + 12]
    mov     edx, [ebp + 16]
    int     0x80
    leave
    ret

; void syscall_write__(u32, const char*, u64);
syscall_write__:
    push    ebp
    mov     ebp, esp
    mov     eax, 0x04
    mov     ebx, [ebp + 8]
    mov     ecx, [ebp + 12]
    mov     edx, [ebp + 16]
    int     0x80
    leave
    ret