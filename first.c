#include <stdio.h>
#include <string.h>

char nt[5][5] = {"E", "E'", "T", "T'", "F"};

char p[5][2][5] = {
    {"T", ""},
    {"+", "e"},
    {"F", ""},
    {"*", "e"},
    {"(", "id"}
};

int count[5] = {1, 2, 1, 2, 2};

void first(char *s, char set[][5], int *n)
{
    int i, k = -1;

    for(i = 0; i < 5; i++)
    {
        if(strcmp(nt[i], s) == 0)
        {
            k = i;
            break;
        }
    }

    if(k == -1)
    {
        for(i = 0; i < *n; i++)
            if(strcmp(set[i], s) == 0)
                return;

        strcpy(set[(*n)++], s);
        return;
    }

    for(i = 0; i < count[k]; i++)
    {
        first(p[k][i], set, n);
    }
}

int main()
{
    int i, j, n;
    char set[10][5];

    for(i = 0; i < 5; i++)
    {
        n = 0;

        first(nt[i], set, &n);

        printf("FIRST(%s) = { ", nt[i]);

        for(j = 0; j < n; j++)
            printf("%s ", set[j]);

        printf("}\n");
    }

    return 0;
}
