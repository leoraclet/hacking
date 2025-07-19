#include <stdio.h>

float tensions[6] = {2.34, 3.9, 0.47, 0.78, 4.52, 2.96};

int main()
{
    printf("404CTF{");

    float offset = 5.0 / 16.0;
    float threshold = 3.0;

    for (int i = 0; i < 6; i++)
    {
        int value = -1;
        for (int j = 0; j < 16; j++)
        {
            if (j != 15 && tensions[i] - offset > threshold && (j == 0 || j == 4 || j == 8 || j == 12))
            {
                value++;
            }
        }

        if (value & 1)
        {
            printf("1");
        }
        else
        {
            printf("0");
        }

        value = value >> 1;
        if (value & 1)
        {
            printf("1");
        }
        else
        {
            printf("0");
        }

        value = value >> 1;
        if (value & 1)
        {
            printf("1");
        }
        else
        {
            printf("0");
        }

        value = value >> 1;
        if (value & 1)
        {
            printf("1");
        }
        else
        {
            printf("0");
        }
    }
    printf("}\n");
}