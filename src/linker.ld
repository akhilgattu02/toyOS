ENTRY(_start)
OUTPUT_FORMAT(binary)
SECTIONS
{
	. = 1M;
    .text : ALIGN(4096)
    {
        *(.text)
    }

    /*
        Read only data
    */
    .rodata : ALIGN(4096)
    {
        *(.rodata)
    }

    .data   : ALIGN(4096)
    {
        *(.data)
    }

    /*
        Block Started by Symbol (BSS). Used to hold uninitialized global and static variables. 
    */
    .bss    : ALIGN(4096)
    {
        *(COMMON)
        *(.bss)
    }

    .asm    :
    {
        *(.asm)
    }
}
