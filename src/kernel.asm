[BITS 32]

global _start
global problem
extern kernel_main

CODE_SEG equ 0x08
DATA_SEG equ 0x10

_start:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov ebp, 0x00200000
    mov esp, ebp

    ; Enable the A20 line, to access memory beyond 1MB
    in al, 0x92
    or al, 0x02
    out 0x92, al

    ; Remap the master PIC
    mov al, 0010001b
    out 0x20, al ; Tell master PIC

    mov al, 0x20 ; Interrupt 0x20 is where master ISR should start
    out 0x21, al
    
    mov al, 00000001b
    out 0x21, al
    ; End remap of the master PIC
    sti

    call kernel_main

    jmp $

problem:
    int 32

times 512-($ - $$) db 0