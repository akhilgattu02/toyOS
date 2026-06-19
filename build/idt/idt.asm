section .asm

global idt_load
idt_load:
    push ebp
    mov ebp, esp /*Move stack pointer (esp) to base pointer (ebp)*/

    mov ebx, [ebp+8] /* Points to first argument of idt_load function if we do ebp + 8*/
    lidt [ebx]
    pop ebp
    ret