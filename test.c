#include <stdio.h>
#include <stdlib.h>
struct table
{
    int *entries;
    int total;
};

struct heap_table
{
    struct table* table[150];
};

int main()
{
    struct table mytable;
    int x[] = {1, 2, 3, 4};
    mytable.total = 10;
    int* entries = (int*)malloc(mytable.total * sizeof(int));
    for(int i = 0; i < mytable.total; i++)
    {
        *(entries + i) = 0x01;
    }
    printf("%d\n", *(entries));
    mytable.entries = entries;
    //printf("Total: %d\n", mytable.total);
    struct heap_table myheap;
    for(int i = 0; i < 150; i++)
    {
        myheap.table[i] = &mytable;
    }
    printf("%ld", sizeof(mytable));

}