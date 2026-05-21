ORG 0x7c00
BITS 16

start:
    mov ah, 0eh
    mov al, 'a'
    ;Calling the BIOS routine. Output char 'a' to the terminal.
    int 0x10
    int 0x10
    jmp $

message: db 'Hello World!', 0

times 510-($ - $$) db 0
dw 0xAA55