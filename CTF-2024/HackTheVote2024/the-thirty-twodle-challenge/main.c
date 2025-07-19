#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    if (argc != 2)
        return 1;

    srand(atoi(argv[1]));
    printf("[");
    for (size_t i = 0; i < 32; i++)
    {
        int ret = rand();
        if (i == 31)
            printf("%d", ret % 2313);
        else
            printf("%d, ", ret % 2313);
    }
    printf("]\n");
    return 0;
}