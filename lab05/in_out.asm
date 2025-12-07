sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax
    call    slen
    mov     edx, eax
    pop     eax
    mov     ecx, eax
    mov     ebx, 1
    mov     eax, 4
    int     0x80
    pop     ebx
    pop     ecx
    pop     edx
    ret

sprintLF:
    call    sprint
    push    eax
    mov     eax, 0Ah
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret

slen:
    push    ebx
    mov     ebx, eax
nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar
finished:
    sub     eax, ebx
    pop     ebx
    ret

sread:
    mov     ecx, eax   ; buffer address
    mov     edx, ebx   ; length
    mov     eax, 3     ; sys_read
    mov     ebx, 0     ; stdin
    int     0x80
    ret

quit:
    mov     eax, 1
    mov     ebx, 0
    int     0x80
