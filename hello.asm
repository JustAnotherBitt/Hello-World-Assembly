section .data                       ; here go strings and variables with fixed value
    hello db 'Hello, World!', 10    ; defines the text "Hello, World!" as "hello", followed by a newline (\n = 10)
    len equ $ - hello               ; calculates the length of the string. I could also directly place the calculated size in "mov ex", which in this case would be 14

section .text                       ; here go the program instructions - the executable code
    global _start                   ; makes the symbol _start visible to the linker as the entry point

_start:                             ; starting point of the program execution (the main).
    ; write syscall
    mov eax, 4         ; sys_write (4)
    mov ebx, 1         ; file descriptor 1 (stdout)
    mov ecx, hello     ; address of the string - pointer to the beginning of the string
    mov edx, len       ; length of the string - calculated automatically in this case
    int 0x80           ; interrupt for system call (syscall)

    ; exit syscall
    mov eax, 1         ; sys_exit (1)
    xor ebx, ebx       ; exit code 0 - zeroes the register: puts 0 in ebx quickly. Equivalent to "mov ebx, 0"
    int 0x80           ; interrupt for system call (syscall)
