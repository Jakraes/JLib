section .note.GNU-stack noalloc noexec nowrite progbits

section     .text
global      syscall_restart__
global      syscall_exit__
global      syscall_fork__
global      syscall_read__
global      syscall_write__

; void syscall_restart__();
syscall_restart__:
    push    ebp
    mov     ebp, esp
    mov     eax, 0
    int     0x80
    leave
    ret

; void syscall_exit__(i32);
syscall_exit__:
    push    ebp
    mov     ebp, esp
    mov     eax, 1
    mov     ebx, [esp + 8]
    int     0x80
    leave
    ret

; void syscall_fork__();
syscall_fork__:
    push    ebp
    mov     ebp, esp
    mov     eax, 2
    int     0x80
    leave
    ret

; void syscall_read__(u32, char*, u64);
syscall_read__:
    push    ebp
    mov     ebp, esp
    mov     eax, 3            ; sys_read
    mov     ebx, [ebp + 8]    ; fd
    mov     ecx, [ebp + 12]   ; buf
    mov     edx, [ebp + 16]   ; count
    int     0x80
    leave
    ret

; void syscall_write__(u32, const char*, u64);
syscall_write__:
    push    ebp
    mov     ebp, esp
    mov     eax, 4            ; sys_write
    mov     ebx, [ebp + 8]    ; fd
    mov     ecx, [ebp + 12]   ; buf
    mov     edx, [ebp + 16]   ; count
    int     0x80
    leave
    ret