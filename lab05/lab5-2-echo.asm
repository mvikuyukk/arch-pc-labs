%include 'in_out.asm'

SECTION .data
    prompt: DB 'Введите строку: ',0

SECTION .bss
    buffer: RESB 80

SECTION .text
    GLOBAL _start
_start:
    ; Print prompt
    mov eax, prompt
    call sprintLF

    ; Read input
    mov eax, buffer
    mov ebx, 80
    call sread

    ; Echo back
    mov eax, buffer
    call sprintLF

    ; Exit
    call quit
