section .note.GNU-stack noalloc noexec nowrite progbits

section     .text
global      _start

extern      main

_start:
    call    main
    mov     ebx, eax
    mov     eax, 1
    int     0x80