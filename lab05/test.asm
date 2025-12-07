%include 'in_out.asm'

SECTION .data
    testmsg: DB 'Test',0

SECTION .text
    GLOBAL _start
_start:
    mov eax, testmsg
    call sprintLF
    call quit
