#ifndef IDT_H
#define IDT_H
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;

struct idt_desc
{
    uint16_t offset_1; //Offset bits 0-15
    uint16_t selector; //Selector in GDT/LDT (16-31)
    uint8_t zero; //Does nothing, unused set to zero (32-39)
    uint8_t type_attr; // Descriptor type and attributes (40-47)
    uint16_t offset_2; //Offset bits 16-31 (48-63)
} __attribute__((packed));

struct idtr_desc
{
    uint16_t limit; // Size of descriptor table - 1
    uint32_t base;  // Base address of the start of the interrupt descriptor table
} __attribute__((packed));

void idt_init();

#endif