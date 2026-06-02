ENTRY(_start)
OUTPUT_FORMAT(binary)
SECTIONS
{
	. = 1M;
    .text :
    {
        *(.text)
    }

    /*
        Read only data
    */
    .rodata :
    {
        *(.rodata)
    }

    .data   :
    {
        *(.data)
    }

    /*
        Block Started by Symbol (BSS). Used to hold uninitialized global and static variables. 
    */
    .bss    :
    {
        *(COMMON)
        *(.bss)
    }
}
