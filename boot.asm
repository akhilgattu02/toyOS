; 0x0e or 0eh is the BIOS teletype output function. It outputs the character in AL to the terminal and advances the cursor.
; lodsb assigns character at address SI to AL and increments SI by 1.

ORG 0x7c00
BITS 16

start:
    mov si, message
    call print
    jmp $

print:
    mov bx, 0

.loop:
    lodsb
    cmp al, 0
    je .done
    call print_char
    jmp .loop

.done:
    ret

print_char:
    mov ah, 0eh
    int 0x10    
    ret

message:
    db 'Hello World!', 0

times 510-($ - $$) db 0
dw 0xAA55