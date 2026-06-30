#include <stdio.h>
#include <stdlib.h>
struct table
{
    int total;
    int *entries;
};

struct heap_table
{
    struct table* table;
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
    printf("Total: %d\n", mytable.total);
    struct heap_table myheap;
    myheap.table = &mytable;
    for(int i = 0; i < mytable.total; i++)
    {
        printf("Entry %d: %d\n", i, mytable.entries[i]);
    }
    printf("%d", myheap.table->entries[0]);

}