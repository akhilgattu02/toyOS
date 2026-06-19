#include "memory.h"

void* memset(void* ptr, int c, size_t size)
{
    char* p = (char*)ptr;
    for(int i = 0; i < size; i++)
    {
        *p = (char)c;
        p += 1;
    }
    return ptr;
}