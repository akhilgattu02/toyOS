; 0x0e or 0eh is the BIOS teletype output function. It outputs the character in AL to the terminal and advances the cursor.
; lodsb assigns character at address SI to AL and increments SI by 1.

ORG 0
BITS 16

_start:
    jmp short start
    nop

times 33 db 0

start:
    jmp 0x7c0:step2

handle_zero:
    mov si, interrupt_zero_message
    call print
    iret

handle_one:
    mov si, interrupt_one_message
    call print
    iret

handle_forteen:
    mov si, interrupt_forteen_message
    call print
    iret

step2:
    cli ; Clear Interrupts
    mov ax, 0x7c0
    mov ds, ax
    mov es, ax
    mov ax, 0x00
    mov ss, ax
    mov sp, 0x7c00
    sti ; Enables Interrupts 

    ;An interrupt has a segment (2 bytes) and an offset (2 bytes) 
    mov word[ss:0x00], handle_zero
    mov word[ss:0x02], 0x7c0

    mov word[ss:0x04], handle_one
    mov word[ss:0x06], 0x7c0

    mov word[ss:0x38], handle_forteen
    mov word[ss:0x3A], 0x7c0

    int 0
    int 1
    int 14

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

interrupt_zero_message:
    db 'Interrupt 0 called!', 13, 10, 0

interrupt_one_message:
    db 'Interrupt 1 called!', 13, 10, 0

interrupt_forteen_message:
    db 'Interrupt 14 called!', 13, 10, 0

times 510-($ - $$) db 0
dw 0xAA55